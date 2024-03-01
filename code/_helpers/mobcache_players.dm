//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////// MOBCACHING SYSTEM //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//
// This system will cache client mobs that are reused frequently
// This system is intended for static, uninteractable mobs
// e.g...
// /mob/new_player
// /mob/observer/dead
// /mob/living/carbon/human/dummy/mannequin
//
//
//
// Please see the blocks below for the various procs and their usage
//
//



//-------------------- Mannequin --------------------
GLOBAL_LIST_EMPTY(mobcache_mannequins)

// Either creates a new mannequin associated with a ckey, or fetches it from the mobcache if it exists
// The rest of the code should NEVER create new or qdel mannequins except for special cases
/proc/get_mannequin(var/ckey = "NULL")
	var/mob/living/carbon/human/dummy/mannequin/M = GLOB.mobcache_mannequins[ckey]
	if(!istype(M))
		GLOB.mobcache_mannequins[ckey] = new /mob/living/carbon/human/dummy/mannequin(null)
		M = GLOB.mobcache_mannequins[ckey]
	return GLOB.mobcache_mannequins[ckey]

// Deletes a mannequin from the mobcache and removes it's ref from the cache
// this should never be needed, but if future timeout cleanup is needed, this can be used.
/proc/del_mannequin(var/ckey = "NULL")
	var/mob/M = GLOB.mobcache_mannequins[ckey]
	if(!istype(M)) // Database entry was null, we're done
		GLOB.mobcache_mannequins -= ckey
		return
	qdel(M) // qdel if M is a type.
	GLOB.mobcache_mannequins -= ckey // remove after the qdel





//-------------------- mob/observer/dead --------------------
GLOBAL_LIST_EMPTY(mobcache_observer_deads)

// Either summons a cached /mob/observer/dead or creates one if it doesn't exist
// When using this, you should always try to assign the returned mob to a ckey IMMEDIATELY thereafter
// If there is a case where you want to fetch a ghost without inserting a /client, contact me
// otherwise summon_actions will have no client!
/proc/get_observer_dead(var/ckey = "NULL", var/turf/position = null, var/mob/target_appearance)
	var/mob/observer/dead/OD = GLOB.mobcache_observer_deads[ckey]
	if(!istype(OD)) // no observer
		OD = new /mob/observer/dead(target_appearance) // so create one
		OD.moveToNullspace() // move it out of the target_appearance mob
		GLOB.mobcache_observer_deads[ckey] = OD

	if(!istype(OD)) //check for magical failures
		log_and_message_admins("MOBCACHE: get_observer_dead failed!")
		return FALSE

	//At this point we've found our observer
	if(istype(target_appearance)) // dress it if a target appearance is defined
		OD.redress(target_appearance)
	if(isturf(position)) // Move it to our target turf if it is defined
		OD.forceMove(position)

	_OD_summon_actions_callback(OD) // this will actually execute after the caller of this function!
	return GLOB.mobcache_observer_deads[ckey] // assign our output

// internal use only. waitfor...sleep(0) more performant than spawn(0)
/proc/_OD_summon_actions_callback(var/mob/observer/dead/OD)
	set waitfor = FALSE // ...setting waitfor = false in a proc means that...
	sleep(0) // ...when we sleep, we return and allow our caller to process the return and finish itself...
	OD._mobcache_summon() // ... and then we call this AFTER the fact. this is apparently more optimal than spawn(0).

// Attempts to dismiss a /mob/observer/dead
// Doesn't need a ckey, so it can be called on logout
// Will check to see if the target mob exists in the database.
// If it does, it knows it has a reference, so it will call the dismiss_actions FIRST (a sort of virtual Destroy())
// THEN AFTERWARDS it teleports it to nullspace for storage.
// If you dismiss a mob that doesn't have a mobcache reference, it will instead qdel it and throw a warning. Ideally, this won't happen
/proc/dismiss_observer_dead(var/mob/observer/dead/OD)
	if(!istype(OD))
		return

	//see if our dismissal observer exists
	for(var/key in GLOB.mobcache_observer_deads)
		if(GLOB.mobcache_observer_deads[key] == OD)
			OD._mobcache_dismiss() // Call this FIRST! Don't call it in nullspace!!
			OD.moveToNullspace() // observer is in our observer db - hide in nullspace
			return

	//if it doesn't, qdel it
	log_and_message_admins("MOBCACHE: An unknown mob/observer/dead was qdelled due to not being databased")
	qdel(OD) // observer is not in observer db - qdel

