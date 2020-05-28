/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 165
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0
//YW Edit Start- Adjusted anouncement to be in line with cryogaia.
/datum/event/radiation_storm/announce()
	command_announcement.Announce("Stellar Radiation flare detected from BD +33 2642, Protoplanetary Nebula. Radiation expected to flood space near \the [station_name()]. Please evacuate into one of the shielded maintenance tunnels or dorms.", "Anomaly Alert", new_sound = 'sound/AI/radiation.ogg') //VOREStation Edit - Dorms ref

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("The outpost has entered the radiation flare. Please remain in a sheltered area until the radiation flare has passed.", "Anomaly Alert")
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		command_announcement.Announce("The outpost has passed the radiation flare. Please allow for up to one minute while radiation levels dissipate, and report to medbay if you experience any unusual symptoms. Maintenance will lose all access again shortly.", "Anomaly Alert")
/datum/event/radiation_storm/proc/radiate()
	var/radiation_level = rand(15, 35)
	for(var/z in using_map.station_levels)
		SSradiation.z_radiate(locate(1, 1, z), radiation_level, 1)
//YW Edit end.
	for(var/mob/living/carbon/C in living_mob_list)
		var/area/A = get_area(C)
		if(!A)
			continue
		if(A.flags & RAD_SHIELDED)
			continue
		if(istype(C,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = C
			if(prob(5))
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)

/datum/event/radiation_storm/end()
	revoke_maint_all_access()

/datum/event/radiation_storm/syndicate/radiate()
	return
