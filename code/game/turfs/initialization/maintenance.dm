/datum/turf_initializer/maintenance/InitializeTurf(var/turf/simulated/T)
	if(T.density)
		return
	// Quick and dirty check to avoid placing things inside windows
	if(locate(/obj/structure/grille, T))
		return

	var/cardinal_turfs = T.CardinalTurfs()

	T.dirt = rand(10, 50) + rand(0, 50)
	// If a neighbor is dirty, then we get dirtier.
	var/how_dirty = dirty_neighbors(cardinal_turfs)
	for(var/i = 0; i < how_dirty; i++)
		T.dirt += rand(0,10)
	T.update_dirt()

	if(prob(2))
		var/type = junk()
		new type(T)
	if(prob(2))
		new /obj/effect/decal/cleanable/blood/oil(T)
	if(prob(25))	// Keep in mind that only "corners" get any sort of web
		attempt_web(T, cardinal_turfs)

/datum/turf_initializer/maintenance/proc/junk()
	if(prob(25))
		return /obj/effect/decal/cleanable/generic
	if(!LAZYLEN(GLOB.random_junk))
		GLOB.random_junk = subtypesof(/obj/item/trash)
		GLOB.random_junk += typesof(/obj/item/trash/cigbutt)
		GLOB.random_junk += /obj/effect/decal/cleanable/spiderling_remains
		GLOB.random_junk += /obj/effect/decal/remains/mouse
		GLOB.random_junk += /obj/effect/decal/remains/robot
		GLOB.random_junk -= /obj/item/trash/plate
		GLOB.random_junk -= /obj/item/trash/snack_bowl
		GLOB.random_junk -= /obj/item/trash/syndi_cakes
		GLOB.random_junk -= /obj/item/trash/tray
	return pick(GLOB.random_junk)

/datum/turf_initializer/maintenance/proc/dirty_neighbors(var/list/cardinal_turfs)
	var/how_dirty = 0
	for(var/turf/simulated/T in cardinal_turfs)
		// Considered dirty if more than halfway to visible dirt
		if(T.dirt > 25)
			how_dirty++
	return how_dirty

/datum/turf_initializer/maintenance/proc/attempt_web(var/turf/simulated/T)
	var/turf/north_turf = get_step(T, NORTH)
	if(!north_turf || !north_turf.density)
		return

	for(var/dir in list(WEST, EAST))	// For the sake of efficiency, west wins over east in the case of 1-tile valid spots, rather than doing pick()
		var/turf/neighbour = get_step(T, dir)
		if(neighbour && neighbour.density)
			if(dir == WEST)
				new /obj/effect/decal/cleanable/cobweb(T)
			if(dir == EAST)
				new /obj/effect/decal/cleanable/cobweb2(T)
			return
