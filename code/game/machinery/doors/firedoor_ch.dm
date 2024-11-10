//Glass variation of the 2x1 firedoor
/obj/machinery/door/firedoor/multi_tile/glass
	icon = 'icons/obj/doors/DoorHazardGlass2x1.dmi'
	width = 2
	glass = 1
	open_sound = 'sound/machines/firewide1o.ogg'
	close_sound = 'sound/machines/firewide1c.ogg'

/obj/machinery/door/firedoor/border_only/can_pathfinding_exit(atom/movable/actor, dir, datum/pathfinding/search)
	return (src.dir != dir) || ..()

/obj/machinery/door/firedoor/border_only/can_pathfinding_enter(atom/movable/actor, dir, datum/pathfinding/search)
	return (src.dir != dir) || ..()
