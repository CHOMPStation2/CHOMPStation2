#ifdef AWAY_MISSION_TEST
#include "vrmaps.dmm"
#endif

#include "vrmaps_turfs.dm"
#include "vrmaps_things.dm"

/datum/map_z_level/cryogaia_lateload/vr_world
	name = Z_NAME_CRYOGAIA_VR
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT

/datum/map_template/cryogaia_lateload/vrworld
	name = Z_NAME_CRYOGAIA_VR
	desc = "The vr world."
	mappath = "maps/yw/yw_vrstuff/vrmaps.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/vr_world
