//Atmosphere properties //CHOMP Comment: Tyr. A toasty planet. More so in lore but with the purpose of this project lessing it. Also something something anomalous site
#define TYR_ONE_ATMOSPHERE	101.5 //kPa
#define TYR_AVG_TEMP			323 //kelvin

#define TYR_PER_N2		0.65 //percent
#define TYR_PER_O2		0.35
#define TYR_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define TYR_PER_CO2		0.00
#define TYR_PER_PHORON	0.00

//Math only beyond this point
#define TYR_MOL_PER_TURF		(TYR_ONE_ATMOSPHERE*CELL_VOLUME/(TYR_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define TYR_MOL_N2			(TYR_MOL_PER_TURF * TYR_PER_N2)
#define TYR_MOL_O2			(TYR_MOL_PER_TURF * TYR_PER_O2)
#define TYR_MOL_N2O			(TYR_MOL_PER_TURF * TYR_PER_N2O)
#define TYR_MOL_CO2			(TYR_MOL_PER_TURF * TYR_PER_CO2)
#define TYR_MOL_PHORON		(TYR_MOL_PER_TURF * TYR_PER_PHORON)

//Turfmakers
#define TYR_SET_ATMOS	nitrogen=TYR_MOL_N2;oxygen=TYR_MOL_O2;carbon_dioxide=TYR_MOL_CO2;phoron=TYR_MOL_PHORON;temperature=TYR_AVG_TEMP
#define TYR_TURF_CREATE(x)	x/TYR/nitrogen=TYR_MOL_N2;x/TYR/oxygen=TYR_MOL_O2;x/TYR/carbon_dioxide=TYR_MOL_CO2;x/TYR/phoron=TYR_MOL_PHORON;x/TYR/temperature=TYR_AVG_TEMP;x/TYR/color="#eacd7c"

/obj/effect/overmap/visitable/planet/tyr
	name = "Tyr"
	desc = "A planet with a high amount of minerals"
	scanner_desc = @{"[i]Stellar Body[/i]: Tyr"}

	map_z = list(Z_LEVEL_DEATH_VALLEY)
	initial_generic_waypoints = list("valley_e", "valley_w")
	start_x  = 3
	start_y  = 5
	known = TRUE
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#E5A76E"
	mountain_color = "#C48C65"
	water_color = "#51323E"
	ice_color = "#E5A76E"
	atmosphere_color = "#54c0ce"
	icon_state = "desert"

/obj/effect/overmap/visitable/planet/tyr/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

/obj/effect/overmap/visitable/planet/tyr/Initialize()
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp("carbon_dioxide", TYR_MOL_CO2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp("nitrogen", TYR_MOL_N2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp("oxygen", TYR_MOL_O2, TYR_AVG_TEMP)

	. = ..()

	docking_codes = null

//AREAS
/area/surface/tyr/town
	name = "Lost Town"
	icon_state = "green"
	outdoors = OUTDOORS_NO

/area/surface/tyr/medical_center
	name = "Lost Toww Medical Center"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/mining_depot
	name = "Wreckage Town - Barn"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/town_hall
	name = "Wreckage Town - Church"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/huntery
	name = "Wreckage Town - Shuttle"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/northern_wilderness
	name = "Tyr Wilderness"
	icon_state = "green"

/area/surface/tyr/southern_wilderness
	name = "Tyr Wilderness"
	icon_state = "green"

/area/surface/tyr/tar_lake
	name = "Tar Lake"
	icon_state = "bluenew"

/area/surface/tyr/ancient_ruins
	name = "Ancient Ruins"
	icon_state = "red"
	requires_power = FALSE
	outdoors = OUTDOORS_NO

/area/surface/tyr/ancient_ruins/puzzlea

/area/surface/tyr/ancient_ruins/puzzleb

/area/surface/tyr/ancient_ruins/puzzlec

/area/surface/tyr/ancient_ruins/puzzled

/area/surface/tyr/north_caverns
	name = "Tyr Caverns"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/south_caverns
	name = "Tyr Caverns"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/surface/tyr/eclipse_stronghold
	name = "Base Neon - Hallways"
	icon_state = "bluenew"
	requires_power = FALSE //note to self, remove when I figure out how engineering works
	outdoors = OUTDOORS_NO

/area/surface/tyr/eclipse_stronghold/sectora
	name = "Base Neon - Docks"

/area/surface/tyr/eclipse_stronghold/sectorb
	name = "Base Neon - Security"

/area/surface/tyr/eclipse_stronghold/sectorc
	name = "Base Neon - Power Generator"

/area/surface/tyr/eclipse_stronghold/sectord
	name = "Base Neon - Dorms"

/area/surface/tyr/eclipse_stronghold/sectore
	name = "Base Neon - Dining Hall"

/area/surface/tyr/eclipse_stronghold/sectorfinale
	name = "Precursor Ruins"

/area/surface/tyr/precursorruins
	icon_state = "bluenew"
	requires_power = FALSE
	outdoors = OUTDOORS_NO

/area/surface/tyr/precursorruins/finale
	name = "Training Final Assesment Chamber"

/area/surface/tyr/precursorruins/southeast
	name = "Relax Training Chamber"

/area/surface/tyr/precursorruins/northwest
	name = "Perception Training Chamber"

/area/surface/tyr/precursorruins/cliffchamber

/area/surface/tyr/precursorruins/airmaze

/area/surface/tyr/precursorruins/spotthediffrence

/turf/unsimulated/wall/planetary/normal/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP

/turf/simulated/mineral/light/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/water/tyr
	color = "#505564"
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/sand/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/deep_sand/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/grass/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/deep_grass/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/gravel/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA

/turf/simulated/floor/outdoors/desert_planet/mud/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA
