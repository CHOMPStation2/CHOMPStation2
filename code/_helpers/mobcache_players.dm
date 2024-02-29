//-------------------- Mannequin
GLOBAL_LIST_EMPTY(mobcache_mannequins)

/proc/get_mannequin(var/ckey = "NULL")
	var/mob/living/carbon/human/dummy/mannequin/M = GLOB.mobcache_mannequins[ckey]
	if(!istype(M))
		GLOB.mobcache_mannequins[ckey] = new /mob/living/carbon/human/dummy/mannequin(null)
		M = GLOB.mobcache_mannequins[ckey]
	return M

/proc/del_mannequin(var/ckey = "NULL")
	GLOB.mobcache_mannequins -= ckey

//-------------------- mob/observer/dead
GLOBAL_LIST_EMPTY(mobcache_observer_deads)

/proc/get_observer_dead(var/ckey = "NULL", var/turf/position = null, var/mob/target_appearance)
	var/mob/observer/dead/OD = GLOB.mobcache_observer_deads[ckey]
	if(!istype(OD)) // no observer
		OD = new /mob/observer/dead(target_appearance) //so create one
		OD.moveToNullspace() // move it out of the target_appearance mob
		GLOB.mobcache_observer_deads[ckey] = OD
	else //At this point we've found our observer
		if(target_appearance)
			OD.redress(target_appearance)
	if(isturf(position))
		OD.forceMove(position)

	spawn(0) //we want summon_actions to be called when there is a valid client
		OD.summon_actions()
	return OD

/proc/dismiss_observer_dead(var/mob/observer/dead/OD)
	if(!istype(OD))
		return

	//see if our dismissal observer exists
	var/foundit = FALSE
	for(var/key in GLOB.mobcache_observer_deads)
		if(GLOB.mobcache_observer_deads[key] == OD)
			OD.dismiss_actions()
			OD.moveToNullspace() // observer is in our observer db - hide in nullspace
			foundit = TRUE
			break

	//if it doesn't, qdel it
	if(!foundit)
		log_and_message_admins("An unknown mob/observer/dead was deleted due to not being databased")
		qdel(OD) // observer is not in observer db - qdel

/proc/del_observer_dead(var/ckey = "NULL")
	var/mob/observer/dead/OD = GLOB.mobcache_observer_deads[ckey]
	if(!istype(OD))
		return
	GLOB.mobcache_observer_deads -= ckey
	qdel(OD)

//-------------------- mob/newplayer
GLOBAL_LIST_EMPTY(mobcache_newplayers)

/proc/get_newplayer(var/ckey = "NULL")
	var/mob/new_player/NP = GLOB.mobcache_newplayers[ckey]
	if(!istype(NP))
		NP = new /mob/new_player/(null)
		GLOB.mobcache_newplayers[ckey] = NP
	return NP

/proc/update_newplayer_from_current(var/mob/new_player/NP, var/ckey = "NULL")
	if(!istype(NP, /mob/new_player))
		return

	if(!ckey)
		log_and_message_admins("Attempted to cache a /mob/new_player with an invalid key!")
		return

	if(ckey in GLOB.mobcache_newplayers) //ckey key exists
		if(GLOB.mobcache_newplayers[ckey] == NP) //ckey key's ref is same as new
			return
		else
			log_and_message_admins("New /mob/new_player created when an old one existed!")
			del_newplayer(ckey)

	GLOB.mobcache_newplayers[ckey] = NP

/proc/del_newplayer(var/ckey = "NULL")
	var/mob/M = GLOB.mobcache_newplayers[ckey]
	if(M.client)
		log_and_message_admins("Attempted to remove a /mob/new_player when it had an active client!")
		return
	qdel(GLOB.mobcache_newplayers[ckey])
	GLOB.mobcache_newplayers -= ckey

// Actions to call when dismissing the observer (Virtual Destroy)
// This is called similar to logout
// No /client, called JUST BEFORE the observer is sent to nullspace
/mob/observer/proc/dismiss_actions()
	return .

// Actions to call when summoning the observer (Virtual New/Initialise)
// This is similar to login
// (hopefully) called AFTER the client has logged in
/mob/observer/proc/summon_actions()
	if(!client)
		log_and_message_admins("A observer was summoned but not given a client!")

	return .
