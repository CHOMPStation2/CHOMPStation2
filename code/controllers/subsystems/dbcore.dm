SUBSYSTEM_DEF(dbcore)
	name = "Database"
	flags = SS_BACKGROUND
	wait = 1 MINUTES
	init_order = INIT_ORDER_DBCORE
	var/failed_connection_timeout = 0

	var/schema_mismatch = 0
	var/db_minor = 0
	var/db_major = 0
	var/failed_connections = 0

	var/last_error
	var/list/active_queries = list()

	var/connection  // Arbitrary handle returned from rust_g.

/datum/controller/subsystem/dbcore/Initialize()
	return ..()

/datum/controller/subsystem/dbcore/fire()
	for(var/I in active_queries)
		var/DBQuery/Q = I
		if(world.time - Q.last_activity_time > (5 MINUTES))
			message_admins("Found undeleted query, please check the server logs and notify coders.")
			log_debug("Undeleted query: \"[Q.sql]\" LA: [Q.last_activity] LAT: [Q.last_activity_time]")
			qdel(Q)
		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/dbcore/Recover()
	connection = SSdbcore.connection

/datum/controller/subsystem/dbcore/Shutdown()
	//This is as close as we can get to the true round end before Disconnect() without changing where it's called, defeating the reason this is a subsystem
	if(IsConnected())
		Disconnect()

//nu
/datum/controller/subsystem/dbcore/can_vv_get(var_name)
	return var_name != NAMEOF(src, connection) && var_name != NAMEOF(src, active_queries) && ..()

/datum/controller/subsystem/dbcore/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, connection))
		return FALSE
	return ..()

/datum/controller/subsystem/dbcore/proc/Connect()
	if(IsConnected())
		return TRUE

	if(failed_connection_timeout <= world.time) //it's been more than 5 seconds since we failed to connect, reset the counter
		failed_connections = 0

	if(failed_connections > 5)	//If it failed to establish a connection more than 5 times in a row, don't bother attempting to connect for 5 seconds.
		failed_connection_timeout = world.time + 50
		return FALSE

	if(!config.sql_enabled)
		return FALSE

	var/user = sqlfdbklogin
	var/pass = sqlfdbkpass
	var/db = sqlfdbkdb
	var/address = sqladdress
	var/port = text2num(sqlport)
	var/timeout = 10
	var/thread_limit = 50

	var/result = json_decode(rustg_sql_connect_pool(json_encode(list(
		"host" = address,
		"port" = port,
		"user" = user,
		"pass" = pass,
		"db_name" = db,
		"read_timeout" = timeout,
		"write_timeout" = timeout,
		"max_threads" = thread_limit,
	))))
	. = (result["status"] == "ok")
	if (.)
		connection = result["handle"]
	else
		connection = null
		last_error = result["data"]
		log_world("Connect() failed | [last_error]")
		++failed_connections

/datum/controller/subsystem/dbcore/proc/CheckSchemaVersion()
	if(config.sql_enabled)
		if(Connect())
			log_world("Database connection established.")
		else
			log_debug("Your server failed to establish a connection with the database.")
	else
		log_debug("Database is not enabled in configuration.")

/*/datum/controller/subsystem/dbcore/proc/SetRoundID()
	if(!Connect())
		return
	var/DBQuery/query_round_initialize = SSdbcore.NewQuery(
		"INSERT INTO [format_table_name("round")] (initialize_datetime, server_ip, server_port) VALUES (Now(), INET_ATON(:internet_address), :port)",
		list("internet_address" = world.internet_address || "0", "port" = "[world.port]")
	)
	query_round_initialize.Execute(async = FALSE)
	GLOB.round_id = "[query_round_initialize.last_insert_id]"
	qdel(query_round_initialize)

/datum/controller/subsystem/dbcore/proc/SetRoundStart()
	if(!Connect())
		return
	var/DBQuery/query_round_start = SSdbcore.NewQuery(
		"UPDATE [format_table_name("round")] SET start_datetime = Now() WHERE id = :round_id",
		list("round_id" = GLOB.round_id)
	)
	query_round_start.Execute()
	qdel(query_round_start)

/datum/controller/subsystem/dbcore/proc/SetRoundEnd()
	if(!Connect())
		return
	var/DBQuery/query_round_end = SSdbcore.NewQuery(
		"UPDATE [format_table_name("round")] SET end_datetime = Now(), game_mode_result = :game_mode_result, station_name = :station_name WHERE id = :round_id",
		list("game_mode_result" = SSticker.mode_result, "station_name" = station_name(), "round_id" = GLOB.round_id)
	)
	query_round_end.Execute()
	qdel(query_round_end)*/

