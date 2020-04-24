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

/obj/structure/boxingrope/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSGLASS))
		return 1
	if(get_dir(O.loc, target) == dir)
		return 0
	return 1

/obj/structure/boxingropeenter
	name = "Ring entrance"
	desc = "Do not exit the ring."
	density = 0
	anchored = 1
	icon = 'icons/obj/boxing_rope_ch.dmi'
	icon_state = "ringrope"
	layer = OBJ_LAYER
