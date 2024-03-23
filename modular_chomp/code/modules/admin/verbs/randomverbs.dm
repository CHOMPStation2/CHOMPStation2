var/global_vantag_hud = 0

/client/proc/toggle_vantag_hud_global(var/mob/target as mob)
	set category = "Fun"
	set name = "Toggle Global Event HUD"
	set desc = "Give everyone the Event HUD."

	global_vantag_hud = !global_vantag_hud
	if(global_vantag_hud)
		for(var/mob/living/L in living_mob_list)
			if(L.ckey)
				L.vantag_hud = TRUE
				L.recalculate_vis()