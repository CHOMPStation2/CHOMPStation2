/* Testing
/turf/simulated/floor/outdoors/lava_land/sand
	name = "sand"
	desc = "Sandy, taste salty and gritty."
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
	edge_blending_priority = 2
	turf_layers = list(/turf/simulated/floor/outdoors/rocks)
	initial_flooring = /decl/flooring/sand
	can_dig = false
*/
/turf/simulated/floor/outdoors/lava_land
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
	icon_edge = 'modular_chomp/icons/turf/lava_land_edge.dmi'
	name = "lavaland base turf"
	desc = "This should not exist"

/turf/simulated/floor/outdoors/lava_land/ash
	name = "ash"
	desc = "A thin soot of grey ash."
	icon_state = "ash"
	edge_blending_priority = 2

/turf/simulated/mineral/lava_land
	name = "ashen rock"
	desc = "A rock wall covered in a thick layer of ash."
	icon_state = "ashrock"
	edge_blending_priority = 3
//	turf_layers = list(/turf/simulated/floor/outdoors/lava_land/ash)

/turf/simulated/floor/outdoors/lava_land/basalt
	name = "basalt"
	desc = "A hard cracked black rock formed from rapidly cooling lava."
	icon_state = "basalt0"
	edge_blending_priority = 3
	turf_layers = list(/turf/simulated/floor/outdoors/lava_land/ash)

//	turf_layers = list(/turf/simulated/floor/outdoors/lava_land/ash) idk how these work

/* Testing
/decl/flooring/outdoors/sand
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
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
