//Triggered by other
/mob/living/silicon/robot/drone/proc/request_player()
	for(var/mob/observer/dead/O in player_list)
		if(jobban_isbanned(O, "Cyborg") || !O.client || !(O.client.prefs.be_special & BE_PAI))
			continue
		question(O.client)

/mob/living/silicon/robot/drone/proc/question(var/client/C)
	spawn(0)
		if(!C || jobban_isbanned(C,"Cyborg"))	return
		var/response = tgui_alert(C, "Someone is attempting to reboot a maintenance drone. Would you like to play as one?", "Maintenance drone reboot", list("Yes", "No", "Never for this round"))
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
		else if (response == "Never for this round")
			C.prefs.be_special ^= BE_PAI

//Triggered by self
/mob/observer/dead/verb/join_as_drone()

	set category = "Ghost"
	set name = "Join As Drone"
	set desc = "If there is a powered, enabled fabricator in the game world with a prepared chassis, join as a maintenance drone."

	if(ticker.current_state < GAME_STATE_PLAYING)
		to_chat(src, "<span class='danger'>The game hasn't started yet!</span>")
		return

	if(!(config.allow_drone_spawn))
		to_chat(src, "<span class='danger'>That verb is not currently permitted.</span>")
		return

	if (!src.stat)
		return

	if (usr != src)
		return 0 //something is terribly wrong

	if(jobban_isbanned(src,"Cyborg"))
		to_chat(usr, "<span class='danger'>You are banned from playing synthetics and cannot spawn as a drone.</span>")
		return

	// VOREStation Addition Start
	if(config.use_age_restriction_for_jobs && isnum(src.client.player_age))
		var/time_till_play = max(0, 3 - src.client.player_age)
		if(time_till_play)
			to_chat(usr, "<span class='danger'>You have not been playing on the server long enough to join as drone.</span>")
			return
	// VOREStation Addition End

	if(!MayRespawn(1))
		return

	var/deathtime = world.time - src.timeofdeath
	var/deathtimeminutes = round(deathtime / (1 MINUTE))
	var/pluralcheck = "minute"
	if(deathtimeminutes == 0)
		pluralcheck = ""
	else if(deathtimeminutes == 1)
		pluralcheck = " [deathtimeminutes] minute and"
	else if(deathtimeminutes > 1)
		pluralcheck = " [deathtimeminutes] minutes and"
	var/deathtimeseconds = round((deathtime - deathtimeminutes * 1 MINUTE) / 10,1)

	if (deathtime < 5 MINUTES)
		to_chat(usr, "You have been dead for[pluralcheck] [deathtimeseconds] seconds.")
		to_chat(usr, "You must wait 5 minutes to respawn as a drone!")
		return

	var/list/all_fabricators = list()
	for(var/obj/machinery/drone_fabricator/DF in machines)
		if(DF.stat & NOPOWER || !DF.produce_drones)
			continue
		if(DF.drone_progress >= 100)
			all_fabricators[DF.fabricator_tag] = DF

	if(!all_fabricators.len)
		to_chat(src, "<span class='danger'>There are no available drone spawn points, sorry.</span>")
		return

	var/choice = tgui_input_list(src, "Which fabricator do you wish to use?", "Fabricator Choice", all_fabricators)
	if(choice)
		var/obj/machinery/drone_fabricator/chosen_fabricator = all_fabricators[choice]
		chosen_fabricator.create_drone(src.client)