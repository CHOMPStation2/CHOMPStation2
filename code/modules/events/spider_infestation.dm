/var/global/sent_spiders_to_station = 0

/datum/event/spider_infestation
	announceWhen	= 90
	var/spawncount = 1


/datum/event/spider_infestation/setup()
<<<<<<< HEAD
	if(prob(25)) //CHOMP Add 25% chance for the event to fail if chosen
		log_debug("Spider infestation failed successfully.")
		kill()
		return

	announceWhen = rand(announceWhen, announceWhen + 60)
	spawncount = rand(4 * severity, 10 * severity)	//spiderlings only have a 50% chance to grow big and strong //CHOMP Edit: old: 2/4 new: 6/14 new: 4/10
=======
	announceWhen = rand(announceWhen, announceWhen + 60)
	spawncount = rand(4 * severity, 6 * severity)	//spiderlings only have a 50% chance to grow big and strong
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	sent_spiders_to_station = 0

/datum/event/spider_infestation/announce()
	command_announcement.Announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", new_sound = 'sound/AI/aliens.ogg')


/datum/event/spider_infestation/start()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
<<<<<<< HEAD
		//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work.
		var/in_area = get_area(temp_vent)
		if(istype(in_area, /area/crew_quarters/sleep) || istype(in_area, /area/hallway/secondary/entry))
			continue
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 10) //CHOMP Edit: Most our networks are 40. SM is 4 and toxins is 2. This needed to change to 10 from 50 in order for spawns to work.
=======
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 50)
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
				var/area/A = get_area(temp_vent)
				if(!(A.forbid_events))
					vents += temp_vent

	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
<<<<<<< HEAD

	//CHOMPEDIT START adding spider EGGS to the possible spawns instead of singular spiderling spawns.
		if(severity == 3)
			var/spawn_spiderlings = pickweight(list(
				/obj/effect/spider/spiderling/space = 95,
				/obj/effect/spider/eggcluster/space = 4,
				/obj/effect/spider/eggcluster/royal/space = 1
				))
			new spawn_spiderlings(vent.loc)
		if(severity < 3) //If the severity is less than 3, only spawn regular spiderlings
			new /obj/effect/spider/spiderling/broodling(vent.loc) //VOREStation Edit - No nurses //CHOMP Edit Oh my JESUS CHRIST, this slipped past me. Literally no nurses. Well guess what, nurses are back.

	//CHOMPEDIT END
=======
		new /obj/effect/spider/spiderling/virgo(vent.loc) //VOREStation Edit - No nurses
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
		vents -= vent
		spawncount--
