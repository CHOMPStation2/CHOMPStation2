
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
	//turf_layers = list(/turf/simulated/floor/outdoors/lavaland/ash)
	demote_to = /turf/simulated/floor/outdoors/lavaland/ash
	var/last_act = 0

// Stolen from mineral turf code.
/turf/simulated/floor/outdoors/lavaland/ashrock/attackby(obj/item/W as obj, mob/user as mob)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	if(istype(W, /obj/item/pickaxe))
		if(!istype(user.loc, /turf))
			return

		var/obj/item/pickaxe/P = W
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
	//turf_layers = list(/turf/simulated/floor/outdoors/lavaland/ash)
	demote_to = /turf/simulated/floor/outdoors/lavaland/ash

/turf/simulated/floor/outdoors/lavaland/basalt/get_edge_icon_state()
	return "basalt0"
/decl/flooring/basalt
	name = "basalt"
	desc = "A hard cracked black rock formed from rapidly cooling lava."
	icon = 'modular_chomp/icons/turf/lava_land.dmi'
	icon_base = "basalt"
	has_base_range = 12
