#define MESSAGE_SERVER_SPAM_REJECT 1
#define MESSAGE_SERVER_DEFAULT_SPAM_LIMIT 10

/datum/data_pda_msg
	var/recipient = "Unspecified" //name of the person
	var/sender = "Unspecified" //name of the sender
	var/message = "Blank" //transferred message

/datum/data_pda_msg/New(var/param_rec = "",var/param_sender = "",var/param_message = "")

	if(param_rec)
		recipient = param_rec
	if(param_sender)
		sender = param_sender
	if(param_message)
		message = param_message

/datum/data_rc_msg
	var/rec_dpt = "Unspecified" //name of the person
	var/send_dpt = "Unspecified" //name of the sender
	var/message = "Blank" //transferred message
	var/stamp = "Unstamped"
	var/id_auth = "Unauthenticated"
	var/priority = "Normal"

/datum/data_rc_msg/New(var/param_rec = "",var/param_sender = "",var/param_message = "",var/param_stamp = "",var/param_id_auth = "",var/param_priority)
	if(param_rec)
		rec_dpt = param_rec
	if(param_sender)
		send_dpt = param_sender
	if(param_message)
		message = param_message
	if(param_stamp)
		stamp = param_stamp
	if(param_id_auth)
		id_auth = param_id_auth
	if(param_priority)
		switch(param_priority)
			if(1)
				priority = "Normal"
			if(2)
				priority = "High"
			if(3)
				priority = "Extreme"
			else
				priority = "Undetermined"

/obj/machinery/message_server
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "server"
	name = "Messaging Server"
	desc = "Facilitates both PDA messages and request console functions."
	density = TRUE
	anchored = TRUE
	unacidable = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 10
	active_power_usage = 100

	var/list/datum/data_pda_msg/pda_msgs = list()
	var/list/datum/data_rc_msg/rc_msgs = list()
	var/active = 1
	var/decryptkey = "password"

	//Spam filtering stuff
	var/list/spamfilter = list("You have won", "your prize", "male enhancement", "shitcurity", \
			"are happy to inform you", "account number", "enter your PIN")
			//Messages having theese tokens will be rejected by server. Case sensitive
	var/spamfilter_limit = MESSAGE_SERVER_DEFAULT_SPAM_LIMIT	//Maximal amount of tokens

	var/datum/looping_sound/tcomms/soundloop // CHOMPStation Add: Hummy noises
	var/noisy = FALSE  // CHOMPStation Add: Hummy noises

/obj/machinery/message_server/Initialize(mapload)
	// CHOMPAdd: PDA Messaging Server humming
	soundloop = new(list(src), FALSE)
	if(prob(60)) // 60% chance to change the midloop
		if(prob(40))
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_02.ogg' = 1)
			soundloop.mid_length = 40
		else if(prob(20))
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_03.ogg' = 1)
			soundloop.mid_length = 10
		else
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_04.ogg' = 1)
			soundloop.mid_length = 30
	// CHOMPAdd End
	. = ..()
	message_servers += src
	decryptkey = GenerateKey()
	send_pda_message("System Administrator", "system", "This is an automated message. The messaging system is functioning correctly.")

/obj/machinery/message_server/Destroy()
	message_servers -= src
	QDEL_NULL(soundloop) // CHOMPStation Add: Hummy noises
	return ..()

/obj/machinery/message_server/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "It appears to be [active ? "online" : "offline"]."

