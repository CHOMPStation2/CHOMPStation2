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

//CHOMPstation floor sound-effects. You need to modify New() because flooring initilization sets footstep_sounds = base_footstep_sounds.
//The out-of-order numbering on the .ogg files is intentional so I don't mix up the source files. -Nadyr
/turf/simulated/floor/outdoors/dirt/New()
	..()
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

/turf/simulated/floor/outdoors/grass/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/grassy-footstep-1.ogg',
		'sound/effects/footstep/grassy-footstep-2.ogg',
		'sound/effects/footstep/grassy-footstep-3.ogg'))

/turf/simulated/floor/outdoors/grass/sif/forest/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/grass1.ogg',
		'sound/effects/footstep/grass2.ogg',
		'sound/effects/footstep/grass3.ogg',
		'sound/effects/footstep/grass4.ogg'))


/turf/simulated/floor/water/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/water1.ogg',
		'sound/effects/footstep/water2.ogg',
		'sound/effects/footstep/water3.ogg',
		'sound/effects/footstep/water4.ogg'))

/turf/simulated/floor/water/deep/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/bubbles3.ogg',
		'sound/effects/footstep/bubbles4.ogg',
		'sound/effects/footstep/bubbles5.ogg'))


/turf/simulated/floor/outdoors/rocks/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/LightStone1.ogg',
		'sound/effects/footstep/LightStone2.ogg',
		'sound/effects/footstep/LightStone3.ogg',
		'sound/effects/footstep/LightStone4.ogg'))

/turf/simulated/floor/outdoors/mud/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/mud1.ogg',
		'sound/effects/footstep/mud2.ogg',
		'sound/effects/footstep/mud3.ogg',
		'sound/effects/footstep/mud4.ogg'))

/turf/simulated/mineral/floor/New()
	..()
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/HeavySand1.ogg',
		'sound/effects/footstep/HeavySand2.ogg',
		'sound/effects/footstep/HeavySand3.ogg',
		'sound/effects/footstep/HeavySand4.ogg',
		'sound/effects/footstep/LightDirt2.ogg',
		'sound/effects/footstep/LightDirt4.ogg'))

//Flooring (code-wise, the part of the floor that goes on top of plating) sound-effects

/decl/flooring/grass
	footstep_sounds = list("human" = list(
		'sound/effects/footstep/grassy-footstep-1.ogg',
		'sound/effects/footstep/grassy-footstep-2.ogg',
		'sound/effects/footstep/grassy-footstep-3.ogg'))