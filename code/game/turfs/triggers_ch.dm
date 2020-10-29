/turf/simulated
	var/triggers = FALSE
	var/list/potential_triggerers = list()	//What can set off our trigger?
	var/list/trig_target_paths = list()		//What are the paths of whatever we want to call our proc on?
	var/trig_target_trigger_uid				//What is the trigger_uid of whatever we want to call our proc on?
	var/trig_proc							//What proc do we want to call?
	var/list/trig_args = list()				//What are the arguments for said proc?
	var/trig_message						//Should we send a message to the person who stepped here?
	var/message_span_class = "notice"		//If we're gonna send them a message, what span class to use?
	var/trig_single_use = FALSE				//Is this only a single use trigger, or can it be used multiple times?
	var/has_been_used = FALSE				//Has this trigger been set off yet?
	var/list/trig_targets = list()			//This is set automatically if the other target vars are set.


/turf/simulated/proc/can_use_trigger(atom/movable/mover)
	if(trig_single_use && has_been_used)
		return FALSE
	if(!potential_triggerers.len)
		return TRUE
	else
		for(var/path in potential_triggerers)
			if(istype(mover,text2path(trim(path))))
				return TRUE
			else
				continue
	return FALSE

/turf/simulated/Entered(atom/movable/mover, atom/oldloc)
	. = ..()
	if(triggers && can_use_trigger(mover))
		if(trig_proc)
			if(trig_targets.len)
				var/testname = trig_proc
				//Find one of the 3 possible ways they could have written /proc/PROCNAME
				if(findtext(trig_proc, "/proc/"))
					testname = replacetext(trig_proc, "/proc/", "")
				else if(findtext(trig_proc, "/proc"))
					testname = replacetext(trig_proc, "/proc", "")
				else if(findtext(trig_proc, "proc/"))
					testname = replacetext(trig_proc, "proc/", "")
				//Clear out any parenthesis if they're a dummy
				testname = replacetext(testname, "()", "")
				for(var/trig_target in trig_targets)
					if(trig_target && !hascall(trig_target,testname))
						message_admins("TRIGGER ERROR: ONE OR MORE TRIGGER TARGETS LACKS THE MENTIONED PROC")
						return
				for(var/trig_target in trig_targets)
					call(trig_target,testname)(arglist(trig_args))
			else
				var/procpath = text2path(trig_proc)
				if(!procpath)
					message_admins("TRIGGER ERROR: INVALID PROC")
					return
				call(procpath)(arglist(trig_args))
		if(trig_message)
			to_chat(mover,"<span class='[message_span_class]'>"+trig_message+"</span>")
		has_been_used = TRUE
	else 
		return

/turf/simulated/proc/update_trig_targets()
	trig_targets = list()
	for(var/path in trig_target_paths)
		var/trig_target_path = text2path(path)
		if(trig_target_path && trig_target_trigger_uid)
			var/list/candidates = get_all_of_type(trig_target_path)
			for(var/candidate in candidates)
				var/datum/cand_datum = candidate
				if(istype(cand_datum))
					if(cand_datum.trigger_uid == trig_target_trigger_uid)
						trig_targets += candidate
						continue
				continue
	if(!trig_targets.len)
		message_admins("TRIGGER ERROR: trig_targets STILL EMPTY AFTER CALLED update_trig_targets()")

/turf/simulated/Initialize(mapload)
	. = ..()
	if(triggers)
		update_trig_targets()