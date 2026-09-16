
//////////////////////////////////////////////////////////////////////////////
//Rogue Mines Stuff

/datum/map_template/cryogaia_lateload/tether_roguemines1
	name = Z_NAME_CRYOGAIA_ROGUEMINE_1
	desc = "Mining, but rogue. Zone 1"
	mappath = "../../../../../maps/submaps/rogue_mines_vr/rogue_mine1.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/roguemines1

/datum/map_z_level/cryogaia_lateload/roguemines1
	name = "Belt 1"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	//z = Z_NAME_CRYOGAIA_ROGUEMINE_1

/datum/map_template/cryogaia_lateload/tether_roguemines2
	name = Z_NAME_CRYOGAIA_ROGUEMINE_2
	desc = "Mining, but rogue. Zone 2"
	mappath = "../../../../../maps/submaps/rogue_mines_vr/rogue_mine2.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/roguemines2

/datum/map_z_level/cryogaia_lateload/roguemines2
	name = "Belt 2"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	//z = Z_NAME_CRYOGAIA_ROGUEMINE_2
