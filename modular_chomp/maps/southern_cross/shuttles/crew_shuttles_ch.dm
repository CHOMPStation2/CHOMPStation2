//This is old chomp code that will need updating to re-add to our game.
//CHOMPedit: Shuttle 3, Sif-bound exploration shuttle for the exploration outpost, Hangar 3, and the wilderness.
//Created so pilots stop stealing the autopilot shuttles and making station-planet travel more burdensome.

GLOBAL_LIST_EMPTY(shuttdisp_list)

/obj/machinery/computer/shuttle_control/web/shuttle3
	name = "shuttle control console"
	shuttle_tag = "Shuttle 3"
	//req_access = list(access_pilot)

/datum/shuttle/autodock/web_shuttle/shuttle3
	name = "Shuttle 3"
	warmup_time = 0
	shuttle_area = /area/shuttle/shuttle3/start
	current_location = "exphangar_1"
	docking_controller_tag = "shuttle3_shuttle"
	web_master_type = /datum/shuttle_web_master/shuttle3

/datum/shuttle_web_master/shuttle3
	destination_class = /datum/shuttle_destination/shuttle3
	starting_destination = /datum/shuttle_destination/shuttle3/root

/datum/shuttle_destination/shuttle3/root
	name = "Exporation Hangar One"
	my_landmark = "exphangar_1"
	preferred_interim_tag = "shuttle3_transit"

	radio_announce = 0
	announcer = "Southern Cross Docking Computer"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/sif_orbit = 5 SECONDS
	)

/datum/shuttle_destination/shuttle3/root/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to Exploration Hangar One."

/datum/shuttle_destination/shuttle3/root/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed Exploration Hangar One."

/datum/shuttle_destination/shuttle3/sif_orbit
	name = "Sif Orbit"
	my_landmark = "shuttle3_orbit"
	preferred_interim_tag = "shuttle3_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/sky = 25 SECONDS,
		/datum/shuttle_destination/shuttle3/stationhangar3 = 25 SECONDS
	)

/*
/datum/shuttle_destination/shuttle3/outside_SC
	name = "Outside of NLS Southern Cross"
	my_landmark = "shuttle3_seconddeck"
	preferred_interim_tag = "shuttle3_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/stationhangar3 = 0 SECONDS
	)
*/

/datum/shuttle_destination/shuttle3/stationhangar3
	name = "Southern Cross Hangar Three"
	my_landmark = "hangar_3"
	preferred_interim_tag = "shuttle3_transit"

	radio_announce = 0
	announcer = "Southern Cross Docking Computer"

/datum/shuttle_destination/shuttle3/stationhangar3/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to Hangar Three."

/datum/shuttle_destination/shuttle3/stationhangar3/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed Hangar Three."

/datum/shuttle_destination/shuttle3/sky
	name = "Skies of Sif"
	my_landmark = "shuttle3_sky"
	preferred_interim_tag = "shuttle3_sky_transit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/mining_base = 10 SECONDS
	)

/datum/shuttle_destination/shuttle3/mining_base
	name = "Wilderness Landing Site "
	my_landmark = "shuttle3_mining"
	preferred_interim_tag = "shuttle3_sky_transit"

	radio_announce = 0
	announcer = "Outpost Automated ATC"

/datum/shuttle_destination/shuttle3/mining_base/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to the Wilderness Area."

/datum/shuttle_destination/shuttle3/mining_base/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed the Wilderness Area."

//Shuttle displays for tracking Shuttles 1 and 2 without spammy intercom announcements. This could hypothetically be expanded to other shuttles if for some reason that's desirable.
/obj/machinery/status_display/shuttle_display
	ignore_friendc = 1
	mode = STATUS_DISPLAY_CUSTOM
	name = "\improper STS display" //STS means Sif Transport System
	desc = "A Sif Transport System display. It tracks automated shuttles."
	message1 = "SHUT1" //Intended to be set on the map. Defaults to SHUT1 if spawned in to allow lazier mapping.

	var/datum/shuttle/autodock/web_shuttle/my_shuttle //This is set by the get_my_shuttle() proc. Don't modify it here. Typepath needs to be defined this far for the compiler to recognize shuttle datum variables.
	var/last_z = Z_LEVEL_STATION_ONE
	var/shuttle_tag = "Shuttle 1" //This needs to use the same tag system as the shuttles subsystem. Set this on the map, otherwise defaults to "Shuttle 1."
	var/location_desc //Location descriptions for extra information on examine.

/obj/machinery/status_display/shuttle_display/examine(mob/user) //Because the displays only fit 5 characters per line.
	. = ..()
	. += "[shuttle_tag] is currently [location_desc]."

/obj/machinery/status_display/shuttle_display/Initialize(mapload)
	. = ..()
	GLOB.shuttdisp_list |= src //Populates the global list for the roundstart hook.

/hook/roundstart/proc/shuttdisp_connect() //Initialize (and LateInitialize) call before the shuttle datums exist so this is needed to make shuttle displays work when mapped in
	for(var/obj/machinery/status_display/shuttle_display/SD in GLOB.shuttdisp_list)
		SD.get_my_shuttle()
	return TRUE

/obj/machinery/status_display/shuttle_display/Initialize(mapload)
	. = ..()
	get_my_shuttle()
	update()

/obj/machinery/status_display/shuttle_display/proc/get_my_shuttle() //Links the displays to their shuttles. Must be called after the shuttle datums exist.
	var/datum/shuttle/autodock/shuttle = SSshuttles.shuttles[shuttle_tag]
	if(!shuttle)
		log_debug("Shuttle display could not find its shuttle!")
	else
		my_shuttle = shuttle
		GLOB.shuttdisp_list -= src //Remove the displays from the global list to reduce memory usage because it's only needed before shuttles initialize.

/obj/machinery/status_display/shuttle_display/update() //Location tracking.
	if(!..() && mode == STATUS_DISPLAY_CUSTOM)
		message2 = ""

		if(!my_shuttle)
			message2 = "ErrR"
			location_desc = "ERROR SHUTTLE NOT FOUND"

		else if(my_shuttle.autopilot == FALSE) //This should prevent displays from being incorrect if somebody steals the shuttles.
			message2 = "MANUAL"
			location_desc = "piloted manually. Please contact Exploration to return the shuttle to autopilot" //Tell them to use Shuttle 3.

		else if(my_shuttle.current_location.z == Z_LEVEL_STATION_ONE)
			message2 = "Stat"
			last_z = Z_LEVEL_STATION_ONE
			location_desc = "docked on the station"

		else if(my_shuttle.current_location.z == Z_LEVEL_SURFACE)
			message2 = "Outp"
			last_z = Z_LEVEL_SURFACE
			location_desc =	"docked on the outpost"

		else
			if(last_z == Z_LEVEL_STATION_ONE)
				message2 = "STS-O"
				location_desc = "travelling to the outpost"

			if(last_z == Z_LEVEL_SURFACE)
				message2 = "STS-S"
				location_desc = "travelling to the station"


		update_display(message1, message2)
		return 1
	return 0

/obj/machinery/status_display/shuttle_display/receive_signal() //This should ensure the shuttle screens can never be changed to a message.
	return

/obj/machinery/status_display/shuttle_display/on_alert_changed() //Same as above but for alert levels.
	return
