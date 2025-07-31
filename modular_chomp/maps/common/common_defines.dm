// Z_LEVEL are just hard coded z-levels
// Z_NAME are late loaded z-level maps that can be looked up in GLOB.map_templates_loaded
// GLOB.map_templates_loaded is populated as /datum/map_template/proc/on_map_preload(z) is called
// Some Z_NAME ultimately will be indexed under an alias however e.g. Z_NAME_ALIAS_GATEWAY

// Southern Cross
#define Z_LEVEL_SC_STATION_MAINTS			1
#define Z_LEVEL_SC_STATION_ONE				2
#define Z_LEVEL_SC_STATION_TWO				3
#define Z_LEVEL_SC_STATION_THREE			4

#define Z_NAME_SC_SURFACE					"Southern Cross - Surface"
#define Z_NAME_SC_SURFACE_MINE				"Southern Cross - Surface Mines"
#define Z_NAME_SC_MISC						"Southern Cross - Misc" // Aliased to Z_NAME_ALIAS_MISC
#define Z_NAME_SC_CENTCOM					"Southern Cross - Central Command" // Aliased to Z_NAME_ALIAS_CENTCOM
#define Z_NAME_SC_TRANSIT					"Southern Cross - Transit"
#define Z_NAME_SC_SURFACE_WILD				"Southern Cross - Surface Wild"

// Soluna Nexus
#define Z_LEVEL_SN_STATION_ONE				1
#define Z_LEVEL_SN_STATION_TWO				2
#define Z_LEVEL_SN_STATION_THREE			3

#define Z_NAME_SN_SURFACE					"Soluna Nexus - Surface"
#define Z_NAME_SN_SURFACE_MINE				"Soluna Nexus - Mines"
#define Z_NAME_SN_MISC						"Soluna Nexus - Misc" // Aliased to Z_NAME_ALIAS_MISC
#define Z_NAME_SN_CENTCOM					"Soluna Nexus - Central Command" // Aliased to Z_NAME_ALIAS_CENTCOM
#define Z_NAME_SN_TRANSIT					"Soluna Nexus - Transit"
#define Z_NAME_SN_SURFACE_WILD				"Soluna Nexus - Surface Wild"

// Relic Base
#define Z_LEVEL_RB_CATACOMBS				1
#define Z_LEVEL_RB_UNDERGROUND				2
#define Z_LEVEL_RB_SURFACE					3
#define Z_LEVEL_RB_UPPER_FLOORS				4
#define Z_LEVEL_RB_THE_SKY					5

#define Z_NAME_RB_UNDERMINES				"Relic Base - Undermines"
#define Z_NAME_RB_SURFACE_WILDS				"Relic Base - Surface Wilds"
#define Z_NAME_RB_WILDERNESS_SKY			"Relic Base - Wilderness Sky"
#define Z_NAME_RB_SURFACE_OCEAN				"Relic Base - Surface Ocean"
#define Z_NAME_RB_SURFACE_MINES				"Relic Base - Surface Mines"
#define Z_NAME_RB_CARRIER 					"Relic Base - Misc" // Aliased to Z_NAME_ALIAS_MISC
#define Z_NAME_RB_CENTCOM					"Relic Base - Central Command" // Aliased to Z_NAME_ALIAS_CENTCOM
#define Z_NAME_RB_TRANSIT					"Relic Base - Transit"

// Named Lateload Submaps
#define Z_NAME_FUELDEPOT_CH					"Offmap - Fueldepot CH"
#define Z_NAME_VR_WORLD_CH					"VR - VR World CH"
#define Z_NAME_PLANET_THOR_CH				"Planet - Thor Surface CH"
#define Z_NAME_PLANET_TYR_CH				"Planet - Desert Valley CH"

// Gateways
#define Z_NAME_GATEWAY_SNOW_FIELD_CH		"Gateway - Snow Field CH"
#define Z_NAME_GATEWAY_ABANDONED_CITY_CH	"Gateway - Abandoned City CH"
#define Z_NAME_GATEWAY_SKYSCRAPER_CH		"Gateway - Skyscraper CH"
#define Z_NAME_GATEWAY_BASE_BLEP_CH			"Gateway - Base Blep CH"
#define Z_NAME_GATEWAY_MADNESS_LAB_CH		"Gateway - Maddness Lab CH"
#define Z_NAME_GATEWAY_CARP_FARM_CH			"Gateway - Carp Farm CH"
#define Z_NAME_GATEWAY_HIDDEN_ECLIPSE_CH	"Gateway - Hidden Eclipse CH"

// Camera Network Additions
#define NETWORK_EXTERIOR "Exterior" // Exterior Cameras
