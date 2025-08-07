
GLOBAL_LIST_EMPTY(station_waypoints) //Create global list for station waypoints, so things like explo carrier can pull docking codes form it without having to scan world.

/obj/effect/overmap/visitable/sector/Soluna_Nexus
	name = "Soluna Nexus"
	icon = 'modular_chomp/icons/obj/overmap.dmi'
	icon_state = "southerncross"
	desc = "Soluna Nexus station, orbiting Sif."
	scanner_desc = @{"[i]Registration[/i]: NLS Soluna Nexus
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen communications station, authorized personnel only"}
	base = 1
	in_space = 1
	start_x =  10
	start_y =  10
	known = 1 // lets Sectors appear on shuttle navigation for easy finding.

	extra_z_levels = list(Z_NAME_SN_TRANSIT, Z_NAME_SN_MISC, Z_NAME_SC_SURFACE, Z_NAME_SC_SURFACE_MINE, Z_NAME_SC_SURFACE_WILD) //This should allow for comms to reach people from the station. Basically this defines all the areas of Southern Cross and the Sif local system on the overmap.
	// "Z_LEVEL_SURFACE_SKYLANDS, " //removed due to lack of use
	mob_announce_cooldown = 0


	initial_generic_waypoints = list(
		"sc-D1_L1A1",
		"sc-D1_L1A2",
		"sc-D1_L1A3",
		"sc-D1_L1A4",
		"sc-D1_L1A5",
		"sc-D1_L1A6",
		"sc-D1_L2A1",
		"sc-D1_L5A1",
		"sc-D1_L5A2",
		"sc-D1_L5A3",
		"sc-D1_L3A1",
		"sc-D1_L4A2",
		"sc-D1_L4A3",
		"sc-D1_L4A4",
		"sc-D1_L4A5",
		"sc-D1_L4A6",
		"sc-D1_H3",
		"sc-D1_H4",
		"sc-D1_near_nw",
		"sc-D1_near_ne",
		"sc-D2_near_nw",
		"sc-D2_near_sw",
		"sc-D2_near_se",
		"sc-D2_near_ne",
		"sc-D3_near_ne",
		"sc-D3_near_se",
		"hangar_2",
		"baby_mammoth_dock",
		"ursula_dock",
		"stargazer_dock",
		"needle_dock",
		"echidna_dock"
		)

/obj/effect/overmap/visitable/sector/Soluna_Nexus/get_space_zlevels() //These are the primary levels that our space station resides in. This also indicates what levels astronauts can drift into.
	return list(
			Z_LEVEL_SN_STATION_ONE,
			Z_LEVEL_SN_STATION_TWO,
			Z_LEVEL_SN_STATION_THREE,
			GLOB.map_templates_loaded[Z_NAME_ALIAS_MISC])

/obj/effect/overmap/visitable/sector/Soluna_Nexus/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/Soluna_Nexus/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/Soluna_Nexus/announce_atc(var/atom/movable/AM, var/going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			SSatc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		SSatc.msg(message)

/obj/effect/overmap/visitable/sector/Southern_Cross
	name = "Southern Cross"
	icon = 'modular_chomp/icons/obj/overmap.dmi'
	icon_state = "southerncross"
	desc = "Southern Cross station, orbiting Sif."
	scanner_desc = @{"[i]Registration[/i]: NLS Southern Cross
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen communications station, authorized personnel only"}
	base = 1
	in_space = 1
	start_x =  10
	start_y =  10
	known = 1 // lets Sectors appear on shuttle navigation for easy finding.

	extra_z_levels = list(Z_NAME_SC_TRANSIT, Z_NAME_SC_MISC, Z_NAME_SC_SURFACE, Z_NAME_SC_SURFACE_MINE, Z_NAME_SC_SURFACE_WILD) //This should allow for comms to reach people from the station. Basically this defines all the areas of Southern Cross and the Sif local system on the overmap.
	// "Z_LEVEL_SURFACE_SKYLANDS, " //removed due to lack of use
	mob_announce_cooldown = 0


	initial_generic_waypoints = list(
		"d1_aux_a",
		"d1_aux_b",
		"d1_aux_c",
		"d1_aux_d",
		"d1_near_ne",
		"d1_near_nw",
		"d1_near_se",
		"d1_near_sw",
		"d2_w1_a",
		"d2_w1_c",
		"d2_w1_e",
		"d2_w2_e",
		"d2_w3_a",
		"d2_w3_c",
		"d2_w3_e",
		"hangar_2",
		"d2_near_ne",
		"d2_near_nw",
		"d2_near_se",
		"d2_near_sw",
		"d3_near_w",
		"d3_near_se",
		"baby_mammoth_dock",
		"ursula_dock",
		"stargazer_dock",
		"needle_dock",
		"echidna_dock"
		)

/obj/effect/overmap/visitable/sector/Southern_Cross/get_space_zlevels() //These are the primary levels that our space station resides in. This also indicates what levels astronauts can drift into.
	return list(
			Z_LEVEL_SC_STATION_MAINTS,
			Z_LEVEL_SC_STATION_ONE,
			Z_LEVEL_SC_STATION_TWO,
			Z_LEVEL_SC_STATION_THREE,
			GLOB.map_templates_loaded[Z_NAME_ALIAS_MISC])

/obj/effect/overmap/visitable/sector/Southern_Cross/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/Southern_Cross/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/Southern_Cross/announce_atc(var/atom/movable/AM, var/going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			SSatc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		SSatc.msg(message)

/obj/effect/overmap/visitable/sector/Southern_Cross/Initialize(mapload)
	. = ..()
	GLOB.station_waypoints += src

/obj/effect/overmap/visitable/sector/Southern_Cross/Destroy()
	GLOB.station_waypoints -= src
	. = ..()

/obj/effect/overmap/visitable/ship/explo_carrier
	name = "NEV Aegis"
	icon_state = "nt_destroyer_g"
	desc = "Spacefaring vessel. NanoTrasen IFF detected."
		//Whenever possible. Replace description with spans. Dont let this sit for 10 years without being done.
	scanner_desc = @{"[i]Registration[/i]: NEV Aegis
	[i]Class[/i]: Light Exploratory Carrier
	[i]Transponder[/i]: Transmitting (EXP), NanoTrasen IFF"
	[b]Notice[/b]: NanoTrasen exploratory vessel, authorized personnel only"}
	vessel_mass = 20000
	vessel_size = SHIP_SIZE_LARGE
	initial_generic_waypoints = list("exphangar_1", "baby_mammoth_dock", "ursula_dock", "stargazer_dock", "needle_dock", "echidna_dock", "carrier_port_dock", "carrier_starboard_dock")

/obj/effect/overmap/visitable/ship/explo_carrier/Initialize(mapload)
	. = ..()
	for(var/obj/effect/overmap/visitable/sector/Southern_Cross/sc in GLOB.station_waypoints) //Scan the global list for our station, get docking codes so all other ships that spawn on it init with the correct ones.
		src.docking_codes = sc.docking_codes

// Overmap object for Thor, hanging in the void of space
/obj/effect/overmap/visitable/planet/Thor
	name = "Thor"
	desc = "Location of NT and Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	// Set map_z to your levels for a planetary base. If you're ever going to split this up/add more Z's to Thor, imitate SC. THESE MUST BE DEFINED FOR SENSORS + SUCH TO WORK.
	map_z = list(Z_LEVEL_RB_CATACOMBS, Z_LEVEL_RB_UNDERGROUND, Z_LEVEL_RB_SURFACE, Z_LEVEL_RB_UPPER_FLOORS, Z_NAME_RB_SURFACE_WILDS, Z_NAME_RB_SURFACE_OCEAN, Z_NAME_RB_CARRIER)

	initial_generic_waypoints = list(
		"baby_mammoth_dock",
		"echidna_dock",
		"stargazer_dock",
		"ursula_dock",
		"needle_dock",
		)

	in_space = 0
	start_x  = 11
	start_y  = 11
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#3A5934"
	mountain_color = "#725C45"
	ice_color = "FFFFFF"
	icecaps = "icecaps"
	icon_state = "lush" //yeet

/obj/effect/overmap/visitable/planet/Thor/Initialize(mapload)
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp(GAS_O2, MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp(GAS_N2, MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Thor/get_space_zlevels()
	return list(GLOB.map_templates_loaded[Z_NAME_ALIAS_MISC])

/obj/effect/overmap/visitable/planet/Thor/Initialize(mapload)
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Thor/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	desc = "Location of Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_NAME_SC_SURFACE, Z_NAME_SC_SURFACE_MINE, Z_NAME_SC_SURFACE_WILD)
	//Z_LEVEL_SURFACE_SKYLANDS, //removed due to lack of use

	initial_generic_waypoints = list(
		"outpost_nw",
		"outpost_s",
		"outpost_w",
		"wilderness_s",
		"wilderness_se",
		"wilderness_w",
		"wilderness_n",
		"wilderness_outpost",
		)

	in_space = 0
	start_x  = 10
	start_y  = 10
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#2D545B"
	mountain_color = "#735555"
	ice_color = "FFFFFF"
	icecaps = "icecaps"
	icon_state = "frozen" //CHOMP comment: Not sure what this does at the moment, but we're doing it live.

/obj/effect/overmap/visitable/planet/Sif/Initialize(mapload)
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp(GAS_O2, MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp(GAS_N2, MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Sif/Initialize(mapload)
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Sif/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp
