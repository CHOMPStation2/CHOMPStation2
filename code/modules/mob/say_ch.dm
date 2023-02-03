/mob/proc/get_all_in_bellies()
	var/list/mobs_in_belly = list()
	for (var/obj/belly/belly in contents) //dogborg sleeper, etc
		for (var/mob/M in belly.contents)
			mobs_in_belly |= M.get_all_in_bellies()
			mobs_in_belly |= M
	return mobs_in_belly

/atom/proc/get_ultimate_mob()
	var/mob/ultimate_mob
	var/atom/to_check = loc
	var/n = 0
	while (to_check && !isturf(to_check) && n < 6)
		if (ismob(to_check))
			ultimate_mob = to_check
			to_check = to_check.loc
			n = 0
		n++
	return ultimate_mob

/atom/proc/get_ultimate_belly()
	var/obj/belly/ultimate_belly
	var/atom/to_check = loc
	var/n = 0
	while (to_check && !isturf(to_check) && n < 6)
		if (isbelly(to_check))
			ultimate_belly = to_check
			to_check = to_check.loc
			n = 0
		n++
	return ultimate_belly

/mob/verb/me_verb_subtle_distanced(message as message) //This would normally go in say.dm
	set name = "Subtle-Targeted"
	set category = "IC"
	set desc = "Emote to nearby people (and your pred/prey), picking from selected targets afterwards."

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "Speech is currently admin-disabled.")
		return
	//VOREStation Addition Start
	if(forced_psay)
		pme(message)
		return
	//VOREStation Addition End

	message = sanitize_or_reflect(message,src) //VOREStation Edit - Reflect too-long messages (within reason)
	if(!message)
		return

	set_typing_indicator(FALSE)
	if(use_me)
		usr.custom_emote_vr(4,message,TRUE)