/datum/controller/subsystem/dbcore/proc/Disconnect()
	failed_connections = 0
	if (connection)
		rustg_sql_disconnect_pool(connection)
	connection = null

/datum/controller/subsystem/dbcore/proc/IsConnected()
	if (!config.sql_enabled)
		return FALSE
	if (!connection)
		return FALSE
	return json_decode(rustg_sql_connected(connection))["status"] == "online"

/datum/controller/subsystem/dbcore/proc/ErrorMsg()
	if(!config.sql_enabled)
		return "Database disabled by configuration"
	return last_error

/datum/controller/subsystem/dbcore/proc/ReportError(error)
	last_error = error

/datum/controller/subsystem/dbcore/proc/NewQuery(sql_query, arguments)
	if(IsAdminAdvancedProcCall())
		message_admins("ERROR: Advanced admin proc call led to sql query. Query has been blocked")
		return FALSE
	return new /DBQuery(connection, sql_query, arguments)

/datum/controller/subsystem/dbcore/proc/QuerySelect(list/querys, warn = FALSE, qdel = FALSE)
	if (!islist(querys))
		if (!istype(querys, /DBQuery))
			CRASH("Invalid query passed to QuerySelect: [querys]")
		querys = list(querys)

	for (var/thing in querys)
		var/DBQuery/query = thing
		if (warn)
			INVOKE_ASYNC(query, /DBQuery.proc/warn_execute)
		else
			INVOKE_ASYNC(query, /DBQuery.proc/Execute)

	for (var/thing in querys)
		var/DBQuery/query = thing
		UNTIL(!query.in_progress)
		if (qdel)
			qdel(query)



/*
Takes a list of rows (each row being an associated list of column => value) and inserts them via a single mass query.
Rows missing columns present in other rows will resolve to SQL NULL
You are expected to do your own escaping of the data, and expected to provide your own quotes for strings.
The duplicate_key arg can be true to automatically generate this part of the query
	or set to a string that is appended to the end of the query
Ignore_errors instructes mysql to continue inserting rows if some of them have errors.
	the erroneous row(s) aren't inserted and there isn't really any way to know why or why errored
Delayed insert mode was removed in mysql 7 and only works with MyISAM type tables,
	It was included because it is still supported in mariadb.
	It does not work with duplicate_key and the mysql server ignores it in those cases
*/
/datum/controller/subsystem/dbcore/proc/MassInsert(table, list/rows, duplicate_key = FALSE, ignore_errors = FALSE, delayed = FALSE, warn = FALSE, async = TRUE, special_columns = null)
	if (!table || !rows || !istype(rows))
		return

	// Prepare column list
	var/list/columns = list()
	var/list/has_question_mark = list()
	for (var/list/row in rows)
		for (var/column in row)
			columns[column] = "?"
			has_question_mark[column] = TRUE
	for (var/column in special_columns)
		columns[column] = special_columns[column]
		has_question_mark[column] = findtext(special_columns[column], "?")

	// Prepare SQL query full of placeholders
	var/list/query_parts = list("INSERT")
	if (delayed)
		query_parts += " DELAYED"
	if (ignore_errors)
		query_parts += " IGNORE"
	query_parts += " INTO "
	query_parts += table
	query_parts += "\n([columns.Join(", ")])\nVALUES"

	var/list/arguments = list()
	var/has_row = FALSE
	for (var/list/row in rows)
		if (has_row)
			query_parts += ","
		query_parts += "\n  ("
		var/has_col = FALSE
		for (var/column in columns)
			if (has_col)
				query_parts += ", "
			if (has_question_mark[column])
				var/name = "p[arguments.len]"
				query_parts += replacetext(columns[column], "?", ":[name]")
				arguments[name] = row[column]
			else
				query_parts += columns[column]
			has_col = TRUE
		query_parts += ")"
		has_row = TRUE

	if (duplicate_key == TRUE)
		var/list/column_list = list()
		for (var/column in columns)
			column_list += "[column] = VALUES([column])"
		query_parts += "\nON DUPLICATE KEY UPDATE [column_list.Join(", ")]"
	else if (duplicate_key != FALSE)
		query_parts += duplicate_key

	var/DBQuery/Query = NewQuery(query_parts.Join(), arguments)
	if (warn)
		. = Query.warn_execute(async)
	else
		. = Query.Execute(async)
	qdel(Query)