/obj/machinery/message_server/proc/GenerateKey()
	//Feel free to move to Helpers.
	var/newKey
	newKey += pick("the", "if", "of", "as", "in", "a", "you", "from", "to", "an", "too", "little", "snow", "dead", "drunk", "rosebud", "duck", "al", "le")
	newKey += pick("diamond", "beer", "mushroom", "assistant", "clown", "captain", "twinkie", "security", "nuke", "small", "big", "escape", "yellow", "gloves", "monkey", "engine", "nuclear", "ai")
	newKey += pick("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	return newKey

/obj/machinery/message_server/process()
	//if(decryptkey == "password")
	//	decryptkey = generateKey()
	if(active && (stat & (BROKEN|NOPOWER)))
		active = 0
		soundloop.stop() // CHOMPStation Add: Hummy noises
		noisy = FALSE // CHOMPStation Add: Hummy noises
		return
	if(!noisy && active) // CHOMPStation Add: Hummy noises
		soundloop.start() // CHOMPStation Add: Hummy noises
		noisy = TRUE // CHOMPStation Add: Hummy noises
	update_icon()
	return

/obj/machinery/message_server/proc/send_pda_message(var/recipient = "",var/sender = "",var/message = "")
	var/result
	for (var/token in spamfilter)
		if (findtextEx(message,token))
			message = span_red("[message]")	//Rejected messages will be indicated by red color.
			result = token										//Token caused rejection (if there are multiple, last will be chosen>.
	pda_msgs += new/datum/data_pda_msg(recipient,sender,message)
	return result

/obj/machinery/message_server/proc/send_rc_message(var/recipient = "",var/sender = "",var/message = "",var/stamp = "", var/id_auth = "", var/priority = 1)
	rc_msgs += new/datum/data_rc_msg(recipient,sender,message,stamp,id_auth)
	var/authmsg = "[message]\n"
	if (id_auth)
		authmsg += "([id_auth])\n"
	if (stamp)
		authmsg += "([stamp])\n"
	for (var/obj/machinery/requests_console/Console in GLOB.allConsoles)
		if (ckey(Console.department) == ckey(recipient))
			if(Console.inoperable())
				Console.message_log += list(list("Message lost due to console failure.","Please contact [station_name()] system adminsitrator or AI for technical assistance."))
				continue
			if(Console.newmessagepriority < priority)
				Console.newmessagepriority = priority
				Console.icon_state = "req_comp[priority]"
			switch(priority)
				if(2)
					if(!Console.silent)
						playsound(Console, 'sound/machines/twobeep.ogg', 50, 1)
						Console.audible_message(text("[icon2html(Console,hearers(Console))] *The Requests Console beeps: 'PRIORITY Alert in [sender]'"),,5, runemessage = "beep! beep!")
					Console.message_log += list(list("High Priority message from [sender]", "[authmsg]"))
				else
					if(!Console.silent)
						playsound(Console, 'sound/machines/twobeep.ogg', 50, 1)
						Console.audible_message(text("[icon2html(Console,hearers(Console))] *The Requests Console beeps: 'Message from [sender]'"),,4, runemessage = "beep beep")
					Console.message_log += list(list("Message from [sender]", "[authmsg]"))
			Console.set_light(2)


/obj/machinery/message_server/attack_hand(user as mob)
//	to_chat(user, span_blue("There seem to be some parts missing from this server. They should arrive on the station in a few days, give or take a few CentCom delays."))
	to_chat(user, span_filter_notice("You toggle PDA message passing from [active ? "On" : "Off"] to [active ? "Off" : "On"]."))
	active = !active
	update_icon()

	return

/obj/machinery/message_server/attackby(obj/item/O as obj, mob/living/user as mob)
	if (active && !(stat & (BROKEN|NOPOWER)) && (spamfilter_limit < MESSAGE_SERVER_DEFAULT_SPAM_LIMIT*2) && \
		istype(O,/obj/item/circuitboard/message_monitor))
		spamfilter_limit += round(MESSAGE_SERVER_DEFAULT_SPAM_LIMIT / 2)
		user.drop_item()
		qdel(O)
		to_chat(user, span_filter_notice("You install additional memory and processors into message server. Its filtering capabilities been enhanced."))
	else
		..(O, user)

/obj/machinery/message_server/update_icon()
	if((stat & (BROKEN|NOPOWER)))
		icon_state = "server-nopower"
	else if (!active)
		icon_state = "server-off"
	else
		icon_state = "server-on"

	return


/datum/feedback_variable
	var/variable
	var/value
	var/details

/datum/feedback_variable/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, variable) || var_name == NAMEOF(src, value) || var_name == NAMEOF(src, details))
		return FALSE
	return ..()

/datum/feedback_variable/New(var/param_variable,var/param_value = 0)
	variable = param_variable
	value = param_value

