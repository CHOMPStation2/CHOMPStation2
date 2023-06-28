//Royal spider eggs exsist, let's see what they do. Mostly copying the normal spider event and adjusting
/var/global/sent_royalspiders_to_station = 0

/datum/event/spider_royalinfest
	announceWhen	= 90
	var/spawncount = 1


/datum/event/spider_royalinfest/setup()
	if(prob(25) && severity == 3) //CHOMP Add 25% chance for the event to fail if chosen and is major severity
		log_debug("Major spider infestation failed successfully.")
		kill()
		return
	announceWhen = rand(announceWhen, announceWhen + 60)
	spawncount = rand(6 * severity, 14 * severity)	//spiderlings only have a 50% chance to grow big and strong //CHOMP Edit: old: 2/4 new: 6/14
	sent_royalspiders_to_station = 0

/datum/event/spider_royalinfest/announce()
	command_announcement.Announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", new_sound = 'sound/AI/aliens.ogg')


/datum/event/spider_royalinfest/start()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
		var/in_area = get_area(temp_vent)
		if(istype(in_area, /area/crew_quarters/sleep) || istype(in_area, /area/hallway/secondary/entry))
			continue
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 10)
				var/area/A = get_area(temp_vent)
				if(!(A.forbid_events))
					vents += temp_vent

	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
	//CHOMPEDIT START adding spider EGGS to the possible spawns instead of singular spiderling spawns.
		var/spawn_spiderlings = pickweight(list(
			/obj/effect/spider/spiderling = 40,
			/obj/effect/spider/eggcluster/royal = 30,
			/obj/effect/spider/eggcluster = 30
			))
		new spawn_spiderlings(vent.loc) //VOREStation Edit - No nurses //Oh my JESUS CHRIST, this slipped past me. Literally no nurses. Well guess what, nurses are back.
	//CHOMPEDIT END
		vents -= vent
		spawncount--
