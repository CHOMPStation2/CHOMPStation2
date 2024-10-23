/datum/event/disease_outbreak/infectedroom
	var/area/target_area
	var/area/target_turfs = list()
	var/infected_tiles

	var/list/excluded = list(
		/area/shuttle,
		/area/crew_quarters,
		/area/holodeck,
		/area/construction,
		/area/engineering/engine_room,
		/area/engineering/engine_monitoring,
		/area/engineering/gravgen,
		/area/maintenance,
		/area/medical,
		/area/rnd/test_area)

/datum/event/disease_outbreak/infectedroom/setup()
	announceWhen = rand(0, 1500)
	endWhen = announceWhen + 1
	var/list/area/affected_area = get_station_areas(excluded)

	if(isemptylist(diseases_minor) && isemptylist(diseases_moderate_major))
		populate_diseases()
	if(isemptylist(transmissable_symptoms))
		populate_symptoms()
	var/datum/disease/virus

	if(prob(50))
		switch(severity)
			if(EVENT_LEVEL_MODERATE)
				virus = pick(diseases_minor)
				infected_tiles = rand(5, 8)
			if(EVENT_LEVEL_MAJOR)
				virus = pick(diseases_moderate_major)
				infected_tiles = rand(7, 10)
		chosen_disease = new virus()
	else
		if(severity == EVENT_LEVEL_MAJOR)
			chosen_disease = create_virus(severity * pick(2,3))	//50% chance for a major disease instead of a moderate one
			infected_tiles = rand(7, 10)
		else
			chosen_disease = create_virus(severity * 2)
			infected_tiles = rand(5, 8)

	for(var/i in 1 to 10)
		var/area/A = pick(affected_area)
		if(is_area_occupied(A))
			log_debug("infectedroom event: Rejected [A] because it is occupied.")
			continue

		var/list/turfs = list()
		for(var/turf/simulated/floor/F in A)
			if(!F.check_density())
				turfs += F
		if(turfs.len == 0)
			log_debug("infectedroom event: Rejected [A] because it has no clear turfs.")
			continue
		target_area = A
		target_turfs = turfs

	if(!target_area)
		log_debug("infectedroom event: Giving up after too many failures to pick target area")
		kill()
		return
	else
		log_debug("infectedroom event: [target_area] was chosen. Infecting...")
		log_admin("Infected room event started; Virus: [chosen_disease]")
		message_admins("Infected room event started; Virus: <a href='?src=\ref[chosen_disease];[HrefToken()];info=1'></a>")

/datum/event/disease_outbreak/infectedroom/announce()
	command_announcement.Announce("Confirmed outbreak of level 7 biohazard aboard \the [location_name()]. All personnel must contain the outbreak.", "Infectious Contaminant in [target_area.name]", new_sound = 'sound/AI/outbreak7.ogg')

/datum/event/disease_outbreak/infectedroom/start()
	for(var/i in 1 to infected_tiles)
		switch(rand(1, 5))
			if(1)
				var/obj/effect/decal/cleanable/blood/C
				C = new(pick_n_take(target_turfs))
				C.basecolor = get_random_colour(rand(0, 1))
				C.update_icon()
				C.viruses |= new chosen_disease()
			if(2)
				var/obj/effect/decal/cleanable/vomit/V
				V = new(pick_n_take(target_turfs))
				V.viruses |= new chosen_disease()
			if(3, 4, 5)
				var/obj/effect/decal/cleanable/mucus/M
				M = new(pick_n_take(target_turfs))
				M.viruses |= new chosen_disease()
