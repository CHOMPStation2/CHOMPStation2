/turf/unsimulated/floor/outdoors/grass
	name = "grass"
	icon_state = "grass0"
	edge_blending_priority = 4

/turf/unsimulated/floor/outdoors/grass/sif
	name = "growth"
	icon_state = "grass_sif0"
	edge_blending_priority = 3 // CHOMPedit

/turf/unsimulated/floor/outdoors/grass/forest
	name = "thick grass"
	icon_state = "grass-dark0"
	//tree_chance = 20
	edge_blending_priority = 5

/turf/unsimulated/floor/outdoors/grass/sif/forest
	name = "thick growth"
	icon_state = "grass_sif_dark0"
	edge_blending_priority = 5

/turf/unsimulated/floor/outdoors/mud
	name = "mud"
	icon_state = "mud_dark"
	edge_blending_priority = 4 // CHOMPedit

/turf/unsimulated/floor/outdoors/rocks
	name = "rocks"
	desc = "Hard as a rock."
	icon_state = "rock"
	edge_blending_priority = 1

/turf/unsimulated/floor/outdoors/rocks/caves
	outdoors = OUTDOORS_NO

/turf/unsimulated/floor/outdoors/rocks/sif
	// nothing

/turf/unsimulated/floor/outdoors/grass/heavy
	name = "heavy grass"
	icon_state = "grass-heavy0"
	edge_blending_priority = 4

/turf/unsimulated/floor/outdoors/dirt
	name = "dirt"
	desc = "Quite dirty!"
	icon_state = "dirt-dark"
	edge_blending_priority = 2

/turf/unsimulated/floor/outdoors/ironsand
	name = "iron sand"
	desc = "Red and gritty."
	icon = 'icons/turf/flooring/ironsand_vr.dmi'
	icon_state = "ironsand1"
	edge_blending_priority = 1

/turf/unsimulated/floor/outdoors/newdirt
	name = "dirt"
	desc = "Looks dirty."
	icon = 'icons/turf/outdoors_vr.dmi'
	icon_state = "dirt0"
	edge_blending_priority = 2

/turf/unsimulated/floor/outdoors/newdirt_nograss
	name = "dirt"
	desc = "Looks dirty."
	icon = 'icons/turf/outdoors_vr.dmi'
	icon_state = "dirt0"
	edge_blending_priority = 2

/turf/unsimulated/floor/outdoors/sidewalk
	name = "sidewalk"
	desc = "Concrete shaped into a path!"
	icon = 'icons/turf/outdoors_vr.dmi'
	icon_state = "sidewalk"
	edge_blending_priority = -1
	movement_cost = -0.5

/turf/unsimulated/floor/outdoors/sidewalk/side
	icon_state = "side-walk"

/turf/unsimulated/floor/outdoors/sidewalk/slab
	icon_state = "slab"

/turf/unsimulated/floor/outdoors/sidewalk/slab/city
	icon_state = "cityslab"

/turf/unsimulated/floor/outdoors/snow
	name = "snow"
	icon_state = "snow"
	edge_blending_priority = 6
	movement_cost = 2

/turf/unsimulated/floor/outdoors/ice
	name = "ice"
	icon_state = "ice"
	desc = "Looks slippery."
	edge_blending_priority = 0

/turf/unsimulated/floor/outdoors/ice/dark
	name = "black ice"
	icon_state = "ice_dark"
	desc = "An uneven surface of dark rocks glazed over by solid ice. Looks slippey, maybe even painful"

/turf/unsimulated/floor/outdoors/ice/dark_smooth
	name = "smooth black ice"
	icon_state = "ice_dark_smooth"
	desc = "Dark rock that has been smoothened to be perfectly even. It's coated in a layer of slippey ice"

/turf/unsimulated/floor/outdoors/ice/Entered(var/mob/living/M)
	addtimer(CALLBACK(src, PROC_REF(do_slip), M), (1 * world.tick_lag), TIMER_DELETE_ME)

/turf/unsimulated/floor/outdoors/ice/proc/do_slip(var/mob/living/M)
	if(istype(M, /mob/living))
		if(M.stunned == 0)
			to_chat(M, span_warning("You slide across the ice!"))
		M.SetStunned(1)
		step(M,M.dir)

/turf/unsimulated/floor/outdoors/shelfice
	name = "ice"
	icon_state = "ice"
	desc = "Looks slippery."
	movement_cost = 4
	edge_blending_priority = 0

/turf/unsimulated/floor/grass2
	name = "grass patch"
	desc = "You can't tell if this is real grass or just cheap plastic imitation."
	icon ='icons/obj/clockwork_objects.dmi'
	icon_state = "grass"

/turf/unsimulated/floor/beach
	name = "Beach"
	icon = 'icons/misc/beach.dmi'

/turf/unsimulated/floor/beach/sand
	name = "Sand"
	icon_state = "sand"

/turf/unsimulated/floor/beach/sand/desert
	icon = 'icons/turf/desert.dmi'
	icon_state = "desert"

/turf/unsimulated/floor/beach/sand/desert/Initialize(mapload)
	. = ..()
	if(prob(5))
		icon_state = "desert[rand(0,4)]"

/turf/unsimulated/floor/beach/coastline
	name = "Coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/unsimulated/floor/beach/water
	name = "Water"
	icon_state = "water"
	movement_cost = 4 // Water should slow you down, just like the original simulated turf.

/turf/unsimulated/floor/beach/water/ocean
	icon_state = "seadeep"
	movement_cost = 8 // Deep water should be difficult to wade through.

/turf/unsimulated/floor/beach/water/Initialize(mapload)
	. = ..()
	add_overlay(image("icon"='icons/misc/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1))

/turf/unsimulated/floor/beach/sand/outdoors
	outdoors = OUTDOORS_YES

/turf/unsimulated/floor/beach/sand/desert/outdoors
	outdoors = OUTDOORS_YES

/turf/unsimulated/floor/beach/coastwater
	name = "Water"
	icon_state = "water"
