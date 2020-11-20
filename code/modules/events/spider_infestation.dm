/var/global/sent_spiders_to_station = 0

/datum/event/spider_infestation
	announceWhen	= 90
	var/spawncount = 1


/datum/event/spider_infestation/setup()
	announceWhen = rand(announceWhen, announceWhen + 60)
	spawncount = rand(4 * severity, 6 * severity)	//spiderlings only have a 50% chance to grow big and strong
	sent_spiders_to_station = 0

/datum/event/spider_infestation/announce()
	command_announcement.Announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", new_sound = 'sound/AI/aliens.ogg')


/datum/event/spider_infestation/start()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
		//CHOMPEdit: Added a couple areas to the exclusion. Also made this actually work. Also make it ugly af because apparently it doesn't like looking at subtypes so I gotta get specific?
		var/in_area = get_area(temp_vent)
		if(istype(in_area, /area/crew_quarters/sleep/vistor_room_1) || istype(in_area, /area/crew_quarters/sleep/vistor_room_2) || istype(in_area, /area/crew_quarters/sleep/vistor_room_3) || istype(in_area, /area/crew_quarters/sleep/vistor_room_4) || istype(in_area, /area/crew_quarters/sleep/vistor_room_5) || istype(in_area, /area/crew_quarters/sleep/vistor_room_6) || istype(in_area, /area/crew_quarters/sleep/vistor_room_7) || istype(in_area, /area/crew_quarters/sleep/vistor_room_8) || istype(in_area, /area/crew_quarters/sleep/vistor_room_9) || istype(in_area, /area/crew_quarters/sleep/vistor_room_10) || istype(in_area, /area/crew_quarters/sleep/vistor_room_11) || istype(in_area, /area/crew_quarters/sleep/vistor_room_12) || istype(in_area, /area/crew_quarters/sleep/vistor_room_13) || istype(in_area, /area/crew_quarters/sleep/vistor_room_14) || istype(in_area, /area/hallway/secondary/entry/D1) || istype(in_area, /area/hallway/secondary/entry/D2) || istype(in_area, /area/hallway/secondary/entry/D3))
			continue
		if(!temp_vent.welded && temp_vent.network && temp_vent.loc.z in using_map.station_levels)
			if(temp_vent.network.normal_members.len > 50)
				vents += temp_vent

	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
		new /obj/effect/spider/spiderling/virgo(vent.loc) //VOREStation Edit - No nurses
		vents -= vent
		spawncount--
