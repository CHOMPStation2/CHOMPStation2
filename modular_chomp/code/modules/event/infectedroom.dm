/datum/event/disease_outbreak/floor
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
		/area/rnd/test_area
		)

/datum/event/disease_outbreak/floor/setup()
	. = ..()
	announceWhen = rand(0, 1500)
	endWhen = announceWhen + 1

/datum/event/disease_outbreak/floor/announce()
	command_announcement.Announce("Confirmed outbreak of level 7 biohazard aboard \the [location_name()]. All personnel must contain the outbreak.", "Infectious Contaminant in [target_area.name]", new_sound = 'sound/AI/outbreak7.ogg')

/datum/event/disease_outbreak/floor/start()
	GLOB.current_pending_diseases += chosen_disease
	var/list/area/affected_area = get_station_areas(excluded)
	var/decal

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
		log_admin("Infected room event started; Virus: [chosen_disease.name]")
		message_admins("Infected room event started; Virus: [chosen_disease.name]")

	switch(severity)
		if(EVENT_LEVEL_MODERATE)
			infected_tiles = rand(5, 8)
		else
			infected_tiles = rand(7, 10)

	for(var/i in 1 to infected_tiles)
		decal = rand(1, 5)
		if(decal == 1)
			var/obj/effect/decal/cleanable/blood/C
			C = new(pick_n_take(target_turfs))
			C.basecolor = get_random_colour(rand(0, 1))
			C.update_icon()
			C.viruses |= chosen_disease
		else if(decal == 2)
			var/obj/effect/decal/cleanable/vomit/V
			V = new(pick_n_take(target_turfs))
			V.viruses |= chosen_disease
		else
			var/obj/effect/decal/cleanable/mucus/M
			M = new(pick_n_take(target_turfs))
			M.viruses |= chosen_disease
