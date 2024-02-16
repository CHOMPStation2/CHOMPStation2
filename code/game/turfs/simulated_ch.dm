/turf/simulated

	//CHOMP reagent belly sloshing sounds
	var/static/list/base_vorefootstep_sounds = list("human" = list(
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

// Removal of older code - this isn't necessary anymore as /decl/flooring/floortype and initial_flooring = /decl/flooring/floortype
// can handle this. If you're not sure how to do it, refer to flooring.dm, and read things over. It's explained there. Rykka <3