/datum/feedback_variable/proc/inc(var/num = 1)
	if(isnum(value))
		value += num
	else
		value = text2num(value)
		if(isnum(value))
			value += num
		else
			value = num

/datum/feedback_variable/proc/dec(var/num = 1)
	if(isnum(value))
		value -= num
	else
		value = text2num(value)
		if(isnum(value))
			value -= num
		else
			value = -num

/datum/feedback_variable/proc/set_value(var/num)
	if(isnum(num))
		value = num

/datum/feedback_variable/proc/get_value()
	return value

/datum/feedback_variable/proc/get_variable()
	return variable

/datum/feedback_variable/proc/set_details(var/text)
	if(istext(text))
		details = text

/datum/feedback_variable/proc/add_details(var/text)
	if(istext(text))
		if(!details)
			details = text
		else
			details += " [text]"

/datum/feedback_variable/proc/get_details()
	return details

/datum/feedback_variable/proc/get_parsed()
	return list(variable,value,details)

var/obj/machinery/blackbox_recorder/blackbox

/obj/machinery/blackbox_recorder
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "blackbox"
	name = "Blackbox Recorder"
	desc = "Records all radio communications, as well as various other information in case of the worst."
	density = TRUE
	anchored = TRUE
	unacidable = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 10
	active_power_usage = 100
	var/list/messages = list()		//Stores messages of non-standard frequencies
	var/list/messages_admin = list()

	var/list/msg_common = list()
	var/list/msg_science = list()
	var/list/msg_command = list()
	var/list/msg_medical = list()
	var/list/msg_engineering = list()
	var/list/msg_security = list()
	var/list/msg_deathsquad = list()
	var/list/msg_syndicate = list()
	var/list/msg_raider = list()
	var/list/msg_cargo = list()
	var/list/msg_service = list()
	var/list/msg_explorer = list()

	var/list/datum/feedback_variable/feedback = new()

	//Only one can exist in the world!
/obj/machinery/blackbox_recorder/Initialize(mapload)
	. = ..()
	if(blackbox)
		if(istype(blackbox,/obj/machinery/blackbox_recorder))
			return INITIALIZE_HINT_QDEL
	blackbox = src

/obj/machinery/blackbox_recorder/Destroy()
	var/turf/T = locate(1,1,2)
	if(T)
		blackbox = null
		var/obj/machinery/blackbox_recorder/BR = new/obj/machinery/blackbox_recorder(T)
		BR.msg_common = msg_common
		BR.msg_science = msg_science
		BR.msg_command = msg_command
		BR.msg_medical = msg_medical
		BR.msg_engineering = msg_engineering
		BR.msg_security = msg_security
		BR.msg_deathsquad = msg_deathsquad
		BR.msg_syndicate = msg_syndicate
		BR.msg_cargo = msg_cargo
		BR.msg_service = msg_service
		BR.feedback = feedback
		BR.messages = messages
		BR.messages_admin = messages_admin
		if(blackbox != BR)
			blackbox = BR
	. = ..()

/obj/machinery/blackbox_recorder/proc/find_feedback_datum(var/variable)
	for(var/datum/feedback_variable/FV in feedback)
		if(FV.get_variable() == variable)
			return FV
	var/datum/feedback_variable/FV = new(variable)
	feedback += FV
	return FV

/obj/machinery/blackbox_recorder/proc/get_round_feedback()
	return feedback

