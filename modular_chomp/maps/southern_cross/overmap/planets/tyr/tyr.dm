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

/obj/effect/overmap/visitable/planet/tyr/Initialize(mapload)
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp(GAS_CO2, TYR_MOL_CO2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_N2, TYR_MOL_N2, TYR_AVG_TEMP)
	atmosphere.adjust_gas_temp(GAS_O2, TYR_MOL_O2, TYR_AVG_TEMP)

	. = ..()

	docking_codes = null

//AREAS
/area/surface/tyr/town
	name = "Lost Town"
	icon_state = "green"
	outdoors = OUTDOORS_YES

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
	outdoors = OUTDOORS_YES


/area/surface/tyr/southern_wilderness
	name = "Tyr Wilderness"
	icon_state = "green"
	outdoors = OUTDOORS_YES

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
	name = "Base Neon"
	icon_state = "bluenew"
	outdoors = OUTDOORS_NO

/area/surface/tyr/eclipse_stronghold/sciencehalls
	name = "Base Neon - Science Halls"

/area/surface/tyr/eclipse_stronghold/creaturestorageA
	name = "Base Neon - Creature Storage A"

/area/surface/tyr/eclipse_stronghold/creaturestorageB
	name = "Base Neon - Creature Storage B"

/area/surface/tyr/eclipse_stronghold/toolstorage
	name = "Base Neon - Tool Storage"

/area/surface/tyr/eclipse_stronghold/meatstorage
	name = "Base Neon - Meat Storage"

/area/surface/tyr/eclipse_stronghold/slimeresearch
	name = "Base Neon - Slime Den"

/area/surface/tyr/eclipse_stronghold/breakroom
	name = "Base Neon - Breakroom"

/area/surface/tyr/eclipse_stronghold/poolroom
	name = "Base Neon - Poolroom"

/area/surface/tyr/eclipse_stronghold/bathroom
	name = "Base Neon - Bathroom"

/area/surface/tyr/eclipse_stronghold/showers
	name = "Base Neon - Shower"

/area/surface/tyr/eclipse_stronghold/researchleadoffice
	name = "Base Neon - Head Scientist Study"

/area/surface/tyr/eclipse_stronghold/furnace
	name = "Base Neon - Furnace"

//Medical area
/area/surface/tyr/eclipse_stronghold/medicalhalls
	name = "Base Neon - Medical Halls"

/area/surface/tyr/eclipse_stronghold/chemicalgas
	name = "Base Neon - Distillery Storage"

/area/surface/tyr/eclipse_stronghold/viro
	name = "Base Neon - Virus Study"

/area/surface/tyr/eclipse_stronghold/genetics
	name = "Base Neon - Life Study"

/area/surface/tyr/eclipse_stronghold/distillery
	name = "Base Neon - Distillery"

/area/surface/tyr/eclipse_stronghold/surgery
	name = "Base Neon - Mass Operations"

/area/surface/tyr/eclipse_stronghold/alienbotany
	name = "Base Neon - Abnormal Botany"

/area/surface/tyr/eclipse_stronghold/chemista
	name = "Base Neon - Chemistry"

/area/surface/tyr/eclipse_stronghold/chemistb
	name = "Base Neon - Sub-Chemistry"

/area/surface/tyr/eclipse_stronghold/cmooffice
	name = "Base Neon - Lead Medical Officer Restzone"

/area/surface/tyr/eclipse_stronghold/recoveryA
	name = "Base Neon - Recovery Zone A"

/area/surface/tyr/eclipse_stronghold/recoveryB
	name = "Base Neon - Recovery Zone B"

/area/surface/tyr/eclipse_stronghold/recoveryC
	name = "Base Neon - Recovery Zone C"

/area/surface/tyr/eclipse_stronghold/morgue
	name = "Base Neon - Final Rest Zone"

//sec areas
/area/surface/tyr/eclipse_stronghold/sechalls
	name = "Base Neon - Security Halls"

/area/surface/tyr/eclipse_stronghold/breakroom
	name = "Base Neon - Breaking Room"

/area/surface/tyr/eclipse_stronghold/jailhouse
	name = "Base Neon - Jailhouse"

/area/surface/tyr/eclipse_stronghold/secoffice
	name = "Base Neon - Warden Office"

/area/surface/tyr/eclipse_stronghold/stash
	name = "Base Neon - Obtained Equipment Stash"

//engi areas
/area/surface/tyr/eclipse_stronghold/engihalls
	name = "Base Neon - Eletrical Halls"

/area/surface/tyr/eclipse_stronghold/radequipmentA
	name = "Base Neon - Glowing Equipment A"

/area/surface/tyr/eclipse_stronghold/radequipmentB
	name = "Base Neon - Glowing Equipment B"

/area/surface/tyr/eclipse_stronghold/engihead
	name = "Base Neon - Lighting Master Den"

/area/surface/tyr/eclipse_stronghold/powerplantgens
	name = "Base Neon - Main Generator"

/area/surface/tyr/eclipse_stronghold/powerplantfuel
	name = "Base Neon - Generator Battery"

/area/surface/tyr/eclipse_stronghold/generatorA
	name = "Base Neon - Backup Battery A"

/area/surface/tyr/eclipse_stronghold/generatorB
	name = "Base Neon - Backup Battery B"

/area/surface/tyr/eclipse_stronghold/teslastorage
	name = "Base Neon - Tesla Storage"

//the cargo misc area
/area/surface/tyr/eclipse_stronghold/cargohalls
	name = "Base Neon - Cargo Hall"

/area/surface/tyr/eclipse_stronghold/cafe
	name = "Base Neon - Cafe"

/area/surface/tyr/eclipse_stronghold/antroom
	name = "Base Neon - Antroom"

/area/surface/tyr/eclipse_stronghold/miscstorage
	name = "Base Neon - Misc Storage"

/area/surface/tyr/eclipse_stronghold/filestorage
	name = "Base Neon - File Storage"

/area/surface/tyr/eclipse_stronghold/docks
	name = "Base Neon - Docks"

/area/surface/tyr/eclipse_stronghold/generatorC
	name = "Base Neon - Backup Battery C"


/area/surface/tyr/eclipse_stronghold/sectorfinale
	name = "Precursor Ruins"
	requires_power = FALSE

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
