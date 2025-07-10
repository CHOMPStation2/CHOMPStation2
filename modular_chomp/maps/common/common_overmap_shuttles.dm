//Stargazer
/datum/shuttle/autodock/overmap/stargazer
	name = "Stargazer"
	warmup_time = 1
	current_location = "stargazer_dock"
	docking_controller_tag = "stargazer"
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

//Baby_Mammoth
/datum/shuttle/autodock/overmap/baby_mammoth
	name = "Baby_mammoth"
	warmup_time = 5
	current_location = "baby_mammoth_dock"
	docking_controller_tag = "baby_mammoth"
	shuttle_area = /area/shuttle/baby_mammoth
	fuel_consumption = 2
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/baby_mammoth
	name = "Baby_mammoth"
	desc = "Southern Cross' humanoid exploration vessel."
	vessel_mass = 6000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Baby_mammoth"

/obj/machinery/computer/shuttle_control/explore/baby_mammoth
	name = "short jump console"
	shuttle_tag = "Baby_mammoth"

//Ursula
/datum/shuttle/autodock/overmap/ursula
	name = "Ursula"
	warmup_time = 2
	current_location = "ursula_dock"
	docking_controller_tag = "ursula"
	shuttle_area = /area/shuttle/ursula
	fuel_consumption = 2
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/ursula
	name = "Ursula"
	desc = "Southern Cross' humanoid science vessel."
	vessel_mass = 3500
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Ursula"

/obj/machinery/computer/shuttle_control/explore/ursula
	name = "short jump console"
	shuttle_tag = "Ursula"

//Needle
/datum/shuttle/autodock/overmap/needle
	name = "Needle"
	warmup_time = 0
	current_location = "needle_dock"
	docking_controller_tag = "needle"
	shuttle_area = /area/shuttle/needle
	fuel_consumption = 1
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/needle
	name = "Needle"
	desc = "Southern Cross' humanoid scouting vessel."
	vessel_mass = 1500
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Needle"

/obj/machinery/computer/shuttle_control/explore/needle
	name = "short jump console"
	shuttle_tag = "Needle"

//Echidna
/datum/shuttle/autodock/overmap/echidna
	name = "Echidna"
	warmup_time = 4
	current_location = "echidna_dock"
	docking_controller_tag = "echidna"
	shuttle_area = /area/shuttle/echidna
	fuel_consumption = 2
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/echidna
	name = "Echidna"
	desc = "Southern Cross' humanoid mining vessel."
	vessel_mass = 5500
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Echidna"

/obj/machinery/computer/shuttle_control/explore/echidna
	name = "short jump console"
	shuttle_tag = "Echidna"

//Spacebus
/datum/shuttle/autodock/overmap/spacebus
	name = "Space Bus"
	warmup_time = 4
	current_location = "hangar_2"
	docking_controller_tag = "spacebus"
	shuttle_area = /area/shuttle/spacebus
	fuel_consumption = 1
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/spacebus
	name = "Space Bus"
	desc = "Southern Cross' civilian transport vessel"
	vessel_mass = 2000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Space Bus"
	known = TRUE

/obj/machinery/computer/shuttle_control/explore/spacebus
	name = "short jump console"
	shuttle_tag = "Space Bus"

//POI Junker
/datum/shuttle/autodock/overmap/junker
	name = "Junker"
	warmup_time = 4
	current_location = "junkspawn"
	docking_controller_tag = "junker"
	shuttle_area = /area/shuttle/junker
	fuel_consumption = 1
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/junker
	name = "Junker"
	desc = "Small class ship, non-NT property."
	vessel_mass = 500
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Junker"

/obj/machinery/computer/shuttle_control/explore/junker
	name = "short jump console"
	shuttle_tag = "Junker"

/*POI Temp removal so I can properly add it in it's own PR
/datum/shuttle/autodock/overmap/phoenix
	name = "Phoenix"
	warmup_time = 4
	current_location = "tyrshuttle"
	docking_controller_tag = "phoenix"
	shuttle_area = /area/shuttle/phoenix
	fuel_consumption = 1
	move_direction = NORTH

/obj/effect/overmap/visitable/ship/landable/phoenix
	name = "Phoenix"
	desc = "Small class ship, non-NT property."
	vessel_mass = 1000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "phoenix"

/obj/machinery/computer/shuttle_control/explore/phoenix
	name = "short jump console"
	shuttle_tag = "phoenix"
*/

