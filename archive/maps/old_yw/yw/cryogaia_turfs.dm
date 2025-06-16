//Simulated
CRYOGAIA_TURF_CREATE(/turf/simulated/open)
/turf/simulated/open/cryogaia
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf
/turf/simulated/open/cryogaia/Initialize(mapload)
	. = ..()
	if(outdoors)
		SSplanets.addTurf(src)

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
/turf/simulated/floor/outdoors/grass/cryogaia
	turf_layers = list(
		/turf/simulated/floor/outdoors/snow,
		/turf/simulated/floor/tiled/cryogaia,
		)

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

// Overriding these for the sake of submaps that use them on other planets.
// This means that mining on tether base and space is oxygen-generating, but solars and mining should use the virgo3b subtype
/turf/simulated/mineral
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature	= T20C
/turf/simulated/floor/outdoors
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature	= T20C
/turf/simulated/floor/water
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature	= T20C

/turf/simulated/floor/indoorrocks //Not outdoor rocks to prevent weather fuckery
	name = "rocks"
	desc = "Hard as a rock."
	icon = 'icons/turf/outdoors.dmi'
	icon_state = "rock"
	edge_blending_priority = 1

/turf/simulated/mineral/vacuum
	oxygen = 0
	nitrogen = 0
	temperature	= TCMB
/turf/simulated/mineral/floor/vacuum
	oxygen = 0
	nitrogen = 0
	temperature	= TCMB
/turf/simulated/floor/shuttle/black
	icon = 'icons/turf/shuttle_white.dmi'
	icon_state = "floor_black"

CRYOGAIA_TURF_CREATE(/turf/simulated/mineral)
CRYOGAIA_TURF_CREATE(/turf/simulated/mineral/floor)
	//This proc is responsible for ore generation on surface turfs
/turf/simulated/mineral/cryogaia/make_ore(var/rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			ORE_URANIUM = 10,
			ORE_PLATINUM = 10,
			ORE_HEMATITE = 20,
			ORE_CARBON = 20,
			ORE_DIAMOND = 1,
			ORE_GOLD = 8,
			ORE_SILVER = 8,
			ORE_PHORON = 18))
	else
		mineral_name = pickweight(list(
			ORE_URANIUM = 5,
			ORE_PLATINUM = 5,
			ORE_HEMATITE = 35,
			ORE_CARBON = 35,
			ORE_GOLD = 3,
			ORE_SILVER = 3,
			ORE_PHORON = 25))
	if(mineral_name && (mineral_name in ore_data))
		mineral = ore_data[mineral_name]
		UpdateMineral()
	update_icon()

/turf/simulated/mineral/cryogaia/rich/make_ore(var/rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			ORE_URANIUM = 10,
			ORE_PLATINUM = 10,
			ORE_HEMATITE = 10,
			ORE_CARBON = 10,
			ORE_DIAMOND = 4,
			ORE_GOLD = 15,
			ORE_SILVER = 15))
	else
		mineral_name = pickweight(list(
			ORE_URANIUM = 7,
			ORE_PLATINUM = 7,
			ORE_HEMATITE = 28,
			ORE_CARBON = 28,
			ORE_DIAMOND = 2,
			ORE_GOLD = 7,
			ORE_SILVER = 7))
	if(mineral_name && (mineral_name in ore_data))
		mineral = ore_data[mineral_name]
		UpdateMineral()
	update_icon()

//Unsimulated
/turf/unsimulated/wall/planetary/cryogaia
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	CRYOGAIA_SET_ATMOS

/turf/unsimulated/mineral/cryogaia
	blocks_air = TRUE

/turf/unsimulated/floor/steel
	icon = 'icons/turf/flooring/tiles_vr.dmi'
	icon_state = "steel"


/turf/unsimulated/wall
	blocks_air = 1

/turf/unsimulated/wall/planetary
	blocks_air = 0

// Some turfs to make floors look better in centcom tram station.

/turf/unsimulated/floor/techfloor_grid
	name = "floor"
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_state = "techfloor_grid"

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"

// Bluespace jump turf!
/turf/space/bluespace
	name = "bluespace"
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"

/turf/space/bluespace/Initialize(mapload)
	. = ..()
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"

// Desert jump turf!
/turf/space/sandyscroll
	name = "sand transit"
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "desert_ns"

//Sky stuff!
// A simple turf to fake the appearance of flying.
/turf/simulated/sky/borealis2
	color = "#E0FFFF"

/turf/simulated/sky/borealis2/Initialize(mapload)
	. = ..()
	SSplanets.addTurf(src)
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
	icon = 'icons/turf/transit_yw.dmi'
	icon_state = "snow_ns"


/turf/simulated/sky/snowscroll/Initialize(mapload)
	. = ..()
	SSplanets.addTurf(src)
	set_light(2, 2, "#E0FFFF")
