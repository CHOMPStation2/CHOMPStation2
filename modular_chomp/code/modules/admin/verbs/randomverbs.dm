GLOBAL_VAR_INIT(global_vantag_hud, 0)

/client/proc/toggle_vantag_hud_global(mob/target as mob)
	set category = "Fun.Event Kit"
	set name = "Toggle Global Event HUD"
	set desc = "Give everyone the Event HUD."

	GLOB.global_vantag_hud = !GLOB.global_vantag_hud
	if(GLOB.global_vantag_hud)
		for(var/mob/living/L in living_mob_list)
			if(L.ckey)
				L.vantag_hud = TRUE
				L.recalculate_vis()

	to_chat(src, span_warning("Global Event HUD has been turned [GLOB.global_vantag_hud ? "on" : "off"]."))
