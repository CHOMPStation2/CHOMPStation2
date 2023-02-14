/datum/event/metroid_infestation
	announceWhen	= 90
	endWhen			= 200
	var/spawncount = 1
	var/list/vents = list()
	var/give_positions = 0

/datum/event/metroid_infestation/setup()
	if(prob(50)) //50% chance of the event to even occur if procced
		kill()
		return
	announceWhen = rand(announceWhen, announceWhen + 60)

	spawncount = rand(2 * severity, 4 * severity)

	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
		//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work.
		var/in_area = get_area(temp_vent)
		if(istype(in_area, /area/crew_quarters/sleep) || istype(in_area, /area/hallway/secondary/entry))
			continue
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 10) //CHOMP Edit: Most our networks are 40. SM is 4 and toxins is 2. This needed to change in order to spawn.
				vents += temp_vent

/datum/event/metroid_infestation/announce()
	command_announcement.Announce("High-energy lifeforms detected coming aboard [station_name()]. All crew members, stay alert, and listen to security instructions.", "Lifesign Alert", new_sound = 'sound/misc/alarm1.ogg')

/datum/event/metroid_infestation/start()
	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
		var/spawn_metroids = pickweight(list(
			/mob/living/simple_mob/metroid/juvenile/baby = 60,
			/mob/living/simple_mob/metroid/juvenile/super = 30,
			/mob/living/simple_mob/metroid/juvenile/alpha = 10
			))
		new spawn_metroids(get_turf(vent))
		vents -= vent
		spawncount--
	vents.Cut()

/datum/event/metroid_infestation/end()
	var/list/area_names = list()
	for(var/metroids in existing_metroids)
		var/mob/living/M = metroids
		if(!M || M.stat == DEAD)
			continue
		var/area/metroid_area = get_area(M)
		if(!metroid_area) //Huh, really?
			if(!get_turf(M)) //No turf either?
				qdel(M) //Must have been nullspaced
				continue
		area_names |= metroid_area.name
	if(area_names.len)
		var/english_list = english_list(area_names)
		command_announcement.Announce("Sensors have narrowed down remaining lifeforms to the followng areas: [english_list]", "Lifesign Alert")
