/datum/event/infectedroom
	var/area/target_area
	var/area/target_turfs = list()
	var/datum/disease2/disease/virus = new
	var/infected_tiles

	var/list/excluded = list(
		/area/shuttle,
		/area/crew_quarters,
		/area/holodeck,
		/area/engineering/engine_room
	)

/datum/event/infectedroom/setup()
	announceWhen = rand(0, 3000)
	endWhen = announceWhen + 1
	var/list/area/affected_area = get_station_areas(excluded)

	if(severity == EVENT_LEVEL_MAJOR)
		virus.makerandom(rand(2,3))
		infected_tiles = rand(4, 8)
	else if(severity == EVENT_LEVEL_MODERATE)
		virus.makerandom(2)
		infected_tiles = rand(3, 6)
	else
		virus.makerandom(1)
		infected_tiles = rand(2, 4)

	for(var/i in 1 to 10)
		var/area/A = pick(affected_area)
		if(is_area_occupied(A))
			log_debug("infectedroom event: Rejected [A] because it is occupied.")
			continue

		var/list/turfs = list()
		for(var/turf/simulated/floor/F in A)
			if(turf_clear(F))
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
		log_admin("Infected room event started; Virus: [english_list(virus.name())]")
		message_admins("Infected room event started; Virus: <a href='?src=\ref[virus];[HrefToken()];info=1'>[virus.name()]</a>")

/datum/event/infectedroom/announce()
	command_announcement.Announce("Confirmed outbreak of level 7 biohazard aboard \the [location_name()]. \
	All personnel must contain the outbreak.", "Biohazard Alert", new_sound = 'sound/AI/outbreak7.ogg')

/datum/event/infectedroom/start()
	var/obj/effect/decal/cleanable/mucus/mapped/M
	for(var/i in 1 to infected_tiles)
		M = new(pick_n_take(target_turfs))
		M.virus2[1] = virus.getcopy()
