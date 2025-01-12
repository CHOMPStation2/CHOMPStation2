/proc/wormhole_event(var/set_duration = 5 MINUTES, var/wormhole_duration_modifier = 1)
	spawn()
	// CHOMPEdit Start - Only allowing these to go to the station
		var/list/pick_turfs = list()
		var/list/exits = list()
		var/list/Z_choices = list()

		Z_choices |= using_map.get_map_levels(1, FALSE)
		Z_choices -= global.using_map.sealed_levels
	// CHOMPEdit End
		for(var/turf/simulated/floor/T in world)
			var/area/A = T.loc
			if(T.z in Z_choices)
				if(!T.block_tele)
					pick_turfs += T
				if(A.flag_check(AREA_FORBID_EVENTS)) // CHOMPEdit - No spawning in dorms
					continue
		// CHOMPAdd Start - Chance to end up in a belly. Fun (:
		for(var/mob/living/mob in player_list)
			if(mob.can_be_drop_pred && isfloor(mob.loc))
				var/turf/simulated/floor/T = get_turf(mob.loc)
				if(!T.block_tele)
					if(mob.vore_selected)
						exits += mob.vore_selected
					else if(mob.vore_organs.len)
						exits += pick(mob.vore_organs)

		exits |= pick_turfs
		// CHOMPAdd End

		if(pick_turfs.len)

			var/wormhole_max_duration = round((5 MINUTES) * wormhole_duration_modifier)
			var/wormhole_min_duration = round((30 SECONDS) * wormhole_duration_modifier)

			//All ready. Announce that bad juju is afoot.
			command_announcement.Announce("Space-time anomalies detected on the station. There is no additional data.", "Anomaly Alert", new_sound = 'sound/AI/spanomalies.ogg')

			//prob(20) can be approximated to 1 wormhole every 5 turfs!
			//admittedly less random but totally worth it >_<
			var/event_duration = set_duration
			var/number_of_selections = round(pick_turfs.len/(4 * (Z_choices.len + 1)))+1	//+1 to avoid division by zero!
			var/sleep_duration = 0.2 SECONDS
			var/end_time = world.time + event_duration	//the time by which the event should have ended

			var/increment =	max(1,round(number_of_selections/50))
//			to_world("DEBUG: number_of_selections: [number_of_selections] | sleep_duration: [sleep_duration]")

			var/index = 1
			for(var/I = 1 to number_of_selections)

				//we've run into overtime. End the event
				if( end_time < world.time )
//					to_world("DEBUG: we've run into overtime. End the event")
					return
				if( !pick_turfs.len )
//					to_world("DEBUG: we've run out of turfs to pick. End the event")
					return

				//loop it round
				index += increment
				index %= pick_turfs.len
				index++

				//get our enter and exit locations
				var/turf/simulated/floor/enter = pick_turfs[index]
				pick_turfs -= enter							//remove it from pickable turfs list
				if( !enter || !istype(enter) )	continue	//sanity

				var/atom/exit = pick(exits) // CHOMPEdit
//				pick_turfs -= exit
				if( !exit || !istype(exit) )	continue	//sanity

				create_wormhole(enter,exit,wormhole_min_duration,wormhole_max_duration)

				sleep(sleep_duration)						//have a well deserved nap!


//maybe this proc can even be used as an admin tool for teleporting players without ruining immulsions?
/proc/create_wormhole(var/turf/enter as turf, var/atom/exit, var/min_duration = 30 SECONDS, var/max_duration = 60 SECONDS) // CHOMPEdit
	set waitfor = FALSE
	var/obj/effect/portal/P = new /obj/effect/portal( enter )
	P.target = exit
	P.creator = null
	P.icon = 'icons/obj/objects.dmi'
	P.failchance = 0
	P.icon_state = "bhole3" // CHOMPEdit - Better icon as well
	P.name = "wormhole"
	P.event = TRUE // CHOMPAdd
	spawn(rand(min_duration,max_duration))
		qdel(P)
