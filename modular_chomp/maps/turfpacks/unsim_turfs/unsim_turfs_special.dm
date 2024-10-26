#pragma multiple
// DO NOT INCLUDE THIS FILE IN THE DME! It is meant to be included by other .dm files repeatedly, redefining the declarations below each time.
/turf/unsimulated/floor/boxing
	name = "boxing mat"
	icon = 'icons/turf/gym_ch.dmi'
	icon_state = "boxing"

/turf/unsimulated/floor/boxing/gym
	name = "gym mat"
	icon_state = "gym_mat"

/turf/unsimulated/floor/flesh
	name = "flesh"
	desc = "This slick flesh ripples and squishes under your touch"
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "flesh_floor"

/turf/unsimulated/floor/flesh/colour
	icon_state = "c_flesh_floor"

/turf/unsimulated/floor/redgrid
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit_vr.dmi'
	icon_state = "rcircuit"

/turf/unsimulated/floor/redgrid/animated
	name = "pulsing pattern"
	icon = 'icons/turf/flooring/circuit_vr.dmi'
	icon_state = "rcircuitanim"

/turf/unsimulated/floor/flock
	icon = 'icons/goonstation/featherzone.dmi'
	icon_state = "floor"

/turf/unsimulated/floor/gorefloor
	name = "infected tile"
	desc = "Slick, sickly-squirming meat has grown in and out of cracks once empty. It pulsates intermittently, and with every beat, blood seeps out of pores."
	icon_state = "bloodfloor_1"
	icon = 'icons/goonstation/turf/meatland.dmi'

/turf/unsimulated/floor/gorefloor2
	name = "putrid mass"
	desc = "It is entirely made of sick, gurgling flesh. It is releasing a sickly odour."
	icon_state = "bloodfloor_2"
	icon = 'icons/goonstation/turf/meatland.dmi'

/turf/unsimulated/gore
	name = "wall of viscera"
	desc = "Its veins pulse in a sickeningly rapid fashion, while certain spots of the wall rise and fall gently, much like slow, deliberate breathing."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_2"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/goreeyes
	name = "wall of viscera"
	desc = "Strangely observant eyes dot the wall. Getting too close has the eyes fixate on you, while their pupils shake violently. Each socket is connected by a series of winding, writhing veins."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_4"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/floor/diona
	name = "biomass flooring"
	icon_state = "diona"

/turf/unsimulated/floor/phoronics
	name = "electromagnetic tile"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit_broken"

/turf/unsimulated/shuttle/plating
	name = "plating"
	icon = 'icons/turf/floors.dmi'
	icon_state = "plating"

/turf/unsimulated/shuttle/floor
	name = "floor"
	icon = 'icons/turf/flooring/shuttle.dmi'
	icon_state = "floor_blue"

/turf/unsimulated/shuttle/floor/red
	icon_state = "floor_red"

/turf/unsimulated/shuttle/floor/yellow
	icon_state = "floor_yellow"

/turf/unsimulated/shuttle/floor/darkred
	icon_state = "floor_dred"

/turf/unsimulated/shuttle/floor/purple
	icon_state = "floor_purple"

/turf/unsimulated/shuttle/floor/white
	icon_state = "floor_white"

/turf/unsimulated/shuttle/floor/black
	icon_state = "floor_black"

/turf/unsimulated/shuttle/floor/glass
	icon_state = "floor_glass"

/turf/unsimulated/shuttle/floor/alien
	icon_state = "alienpod1"
	light_range = 3
	light_power = 0.6
	light_color = "#66ffff" // Bright cyan.
	light_on = TRUE
	block_tele = TRUE

/turf/unsimulated/shuttle/floor/alienplating
	icon_state = "alienplating"
	block_tele = TRUE

/turf/unsimulated/shuttle/floor/alienplating/blue
	icon = 'icons/turf/shuttle_alien_blue.dmi'
	icon_state = "alienplating"

/turf/unsimulated/shuttle/floor/alienplating/blue/half
	icon_state = "alienplatinghalf"

/turf/unsimulated/shuttle/floor/alien/blue
	icon = 'icons/turf/shuttle_alien_blue.dmi'
	icon_state = "alienpod1"
	light_range = 4
	light_power = 0.8
	light_color = "#66ffff" // Bright cyan.

/turf/unsimulated/shuttle/floor/skipjack //Skipjack floors
	name = "skipjack floor"
	icon_state = "floor_dred"

/turf/unsimulated/shuttle/floor/voidcraft
	name = "voidcraft tiles"
	icon_state = "void"

/turf/unsimulated/shuttle/floor/voidcraft/dark
	name = "voidcraft tiles"
	icon_state = "void_dark"

/turf/unsimulated/shuttle/floor/voidcraft/light
	name = "voidcraft tiles"
	icon_state = "void_light"
