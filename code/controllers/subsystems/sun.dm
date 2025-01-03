SUBSYSTEM_DEF(sun)
	name = "Sun"
	wait = 600
<<<<<<< HEAD
	flags = SS_NO_INIT // CHOMPEdit
=======
	flags = SS_NO_INIT
>>>>>>> f48022188f (Subsystem return update (#16820))
	var/static/datum/sun/sun = new

/datum/controller/subsystem/sun/fire()
	sun.calc_position()
