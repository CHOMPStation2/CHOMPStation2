/datum/event/metroid_infestation
	announceWhen	= 90
	endWhen			= 200
	var/spawncount = 1
	var/list/vents = list()
	var/give_positions = 0
	var/active_metroid_event = TRUE
	var/list/alive_metroids = list()

/datum/event/metroid_infestation/setup()
	active_metroid_event = TRUE
	announceWhen = rand(announceWhen, announceWhen + 60)

	spawncount = rand(2 * severity, 4 * severity)

	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in GLOB.machines)
		//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work.
		var/area/in_area = get_area(temp_vent)
		if(in_area.flag_check(AREA_FORBID_EVENTS))
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
			/mob/living/simple_mob/metroid/juvenile/alpha = 10,
			/mob/living/simple_mob/metroid/juvenile/gamma = 3,
			/mob/living/simple_mob/metroid/juvenile/zeta = 2,
			/mob/living/simple_mob/metroid/juvenile/omega = 1,
			))
		alive_metroids.Add(new spawn_metroids(get_turf(vent)))
		vents -= vent
		spawncount--
	vents.Cut()

/datum/event/metroid_infestation/end()
	var/list/area_names = list()
	for(var/metroids in alive_metroids)
		var/mob/living/M = metroids
		if(!M || M.stat == DEAD)
			continue
		var/area/metroid_area = get_area(M)
		if(!metroid_area) //Huh, really?
			if(!get_turf(M)) //No turf either?
				qdel(M) //Must have been nullspaced
				continue
		area_names |= metroid_area.name
	if(area_names.len && active_metroid_event == TRUE)
		var/english_list = english_list(area_names)
		command_announcement.Announce("Sensors have narrowed down remaining lifeforms to the following areas: [english_list]", "Lifesign Alert")
