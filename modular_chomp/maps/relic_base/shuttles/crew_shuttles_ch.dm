
/datum/shuttle/autodock/web_shuttle/shuttle3
	current_location = "hangar_3"

/datum/shuttle_web_master/shuttle3
	starting_destination = /datum/shuttle_destination/shuttle3/stationhangar3

/datum/shuttle_destination/shuttle3/root
	announcer = "Relic Base Docking Computer"

/datum/shuttle_destination/shuttle3/sif_orbit
	name = "Thor Orbit"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/sky = 30 SECONDS
	)

/datum/shuttle_destination/shuttle3/stationhangar3
	name = "Relic Base Landing Pad 3"

	announcer = "Exploration Carrier"

/datum/shuttle_destination/shuttle3/stationhangar3/get_arrival_message()
	return "Attention, [master.my_shuttle.visible_name] has arrived to Landing Pad Three."

/datum/shuttle_destination/shuttle3/stationhangar3/get_departure_message()
	return "Attention, [master.my_shuttle.visible_name] has departed Landing Pad Three."

/datum/shuttle_destination/shuttle3/sky
	name = "Skies of Thor"

	routes_to_make = list(
		/datum/shuttle_destination/shuttle3/mining_base = 10 SECONDS,
		/datum/shuttle_destination/shuttle3/stationhangar3 = 10 SECONDS
	)
