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
/turf/simulated/floor/outdoors/lavaland
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
	icon_edge = 'modular_chomp/icons/turf/lava_land_edge.dmi'
	name = "lavaland base turf"
	desc = "This should not exist"

/turf/simulated/floor/outdoors/lavaland/ash
	name = "ash"
	desc = "A thin soot of grey ash."
	icon_state = "ash"
	edge_blending_priority = 2

/turf/simulated/floor/outdoors/lavaland/ashrock
	name = "ashen rock"
	desc = "A rock wall covered in a thick layer of ash."
	icon_state = "ashrock"
	density = TRUE
	opacity = TRUE
	edge_blending_priority = 7
	initial_flooring = /decl/flooring/lavaland/ashrock
	turf_layers = list(/turf/simulated/floor/outdoors/lavaland/ash)
	var/last_act = 0

// Stolen from mineral turf code.
/turf/simulated/floor/outdoors/lavaland/ashrock/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	if(istype(W, /obj/item/weapon/pickaxe))
		if(!istype(user.loc, /turf))
			return

		var/obj/item/weapon/pickaxe/P = W
		if(last_act + P.digspeed > world.time)//prevents message spam
			return
		last_act = world.time

		playsound(user, P.drill_sound, 20, 1)
		to_chat(user, "<span class='notice'>You start [P.drill_verb].</span>")

		if(do_after(user,P.digspeed))

			to_chat(user, "<span class='notice'>You finish [P.drill_verb] \the [src].</span>")
			density = FALSE
			opacity = FALSE
			demote() // Converts the turf to the next layer in turf_layers.
	..()

/decl/flooring/lavaland/ashrock
	name = "ash covered stone"
	desc = "Stone that's covered in a thin layer of ash."
	icon_base = "ashrock"
	icon = 'modular_chomp/icons/turf/lava_land.dmi'

/turf/simulated/floor/outdoors/lavaland/basalt
	icon_state = "basalt0"
	edge_blending_priority = 3
	initial_flooring = /decl/flooring/basalt
	turf_layers = list(/turf/simulated/floor/outdoors/lavaland/ash)

/turf/simulated/floor/outdoors/lavaland/basalt/get_edge_icon_state()
	return "basalt0"
/decl/flooring/basalt
	name = "basalt"
	desc = "A hard cracked black rock formed from rapidly cooling lava."
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
	icon_base = "basalt"
	has_base_range = 12



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
