
#define Z_LEVEL_MAIN_DEBUGABUS_TESTING					1

/datum/map/debugabus
	name = "Debugabus"
	full_name = "NSS Ade-testing"
	path = "debugabus"

	lobby_icon = 'icons/misc/title_vr.dmi'
	lobby_screens = list("tether2_night")

	accessible_z_levels = list("1" = 100)
	base_turf_by_z = list("1" = /turf/space)


	zlevel_datum_type = /datum/map_z_level/debugabus


	station_networks = list(
							NETWORK_DEFAULT
							)

	allowed_spawns = list("Gateway")

/datum/map/debugabus/New()
	..()
	SSticker.start_immediately = TRUE

/datum/map_z_level/debugabus/station
	z = Z_LEVEL_MAIN_DEBUGABUS_TESTING
	name = "Station Level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_XENOARCH_EXEMPT
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map/debugabus/perform_map_generation()
	return 1

/area/centcom/test
	flags = RAD_SHIELDED


//////////////////////////////////////////////////////////////
// Supply shuttle
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = FERRY_LOCATION_OFFSITE
	shuttle_area = /area/shuttle/supply
	warmup_time = 10
	landmark_offsite = "supply_cc"
	landmark_station = "supply_station"
	docking_controller_tag = "supply_shuttle"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY
	move_direction = NORTH