/obj/machinery/blackbox_recorder/proc/round_end_data_gathering()

	var/pda_msg_amt = 0
	var/rc_msg_amt = 0

	for(var/obj/machinery/message_server/MS in GLOB.machines)
		if(MS.pda_msgs.len > pda_msg_amt)
			pda_msg_amt = MS.pda_msgs.len
		if(MS.rc_msgs.len > rc_msg_amt)
			rc_msg_amt = MS.rc_msgs.len

	feedback_set_details("radio_usage","")

	feedback_add_details("radio_usage","COM-[msg_common.len]")
	feedback_add_details("radio_usage","SCI-[msg_science.len]")
	feedback_add_details("radio_usage","HEA-[msg_command.len]")
	feedback_add_details("radio_usage","MED-[msg_medical.len]")
	feedback_add_details("radio_usage","ENG-[msg_engineering.len]")
	feedback_add_details("radio_usage","SEC-[msg_security.len]")
	feedback_add_details("radio_usage","DTH-[msg_deathsquad.len]")
	feedback_add_details("radio_usage","SYN-[msg_syndicate.len]")
	feedback_add_details("radio_usage","CAR-[msg_cargo.len]")
	feedback_add_details("radio_usage","SRV-[msg_service.len]")
	feedback_add_details("radio_usage","OTH-[messages.len]")
	feedback_add_details("radio_usage","PDA-[pda_msg_amt]")
	feedback_add_details("radio_usage","RC-[rc_msg_amt]")


	feedback_set_details("round_end","[time2text(world.realtime)]") //This one MUST be the last one that gets set.

/obj/machinery/blackbox_recorder/vv_edit_var(var_name, var_value)
	var/static/list/blocked_vars		//hacky as fuck kill me
	if(!blocked_vars)
		var/obj/machinery/M = new
		var/list/parent_vars = M.vars.Copy()
		blocked_vars = vars.Copy() - parent_vars
	if(var_name in blocked_vars)
		return FALSE
	return ..()

//This proc is only to be called at round end.
/obj/machinery/blackbox_recorder/proc/save_all_data_to_sql()
	if(!feedback) return

	round_end_data_gathering() //round_end time logging and some other data processing
	establish_db_connection()
	if(!SSdbcore.IsConnected()) return
	var/round_id

	var/datum/db_query/query = SSdbcore.NewQuery("SELECT MAX(round_id) AS round_id FROM erro_feedback")
	query.Execute()
	while(query.NextRow())
		round_id = query.item[1]
	qdel(query)
	if(!isnum(round_id))
		round_id = text2num(round_id)
	round_id++

	for(var/datum/feedback_variable/FV in feedback)
		var/sql = "INSERT INTO erro_feedback VALUES (null, Now(), [round_id], \"[FV.get_variable()]\", [FV.get_value()], \"[FV.get_details()]\")"
		var/datum/db_query/query_insert = SSdbcore.NewQuery(sql)
		query_insert.Execute()
		qdel(query_insert)

// Sanitize inputs to avoid SQL injection attacks //CHOMPEdit NOTE: This is not secure. Basic filters like this are pretty easy to bypass. Use the format for arguments used in the above.
/proc/sql_sanitize_text(var/text)
	text = replacetext(text, "'", "''")
	text = replacetext(text, ";", "")
	text = replacetext(text, "&", "")
	return text

/proc/feedback_set(var/variable,var/value)
	if(!blackbox) return

	variable = sql_sanitize_text(variable)

	var/datum/feedback_variable/FV = blackbox.find_feedback_datum(variable)

	if(!FV) return

	FV.set_value(value)

/proc/feedback_inc(var/variable,var/value)
	if(!blackbox) return

	variable = sql_sanitize_text(variable)

	var/datum/feedback_variable/FV = blackbox.find_feedback_datum(variable)

	if(!FV) return

	FV.inc(value)

/proc/feedback_dec(var/variable,var/value)
	if(!blackbox) return

	variable = sql_sanitize_text(variable)

	var/datum/feedback_variable/FV = blackbox.find_feedback_datum(variable)

	if(!FV) return

	FV.dec(value)

/proc/feedback_set_details(var/variable,var/details)
	if(!blackbox) return

	variable = sql_sanitize_text(variable)
	details = sql_sanitize_text(details)

	var/datum/feedback_variable/FV = blackbox.find_feedback_datum(variable)

	if(!FV) return

	FV.set_details(details)

/proc/feedback_add_details(var/variable,var/details)
	if(!blackbox) return

	variable = sql_sanitize_text(variable)
	details = sql_sanitize_text(details)

	var/datum/feedback_variable/FV = blackbox.find_feedback_datum(variable)

	if(!FV) return

	FV.add_details(details)

#undef MESSAGE_SERVER_SPAM_REJECT
#undef MESSAGE_SERVER_DEFAULT_SPAM_LIMIT
