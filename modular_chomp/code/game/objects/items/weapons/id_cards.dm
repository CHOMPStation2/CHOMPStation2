
/obj/item/weapon/card/id/exploration/borg
	var/mob/living/silicon/robot/R
	var/last_robot_loc
	name = "Robot Exploration ID"
	rank = JOB_EXPLORER

/obj/item/weapon/card/id/exploration/borg/Initialize()
	. = ..()
	R = loc.loc
	registered_name = R.braintype
	RegisterSignal(src, COMSIG_OBSERVER_MOVED, PROC_REF(check_loc))

/obj/item/weapon/card/id/exploration/borg/proc/check_loc(atom/movable/mover, atom/old_loc, atom/new_loc)
	if(old_loc == R || old_loc == R.module)
		last_robot_loc = old_loc
	if(!istype(loc, /obj/machinery) && loc != R && loc != R.module)
		if(last_robot_loc)
			forceMove(last_robot_loc)
			last_robot_loc = null
		else
			forceMove(R)
		if(loc == R)
			hud_layerise()

/obj/item/weapon/card/id/exploration/borg/Destroy()
	UnregisterSignal(src, COMSIG_OBSERVER_MOVED)
	..()
