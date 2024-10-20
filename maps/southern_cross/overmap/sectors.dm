// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	desc = "Location of Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD)
	//Z_LEVEL_SURFACE_SKYLANDS, //removed due to lack of use

	initial_generic_waypoints = list(
		"outpost_nw",
		"outpost_s",
		"outpost_w",
		"wilderness_s",
		"wilderness_se",
		"wilderness_w",
		"wilderness_n"
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

	extra_z_levels = list(Z_LEVEL_TRANSIT, Z_LEVEL_MISC,Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD) //This should allow for comms to reach people from the station. Basically this defines all the areas of Southern Cross and the Sif local system on the overmap.
	// "Z_LEVEL_SURFACE_SKYLANDS, " //removed due to lack of use
	var/mob_announce_cooldown = 0


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
			Z_LEVEL_STATION_MAINTS,
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
