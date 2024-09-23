// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	desc = "Location of Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD) //add Z_LEVEL_SURFACE_VALLEY to list if you want valley back
	//Z_LEVEL_SURFACE_SKYLANDS, //removed due to lack of use

	initial_generic_waypoints = list(
		"outpost_nw",
		"outpost_s",
		"outpost_w",
		"wilderness_s",
		"wilderness_se",
		"wilderness_w",
		"wilderness_n",
		"valley_e"
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

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp("oxygen", MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp("nitrogen", MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Sif/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

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

	extra_z_levels = list(Z_LEVEL_TRANSIT, Z_LEVEL_MISC,Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD) //This should allow for comms to reach people from the station. Basically this defines all the areas of Southern Cross and the Sif local system on the overmap. //CHOMPedit, Z_LEVEL_SURFACE_VALLEY for valley back
	// "Z_LEVEL_SURFACE_SKYLANDS, " //removed due to lack of use
	var/mob_announce_cooldown = 0


	initial_generic_waypoints = list(
        "sc-D1_L1A1",
        "sc-D1_L1A2",
        "sc-D1_L1A3",
        "sc-D1_L1A4",
        "sc-D1_L1A5",
        "sc-D1_L1A6",
        "sc-D1_L2A1",
        "sc-D1_L3A1",
        "sc-D1_L4A1",
        "sc-D1_L4A2",
        "sc-D1_L4A3",
        "sc-D1_L4A4",
        "sc-D1_L4A5",
        "sc-D1_L4A6",
        "sc-D1_L5A1",
        "sc-D1_L5A2",
        "sc-D1_L5A3",
        "sc-D1_H1",
        "sc-D1_H2",
        "sc-D1_H3",
        "sc-D1_H4",
        "sc-D1_near_ne",
        "sc-D1_near_nw",
        "sc-D2_near_ne",
        "sc-D2_near_nw",
        "sc-D2_near_se",
        "sc-D2_near_sw",
        "sc-D3_near_ne",
        "sc-D3_near_se",
		"baby_mammoth_dock",
		"ursula_dock",
		"stargazer_dock",
		"needle_dock",
		"echidna_dock",
        "hangar_2" // TEMP, want to replace it with "sc-D1_H2". Don't know how shuttle code work. (KAS)
		)

/obj/effect/overmap/visitable/sector/Southern_Cross/get_space_zlevels() //These are the primary levels that our space station resides in. This also indicates what levels astronauts can drift into.
	return list(
//			Z_LEVEL_STATION_MAINTS, (Removed for new map. KAS)
			Z_LEVEL_STATION_ONE,
			Z_LEVEL_STATION_TWO,
			Z_LEVEL_STATION_THREE,
			Z_LEVEL_MISC)

/obj/effect/overmap/visitable/sector/Southern_Cross/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/Southern_Cross/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/Southern_Cross/proc/announce_atc(var/atom/movable/AM, var/going = FALSE)
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
			atc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		atc.msg(message)

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	. = ..()
	docking_codes = null
