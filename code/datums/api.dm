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

/client
	var/received_discord_pm
	var/discord_admin
