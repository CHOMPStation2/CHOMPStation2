//Buncha mapping helpers to make some map work easier

//idk where better to put this lmao
#define Z_TURFS(ZLEVEL) block(locate(1,1,ZLEVEL), locate(world.maxx, world.maxy, ZLEVEL))

/obj/effect/map_helper
	icon = 'icons/misc/map_helpers.dmi'

/obj/effect/map_helper/Initialize(mapload)
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/map_helper/LateInitialize()
	qdel(src)

/obj/effect/map_helper/base_turf
	name = "z-wide baseturf editor"
	desc = "I set the provided 'baseturf' to the whole z-level I'm in!"
	var/baseturf

/obj/effect/map_helper/base_turf/LateInitialize()
	if(baseturf)
		using_map.base_turf_by_z["[z]"] = baseturf
	qdel(src)

/obj/effect/map_helper/base_turf/area
	name = "area-wide baseturf editor"
	desc = "I set the provided 'baseturf' var to the whole /area I'm in!"

/obj/effect/map_helper/base_turf/area/LateInitialize()
	var/area/our_area = get_area(src)
	if(our_area)
		our_area.base_turf = baseturf
	qdel(src)

/obj/effect/map_helper/no_tele
	name = "z-wide teleport block"
	desc = "I disable the use of all hand tele's/translocators/bluespace harpoons/telescience in my z-level!"

/obj/effect/map_helper/no_tele/LateInitialize()
	/* Wait this doesn't work. Why did I write this.
	Until I can figure out a way to get all areas in a z-level I'm just gonna let block_tele handle it instead.

	for(var/area/A in world)
		if(A.z) //find some way to filter by z-level here, which is stupid since areas can exist in multiple z-levels at once
			A.flags += BLUE_SHIELDED
	*/
	for(var/turf/T in Z_TURFS(z))
		T.block_tele = 1
	qdel(src)

/obj/effect/map_helper/no_tele/area
	name = "area-wide teleport block"
	desc = "I disable the use of all hand tele's/translocators/bluespace harpoons/telescience in my area!"

/obj/effect/map_helper/no_tele/area/LateInitialize()
	var/area/A = get_area(src)
	if(A)
		A.flags |= BLUE_SHIELDED
		for(var/turf/T in A.contents)
			T.block_tele = 1
	qdel(src)

/obj/effect/map_helper/make_indoors
	name = "z-wide indoors maker"
	desc = "I forcibly call make_indoors on every turf on this z-level. Useful for admin late loading maps to fix lighting!"

/obj/effect/map_helper/make_indoors/LateInitialize()
	for(var/turf/simulated/T in Z_TURFS(z))
		T.make_indoors()
	qdel(src)

/obj/effect/map_helper/make_indoors/area
	name = "Area indoors maker"
	desc = "I forcibly call make_indoors on every turf in this area."

/obj/effect/map_helper/make_indoors/area/LateInitialize()
	var/area/A = get_area(src)
	if(A)
		for(var/turf/simulated/T in A.contents)
			T.make_indoors()
	qdel(src)

/obj/effect/map_helper/make_outdoors
	name = "z-wide outdoors maker"
	desc = "I forcibly call make_outdoors on every turf on this z-level."

/obj/effect/map_helper/make_outdoors/LateInitialize()
	for(var/turf/simulated/T in Z_TURFS(z))
		T.make_outdoors()
	qdel(src)

/obj/effect/map_helper/make_outdoors/area
	name = "Area outdoors maker"
	desc = "I forcibly call make_outdoors on every turf in this area."

/obj/effect/map_helper/make_outdoors/area/LateInitialize()
	var/area/A = get_area(src)
	if(A)
		for(var/turf/simulated/T in A.contents)
			T.make_outdoors()
	qdel(src)

/*
Make this if you can figure out a way to do it for every area in that z level exclusively
/obj/effect/map_helper/no_phaseshift
	name = "area-wide teleport block"
	desc = "I disable the use of all hand tele's/translocators/bluespace harpoons/telescience in my area!"

/obj/effect/map_helper/no_phaseshift/LateInitialize()
	var/area/A = get_area(src)
	if(A)
		A.flags += BLUE_SHIELDED
		for(var/turf/T in A.contents)
			T.block_tele = 1
	qdel(src)
*/

/obj/effect/map_helper/no_phaseshift/area
	name = "area-wide phaseshift blocker"
	desc = "I disable the use of both shadekin and redspace phasing!"

/obj/effect/map_helper/no_phaseshift/area/LateInitialize()
	var/area/A = get_area(src)
	if(A)
		A.flags |= PHASE_SHIELDED
	qdel(src)

//For active edges in Sif POIs
/obj/random/turf/lava/sif
	name = "random Lava spawn sif"
	desc = "This is a random lava spawn. Programmed to spawn lava with sif temps"

	override_outdoors = TRUE
	turf_outdoors = OUTDOORS_NO

/obj/random/turf/lava/sif/item_to_spawn()
	return pick(prob(5);/turf/simulated/floor/lava/external,
				prob(3);/turf/simulated/floor/outdoors/rocks/caves,
				prob(1);/turf/simulated/mineral/ignore_mapgen/cave)
