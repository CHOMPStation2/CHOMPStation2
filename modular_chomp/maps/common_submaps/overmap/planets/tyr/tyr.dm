//Atmosphere properties //CHOMP Comment: Tyr. A toasty planet. More so in lore but with the purpose of this project lessing it. Also something something anomalous site
#define TYR_ONE_ATMOSPHERE	101.5 //kPa
#define TYR_AVG_TEMP			303 //kelvin

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

	map_z = list(Z_NAME_PLANET_TYR_CH)
	initial_generic_waypoints = list("valley_e", "valley_w")
	start_x  = 3
	start_y  = 5
	known = TRUE
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#E5A76E"
	mountain_color = "#E5A76E"
	water_color = "#C48C65"
	ice_color = "#C48C65"
	atmosphere_color = "#54c0ce"
	icon_state = "desert"

/obj/effect/overmap/visitable/planet/tyr/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

/obj/effect/overmap/visitable/planet/tyr/Initialize(mapload)
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp(GAS_CO2, TYR_MOL_CO2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_N2, TYR_MOL_N2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_O2, TYR_MOL_O2, TYR_AVG_TEMP)

	. = ..()

	docking_codes = null

//AREAS
/area/planet/tyr
	name = "Tyr Surface"

/area/planet/tyr/ship_graveyard
	name = "Tyr Ship Graveyard"
	icon_state = "green"
	outdoors = OUTDOORS_YES


/area/surface/tyr/shuttles
	name = "Destroyed Shuttle"
	icon_state = "green"
	outdoors = OUTDOORS_NO

/area/planet/tyr/shuttles/one

/area/planet/tyr/shuttles/two

/area/planet/tyr/shuttles/three

/area/planet/tyr/shuttles/four

/area/planet/tyr/shuttles/five

/area/planet/tyr/shuttles/six

/area/planet/tyr/shuttles/seven

/area/planet/tyr/shuttles/eight

/area/planet/tyr/shuttles/nine

/area/planet/tyr/shuttles/ten

/area/planet/tyr/shuttles/eleven

/area/planet/tyr/shuttles/tweleve

/area/planet/tyr/shuttles/thirteen

/area/planet/tyr/shuttles/fourteen

/area/planet/tyr/shuttles/fifteen

/area/planet/tyr/shuttles/rock_one

/area/planet/tyr/shuttles/rock_two


/area/planet/tyr/eclipse_refinery
	name = "Eclipse Refinery"
	icon_state = "green"
	outdoors = OUTDOORS_NO


/area/planet/tyr/caverns
	name = "Tyr Caverns"
	icon_state = "away"
	outdoors = OUTDOORS_NO

/area/planet/tyr/ancient_ruins
	name = "Ark Storage"
	icon_state = "red"
	requires_power = FALSE
	outdoors = OUTDOORS_NO

/area/planet/tyr/ancient_ruins/one

/area/planet/tyr/ancient_ruins/two

/area/planet/tyr/ancient_ruins/three

/area/planet/tyr/ancient_ruins/four

/area/planet/tyr/ancient_ruins/five

/area/planet/tyr/ancient_ruins/six

/area/planet/tyr/precursorruins
	icon_state = "bluenew"
	requires_power = FALSE
	outdoors = OUTDOORS_NO
	name = "Ark Facility"
	flags = RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT | AREA_SECRET_NAME | AREA_FORBID_EVENTS | PHASE_SHIELDED

/area/planet/tyr/precursorruins/checkpoint
	name = "Ark Facility - Checkpoint"
	icon_state = "purple"

/area/planet/tyr/precursorruins/entryway
	name = "Ark Facility - Entrance Hall"
	icon_state = "dark"

/area/planet/tyr/precursorruins/checkpoint
	name = "Ark Facility - Checkpoint"

/area/planet/tyr/precursorruins/stairwell
	name = "Ark Facility - Stairwell"
	icon_state = "purple"

/area/planet/tyr/precursorruins/science_branch
	name = "Ark Facility - Science Branch"
	icon_state = "dark"

/area/planet/tyr/precursorruins/misc
	name = "Ark Facility - Misc"

/area/planet/tyr/precursorruins/swarm_staircase
	name = "Ark Facility - Stair Spiral"
	icon_state = "purple"

/area/planet/tyr/precursorruins/swarm_boss
	name = "Ark Facility - Swarm Container"
	icon_state = "dark"

/area/planet/tyr/precursorruins/medical_boss
	name = "Ark Facility - Underconstruction"

/area/planet/tyr/precursorruins/weather_boss
	name = "Ark Facility - Weather Report"
	icon_state = "purple"

/area/planet/tyr/precursorruins/sec_boss
	name = "Ark Facility - Security Watchzone"
	icon_state = "dark"

/area/planet/tyr/precursorruins/engi_boss
	name = "Ark Facility - Engine Control"

/area/planet/tyr/precursorruins/science_a
	name = "Ark Facility - Containment A"
	icon_state = "purple"

/area/planet/tyr/precursorruins/science_b
	name = "Ark Facility - Containment B"
	icon_state = "dark"

/area/planet/tyr/precursorruins/science_c
	name = "Ark Facility - Containment C"

/area/planet/tyr/precursorruins/science_d
	name = "Ark Facility - Containment D"
	icon_state = "purple"

/area/planet/tyr/precursorruins/science_e
	name = "Ark Facility - Containment E"
	icon_state = "dark"

/area/planet/tyr/precursorruins/science_f
	name = "Ark Facility - Containment F"

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

/turf/simulated/floor/lava/tyr
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

/turf/simulated/shuttle/floor/voidcraft/tyr
	oxygen		= TYR_MOL_O2
	nitrogen	= TYR_MOL_N2
	temperature	= TYR_AVG_TEMP
	outdoors = OUTDOORS_AREA
