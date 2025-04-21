/datum/event/horde_infestation
	announceWhen	= 30
	endWhen		= 200
	var/spawncount = 1
	var/list/vents = list()
	var/spiders = FALSE
	var/metroids = FALSE
	var/list/alive_metroids = list()

/datum/event/horde_infestation/setup()
	announceWhen = rand(announceWhen, announceWhen + 60)

	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in GLOB.machines) //Gathering together all possible areas to spawn mobs.
		//CHOMPEdit: Added a couple areas to the exclusion.
		var/area/in_area = get_area(temp_vent)
		if(in_area.flag_check(AREA_FORBID_EVENTS))
			continue
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels)) //No spawns on welded vents
			if(temp_vent.network.normal_members.len > 10) //CHOMP Edit: Most our networks are 40. SM is 4 and toxins is 2. This needed to change in order to spawn.
				vents += temp_vent

	if(prob(50)) //50/50 chance on spiders or metroids.
		log_debug("Hord event, spiders selected.")
		spawncount = rand(4 * severity, 10 * severity)
		sent_spiders_to_station = 0
		spiders = TRUE

	else
		log_debug("Horde event, metroids selected.")
		spawncount = rand(2 * severity, 4 * severity)
		metroids = TRUE


/datum/event/horde_infestation/announce()
	if(spiders) //Horrible way of doing this
		command_announcement.Announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", new_sound = 'sound/AI/aliens.ogg')
	if(metroids) //Horrible way of doing this
		command_announcement.Announce("High-energy lifeforms detected coming aboard [station_name()]. All crew members, stay alert, and listen to security instructions.", "Lifesign Alert", new_sound = 'sound/misc/alarm1.ogg')

/datum/event/horde_infestation/start()
	if(spiders)
		for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in GLOB.machines)
			//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work.
			var/area/in_area = get_area(temp_vent)
			if(in_area.flag_check(AREA_FORBID_EVENTS))
				continue
			if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
				if(temp_vent.network.normal_members.len > 10) //CHOMP Edit: Most our networks are 40. SM is 4 and toxins is 2. This needed to change to 10 from 50 in order for spawns to work.
					var/area/A = get_area(temp_vent)
					if(!(A.flag_check(AREA_FORBID_EVENTS)))
						vents += temp_vent

		while((spawncount >= 1) && vents.len)
			var/obj/vent = pick(vents)
		//CHOMPEDIT START adding spider EGGS to the possible spawns instead of singular spiderling spawns.
			var/spawn_spiderlings = pickweight(list(
				/obj/effect/spider/spiderling/space = 95,
				/obj/effect/spider/eggcluster/space = 4,
				/obj/effect/spider/eggcluster/royal/space = 1
				))
			new spawn_spiderlings(vent.loc) //VOREStation Edit - No nurses //Oh my JESUS CHRIST, this slipped past me. Literally no nurses. Well guess what, nurses are back.
		//CHOMPEDIT END
			vents -= vent
			spawncount--
	if(metroids)
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

/datum/event/horde_infestation/end()
	if(spiders)
		return
	if(metroids)
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
		if(area_names.len)
			var/english_list = english_list(area_names)
			command_announcement.Announce("Sensors have narrowed down remaining lifeforms to the following areas: [english_list]", "Lifesign Alert")
