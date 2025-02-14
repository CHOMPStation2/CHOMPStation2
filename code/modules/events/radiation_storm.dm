/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 165
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0

/datum/event/radiation_storm/announce()
	command_announcement.Announce("High levels of radiation detected near \the [station_name()]. Please evacuate into one of the shielded maintenance tunnels or dorms. The area of the cafeteria is also shielded.", "Anomaly Alert", new_sound = 'sound/AI/radiation.ogg') //VOREStation Edit - Dorms ref //CHOMPEdit: Restored original message, TFF 16/4/20 - mention additional safe place(s) in announcement

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("The station has entered the radiation belt. Please remain in a sheltered area until we have passed the radiation belt.", "Anomaly Alert") //CHOMPEdit: Restored original message
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		command_announcement.Announce("The station has passed the radiation belt. Please allow for up to one minute while radiation levels dissipate, and report to medbay if you experience any unusual symptoms. Maintenance will lose all access again shortly.", "Anomaly Alert") //CHOMPEdit: Restored original message
/datum/event/radiation_storm/proc/radiate()
	var/radiation_level = rand(15, 35)
	for(var/z in using_map.station_levels)
		SSradiation.z_radiate(locate(1, 1, z), radiation_level, 1)

	for(var/mob/living/carbon/C in living_mob_list)
		if(!(C.z in using_map.station_levels) || C.isSynthetic() || isbelly(C.loc))
			continue
		var/area/A = get_area(C)
		if(!A)
			continue
		if(A.flag_check(RAD_SHIELDED))
			continue
		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			var/chance = 5.0
			chance -= (chance / 100) * C.getarmor(null, "rad")
			//CHOMPEdit Start
			if(C.species.traits.Find(/datum/trait/positive/rad_resistance))
				chance -= (chance / 100) * 20
			if(C.species.traits.Find(/datum/trait/positive/rad_resistance_extreme))
				chance -= (chance / 100) * 60
			if(C.species.traits.Find(/datum/trait/positive/rad_immune))
				chance -= (chance / 100) * 100
			if(prob(round(chance, 0.01)))
			//CHOMPEdit End
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)
				H.UpdateAppearance()

/datum/event/radiation_storm/end()
	revoke_maint_all_access()

/datum/event/radiation_storm/syndicate/radiate()
	return