// Attmpts to delete a /mob/observer/dead from the mobcache and removes it's ref from the cache
// this should never be needed, but if future timeout cleanup is needed, this can be used.
// force : if the new_player mob you're trying to delete has a client, force=TRUE: Ghostize them. force=FALSE: abort.
// returns TRUE if successful, FALSE if not.
/proc/del_observer_dead(var/ckey = "NULL", force = FALSE)
	var/mob/M = GLOB.mobcache_observer_deads[ckey]
	if(!istype(M)) // No database entry exists, we automatically succeed
		GLOB.mobcache_observer_deads -= ckey // remove a potential null
		return TRUE

	// found a client
	if(M.client)
		if(force)
			log_and_message_admins("MOBCACHE: Removed a /mob/new_player when it had an active client! The user was ghosted")
			if(!M.ghostize())
				log_and_message_admins("MOBCACHE: The previous ghosting action failed! Jesus christ.") //this REALLY shouldn't happen
				return FALSE //somehow the ghostizing fails
			return TRUE //user was ghosted
		else
			log_and_message_admins("MOBCACHE: Attempted to remove a /mob/new_player when it had an active client! aborted")
			return FALSE // force=false, so don't try to ghost them

	// no client
	qdel(GLOB.mobcache_observer_deads[ckey])
	GLOB.mobcache_observer_deads -= ckey
	return TRUE // success





//-------------------- mob/newplayer --------------------
GLOBAL_LIST_EMPTY(mobcache_newplayers)

// fetches a /mob/new_player from the database. This should almost never have to create one,
// because a connecting new client has one created for it on /world.
// when it is created, it registers itself in /mob/new_player/New() using the update_newplayer_from_current function below
/proc/get_newplayer(var/ckey = "NULL")
	var/mob/new_player/NP = GLOB.mobcache_newplayers[ckey]
	if(!istype(NP))
		NP = new /mob/new_player/(null)
		GLOB.mobcache_newplayers[ckey] = NP

	_NP_summon_actions_callback(NP)
	return GLOB.mobcache_newplayers[ckey]

// internal use only. waitfor...sleep(0) more performant than spawn(0)
/proc/_NP_summon_actions_callback(var/mob/new_player/NP)
	set waitfor = FALSE // ...setting waitfor = false in a proc means that...
	sleep(0) // ...when we sleep, we return and allow our caller to process the return and finish itself...
	NP._mobcache_summon() // ... and then we call this AFTER the fact. this is apparently more optimal than spawn(0).

// since new_players is the default mob (created by /world when a brand new client connects),
// we cannot create it. It's created for us. So, we have this proc to update the database after the fact...
// This chould be called on /mob/new_player/New()
// that way, new only ever runs once for a user. thereafter, the new_player mob is cached and puts their ckey back in when resummoned
/proc/update_newplayer_from_current(var/mob/new_player/NP, var/ckey = "NULL")
	if(!istype(NP, /mob/new_player))
		return

	if(ckey in GLOB.mobcache_newplayers) //ckey key exists
		if(GLOB.mobcache_newplayers[ckey] == NP) //ckey key's ref is same as new - no update needed
			return
		else
			log_and_message_admins("MOBCACHE: New /mob/new_player created when an old one existed! Removing old one.")
			if(!del_newplayer(ckey)) //ckey's ref was different - delete the old ref
				log_and_message_admins("MOBCACHE: Old /mob/new_player had a client! Something has gone horribly wrong.")
				return


	GLOB.mobcache_newplayers[ckey] = NP

// This attempts to remove a /mob/new_player from the database and then delete it
// It should rarely be needed if everything works right
// force : if the new_player mob you're trying to delete has a client, force=TRUE: Ghostize them. force=FALSE: abort.
// ideally, avoid using force=TRUE
// Ghosting someone out of a new_player mob is kind of weird... but then again it should never really happen. Better than kicking them!
// returns TRUE if successful, FALSE if not.
/proc/del_newplayer(var/ckey = "NULL", force = FALSE)
	var/mob/M = GLOB.mobcache_newplayers[ckey]
	if(!istype(M)) // No database entry exists, we automatically succeed
		GLOB.mobcache_newplayers -= ckey // remove a potential null
		return TRUE

	// found a client
	if(M.client)
		if(force)
			log_and_message_admins("MOBCACHE: Removed a /mob/new_player when it had an active client! The user was ghosted")
			if(!M.ghostize())
				log_and_message_admins("MOBCACHE: The previous ghosting action failed! Jesus christ.") //this REALLY shouldn't happen
				return FALSE //somehow the ghostizing fails
			return TRUE //user was ghosted
		else
			log_and_message_admins("MOBCACHE: Attempted to remove a /mob/new_player when it had an active client! aborted")
			return FALSE // force=false, so don't try to ghost them

	// no client
	qdel(GLOB.mobcache_newplayers[ckey])
	GLOB.mobcache_newplayers -= ckey
	return TRUE // success

