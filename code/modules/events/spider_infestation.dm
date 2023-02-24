/var/global/sent_spiders_to_station = 0

/datum/event/spider_infestation
	announceWhen	= 90
	var/spawncount = 1


/datum/event/spider_infestation/setup()
	if(prob(75) && severity == 3) //CHOMP Add 75% chance of the event to even occur if chosen and is major severity
		log_debug("Major spider infestation failed successfully.")
		kill()
		return
	announceWhen = rand(announceWhen, announceWhen + 60)
	spawncount = rand(6 * severity, 14 * severity)	//spiderlings only have a 50% chance to grow big and strong //CHOMP Edit: old: 2/4 new: 6/14
	sent_spiders_to_station = 0

/datum/event/spider_infestation/announce()
	command_announcement.Announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", new_sound = 'sound/AI/aliens.ogg')


/datum/event/spider_infestation/start()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
		//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work.
		var/in_area = get_area(temp_vent)
		if(istype(in_area, /area/crew_quarters/sleep) || istype(in_area, /area/hallway/secondary/entry))
			continue
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 10) //CHOMP Edit: Most our networks are 40. SM is 4 and toxins is 2. This needed to change to 10 from 50 in order for spawns to work.
				var/area/A = get_area(temp_vent)
				if(!(A.forbid_events))
					vents += temp_vent

	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
		new /obj/effect/spider/spiderling(vent.loc) //VOREStation Edit - No nurses //Oh my JESUS CHRIST, this slipped past me. Literally no nurses. Well guess what, nurses are back.
		vents -= vent
		spawncount--
