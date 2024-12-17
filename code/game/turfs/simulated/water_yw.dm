/turf/simulated/floor/water/hotspring
	name = "Hotsprings"
	desc = "A natural hotspring connecting to an aquifer. It seems the facility was built ontop of it."
	edge_blending_priority = -2
	movement_cost = 8
	depth = 2
	water_state = "water_shallow"
	outdoors = FALSE

/turf/simulated/floor/water/hotspring/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/simulated/floor/water/hotspring))
			to_chat(L, span_warning("You feel an overwhelming wave of warmth from entering \the [src]!"))
	AM.water_act(5)
	..()
