//Simulated
CRYOGAIA_TURF_CREATE(/turf/simulated/open)
/turf/simulated/open/cryogaia
	CRYOGAIA_SET_ATMOS

CRYOGAIA_TURF_CREATE(/turf/simulated/floor)

/turf/simulated/floor/cryogaia_indoors
	CRYOGAIA_SET_ATMOS
/turf/simulated/floor/cryogaia_indoors/update_graphic(list/graphic_add = null, list/graphic_remove = null)
	return 0

CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow/snow)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow/snow/snow2)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow/gravsnow)

CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating/drift)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/rocks)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/plating/snow/plating)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/cryogaia)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/old_tile/gray)

CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/rocks)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/mud)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/snow)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/water)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/water/contaminated)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/water/deep)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/wood)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/plating/external)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/external)
CRYOGAIA_TURF_CREATE(/turf/simulated/shuttle/floor)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/grass/sif/forest)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/white)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/carpet/sblucarpet)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/old_tile/green)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled/old_tile/white)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/tiled)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/carpet/turcarpet)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/greengrid)
CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/dirt)

CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/dirt)
/turf/simulated/floor/outdoors/dirt
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_state = "asteroid"

CRYOGAIA_TURF_CREATE(/turf/simulated/floor/outdoors/grass/sif)

//a set of 'covered' outdoor tiles. can be used as shelter from storms and the inside of the caves.
/turf/simulated/floor/outdoors/snow/snow/cryogaia/covered
	outdoors = 0

/turf/simulated/floor/outdoors/snow/snow/snow2/cryogaia/covered
	outdoors = 0

/turf/simulated/floor/outdoors/snow/gravsnow/cryogaia/covered
	outdoors = 0

/turf/simulated/floor/reinforced/cryogaia
	name = "hangar hatch"
	desc = "A heavily reinforced hangar access point. It doesn't look like it'll open easily."
	outdoors = 1
	CRYOGAIA_SET_ATMOS

/turf/simulated/floor/tiled/old_tile/gray/cryogaia
	CRYOGAIA_SET_ATMOS

/turf/simulated/floor/shuttle/black
	icon = 'icons/turf/shuttle_white.dmi'
	icon_state = "floor_black"

CRYOGAIA_TURF_CREATE(/turf/simulated/mineral)
CRYOGAIA_TURF_CREATE(/turf/simulated/mineral/floor)
	//This proc is responsible for ore generation on surface turfs
/turf/simulated/mineral/cryogaia/make_ore(rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			"marble" = 3,
			"uranium" = 10,
			"platinum" = 10,
			"hematite" = 20,
			"carbon" = 20,
			"diamond" = 1,
			"gold" = 8,
			"silver" = 8,
			"phoron" = 18,
			"lead" = 2,
			"verdantium" = 1))
	else
		mineral_name = pickweight(list(
			"marble" = 2,
			"uranium" = 5,
			"platinum" = 5,
			"hematite" = 35,
			"carbon" = 35,
			"gold" = 3,
			"silver" = 3,
			"phoron" = 25,
			"lead" = 1))
	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

/turf/simulated/mineral/cryogaia/rich/make_ore(rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			"uranium" = 10,
			"platinum" = 10,
			"hematite" = 10,
			"carbon" = 10,
			"diamond" = 4,
			"gold" = 15,
			"silver" = 15))
	else
		mineral_name = pickweight(list(
			"uranium" = 7,
			"platinum" = 7,
			"hematite" = 28,
			"carbon" = 28,
			"diamond" = 2,
			"gold" = 7,
			"silver" = 7))
	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

//Underdark
/turf/simulated/mineral/rich/make_ore(rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			"uranium" = 10,
			"platinum" = 10,
			"hematite" = 10,
			"carbon" = 10,
			"diamond" = 4,
			"gold" = 15,
			"silver" = 15,
			"hydrogen" = 2))
	else
		mineral_name = pickweight(list(
			"uranium" = 7,
			"platinum" = 7,
			"hematite" = 28,
			"carbon" = 28,
			"diamond" = 2,
			"gold" = 7,
			"silver" = 7))
	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()


//Unsimulated
/turf/unsimulated/mineral/cryogaia
	blocks_air = TRUE


//Sky stuff!
// A simple turf to fake the appearance of flying.
/turf/simulated/sky/borealis2
	color = "#E0FFFF"

/turf/simulated/sky/borealis2/Initialize()
	. = ..()
	set_light(2, 2, "#E0FFFF")

/turf/simulated/sky/borealis2/north
	dir = NORTH
/turf/simulated/sky/borealis2/south
	dir = SOUTH
/turf/simulated/sky/borealis2/east
	dir = EAST
/turf/simulated/sky/borealis2/west
	dir = WEST


/turf/simulated/sky/borealis2/moving
	icon_state = "sky_fast"
/turf/simulated/sky/borealis2/moving/north
	dir = NORTH
/turf/simulated/sky/borealis2/moving/south
	dir = SOUTH
/turf/simulated/sky/borealis2/moving/east
	dir = EAST
/turf/simulated/sky/borealis2/moving/west
	dir = WEST


/turf/simulated/sky/snowscroll
	name = "snow transit"
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "snow_ns"

/turf/simulated/sky/snowscroll/Initialize()
	. = ..()
	set_light(2, 2, "#E0FFFF")


// Misc
/area/mine/explored/cryogaia_wilds
	name = "\improper cryogaia Wilderness Outer Perimeter"

/area/mine/unexplored/cryogaia_wilds
	name = "\improper cryogaia Wilderness Inner Perimeter"