/DBQuery
	// Inputs
	var/connection
	var/sql
	var/arguments

	// Status information
	var/in_progress
	var/last_error
	var/last_activity
	var/last_activity_time

	// Output
	var/list/list/rows
	var/next_row_to_take = 1
	var/affected
	var/last_insert_id

	var/list/item  //list of data values populated by NextRow()

/DBQuery/New(connection, sql, arguments)
	SSdbcore.active_queries[src] = TRUE
	Activity("Created")
	item = list()

	src.connection = connection
	src.sql = sql
	src.arguments = arguments

/DBQuery/Destroy()
	Close()
	SSdbcore.active_queries -= src
	return ..()

/DBQuery/CanProcCall(proc_name)
	//fuck off kevinz
	return FALSE

/DBQuery/proc/Activity(activity)
	last_activity = activity
	last_activity_time = world.time

/DBQuery/proc/warn_execute(async = TRUE)
	. = Execute(async)
	if(!.)
		to_chat(usr, "<span class='danger'>A SQL error occurred during this operation, check the server logs.</span>")

/DBQuery/proc/Execute(async = TRUE, log_error = TRUE)
	Activity("Execute")
	if(in_progress)
		CRASH("Attempted to start a new query while waiting on the old one")

	if(!SSdbcore.IsConnected())
		last_error = "No connection!"
		return FALSE

	var/start_time
	if(!async)
		start_time = REALTIMEOFDAY
	Close()
	. = run_query(async)
	var/timed_out = !. && findtext(last_error, "Operation timed out")
	if(!. && log_error)
		log_debug("[last_error] | Query used: [sql] | Arguments: [json_encode(arguments)]")
	if(!async && timed_out)
		log_debug("Query execution started at [start_time]")
		log_debug("Query execution ended at [REALTIMEOFDAY]")
		log_debug("Slow query timeout detected.")
		log_debug("Query used: [sql]")
		slow_query_check()

/DBQuery/proc/run_query(async)
	var/job_result_str

	if (async)
		var/job_id = rustg_sql_query_async(connection, sql, json_encode(arguments))
		in_progress = TRUE
		UNTIL((job_result_str = rustg_sql_check_query(job_id)) != RUSTG_JOB_NO_RESULTS_YET)
		in_progress = FALSE

		if (job_result_str == RUSTG_JOB_ERROR)
			last_error = job_result_str
			return FALSE
	else
		job_result_str = rustg_sql_query_blocking(connection, sql, json_encode(arguments))

	var/result = json_decode(job_result_str)
	switch (result["status"])
		if ("ok")
			rows = result["rows"]
			affected = result["affected"]
			last_insert_id = result["last_insert_id"]
			return TRUE
		if ("err")
			last_error = result["data"]
			return FALSE
		if ("offline")
			last_error = "offline"
			return FALSE

/DBQuery/proc/RowCount()
	return rows.len

/DBQuery/proc/slow_query_check()
	message_admins("HEY! A database query timed out.")

/DBQuery/proc/NextRow(async = TRUE)
	Activity("NextRow")

	if (rows && next_row_to_take <= rows.len)
		item = rows[next_row_to_take]
		next_row_to_take++
		return !!item
	else
		return FALSE

/DBQuery/proc/ErrorMsg()
	return last_error

/DBQuery/proc/Close()
	rows = null
	item = null