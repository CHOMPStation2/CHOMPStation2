/obj/effect/step_trigger/teleporter/deathfall/Initialize(mapload)
	. = ..()
	teleport_z = src.z //This is for use in gateways, so mappers can hard map the X and Y without worrying about going to brazil

/obj/effect/step_trigger/teleporter/deathfall/Trigger(var/atom/movable/A)
	var/turf/simulated/T = locate(teleport_x, teleport_y, teleport_z)
	if(!istype(T))
		log_debug("[src] failed to find destination turf.")
		return
	if(A.hovering)//Flying people dont fall
		return
	if(isobserver(A))
		A.forceMove(T) // Harmlessly move ghosts.
		return
	if(A.throwing) //jumpboots
		return
	if(!(A.can_fall())) //test
		return // Phased shifted kin should not fall

	var/mob/living/L
	if(isliving(A))
		L = A
		if(L.is_floating)
			return //Flyers/nograv can ignore it

	A.forceMove(T)
	// Living things should probably be logged when they fall...
	if(isliving(A))
		message_admins("\The [A] fell out of the sky.")
	// ... because they're probably going to die from it.
		A.fall_impact(T, 42, 90, FALSE, TRUE)	//Medical gameplay generator
	else
		message_admins("ERROR: planetary_fall step trigger lacks a planet to fall onto.")
		return

/obj/effect/step_trigger/teleporter/poi/Initialize(mapload) //This is for placing teleporters in gateways/POIS, where Z levels can be different and I cant be assed to make fake teleporter stairs
	. = ..()
	teleport_z = src.z
