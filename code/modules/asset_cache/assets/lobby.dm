/datum/asset/simple/lobby_files
	keep_local_name = TRUE
	assets = list(
		"lobby_loading.gif" = 'html/lobby/loading.gif',
		"load.ogg" = 'sound/lobby/lobby_load.ogg',
	)

/datum/asset/simple/lobby_files/register()
	// not actually a gif
	assets["lobby_bg.gif"] = pick(using_map.lobby_screens)
	. = ..()

/datum/asset/simple/restart_animation
	assets = list(
		"loading" = 'html/lobby/loading.gif'
	)
