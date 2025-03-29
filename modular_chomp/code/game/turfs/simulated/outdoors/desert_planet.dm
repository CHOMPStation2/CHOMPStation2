// Parent turf.
/turf/simulated/floor/outdoors/desert_planet
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/desert_tiles.dmi'
	icon_edge = 'modular_chomp/icons/turf/outdoors_edge.dmi'
	can_dig = FALSE

/turf/simulated/floor/outdoors/desert_planet/sand
	name = "sand"
	desc = "Salty and gritty."
	icon_state = "sand0"
	edge_blending_priority = 2
	initial_flooring = /decl/flooring/desert_planet/sand

// Necessary to get the edges to generate correctly since we use a random-ish icon_state. Inelegant to hard code, but this is a one-off case.
/turf/simulated/floor/outdoors/desert_planet/sand/get_edge_icon_state()
	return "sand"

/turf/simulated/floor/outdoors/desert_planet/sand/Initialize(mapload)
	. = ..()
	icon_state = "sand[rand(0,2)]"

/turf/simulated/floor/outdoors/desert_planet/sand/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/shovel))
		to_chat(user, span_notice("You begin to remove \the [src] with your [W]."))
		if(do_after(user, 4 SECONDS * W.toolspeed))
			to_chat(user, span_notice("\The [src] has been dug up, and now lies in a pile nearby."))
			icon_state = "sand_dug"
			new /obj/item/ore/glass (src)
		else
			to_chat(user, span_notice("You decide to not finish removing \the [src]."))
	else
		..()

/turf/simulated/floor/outdoors/desert_planet/deep_sand
	name = "sand"
	desc = "Really gets everywhere."
	icon_state = "deep_sand0"
	edge_blending_priority = 1
	movement_cost = 3
	initial_flooring = /decl/flooring/desert_planet/deep_sand

/turf/simulated/floor/outdoors/desert_planet/deep_sand/Initialize(mapload)
	. = ..()
	icon_state = "deep_sand[rand(0,2)]"

/turf/simulated/floor/outdoors/desert_planet/grass
	name = "grass"
	desc = "Lively green grass, soft to walk on."
	icon_state = "grass"
	edge_blending_priority = 5
	initial_flooring = /decl/flooring/desert_planet/grass

/turf/simulated/floor/outdoors/desert_planet/deep_grass
	name = "dense grass"
	desc = "Dense patch of grass, seems like a soft spot to lay on."
	icon_state = "deep_grass"
	edge_blending_priority = 6
	initial_flooring = /decl/flooring/desert_planet/deep_grass

/turf/simulated/floor/outdoors/desert_planet/gravel
	name = "gravel"
	desc = "Mix of dirt and sand, it crumbles in your hand."
	icon_state = "gravel"
	edge_blending_priority = 3
	initial_flooring = /decl/flooring/desert_planet/gravel

/turf/simulated/floor/outdoors/desert_planet/mud
	name = "mud"
	desc = "Squishy damp dirt, smells muddy."
	icon_state = "mud"
	edge_blending_priority = 4
	initial_flooring = /decl/flooring/desert_planet/mud

// At last we've come full circle, a floor which is actually a wall.
/turf/simulated/floor/outdoors/desert_planet/stonewall
	name = "sandstone"
	desc = "Rough sandstone."
	icon_state = "stonewall"
	density = TRUE
	opacity = TRUE
	edge_blending_priority = 7
	initial_flooring = /decl/flooring/desert_planet/stonewall
	//turf_layers = list(/turf/simulated/floor/outdoors/rocks)
	demote_to = /turf/simulated/floor/outdoors/rocks
	var/last_act = 0

// Stolen from mineral turf code.
/turf/simulated/floor/outdoors/desert_planet/stonewall/attackby(obj/item/W as obj, mob/user as mob)
	if(!user.IsAdvancedToolUser())
		to_chat(user, span_warning("You don't have the dexterity to do this!"))
		return

	if(istype(W, /obj/item/pickaxe))
		if(!istype(user.loc, /turf))
			return

		var/obj/item/pickaxe/P = W
		if(last_act + P.digspeed > world.time)//prevents message spam
			return
		last_act = world.time

		playsound(user, P.drill_sound, 20, 1)
		to_chat(user, span_notice("You start [P.drill_verb]."))

		if(do_after(user,P.digspeed))

			to_chat(user, span_notice("You finish [P.drill_verb] \the [src]."))
			new /obj/item/stack/material/sandstone(src)
			density = FALSE
			opacity = FALSE
			demote() // Converts the turf to the next layer in turf_layers.
	..()

/turf/simulated/floor/outdoors/desert_planet/sandrock
	name = "sandstone tiles"
	desc = "Tightly joined in a mesmerizing lattice."
	icon_state = "sandrock"
	density = TRUE
	opacity = TRUE
	initial_flooring = /decl/flooring/desert_planet/sandrock

// Declarations (for initial_flooring)
/decl/flooring/desert_planet // Yeah don't use this one, it's a parent just for setting icon.
	name = "desert stuff"
	desc = "If you see this, this turf is using the wrong decl."
	icon = 'modular_chomp/icons/turf/desert_tiles.dmi'
	icon_base = null

/decl/flooring/desert_planet/sand
	name = "sand"
	desc = "Salty and gritty."
	icon_base = "sand"
	has_base_range = 2

/decl/flooring/desert_planet/deep_sand
	name = "sand"
	desc = "Really gets everywhere."
	icon_base = "deep_sand"
	has_base_range = 2

/decl/flooring/desert_planet/grass
	name = "grass"
	desc = "Lively green grass, soft to walk on."
	icon_base = "grass"

/decl/flooring/desert_planet/deep_grass
	name = "dense grass"
	desc = "Dense patch of grass, seems like a soft spot to lay on."
	icon_base = "deep_grass"

/decl/flooring/desert_planet/gravel
	name = "gravel"
	desc = "Mix of dirt and sand, it crumbles in your hand."
	icon_base = "gravel"

/decl/flooring/desert_planet/mud
	name = "mud"
	desc = "Squishy damp dirt, smells muddy."
	icon_base = "mud"

/decl/flooring/desert_planet/stonewall
	name = "sandstone"
	desc = "Rough sandstone."
	icon_base = "stonewall"

/decl/flooring/desert_planet/sandrock
	name = "sandstone tiles"
	desc = "Tightly joined in a mesmerizing lattice."
	icon_base = "sandrock"
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS

/*
/obj/effect/floor_decal/desert_planet/floor/sand0_edge
	name = "sand0_edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "sand0_edge"

/obj/effect/floor_decal/desert_planet/floor/gravel_edge
	name = "gravel_edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "gravel_edge"

/obj/effect/floor_decal/desert_planet/floor/mud_edge
	name = "mud_edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "mud_edge"

/obj/effect/floor_decal/desert_planet/floor/grass_edge
	name = "grass_edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "grass_edge"

/obj/effect/floor_decal/desert_planet/floor/deep_grass_edge
	name = "deep_grass_edge"
	icon = 'icons/turf/desert_planet.dmi'
	icon_state = "deep_grass_edge"
*/

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
