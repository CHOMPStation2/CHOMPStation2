/decl/flooring
	var/list/vorefootstep_sounds = list() // key=species name, value = list of sounds, used for reagent sloshing in vore belly

	vorefootstep_sounds = list("human" = list(
		'sound/vore/walkslosh1.ogg',
		'sound/vore/walkslosh2.ogg',
		'sound/vore/walkslosh3.ogg',
		'sound/vore/walkslosh4.ogg',
		'sound/vore/walkslosh5.ogg',
		'sound/vore/walkslosh6.ogg',
		'sound/vore/walkslosh7.ogg',
		'sound/vore/walkslosh8.ogg',
		'sound/vore/walkslosh9.ogg',
		'sound/vore/walkslosh10.ogg'))

/turf/simulated/floor/boxing
	name = "boxing mat"
	icon = 'icons/turf/gym_ch.dmi'
	icon_state = "boxing"

/turf/simulated/floor/boxing/gym
	name = "gym mat"
	icon_state = "gym_mat"

/turf/simulated/mineral/floor/cave
	name = "basalt"
	desc = "Loose, rocky basalt. It crumbles to sand under the slightest bit of force."
	icon = 'icons/turf/thor_ch.dmi'
	icon_state = "basalt0"

/turf/simulated/mineral/thor/mines
	name = "dark rock"
	desc = "Dark black basalt. Rich in exotic minerals."
	icon = 'icons/turf/thor_ch.dmi'
	icon_state = "deeprock"

/turf/unsimulated/mineral/thor/mines
	name = "impassable dark rock"
	desc = "Dark black basalt. Packed impossibly tightly, no way to get past this."
	icon = 'icons/turf/thor_ch.dmi'
	icon_state = "deeprock-solid"