// A new_mob is never really 'dismissed'. It already exists in nullspace, just a place to hold someone perousing the menu..
// nonetheless, we have this to handle instead where a qdel used to go.
/proc/dismiss_new_player(var/mob/new_player/NP)
	if(!istype(NP))
		return

	//see if our dismissal observer exists
	for(var/key in GLOB.mobcache_newplayers)
		if(GLOB.mobcache_newplayers[key] == NP)
			NP._mobcache_dismiss() // Call this FIRST
			if(NP.loc) // if they escaped
				log_and_message_admins("MOBCACHE: A mob/new_player somehow got out of Nullspace! Sending them home...") // how tho
				NP.moveToNullspace() // go home
			return

	//if it doesn't, qdel it
	log_and_message_admins("MOBCACHE: An unknown mob/new_player was qdelled due to not being databased")
	qdel(NP) // observer is not in observer db - qdel




//-------------------- mob subtype procs --------------------
// For any full type used in the mobcache;
// for all behaviors and calls of that type's New/Initialize/LateInitialize that is UNDONE in that type's Logout;
//
// You must define the same SET behaviors in the same type's mobcache_summon_actions (for new/initialize/lateinitialize assignments linked to Logout unassignments)
// And the same corresponding UNSET behavior in the same type's mobcache_dismiss_actions (for LOGOUT unassignments linked to New/Initialize/Lateinitialize assignments)
//
// And the same for all subtypes (IF the type uses ..())
//
// Basically, if a mob was expected to be created, used and then destroyed,
// you need to 'simulate' the Creation and Destruction behavior in summon_actions and dismiss_actions.
//
// Try to not destroy stuff on logout/dismissal that doesn't NEED to be destroyed.
// Sometimes it has to be done though. And that's what this is for.
//
//

//------------------ dismiss/summon FILTERED CALL procs -------------------
// This is used to filter the exact types that should be calling mobcache_dismiss_actions and mobcache_summon_actions
// Only /mob subtypes actually defined as cached here should have ANY behavior work for them
// These procs ensure the correct types execute the correct proc/overrides of proc.
//


/mob/proc/final/_mobcache_dismiss()
	if(istype(src, /mob/new_player))
		var/mob/new_player/NP = src
		NP?.mobcache_dismiss_actions()
		return

	if(istype(src, /mob/observer/dead))
		var/mob/observer/dead/OD = src
		OD?.mobcache_dismiss_actions()
		return
	log_and_message_admins("MOBCACHE: an invalid mob called mobcache_dismiss")

/mob/proc/final/_mobcache_summon()
	if(istype(src, /mob/new_player))
		var/mob/new_player/NP = src
		NP?.mobcache_summon_actions()
		return

	if(istype(src, /mob/observer/dead))
		var/mob/observer/dead/OD = src
		OD?.mobcache_summon_actions()
		return
	log_and_message_admins("MOBCACHE: an invalid mob called mobcache_summon")



//------------------ dismiss/summon ACTIONS/BEHAVIOR procs -------------------
//
// DO NOT CALL THE PROCS BELOW ANYWHERE. They should ONLY BE CALLED by the corresponding _mobcache_summon and _mobcache_destroy ABOVE!!
// ONLY OVERRIDE THEM with the behaviors you need to mimic for your cached types!
//

// Actions to call when dismissing the observer (Virtual Destroy)
// This is called similar to logout, shortly AFTER it.
// No /client, called JUST BEFORE the observer is sent to nullspace
/mob/proc/mobcache_dismiss_actions()
	return .


// Actions to call when summoning the observer (Virtual New/Initialise)
// This is similar to login
// (hopefully) called AFTER the client has logged in
/mob/proc/mobcache_summon_actions()
	if(istype(src, /mob/new_player)) // root behaviors for /mob/newplayers
		if(!client)
			log_and_message_admins("MOBCACHE: A new_player was summoned but not given a client!")

	if(istype(src, /mob/observer/dead)) // root behaviors for /mob/observer/dead
		if(!client)
			log_and_message_admins("MOBCACHE: A observer was summoned but not given a client!")

		if(!isturf(loc)) // we ended up in nullspace somehow
			to_chat(src, "<span class='danger'>Could not locate an observer spawn point. Use the Teleport verb to jump to the station map.</span>")

	return .
