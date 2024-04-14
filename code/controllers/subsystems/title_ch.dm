SUBSYSTEM_DEF(title)
	name = "Title Screen"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_TITLE
//	init_stage = INITSTAGE_EARLY

	var/file_path
	var/icon/icon
	var/icon_state
	var/icon/previous_icon
	var/turf/closed/indestructible/splashscreen/splash_turf

/datum/controller/subsystem/title/Initialize()
	if(file_path && icon)
		return SS_INIT_SUCCESS
	/*
	if(fexists("data/previous_title.dat"))
		var/previous_path = file2text("data/previous_title.dat")
		if(istext(previous_path))
			previous_icon = new(previous_icon)
	fdel("data/previous_title.dat")

	var/list/provisional_title_screens = flist("[global.config.directory]/title_screens/images/")
	var/list/title_screens = list()
	var/use_rare_screens = prob(1)

	for(var/S in provisional_title_screens)
		var/list/L = splittext(S,"+")
		if((L.len == 1 && (L[1] != "exclude" && L[1] != "blank.png")) || (L.len > 1 && ((use_rare_screens && LOWER_TEXT(L[1]) == "rare") || (LOWER_TEXT(L[1]) == LOWER_TEXT(SSmapping.config.map_name)))))
			title_screens += S

	if(length(title_screens))
		file_path = "[global.config.directory]/title_screens/images/[pick(title_screens)]"

	if(!file_path)
		file_path = "icons/runtime/default_title.dmi"

	ASSERT(fexists(file_path))

	icon = new(fcopy_rsc(file_path))
	*/
	icon = new(using_map.lobby_icon)
	var/known_icon_states = cached_icon_states(icon)
	for(var/lobby_screen in using_map.lobby_screens)
		if(!(lobby_screen in known_icon_states))
			error("Lobby screen '[lobby_screen]' did not exist in the icon set [icon].")
			using_map.lobby_screens -= lobby_screen

	if(using_map.lobby_screens.len)
		icon_state = pick(using_map.lobby_screens)
	else
		icon_state = known_icon_states[1]

	if(splash_turf)
		splash_turf.icon = icon
		splash_turf.icon_state = icon_state
		splash_turf.handle_generic_titlescreen_sizes()

	return SS_INIT_SUCCESS

/datum/controller/subsystem/title/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if(NAMEOF(src, icon))
				if(splash_turf)
					splash_turf.icon = icon

/datum/controller/subsystem/title/Shutdown()
	/*if(file_path)
		var/F = file("data/previous_title.dat")
		WRITE_FILE(F, file_path)*/

	/*for(var/thing in GLOB.clients)
		if(!thing)
			continue
		var/atom/movable/screen/splash/S = new(thing, FALSE)
		S.Fade(FALSE,FALSE)*/

/datum/controller/subsystem/title/Recover()
	icon = SStitle.icon
	splash_turf = SStitle.splash_turf
	file_path = SStitle.file_path
	previous_icon = SStitle.previous_icon


//Following is related to jank required to get stuff to render for new players

GLOBAL_LIST_EMPTY(newplayer_start)

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize(mapload)
	..()
	GLOB.newplayer_start += loc
	return INITIALIZE_HINT_QDEL
