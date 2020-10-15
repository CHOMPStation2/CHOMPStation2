//UNIFY start
/obj/machinery/drone_fabricator/unify	//Non-Specific dronetype
	drone_type = null //var filled by drone choice.
	fabricator_tag = "Unified Drone Fabricator"

	var/list/possible_drones = list("Construction Module" = /mob/living/silicon/robot/drone/construction,
									"Maintenance Module" = /mob/living/silicon/robot/drone,
									) //List of drone types to choose from.//Changeable in mapping.

	create_drone(var/client/player)
		choose_dronetype(possible_drones) //Call Drone choice before executing create_drone
		..()

/obj/machinery/drone_fabricator/proc/choose_dronetype(possible_drones)
	var/choice
	choice = input(usr,"What module would you like to use?") as null|anything in possible_drones
	if(!choice) return
	drone_type = possible_drones[choice]
//UNIFY end
