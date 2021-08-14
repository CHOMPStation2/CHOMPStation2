/* CHOMPStation-specific flooring for usage with custom stations, away missions, etc.
 *
 * Contains:
 *		Flooring Declaration for slosh
 *		Boxing Flooring
 *		Jungle Flooring
 *		TBD
 *
 */

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
	
///////////NSB Forbearance///////////
///////////Jungle Flooring///////////

/decl/flooring/grass/jungle
	name = "grass"
	desc = "A thick and heavy grass that's adapted to the humid and unforgiving climate."
	icon = 'icons/turf/flooring/torrisfloor.dmi'
	icon_base = "torris_grass"
	has_base_range = 1
	damage_temperature = T0C+80
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_REMOVE_SHOVEL
	build_type = /obj/item/stack/tile/grass/jungle
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/grass1.ogg',
		'sound/effects/footstep/grass2.ogg',
		'sound/effects/footstep/grass3.ogg',
		'sound/effects/footstep/grass4.ogg'))

/decl/flooring/dirt/jungle
	name = "dirt"
	desc = "Moist, but more than capable of supporting weight. Some minor squish may ensue."
	icon = 'icons/turf/flooring/torrisfloor.dmi'
	icon_base = "torris_dirt"
	flags = TURF_HAS_EDGES

/decl/flooring/dirt/volcanic
	name = "volcanic dirt"
	desc = "Dirt that's been cooked by the hostile atmosphere of a volcano. Crunchy."
	icon = 'icons/turf/flooring/torrisfloor.dmi'
	icon_base = "torris_volcanic_dirt"
	flags = TURF_HAS_EDGES