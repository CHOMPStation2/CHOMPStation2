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

//No skybox icon, please add one later.
	//skybox_icon = 'cruiser.dmi' //Art by Gwyvern, see ATTRIBUTIONS.md
	//skybox_icon_state = "skybox"
	//skybox_pixel_x = 370
	//skybox_pixel_y = 370
