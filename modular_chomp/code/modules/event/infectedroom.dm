/datum/event/infectedroom
	var/area/target_area
	var/area/target_turfs = list()
	var/datum/disease2/disease/virus = new
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

	var/commondisease = list(
		"Friday Fever" = list(
			/datum/disease2/effect/choreomania,
			/datum/disease2/effect/spin,
			/datum/disease2/effect/flip,
			/datum/disease2/effect/scream),
		"Common Cold" = list(
			/datum/disease2/effect/sneeze,
			/datum/disease2/effect/cough,
			/datum/disease2/effect/fridge,
			/datum/disease2/effect/drowsness),
		"Brain Bloat" = list(
			/datum/disease2/effect/invisible,
			/datum/disease2/effect/headache,
			/datum/disease2/effect/telepathic,
			/datum/disease2/effect/nothing
		),
		"Glutton's Gut" = list(
			/datum/disease2/effect/drool,
			/datum/disease2/effect/hungry,
			/datum/disease2/effect/pica,
			/datum/disease2/effect/nothing
		),
		"Motor System Impairment" = list(
			/datum/disease2/effect/twitch,
			/datum/disease2/effect/jellylegs,
			/datum/disease2/effect/spin,
			/datum/disease2/effect/groan
		)
	)

/datum/event/infectedroom/setup()
	announceWhen = rand(0, 1500)
	endWhen = announceWhen + 1
	var/list/area/affected_area = get_station_areas(excluded)
	var/chosenvirus = pick(commondisease)

	if(severity == EVENT_LEVEL_MAJOR)
		if(prob(75))
			virus.makerandom(rand(2,3))
		else
			virus.makedisease(commondisease[chosenvirus], rand(2,3), chosenvirus)
		infected_tiles = rand(7, 10)
	else if(severity == EVENT_LEVEL_MODERATE)
		if(prob(50))
			virus.makerandom(2)
		else
			virus.makedisease(commondisease[chosenvirus], 2, chosenvirus)
		infected_tiles = rand(5, 8)
	else
		virus.makerandom(1)
		infected_tiles = rand(3, 6)

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
		log_admin("Infected room event started; Virus: [virus.name()]")
		message_admins("Infected room event started; Virus: <a href='?src=\ref[virus];[HrefToken()];info=1'>[virus.name()]</a>")

/datum/event/infectedroom/announce()
	command_announcement.Announce("Confirmed outbreak of level 7 biohazard aboard \the [location_name()]. All personnel must contain the outbreak.", "Infectious Contaminant in [target_area.name]", new_sound = 'sound/AI/outbreak7.ogg')

/datum/event/infectedroom/start()
	var/decal

	for(var/i in 1 to infected_tiles)
		decal = rand(1, 5)
		if(decal == 1)
			var/obj/effect/decal/cleanable/blood/C
			C = new(pick_n_take(target_turfs))
			C.basecolor = get_random_colour(rand(0, 1))
			C.update_icon()
			C.virus2 |= new /datum/disease2/disease
			C.virus2[1] = virus.getcopy()
		else if(decal == 2)
			var/obj/effect/decal/cleanable/vomit/V
			V = new(pick_n_take(target_turfs))
			V.virus2 |= new /datum/disease2/disease
			V.virus2[1] = virus.getcopy()
		else
			var/obj/effect/decal/cleanable/mucus/M
			M = new(pick_n_take(target_turfs))
			M.virus2 |= new /datum/disease2/disease
			M.virus2[1] = virus.getcopy()
