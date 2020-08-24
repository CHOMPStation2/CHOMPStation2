/datum/shuttle/autodock/overmap/stargazer
	name = "Stargazer"
	warmup_time = 0
	current_location = "stargazer_dock"
	shuttle_area = /area/shuttle/stargazer
	fuel_consumption = 2
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/stargazer
	name = "Stargazer"
	desc = "Southern Cross' humanoid transport vessel."
	vessel_mass = 3000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Stargazer"

/obj/machinery/computer/shuttle_control/explore/stargazer
	name = "short jump console"
	shuttle_tag = "Stargazer"
	req_one_access = list(access_pilot)