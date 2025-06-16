#define Z_LEVEL_STATION_ONE 1

/datum/map/runtime_station
	name = "Runtime Station"
	full_name = "Southern Cross"
	path = "modular_chomp/maps/runtime/runtime_station"

	lobby_screens = list('html/lobby/logo2.gif') // CHOMPEdit
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'	//CHOMPStation Edit - Job icons for off-duty/exploration

	zlevel_datum_type = /datum/map_z_level/runtime_station

	station_name  = "NLS Southern Cross"
	station_short = "Southern Cross"
	dock_name     = "NCS Northern Star" // Now we're the centcom!
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Vir"
	use_overmap = FALSE

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the station at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %dock_name% has been scheduled. The shuttle has been called. Those leaving should proceed to docks one and two in approximately %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station at docks one and two. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at docks one and two in approximately %ETA%."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."
	usable_email_tlds = list("freemail.nt")
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway", "Sif plains")
	default_skybox = /datum/skybox_settings/southern_cross
	map_levels = list(
			Z_LEVEL_STATION_ONE
		)
	lateload_gateway = null

/datum/skybox_settings/southern_cross
	icon_state = "dyable"
	random_color = TRUE

/datum/map_z_level/runtime_station
	z = Z_LEVEL_STATION_ONE
	name = "Deck 1"
	base_turf = /turf/space
