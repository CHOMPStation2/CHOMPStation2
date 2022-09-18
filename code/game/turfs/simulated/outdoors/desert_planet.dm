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
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "sand0"
	//edge_blending_priority = 1
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/* #I want this for the desert tiles.
/turf/simulated/floor/outdoors/desert_planet/sand
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
		"sand" = 50,
		"sand" = 1,
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
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "deep_sand"
	movement_cost = 3
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/turf/simulated/floor/outdoors/desert_planet/grass
	name = "grass"
	desc = "Lively green grass, soft to walk on."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "grass"
	//edge_blending_priority = 4
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/turf/simulated/floor/outdoors/desert_planet/deep_grass
	name = "dense grass"
	desc = "Dense patch of grass, seems like a soft spot to lay on."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "deep_grass"
	//edge_blending_priority = 5
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/turf/simulated/floor/outdoors/desert_planet/gravel
	name = "gravel"
	desc = "Mix of dirt and sand, it crumbles in your hand."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "gravel"
	//edge_blending_priority = 2
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/turf/simulated/floor/outdoors/desert_planet/mud
	name = "mud"
	desc = "Squishy damp dirt, smells muddy."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "mud"
	//edge_blending_priority = 3
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/turf/simulated/floor/outdoors/desert_planet/sandstone_tiles
	name = "sandstone_tiles"
	desc = "Smooth polished sandstone tiles, fitted and fixed in patters"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "sandstone_tiles"
	//edge_blending_priority = 3
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)

/obj/effect/floor_decal/desert_planet/floor/sand0-edge
	name = "sand0-edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "sand0-edge"

/obj/effect/floor_decal/desert_planet/floor/gravel-edge
	name = "gravel-edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "gravel-edge"

/obj/effect/floor_decal/desert_planet/floor/mud-edge
	name = "mud-edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "mud-edge"

/obj/effect/floor_decal/desert_planet/floor/grass-edge
	name = "grass-edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "grass-edge"

/obj/effect/floor_decal/desert_planet/floor/deep_grass-edge
	name = "deep_grass-edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "deep_grass-edge"


/*  #No idea how water tiles work
/turf/simulated/floor/outdoors/desert_planet/water
	name = "water"
	desc = "Clear cool water, looks potable."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "water"
	var/water_state = "water_shallow"
	var/under_state = "sand"
	can_be_plated = FALSE
	outdoors = OUTDOORS_YES
	flags = TURF_ACID_IMMUNE
	layer = WATER_FLOOR_LAYER
	can_dirty = FALSE	// It's water
	var/depth = 1 // Higher numbers indicates deeper water.
	var/reagent_type = "water"
	edge_blending_priority = 2
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

/turf/simulated/floor/outdoors/desert_planet/deep_water
	name = "deep water"
	desc = "deep enough you can't see the bottom of it."
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "deep_water"
	var/water_state = "water_shallow"
	var/under_state = "sand"
	can_be_plated = FALSE
	outdoors = OUTDOORS_YES
	flags = TURF_ACID_IMMUNE
	layer = WATER_FLOOR_LAYER
	can_dirty = FALSE	// It's water
	var/depth = 2 // Higher numbers indicates deeper water.
	var/reagent_type = "water"
	edge_blending_priority = 4
	turf_layers = list(/turf/simulated/floor/outdoors/desert_planet/sand)

  //I want this for the water tiles
/turf/simulated/floor/water
	name = "shallow water"
	desc = "A body of water.  It seems shallow enough to walk through, if needed."
	icon = 'icons/turf/outdoors.dmi'
	icon_state = "seashallow" // So it shows up in the map editor as water.
	var/water_state = "water_shallow"
	var/under_state = "rock"
	edge_blending_priority = -1
	movement_cost = 4
	can_be_plated = FALSE
	outdoors = OUTDOORS_YES
	flags = TURF_ACID_IMMUNE

	layer = WATER_FLOOR_LAYER

	can_dirty = FALSE	// It's water

	var/depth = 1 // Higher numbers indicates deeper water.

	var/reagent_type = "water"
	// var/datum/looping_sound/water/soundloop CHOMPEdit: Removing soundloop for now.
*/