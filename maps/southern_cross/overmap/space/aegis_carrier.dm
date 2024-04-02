//////////////////////////////////
////// AEGIS CARRIER. This is the exploration carrier from southern_cross-7.
//////////////////////////////////

///// DATUMS /////

/datum/map_template/sc_lateload/aegis
	name = "NEV Aegis"
	desc = "The local NanoTrasen Exploration Vessel."
	mappath = 'maps/southern_cross/overmap/space/aegis.dmm'
	associated_map_datum = /datum/map_z_level/sc_lateload/aegis

/datum/map_z_level/sc_lateload/aegis
	name = "NEV Aegis"
	flags = MAP_LEVEL_PLAYER
	base_turf = /turf/space
	z = Z_LEVEL_CARRIER

///// OVERMAP /////

/obj/effect/overmap/visitable/ship/aegis
	name = "NEV Aegis"
	desc = "The NanoTrasen Exploration Vessel Aegis is a carrier-sized spacecraft built to survey and provide security to fringe NanoTrasen and civilian territories. \
			One of four sister ships, the Aegis is the third of its class, designed by a joint intiative of contracted SCG and Hegemony shipwrights."
	icon = 'modular_chomp/icons/obj/overmap.dmi'
	icon_state = "aegis_g"
	scanner_desc = @{"[i]Registration[/i]: NEV Aegis
[i]Class[/i]: Carrier
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[b]Notice[/b]: Large exploration/security vessel. Please observe all travel restrictions, if any, in its vicinity."}

	vessel_mass = 20000
	vessel_size = SHIP_SIZE_LARGE
	start_x = 10
	start_y = 10
	known = 1

	initial_generic_waypoints = list(
		"baby_mammoth_dock",
		"ursula_dock",
		"stargazer_dock",
		"needle_dock",
		"echidna_dock",
		"aeghangar_1"
		)

	unowned_areas = list(/area/shuttle/baby_mammoth,
						 /area/shuttle/shuttle3/start,
						 /area/shuttle/ursula,
						 /area/shuttle/stargazer,
						 /area/shuttle/needle,
						 /area/shuttle/echidna
						 )

///// AREAS /////

////////////////////////////////////////////////
//////	 	New Explo Carrier Areas		 ///////
////////////////////////////////////////////////

/area/shuttle/aegis
	name = "\improper Aegis"
	icon_state = "shuttlered"
	requires_power = 1


//// Bow ////


/area/shuttle/aegis/portbowairlock
	name = "\improper Port Bow Airlock"

/area/shuttle/aegis/starboardbowairlock
	name = "\improper Starboard Bow Airlock"

/area/shuttle/aegis/eva
	name = "\improper EVA"

/area/shuttle/aegis/botany
	name = "\improper Botany Lab"

/area/shuttle/aegis/washroom
	name = "\improper Washroom"

/area/shuttle/aegis/civaccesshallway
	name = "\improper Civilian Access Hallway"

/area/shuttle/aegis/janitorial
	name = "\improper Janitorial Closet"

/area/shuttle/aegis/kitchen
	name = "\improper Kitchen"

/area/shuttle/aegis/restrooms
	name = "\improper Restrooms"

/area/shuttle/aegis/portbowhallway
	name = "\improper Port Bow Hallway"

/area/shuttle/aegis/bar
	name = "\improper Bar"
	flags = RAD_SHIELDED

/area/shuttle/aegis/starbowhallway
	name = "\improper Starboard Bow Hallway"

/area/shuttle/aegis/suite1
	name = "\improper Suite One"
	flags = RAD_SHIELDED

/area/shuttle/aegis/suite2
	name = "\improper Suite Two"
	flags = RAD_SHIELDED

/area/shuttle/aegis/pathfinderroom
	name = "\improper Pathfinder's Ready-Room"
	flags = RAD_SHIELDED

/area/shuttle/aegis/commanderroom
	name = "\improper Security Commander's Ready-Room"
	flags = RAD_SHIELDED

/area/shuttle/aegis/portqpadjunction
	name = "\improper Port Q-Pad Junction"

/area/shuttle/aegis/starqpadjunction
	name = "\improper Starboard Q-Pad Junction"

/area/shuttle/aegis/slingcarrierdock
	name = "\improper Object Removal Ballista Bay"

/area/shuttle/aegis/stationqpad
	name ="\improper Station Q-Pad Junction"

/area/shuttle/aegis/secbowcheckpoint
	name = "\improper Security Bow Checkpoint"


//// Midship ////


/area/shuttle/aegis/staginghangar
	name = "\improper Staging Hangar"


//// Hangar ////


/area/shuttle/aegis/hangarone
	name = "\improper Exploration Carrier Hangar One"
	icon_state = "hangar"

/area/shuttle/aegis/hangartwo
	name = "\improper Exploration Carrier Hangar Two"
	icon_state = "hangar"

/area/shuttle/aegis/hangarthree
	name = "\improper Exploration Carrier Hangar Three"
	icon_state = "hangar"

/area/shuttle/aegis/hangarfour
	name = "\improper Exploration Carrier Hangar Four"
	icon_state = "hangar"

/area/shuttle/aegis/hangarfive
	name = "\improper Exploration Carrier Hangar Five"
	icon_state = "hangar"

/area/shuttle/aegis/hangarsix
	name = "\improper Exploration Carrier Hangar Six"
	icon_state = "hangar"


//// Stern ////



/area/shuttle/aegis/uppersternhallway
	name = "\improper Upper Stern Hallway"

/area/shuttle/aegis/medbaylobby
	name = "\improper Medbay Lobby"

/area/shuttle/aegis/medicalbay
	name = "\improper Medical Bay"

/area/shuttle/aegis/surgical1
	name = "\improper Surgical Theatre One"

/area/shuttle/aegis/midsternhallway
	name = "\improper Middle Stern Hallway"

/area/shuttle/aegis/exploarmory
	name = "\improper Exploration Armory"

/area/shuttle/aegis/explobriefroom
	name = "\improper Exploration Briefing Room"

/area/shuttle/aegis/explodorm1
	name = "\improper Exploration Dorm One"
	flags = RAD_SHIELDED

/area/shuttle/aegis/explodorm2
	name = "\improper Exploration Dorm Two"
	flags = RAD_SHIELDED

/area/shuttle/aegis/breakroom
	name = "\improper Public Breakroom"

/area/shuttle/aegis/cic
	name = "\improper Combat Information Center"

/area/shuttle/aegis/secoffice
	name = "\improper Security Office"

/area/shuttle/aegis/gatewayeva
	name = "\improper Gateway EVA"

/area/shuttle/aegis/gateway
	name = "\improper Gateway"

/area/shuttle/aegis/secarmory
	name = "\improper Security Armory"

/area/shuttle/aegis/miningfoyer
	name = "\improper Mining Foyer"

/area/shuttle/aegis/reactoraccess
	name = "\improper Reactor Access"

/area/shuttle/aegis/reactorcr
	name = "\improper Reactor Control Room"

/area/shuttle/aegis/reactorroom
	name = "\improper Fusion Reactor"

/area/shuttle/aegis/rndlobby
	name = "\improper R&D Lobby"

/area/shuttle/aegis/rnd
	name = "\improper Research and Development"

/area/shuttle/aegis/engoffice
	name = "\improper Engineering Office"

/area/shuttle/aegis/engstorage
	name = "\improper Engineering Equipment Room"

/area/shuttle/aegis/atmospherics
	name = "\improper Atmospherics"

/area/shuttle/aegis/secureaccess
	name = "\improper Secure Access Corridor"

/area/shuttle/aegis/techstorage
	name = "\improper Technical Storage"

/area/shuttle/aegis/aicore
	name = "\improper Auxiliary AI Core"

/area/shuttle/aegis/telecomms
	name = "\improper Ship Telecomms"

/area/shuttle/aegis/disposals
	name = "\improper Disposals Sorting"

/area/shuttle/aegis/lowersternhallway
	name = "\improper Lower Stern Hallway"

/area/shuttle/aegis/portfuelstorage
	name = "\improper Port Fuel Storage"

/area/shuttle/aegis/starfuelstorage
	name = "\improper Starboard Fuel Storage"


//// Maints ////


/area/shuttle/aegis/portuppermaint
	name = "\improper Port Upper Maintenance"

/area/shuttle/aegis/staruppermaint
	name = "\improper Starboard Upper Maintenance"

/area/shuttle/aegis/portexplomaint
	name = "\improper Port Exploration Maintenance"

/area/shuttle/aegis/starsciencemaint
	name = "\improper Starboard Science Maintenance"

/area/shuttle/aegis/portlowermaint
	name = "\improper Port Lower Maintenance"

/area/shuttle/aegis/starlowermaint
	name = "\improper Starboard Lower Maintenance"

/area/shuttle/aegis/portsternairlock
	name = "\improper Port Stern Airlock"

/area/shuttle/aegis/starsternairlock
	name = "\improper Starboard Stern Airlock"