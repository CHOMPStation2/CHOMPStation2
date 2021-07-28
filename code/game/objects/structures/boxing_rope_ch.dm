/obj/structure/boxingrope
	name = "Boxing Ropes"
	desc = "Do not exit the ring."
	density = 1
	anchored = 1
	icon = 'icons/obj/boxing_rope_ch.dmi'
	icon_state = "ringrope"
	layer = OBJ_LAYER

/obj/structure/boxingrope/CanPass(atom/movable/mover, turf/target) //Taken from window.dm
	if(istype(mover) && mover.checkpass(PASSGLASS))
		return TRUE
	if((get_dir(loc, target) & dir) || (get_dir(mover, target) == turn(dir, 180)))
		return !density
	else
		return TRUE

/obj/structure/fitness/boxing_ropes/Uncross(atom/movable/mover, turf/target)
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return TRUE
	if(get_dir(mover, target) == dir) // From here to elsewhere, can't move in our dir
		return !density
	return TRUE

/obj/structure/boxingropeenter
	name = "Ring entrance"
	desc = "Do not exit the ring."
	density = 0
	anchored = 1
	icon = 'icons/obj/boxing_rope_ch.dmi'
	icon_state = "ringrope"
	layer = OBJ_LAYER
