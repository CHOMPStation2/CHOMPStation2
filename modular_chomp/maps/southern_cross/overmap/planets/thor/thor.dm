//Atmosphere properties //CHOMP Comment: I guess this THOR planetary information should go here. THOR is a gas giant, it ain't gonna be getting very many other maps.
#define THOR_ONE_ATMOSPHERE	101.5 //kPa
#define THOR_AVG_TEMP			313 //kelvin

#define THOR_PER_N2		0.65 //percent
#define THOR_PER_O2		0.35
#define THOR_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define THOR_PER_CO2		0.00
#define THOR_PER_PHORON	0.00

//Math only beyond this point
#define THOR_MOL_PER_TURF		(THOR_ONE_ATMOSPHERE*CELL_VOLUME/(THOR_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define THOR_MOL_N2			(THOR_MOL_PER_TURF * THOR_PER_N2)
#define THOR_MOL_O2			(THOR_MOL_PER_TURF * THOR_PER_O2)
#define THOR_MOL_N2O			(THOR_MOL_PER_TURF * THOR_PER_N2O)
#define THOR_MOL_CO2			(THOR_MOL_PER_TURF * THOR_PER_CO2)
#define THOR_MOL_PHORON		(THOR_MOL_PER_TURF * THOR_PER_PHORON)

//Turfmakers
#define THOR_SET_ATMOS	nitrogen=THOR_MOL_N2;oxygen=THOR_MOL_O2;carbon_dioxide=THOR_MOL_CO2;phoron=THOR_MOL_PHORON;temperature=THOR_AVG_TEMP
#define THOR_TURF_CREATE(x)	x/THOR/nitrogen=THOR_MOL_N2;x/THOR/oxygen=THOR_MOL_O2;x/THOR/carbon_dioxide=THOR_MOL_CO2;x/THOR/phoron=THOR_MOL_PHORON;x/THOR/temperature=THOR_AVG_TEMP;x/THOR/color="#eacd7c"

/obj/effect/overmap/visitable/planet/thor
	name = "Thor"
	desc = "Inhabited terrestrial natural saterlite of Sif"
	scanner_desc = @{"[i]Stellar Body[/i]: Thor
[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_LEVEL_JUNGLE)
	initial_generic_waypoints = list("thor_nw","thor_e","spacebus_jungle")
	start_x  = 11
	start_y  = 17
	known = TRUE
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#176422"
	mountain_color = "#093314"
	water_color = "#086dcc"
	ice_color = "#f5ffff"
	atmosphere_color = "#54c0ce"
	icon_state = "lush"


/obj/effect/overmap/visitable/planet/thor/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

/obj/effect/overmap/visitable/planet/thor/Initialize(mapload)
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp(GAS_CO2, THOR_MOL_CO2, THOR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_N2, THOR_MOL_N2, THOR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_O2, THOR_MOL_O2, THOR_AVG_TEMP)

	. = ..()

	docking_codes = null

//AREAS
/area/surface/thor/med
	name = "Jungle Outpost Medical"
	icon_state = "medbay"

/area/surface/thor/engi
	name = "Jungle Outpost Solars"
	icon_state = "engineering"

/area/surface/thor/janitor
	name = "Jungle Outpost Custodions"
	icon_state = "janitor"

/area/surface/thor/kitchen
	name = "Jungle Outpost Kitchen"
	icon_state = "cafeteria"

/area/surface/thor/bar
	name = "Jungle Outpost Bar"
	icon_state = "cafeteria"

/area/surface/thor/dorms
	name = "Jungle Outpost Generic Dorms"
	icon_state = "Sleep"
	flags = RAD_SHIELDED | AREA_SOUNDPROOF | AREA_ALLOW_LARGE_SIZE | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_TRACKING

/area/surface/thor/dorms/pool1
	name = "Jungle Outpost Pool Shack 1"

/area/surface/thor/dorms/pool2
	name = "Jungle Outpost Pool Shack 2"

/area/surface/thor/dorms/pool3
	name = "Jungle Outpost Pool Shack 3"
/area/surface/outside/thor/pool
	name = "Jungle Swimming Pool"
	icon_state = "bluenew"
	always_unpowered = FALSE

/area/surface/outside/thor/landingpad
	name = "Space Bus Landing Pad"
	icon_state = "bluenew"

/area/surface/outside/thor/outpost
	name = "Jungle Outpost Perimiter"
	icon_state = "green"
/area/surface/outside/thor/jungle
	name = "Jungle"
	icon_state = "green"
/area/surface/outside/thor/jungle/deep
	name = "Untamed Jungles"
	icon_state = "green"

/area/surface/outside/thor/beach
	name = "Tropical Beach"
	icon_state = "away"
/area/surface/outside/thor/ocean
	name = "Tropical Ocean"
	icon_state = "bluenew"

/area/surface/thor/caves
	name = "Tropical Caves"
	icon_state = "darkred"
	always_unpowered = TRUE

/area/surface/thor/abandonedhouse
	name = "Jungle Abandoned House"
	icon_state = "away1"

/area/surface/thor/commstower
	name = "Jungle Comms Tower"
	icon_state = "away1"
//TURFS (mostly existing turfs with armos changes)

/turf/unsimulated/wall/planetary/normal/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/mineral/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
/turf/simulated/floor/outdoors/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/water/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/shuttle/floor/alienplating/external/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/shuttle/floor/voidcraft/external/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/shuttle/floor/voidcraft/external/dark/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/shuttle/floor/voidcraft/external/light/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/plating/external/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/tiled/external/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/mud/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/rocks/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/tiled/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	outdoors = OUTDOORS_YES

/turf/simulated/floor/tiled/steel/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	outdoors = OUTDOORS_YES

/turf/simulated/floor/plating/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	outdoors = OUTDOORS_YES

/turf/simulated/floor/outdoors/grass/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	animals = "thor_real"
	grass = "thor_real"
	var/tree_chance = 5

/turf/simulated/floor/outdoors/grass/heavy/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	animals = "thor_real"
	grass = "thor_real"
	var/tree_chance = 10

/turf/simulated/floor/outdoors/grass/forest/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP
	animals = "thor_real"
	grass = "thor_real"
	var/tree_chance = 10

/turf/simulated/floor/outdoors/dirt/thor/planetuse
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/reinforced/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/concrete/outdoors/thor
	outdoors = TRUE
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/tiled/asteroid_steel/outdoors/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/beach/sand/desert/outdoors/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/desert_planet/gravel/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/desert_planet/sand/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/mineral/floor/cave/thor
	oxygen		= THOR_MOL_O2
	nitrogen	= THOR_MOL_N2
	temperature	= THOR_AVG_TEMP

/turf/simulated/floor/outdoors/grass/thor/Initialize(mapload)
	if(tree_chance && prob(tree_chance) && !check_density())
		new /obj/structure/flora/tree/jungle(src)
	. = ..()

/turf/simulated/floor/outdoors/grass/heavy/thor/Initialize(mapload)
	if(tree_chance && prob(tree_chance) && !check_density())
		new /obj/structure/flora/tree/jungle(src)
	. = ..()

/turf/simulated/floor/outdoors/grass/forest/thor/Initialize(mapload)
	if(tree_chance && prob(tree_chance) && !check_density())
		new /obj/structure/flora/tree/jungle(src)

	grass = "thor_real"
	. = ..()
