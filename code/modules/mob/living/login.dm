/mob/living/Login()
	..()
	//Mind updates
	mind_initialize()	//updates the mind (or creates and initializes one if one doesn't exist)
	mind.active = 1		//indicates that the mind is currently synced with a client
	//If they're SSD, remove it so they can wake back up.
	update_antag_icons(mind)
	client.screen |= global_hud.darksight
	client.images |= dsoverlay

	if(ai_holder && !ai_holder.autopilot)
		ai_holder.go_sleep()
		to_chat(src,span_notice("Mob AI disabled while you are controlling the mob."))

	AddComponent(/datum/component/character_setup)

	// Vore stuff
	add_verb(src,/mob/living/proc/escapeOOC) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/lick) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/smell) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/switch_scaling) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/center_offset) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/mute_entry) //CHOMPEdit TGPanel //CHOMPEdit
	add_verb(src,/mob/living/proc/liquidbelly_visuals) //CHOMPEdit TGPanel //CHOMPEdit
	add_verb(src,/mob/living/proc/fix_vore_effects) //CHOMPEdit TGPanel //CHOMPedit

	if(!no_vore)
		add_verb(src,/mob/living/verb/vorebelly_printout) //CHOMPEdit TGPanel
		if(!vorePanel)
			AddComponent(/datum/component/vore_panel)

	add_verb(src,/mob/living/proc/vore_transfer_reagents) //CHOMPEdit TGPanel //CHOMP If mob doesnt have bellies it cant use this verb for anything
	add_verb(src,/mob/living/proc/vore_check_reagents) //CHOMPEdit TGPanel //CHOMP If mob doesnt have bellies it cant use this verb for anything
	add_verb(src,/mob/living/proc/vore_bellyrub) //CHOMPEdit TGPanel //CHOMP If mob doesnt have bellies it probably won't be needing this anyway
	add_verb(src,/mob/proc/nsay_vore) //CHOMPAdd
	add_verb(src,/mob/proc/nme_vore) //CHOMPAdd
	add_verb(src,/mob/proc/nsay_vore_ch) //CHOMPAdd
	add_verb(src,/mob/proc/nme_vore_ch) //CHOMPAdd
	add_verb(src,/mob/proc/enter_soulcatcher) //CHOMPAdd

	//VOREStation Add Start
	if(!voice_sounds_list.len || !voice_sounds_list)
		if(client.prefs.voice_sound)
			var/prefsound = client.prefs.voice_sound
			voice_sounds_list = get_talk_sound(prefsound) //CHOMEPEDIT GLobal voice getter
			/* CHOMPRemval, redundant voice selector
			switch(prefsound)
				if("beep-boop")
					voice_sounds_list = talk_sound
				if("goon speak 1")
					voice_sounds_list = goon_speak_one_sound
				if("goon speak 2")
					voice_sounds_list = goon_speak_two_sound
				if("goon speak 3")
					voice_sounds_list = goon_speak_three_sound
				if("goon speak 4")
					voice_sounds_list = goon_speak_four_sound
				if("goon speak blub")
					voice_sounds_list = goon_speak_blub_sound
				if("goon speak bottalk")
					voice_sounds_list = goon_speak_bottalk_sound
				if("goon speak buwoo")
					voice_sounds_list = goon_speak_buwoo_sound
				if("goon speak cow")
					voice_sounds_list = goon_speak_cow_sound
				if("goon speak lizard")
					voice_sounds_list = goon_speak_lizard_sound
				if("goon speak pug")
					voice_sounds_list = goon_speak_pug_sound
				if("goon speak pugg")
					voice_sounds_list = goon_speak_pugg_sound
				if("goon speak roach")
					voice_sounds_list = goon_speak_roach_sound
				if("goon speak skelly")
					voice_sounds_list = goon_speak_skelly_sound
		*/ //CHOMPRemval, redundant voice selector
		else
			voice_sounds_list = talk_sound
	//VOREStation Add End
	return .
