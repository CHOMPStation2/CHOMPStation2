//simple mob blocker to use in VR to stop mobs from going through
/obj/effect/mobblocker
	name = "Mob blocker"
	desc = "Blocks simple mobs from going through"
	icon = 'icons/effects/effects.dmi'
	icon_state = "directional_shield"
	anchored = TRUE

/obj/effect/mobblocker/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /mob/living/simple_mob))
		return FALSE
	return TRUE
