var/list/topic_commands = list()
var/list/topic_commands_names = list()

/hook/startup/proc/setup_api()
	for (var/path in typesof(/datum/topic_command) - /datum/topic_command)
		var/datum/topic_command/A = new path()
		if(A != null)
			topic_commands[A.name] = A
			topic_commands_names.Add(A.name)
		listclearnulls(topic_commands)
		listclearnulls(topic_commands_names)

	return 1

//API Boilerplate
/datum/topic_command
	var/name = null //Name for the command
	var/no_auth = 0 //If the user does NOT need to be authed to use the command
	var/no_throttle = 0 //If this command should NOT be limited by the throtteling
	var/description = null //Description for the command
	var/list/params = list() //Required Parameters for the command
	//Explanation of the parameter options:
	//Required - name -> Name of the parameter - should be the same as the index in the list
	//Required - desc -> Description of the parameter
	//Required - req -> Is this a required parameter: 1 -> Yes, 0 -> No
	//Required - type -> What type is this:
	//						str->String,
	//						int->Integer,
	//						lst->List/array,
	//						senderkey->unique identifier of the person sending the request
	//						slct -> Select one of multiple specified options
	//Required* - options -> The possible options that can be selected (slct)
	var/statuscode = null
	var/response = null
	var/data = null
/datum/topic_command/proc/run_command(queryparams)
	// Always returns 1 --> Details status in statuscode, response and data
	return 1
/datum/topic_command/proc/check_params_missing(queryparams)
	//Check if some of the required params are missing
	// 0 -> if all params are supplied
	// >=1 -> if a param is missing
	var/list/missing_params = list()
	var/errorcount = 0

	for(var/key in params)
		var/list/param = params[key]
		if(queryparams[key] == null)
			if(param["req"] == 0)
				log_debug("API: The following parameter is OPTIONAL and missing: [param["name"]] - [param["desc"]]")
			else
				log_debug("API: The following parameter is REQUIRED but missing: [param["name"]] - [param["desc"]]")
				errorcount ++
				missing_params += param["name"]
	if(errorcount)
		log_debug("API: Request aborted. Required parameters missing")
		statuscode = 400
		response = "Required params missing"
		data = missing_params
		return errorcount
	return 0


/datum/topic_command/send_adminmsg
	name = "send_adminmsg"
	description = "Sends a adminmessage to a player"
	params = list(
		"ckey" = list("name"="ckey","desc"="The target of the adminmessage","req"=1,"type"="str"),
		"msg" = list("name"="msg","desc"="The message that should be sent","req"=1,"type"="str"),
		"senderkey" = list("name"="senderkey","desc"="Unique id of the person that sent the adminmessage","req"=1,"type"="senderkey"),
		"rank" = list("name"="rank","desc"="The rank that should be displayed - Defaults to admin if none specified","req"=0,"type"="str")
		)

/datum/topic_command/send_adminmsg/run_command(queryparams)
	/*
		We got an adminmsg from IRC bot lets split the API
		expected output:
			1. ckey = ckey of person the message is to
			2. msg = contents of message, parems2list requires
			3. rank = Rank that should be displayed
			4. senderkey = the ircnick that send the message.
	*/

	var/client/C
	var/req_ckey = ckey(queryparams["ckey"])

	for(var/client/K in clients)
		if(K.ckey == req_ckey)
			C = K
			break
	if(!C)
		statuscode = 404
		response = "No client with that name on server"
		data = null
		return 1

	var/rank = queryparams["rank"]
	if(!rank)
		rank = "Admin"

	var/message =	"<font color='red'>[rank] PM from <b><a href='?discord_msg=[queryparams["senderkey"]]'>[queryparams["senderkey"]]</a></b>: [queryparams["msg"]]</font>"
	var/amessage =	"<font color='blue'>[rank] PM from <a href='?discord_msg=[queryparams["senderkey"]]'>[queryparams["senderkey"]]</a> to <b>[key_name(C)]</b> : [queryparams["msg"]]</font>"

	C.received_discord_pm = world.time
	C.discord_admin = queryparams["senderkey"]

	C << 'sound/effects/adminhelp.ogg'
	C << message

	for(var/client/A in admins)
		if(A != C)
			A << amessage


	statuscode = 200
	response = "Admin Message sent"
	data = null
	return 1


/client
	var/received_discord_pm
	var/discord_admin