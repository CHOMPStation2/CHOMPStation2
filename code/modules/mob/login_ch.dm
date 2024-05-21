/mob/Login()
	. = ..()
	set_listening(LISTENING_PLAYER)
	if(GLOB.global_vantag_hud)
		vantag_hud = TRUE
		recalculate_vis()
