var/datum/controller/transfer_controller/transfer_controller

/datum/controller/transfer_controller
	var/timerbuffer = 0 //buffer for time check
	var/currenttick = 0
	var/shift_hard_end = 0 //VOREStation Edit
	var/shift_last_vote = 0 //VOREStation Edit
/datum/controller/transfer_controller/New()
	timerbuffer = CONFIG_GET(number/vote_autotransfer_initial) // CHOMPEdit
	shift_hard_end = CONFIG_GET(number/vote_autotransfer_initial) + (CONFIG_GET(number/vote_autotransfer_interval) * 2) //CHOMPStation Edit //Change this "1" to how many extend votes you want there to be. //Note: Fuck you whoever just slapped a number here instead of using the FUCKING CONFIG LIKE ALL THE OTHER NUMBERS HERE
	shift_last_vote = shift_hard_end - CONFIG_GET(number/vote_autotransfer_interval) //VOREStation Edit // CHOMPEdit
	START_PROCESSING(SSprocessing, src)

/datum/controller/transfer_controller/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	..()

/datum/controller/transfer_controller/process()
	currenttick = currenttick + 1
	//VOREStation Edit START
	if (round_duration_in_ds >= shift_last_vote - 2 MINUTES)
		shift_last_vote = 1000000000000 //Setting to a stupidly high number since it'll be not used again. //CHOMPEdit
		to_world("<b>Warning: This upcoming round-extend vote will be your last chance to vote for shift extension. Wrap up your scenes in the next 60 minutes if the round is extended.</b>") //CHOMPStation Edit
	if (round_duration_in_ds >= shift_hard_end - 1 MINUTE)
		init_shift_change(null, 1)
		shift_hard_end = timerbuffer + CONFIG_GET(number/vote_autotransfer_interval) //If shuttle somehow gets recalled, let's force it to call again next time a vote would occur. // CHOMPEdit
		timerbuffer = timerbuffer + CONFIG_GET(number/vote_autotransfer_interval) //Just to make sure a vote doesn't occur immediately afterwords. // CHOMPEdit
	else if (round_duration_in_ds >= timerbuffer - 1 MINUTE)
		new /datum/vote/crew_transfer
	//VOREStation Edit END
		timerbuffer = timerbuffer + CONFIG_GET(number/vote_autotransfer_interval) // CHOMPEdit
