/* Testing
/turf/simulated/floor/outdoors/desert_planet/sand
	name = "sand"
	desc = "Sandy, taste salty and gritty."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	edge_blending_priority = 2
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)
	initial_flooring = /decl/flooring/sand
	can_dig = false
*/

/turf/simulated/floor/outdoors/desert_planet/sand
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "sand"
	edge_blending_priority = 3
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/* Testing
/decl/flooring/outdoors/sand
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_base = "sand"
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/asteroid1.ogg',
		'sound/effects/footstep/asteroid2.ogg',
		'sound/effects/footstep/asteroid3.ogg',
		'sound/effects/footstep/asteroid4.ogg',
		'sound/effects/footstep/asteroid5.ogg',
		'sound/effects/footstep/MedDirt1.ogg',
		'sound/effects/footstep/MedDirt2.ogg',
		'sound/effects/footstep/MedDirt3.ogg',
		'sound/effects/footstep/MedDirt4.ogg'))

/turf/simulated/floor/outdoors/sand/Initialize(mapload)
	var/possiblesands = list(
		"ironsand1" = 50,
		"ironsand2" = 1,
		"ironsand3" = 1,
		"ironsand4" = 1,
		"ironsand5" = 1,
		"ironsand6" = 1,
		"ironsand7" = 1,
		"ironsand8" = 1,
		"ironsand9" = 1,
		"ironsand10" = 1,
		"ironsand11" = 1,
		"ironsand12" = 1,
		"ironsand13" = 1,
		"ironsand14" = 1,
		"ironsand15" = 1

	)
	flooring_override = pickweight(possiblesands)
	return ..()

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
			to_chat(L, "<span class='warning'>You feel an overwhelming wave of warmth from entering \the [src]!</span>")
	AM.water_act(5)
	..()


*/

/turf/simulated/floor/outdoors/desert_planet/deep_sand
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "deep_sand"
	edge_blending_priority = 2
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/grass
	name = "grass"
	desc = "Lively green grass, soft to walk on."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "grass"
	edge_blending_priority = 6
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/deep_grass
	name = "dense grass"
	desc = "Dense patch of grass, seems like a soft spot to lay on."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "deep_grass"
	edge_blending_priority = 7
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/gravel
	name = "gravel"
	desc = "Mix of dirt and sand, it crumbles in your hand."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "gravel"
	edge_blending_priority = 5
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/mud
	name = "mud"
	desc = "Squishy damp dirt, smells muddy."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "mud"
	edge_blending_priority = 4
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/water
	name = "water"
	desc = "Clear cool water, looks potable."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "water"
	edge_blending_priority = 8
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/deep_water
	name = "deep water"
	desc = "deep enough you can't see the bottom of it."
	icon = 'modular_chomp/icons/turf/desert_planet.dmi'
	icon_state = "deep_water"
	edge_blending_priority = 9
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)
