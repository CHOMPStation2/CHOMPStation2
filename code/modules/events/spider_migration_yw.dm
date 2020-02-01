/datum/event/spider_migration
	announceWhen	= 50
	endWhen 		= 900

	var/list/spawned_spider = list()

/datum/event/spider_migration/setup()
	announceWhen = rand(40, 60)
	endWhen = rand(600,1200)

/datum/event/spider_migration/announce()
	var/announcement = ""
	if(severity == EVENT_LEVEL_MAJOR)
		announcement = "Massive breach of [station_name()] walls detected. Unknown biological entities has been detected near within perimeter. Heavily armed Security Patrol required."
	else
		announcement = "Unknown biological [spawned_spider.len == 1 ? "entity has" : "entities have"] bypassed [station_name()]'s perimeter walls, Security Patrol."
	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/spider_migration/start()
	if(severity == EVENT_LEVEL_MAJOR)
		spawn_spider(landmarks_list.len)
	else if(severity == EVENT_LEVEL_MODERATE)
		spawn_spider(rand(4, 6)) 			//12 to 30 spider, in small groups
	else
		spawn_spider(rand(1, 3), 1, 2)	//1 to 6 spider, alone or in pairs

/datum/event/spider_migration/proc/spawn_spider(var/num_groups, var/group_size_min=3, var/group_size_max=5)
	var/list/spawn_locations = list()

	for(var/obj/effect/landmark/C in landmarks_list)
		if(C.name == "carpspawn")
			spawn_locations.Add(C.loc)
	spawn_locations = shuffle(spawn_locations)
	num_groups = min(num_groups, spawn_locations.len)

	var/i = 1
	while (i <= num_groups)
		var/group_size = rand(group_size_min, group_size_max)
		for (var/j = 1, j <= group_size, j++)
			spawned_spider.Add(new /mob/living/simple_mob/animal/giant_spider/frost/event(spawn_locations[i]))
		i++

/datum/event/spider_migration/end()
	spawn(0)
		for(var/mob/living/simple_mob/SM in spawned_spider)
			if(!SM.stat)
				var/turf/T = get_turf(SM)
				if(istype(T, /turf/space))
					if(prob(75))
						qdel(SM)
			sleep(1)