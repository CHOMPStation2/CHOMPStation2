//No clue what to call this but its essenitally a companion file for drone.dm where we have all the tiny single or 3 line procs for sake of readability
/mob/living/silicon/robot/drone/Destroy()
	if(hat)
		hat.loc = get_turf(src)
	..()

/mob/living/silicon/robot/drone/is_sentient()
	return FALSE

/mob/living/silicon/robot/drone/Login()
	. = ..()
	if(can_pick_shell)
		to_chat(src, "<b>You can select a shell using the 'Robot Commands' > 'Customize Appearance'</b>")

//Redefining some robot procs...
/mob/living/silicon/robot/drone/SetName(pickedName as text)
	real_name = pickedName
	name = real_name

/mob/living/silicon/robot/drone/updatename()
	if(name_override)
		return
	real_name = "[initial(name)] ([serial_number])"
	name = real_name

/mob/living/silicon/robot/drone/choose_icon()
	return

/mob/living/silicon/robot/drone/pick_module()
	return

//DRONE MOVEMENT.
/mob/living/silicon/robot/drone/Process_Spaceslipping(var/prob_slip)
	return 0

/mob/living/silicon/robot/drone/add_robot_verbs()
	src.verbs |= silicon_subsystems

/mob/living/silicon/robot/drone/remove_robot_verbs()
	src.verbs -= silicon_subsystems