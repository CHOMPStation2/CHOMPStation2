SUBSYSTEM_DEF(input)
	name = "Input"
	wait = 1 // SS_TICKER means this runs every tick
	init_order = INIT_ORDER_INPUT
<<<<<<< HEAD
	flags = SS_TICKER | SS_NO_INIT // CHOMPEdit
=======
	flags = SS_TICKER | SS_NO_INIT
>>>>>>> f48022188f (Subsystem return update (#16820))
	priority = FIRE_PRIORITY_INPUT
	runlevels = RUNLEVELS_DEFAULT | RUNLEVEL_LOBBY

/datum/controller/subsystem/input/fire()
	var/list/clients = GLOB.clients // Let's sing the list cache song
	for(var/i in 1 to clients.len)
		var/client/C = clients[i]
		C?.keyLoop()
