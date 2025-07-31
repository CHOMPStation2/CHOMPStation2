// Z_LEVEL are just hard coded z-levels
// Z_NAME are late loaded z-level maps that can be looked up in GLOB.map_templates_loaded
// GLOB.map_templates_loaded is populated as /datum/map_template/proc/on_map_preload(z) is called
// Some Z_NAME ultimately will be indexed under an alias however e.g. Z_NAME_ALIAS_GATEWAY

// Southern Cross
#define Z_LEVEL_SC_STATION_MAINTS			1
#define Z_LEVEL_SC_STATION_ONE				2
#define Z_LEVEL_SC_STATION_TWO				3
#define Z_LEVEL_SC_STATION_THREE			4
#define Z_LEVEL_SC_SURFACE					5
#define Z_LEVEL_SC_SURFACE_MINE				6
#define Z_LEVEL_SC_MISC						7 //Carrier, actually
#define Z_LEVEL_SC_CENTCOM					8
#define Z_LEVEL_SC_TRANSIT					9
#define Z_LEVEL_SC_SURFACE_WILD				10
//#define Z_LEVEL_SC_SURFACE_VALLEY 			11 //CHOMpedit: Repalcing with Tyr
#define Z_LEVEL_SC_GATEWAY					15

// Soluna Nexus
#define Z_LEVEL_SN_STATION_ONE				1
#define Z_LEVEL_SN_STATION_TWO				2
#define Z_LEVEL_SN_STATION_THREE			3
#define Z_LEVEL_SN_SURFACE					4
#define Z_LEVEL_SN_SURFACE_MINE				5
#define Z_LEVEL_SN_MISC						6 //Carrier, actually
#define Z_LEVEL_SN_CENTCOM					7
#define Z_LEVEL_SN_TRANSIT					8
#define Z_LEVEL_SN_SURFACE_WILD				9
//#define Z_LEVEL_SN_SURFACE_VALLEY 			10 Re comment once valley is added
#define Z_LEVEL_SN_GATEWAY					14

// Relic Base
#define Z_LEVEL_RB_CATACOMBS				1
#define Z_LEVEL_RB_UNDERGROUND				2
#define Z_LEVEL_RB_SURFACE					3
#define Z_LEVEL_RB_UPPER_FLOORS				4
#define Z_LEVEL_RB_THE_SKY					5
#define Z_LEVEL_RB_UNDERMINES				6
#define Z_LEVEL_RB_SURFACE_WILDS			7
#define Z_LEVEL_RB_WILDERNESS_SKY			8
#define Z_LEVEL_RB_SURFACE_OCEAN			9
#define Z_LEVEL_RB_SURFACE_MINES			10
#define Z_LEVEL_RB_CARRIER 					11
#define Z_LEVEL_RB_CENTCOM					12
#define Z_LEVEL_RB_TRANSIT					13
#define Z_LEVEL_RB_GATEWAY					15
#define Z_LEVEL_RB_REDGATE					16

// Named Submaps
#define Z_NAME_FUELDEPOT_CH					"Fueldepot CH"
#define Z_NAME_VR_WORLD_CH					"VR World CH"
#define Z_NAME_THOR							"Thor Surface CH"
#define Z_NAME_TYR							"Desert Valley CH"

// Camera Network Additions
#define NETWORK_EXTERIOR "Exterior" // Exterior Cameras
