/area/awaymission/baseblep
	icon_state = "green"
	base_turf = /turf/simulated/floor/outdoors/dirt
	ambience = AMBIENCE_OTHERWORLDLY

/area/awaymission/baseblep/base
	name = "Base Blep"
	icon_state = "green"

/area/awaymission/baseblep/cavern
	icon_state = "blue"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/music/LRRMenu.ogg', 'sound/music/LRRTrack3.ogg', \
	'sound/ambience/cave/AmbCaveDebriA.ogg', 'sound/ambience/cave/AmbCaveDebriB.ogg', 'sound/ambience/cave/AmbCaveDebriC.ogg', \
	'sound/ambience/cave/AmbCaveDebriD.ogg')
	outdoors = 1
	name = "Squish Caverns"

/area/awaymission/baseblep/caynon
	name = "Squish Caynon"
	icon_state = "red"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/music/LRRMenu.ogg', 'sound/music/LRRTrack3.ogg', \
	'sound/ambience/cave/AmbCaveDebriA.ogg', 'sound/ambience/cave/AmbCaveDebriB.ogg', 'sound/ambience/cave/AmbCaveDebriC.ogg', \
	'sound/ambience/cave/AmbCaveDebriD.ogg')
	dynamic_lighting = 1
	outdoors = 1

/area/awaymission/baseblep/hivebotsphere
	name = "Checkpoint"
	requires_power = 0

/area/awaymission/baseblep/finale
	name = "Gateway"
	requires_power = 0

//Because dumb Vr errors
/area/vr
