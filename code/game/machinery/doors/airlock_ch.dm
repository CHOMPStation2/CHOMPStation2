/obj/machinery/door/airlock/scp
	name = "SCP Access"
	icon = 'icons/obj/doors/SCPdoor.dmi'
	//req_one_access = list(access_maint_tunnels)
	open_sound_powered = 'sound/machines/scp1o.ogg'
	close_sound_powered = 'sound/machines/scp1c.ogg'

/obj/machinery/door/airlock/can_pathfinding_enter(atom/movable/actor, dir, datum/pathfinding/search)
	return ..() || (has_access(req_access, req_one_access, search.ss13_with_access) && !locked && !inoperable())
