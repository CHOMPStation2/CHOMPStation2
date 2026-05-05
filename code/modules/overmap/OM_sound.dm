/obj/effect/overmap/visitable/sector/Crossed(obj/effect/overmap/visitable/ship/enterer)
<<<<<<< HEAD
	. = ..()
	if(istype(enterer))
		for(var/mob/potential_mob as anything in GLOB.player_list)
			if(potential_mob.z in enterer.map_z)
				SEND_SOUND(potential_mob, 'sound/ambience/approaching_planet.ogg')

/obj/effect/overmap/visitable/planet/Crossed(obj/effect/overmap/visitable/ship/enterer) //CHOMPedit, lazy copy-paste
=======
>>>>>>> 5926589c16 (removes var/ inside all procs (#19450))
	. = ..()
	if(istype(enterer))
		for(var/mob/potential_mob as anything in GLOB.player_list)
			if(potential_mob.z in enterer.map_z)
				SEND_SOUND(potential_mob, 'sound/ambience/approaching_planet.ogg')
