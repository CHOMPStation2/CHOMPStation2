//////////////////////////////////////////////////////
////////////////////SUBTLE COMMAND////////////////////
//////////////////////////////////////////////////////

/mob/verb/me_verb_subtle(message as message) //This would normally go in say.dm
	set name = "Subtle"
	set category = "IC"
	set desc = "Emote to nearby people (and your pred/prey)"

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
		usr.emote_vr("me",4,message)
	else
		usr.emote_vr(message)

/mob/proc/custom_emote_vr(var/m_type=1,var/message = null, var/distanced=FALSE) //This would normally go in emote.dm //CHOMPEdit: subtle-distance
	if(stat || !use_me && usr == src)
		to_chat(src, "You are unable to emote.")
		return

	//VOREStation Addition Start
	if(forced_psay)
		pme(message)
		return
	//VOREStation Addition End

	var/muzzled = is_muzzled()
	if(m_type == 2 && muzzled) return

<<<<<<< HEAD
=======
	var/subtle_mode
	if(autowhisper && autowhisper_mode && !mode_selection)
		if(autowhisper_mode != "Psay/Pme")	//This isn't actually a custom subtle mode, so we shouldn't use it!
			subtle_mode = autowhisper_mode
	if(mode_selection && !subtle_mode)
		subtle_mode = tgui_input_list(src, "Select Custom Subtle Mode", "Custom Subtle Mode", list("Adjacent Turfs (Default)", "My Turf", "My Table", "Current Belly (Prey)", "Specific Belly (Pred)", "Specific Person"))
	if(!subtle_mode)
		if(mode_selection)
			if(message)
				to_chat(src, "<span class='warning'>Subtle mode not selected. Your input has not been sent, but preserved:</span> [message]")
			return
		else
			subtle_mode = "Adjacent Turfs (Default)"

>>>>>>> 662c7e356e... Merge pull request #15152 from Very-Soft/range
	var/input
	if(!message)
		input = sanitize_or_reflect(tgui_input_text(src,"Choose an emote to display."), src)
	else
		input = message

	if(input)
		log_subtle(message,src)
		message = "<span class='emote_subtle'><B>[src]</B> <I>[input]</I></span>"
	else
		return

	if (message)
		var/undisplayed_message = "<span class='emote'><B>[src]</B> <I>does something too subtle for you to see.</I></span>"
		message = encode_html_emphasis(message)

		var/list/vis = get_mobs_and_objs_in_view_fast(get_turf(src),1,2) //Turf, Range, and type 2 is emote
		var/list/vis_mobs = vis["mobs"]
		var/list/vis_objs = vis["objs"]

		//CHOMPEdit: subtle target selection
		var/all_targets_mobs = list()
		var/all_targets_objs = list()
		if (distanced)
			var/mob/u_mob = get_ultimate_mob() || src
			var/possessed = list()
			var/valid_targets = list("One tile radius" = "otr", "Single tile" = "st", "All in belly and preds" = "aibap")
			for (var/obj/item/i in vis_objs)
				if (LAZYLEN(i.possessed_voice))
					var/x = i.get_ultimate_mob()
					if ((!x && (isturf(loc) || i.loc == loc)) || x == u_mob)
						var/is_active = FALSE
						for (var/mob/M in i.possessed_voice)
							if (M.client)
								is_active = TRUE
								break
						if (is_active)
							valid_targets["Only [i]"] = "\ref[i]"
							possessed += i.possessed_voice
			for (var/mob/M as anything in vis_mobs)
				if (!M.client || M == src)
					continue
				if (isobserver(M))
					if (isbelly(M.loc) && (M.loc in contents))
						valid_targets["Only [M]"] = "\ref[M]"
					continue
				if (isturf(M.loc) || M.loc == loc)
					valid_targets["Only [M]"] = "\ref[M]"
					continue
				if (get_turf(M) == get_turf(src)) //so we aren't going through everything
					if (length(possessed))
						if (M in possessed)
							continue
					if (M == u_mob || M.is_inside_atom_recursive(u_mob))
						valid_targets["Only [M]"] = "\ref[M]"
						continue
			valid_targets += list("Cancel" = "c")
			valid_targets += list("Cancel and print to chat" = "captc")
			var/selected = input(src, "Choose the target to send it to.", "Subtle Distance", "One tile radius") as anything in valid_targets //default to one tile radius
			var/target = valid_targets[selected]
			if (target == "c" || isnull(target))
				return
			if (target == "captc")
				to_chat(src, "<span class='notice'>Cancelled message (pressed cancel): [message]</span>")
				return

			vis = get_mobs_and_objs_in_view_fast(get_turf(src),1,2) //in case it changed
			vis_mobs = vis["mobs"]
			vis_objs = vis["objs"]

			var/cancelled

			switch(target)
				if ("otr", null)
					all_targets_mobs |= vis_mobs
					all_targets_objs |= vis_objs
				if ("st")
					for (var/mob/M as anything in vis_mobs)
						if (isobserver(M) || get_dist(get_turf(src), get_turf(M)) < 1)
							all_targets_mobs |= M
					for (var/obj/M as anything in vis_objs)
						if (get_dist(get_turf(src), get_turf(M)) < 1)
							all_targets_objs |= M
				if ("aibap")
					var/obj/belly/belly = get_ultimate_belly()
					var/mob/pred = belly?.owner || src
					if (pred)
						all_targets_mobs |= pred.get_all_in_bellies()
						for (var/mob/M as anything in vis_mobs)
							if (isobserver(M))
								all_targets_mobs |= M
								continue
							if (get_dist(get_turf(src), get_turf(M)) > 1)
								continue
							if (!isturf(M.loc) && !(M in all_targets_mobs)) //possessed items, mobs in bags, etc
								if (M.get_ultimate_belly() in pred.contents)
									all_targets_mobs |= M
							if (istype(M, /mob/living/dominated_brain) && M.get_ultimate_mob() == pred)
								all_targets_mobs |= M
						for (var/obj/item/i in vis_objs)
							if (LAZYLEN(i.possessed_voice) && (i.get_ultimate_belly() in pred.contents))
								all_targets_objs |= i
								all_targets_mobs |= i.possessed_voice
						all_targets_mobs |= pred
					else
						cancelled = "no belly owner"
				else
					var/target_reffed = locate(target)
					if (!target_reffed || (ismob(target_reffed) && !(target_reffed in vis_mobs)) || (isitem(target_reffed) && !(target_reffed in vis_objs)))
						cancelled = "mob not available"
					else
						if (ismob(target_reffed))
							all_targets_mobs |= target_reffed
						if (isitem(target_reffed))
							var/obj/item/i = target_reffed
							all_targets_objs |= target_reffed
							all_targets_mobs |= i.possessed_voice
						for (var/mob/M as anything in vis_mobs)
							if (isobserver(M))
								all_targets_mobs |= M

			all_targets_mobs |= src

			if (cancelled)
				to_chat(src, "<span class='notice'>Cancelled message ([cancelled]): [message]</span>")
				return
		else
			all_targets_mobs = vis_mobs
			all_targets_objs = vis_objs

		for(var/mob/M as anything in all_targets_mobs) //CHOMPEdit end
			if(isnewplayer(M))
				continue
			if(isobserver(M) && !(is_preference_enabled(/datum/client_preference/whisubtle_vis) || (isbelly(M.loc) && src == M.loc:owner)) && !M.client?.holder) //CHOMPEdit - Added the belly check so that ghosts in bellies can still see their pred's messages.
				spawn(0)
					M.show_message(undisplayed_message, 2)
			else
				spawn(0)
					M.show_message(message, 2)
					if(M.Adjacent(src) && M.is_preference_enabled(/datum/client_preference/say_sounds)) //CHOMPEdit - makes it so the sounds only play for ghosts when adjacent to the person making them
						if(voice_sounds_list)	//CHOMPEdit, changes to subtle emotes to use mob voice instead
							M << sound(pick(voice_sounds_list), volume = 25)

		for(var/obj/O as anything in all_targets_objs) //CHOMPEdit, allows for subtle distances
			spawn(0)
				O.see_emote(src, message, 2)

/mob/proc/emote_vr(var/act, var/type, var/message) //This would normally go in say.dm
	if(act == "me")
		return custom_emote_vr(type, message)

#define MAX_HUGE_MESSAGE_LEN 8192
#define POST_DELIMITER_STR "\<\>"
/proc/sanitize_or_reflect(message,user)
	//Way too long to send
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return

	message = sanitize(message, max_length = MAX_HUGE_MESSAGE_LEN)

	//Came back still too long to send
	if(length(message) > MAX_MESSAGE_LEN)
		fail_to_chat(user,message)
		return null
	else
		return message

// returns true if it failed
/proc/reflect_if_needed(message, user)
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return TRUE
	return FALSE

/proc/fail_to_chat(user,message)
	if(!message)
		to_chat(user, "<span class='danger'>Your message was NOT SENT, either because it was FAR too long, or sanitized to nothing at all.</span>")
		return

	var/length = length(message)
	var/posts = CEILING((length/MAX_MESSAGE_LEN), 1)
	to_chat(user,message)
	to_chat(user, "<span class='danger'>^ This message was NOT SENT ^ -- It was [length] characters, and the limit is [MAX_MESSAGE_LEN]. It would fit in [posts] separate messages.</span>")
#undef MAX_HUGE_MESSAGE_LEN

///// PSAY /////

/mob/verb/psay(message as text)
	set category = "IC"
	set name = "Psay"
	set desc = "Talk to people affected by complete absorbed or dominate predator/prey."

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return
	if (!message)
		message = tgui_input_text(usr, "Type a message to say.","Psay")
	message = sanitize_or_reflect(message,src)
	if (!message)
		return
	message = capitalize(message)
	if (stat == DEAD)
		return say_dead(message)
	if(!isliving(src))
		forced_psay = FALSE
		say(message)
	var/f = FALSE		//did we find someone to send the message to other than ourself?
	var/mob/living/pb	//predator body
	var/mob/living/M = src
	if(istype(M, /mob/living/dominated_brain))
		var/mob/living/dominated_brain/db = M
		if(db.loc != db.pred_body)
			to_chat(db, "<span class='danger'>You aren't inside of a brain anymore!!!</span>")
			qdel(db)	//Oh no, dominated brains shouldn't exist outside of the body, so if we got here something went very wrong.
			return
		else
			pb = db.pred_body
			to_chat(pb, "<span class='changeling'>The captive mind of \the [M] thinks, \"[message]\"</span>")	//To our pred if dominated brain
			if(pb.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					pb << sound(pick(voice_sounds_list), volume = 25)
			f = TRUE
	else if(M.absorbed && isbelly(M.loc))
		pb = M.loc.loc
		to_chat(pb, "<span class='changeling'>\The [M] thinks, \"[message]\"</span>")	//To our pred if absorbed
		if(pb.is_preference_enabled(/datum/client_preference/say_sounds))
			if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
				pb << sound(pick(voice_sounds_list), volume = 25)
		f = TRUE

	if(pb)	//We are prey, let's do the prey thing.

		for(var/I in pb.contents)
			if(istype(I, /mob/living/dominated_brain) && I != M)
				var/mob/living/dominated_brain/db = I
				to_chat(db, "<span class='changeling'>The captive mind of \the [M] thinks, \"[message]\"</span>")	//To any dominated brains in the pred
				if(db.is_preference_enabled(/datum/client_preference/say_sounds))
					if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
						db << sound(pick(voice_sounds_list), volume = 25)
				f = TRUE
		for(var/B in pb.vore_organs)
			for(var/mob/living/L in B)
				if(L.absorbed && L != M && L.ckey)
					to_chat(L, "<span class='changeling'>\The [M] thinks, \"[message]\"</span>")	//To any absorbed people in the pred
					if(L.is_preference_enabled(/datum/client_preference/say_sounds))
						if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
							L << sound(pick(voice_sounds_list), volume = 25)
					f = TRUE

	//Let's also check and see if there's anyone inside of us to send the message to.
	for(var/I in M.contents)
		if(istype(I, /mob/living/dominated_brain))
			var/mob/living/dominated_brain/db = I
			to_chat(db, "<span class='changeling'><b>\The [M] thinks, \"[message]\"</b></span>")	//To any dominated brains inside us
			if(db.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					db << sound(pick(voice_sounds_list), volume = 25)
			f = TRUE
	for(var/B in M.vore_organs)
		for(var/mob/living/L in B)
			if(L.absorbed)
				to_chat(L, "<span class='changeling'><b>\The [M] thinks, \"[message]\"</b></span>")	//To any absorbed people inside us
				if(L.is_preference_enabled(/datum/client_preference/say_sounds))
					if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
						L << sound(pick(voice_sounds_list), volume = 25)
				f = TRUE

	if(f)	//We found someone to send the message to
		if(pb)
			to_chat(M, "<span class='changeling'>You think \"[message]\"</span>")	//To us if we are the prey
			if(M.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					M << sound(pick(voice_sounds_list), volume = 25)
		else
			to_chat(M, "<span class='changeling'><b>You think \"[message]\"</b></span>")	//To us if we are the pred
			if(M.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					M << sound(pick(voice_sounds_list), volume = 25)
		for (var/mob/G in player_list)
			if (istype(G, /mob/new_player))
				continue
			else if(isobserver(G) && G.is_preference_enabled(/datum/client_preference/ghost_ears))
				if(is_preference_enabled(/datum/client_preference/whisubtle_vis) || G.client.holder)
					to_chat(G, "<span class='changeling'>\The [M] thinks, \"[message]\"</span>")
		log_say(message,M)
	else		//There wasn't anyone to send the message to, pred or prey, so let's just say it instead and correct our psay just in case.
		M.forced_psay = FALSE
		M.say(message)

///// PME /////

/mob/verb/pme(message as message)
	set category = "IC"
	set name = "Pme"
	set desc = "Emote to people affected by complete absorbed or dominate predator/prey."

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return
	if (!message)
		message = tgui_input_text(usr, "Type a message to emote.","Pme")
	message = sanitize_or_reflect(message,src)
	if (!message)
		return
	if (stat == DEAD)
		return say_dead(message)
	if(!isliving(src))
		forced_psay = FALSE
		me_verb(message)
	var/f = FALSE		//did we find someone to send the message to other than ourself?
	var/mob/living/pb	//predator body
	var/mob/living/M = src
	if(istype(M, /mob/living/dominated_brain))
		var/mob/living/dominated_brain/db = M
		if(db.loc != db.pred_body)
			to_chat(db, "<span class='danger'>You aren't inside of a brain anymore!!!</span>")
			qdel(db)	//Oh no, dominated brains shouldn't exist outside of the body, so if we got here something went very wrong.
			return
		else
			pb = db.pred_body
			to_chat(pb, "<span class='changeling'>\The [M] [message]</span>")	//To our pred if dominated brain
			if(pb.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					pb << sound(pick(voice_sounds_list), volume = 25)
			f = TRUE

	else if(M.absorbed && isbelly(M.loc))
		pb = M.loc.loc
		to_chat(pb, "<span class='changeling'>\The [M] [message]</span>")	//To our pred if absorbed
		if(pb.is_preference_enabled(/datum/client_preference/say_sounds))
			if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
				pb << sound(pick(voice_sounds_list), volume = 25)
		f = TRUE

	if(pb)	//We are prey, let's do the prey thing.

		for(var/I in pb.contents)
			if(istype(I, /mob/living/dominated_brain) && I != M)
				var/mob/living/dominated_brain/db = I
				to_chat(db, "<span class='changeling'>\The [M] [message]</span>")	//To any dominated brains in the pred
				if(pb.is_preference_enabled(/datum/client_preference/say_sounds))
					if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
						pb << sound(pick(voice_sounds_list), volume = 25)
				f = TRUE
		for(var/B in pb.vore_organs)
			for(var/mob/living/L in B)
				if(L.absorbed && L != M && L.ckey)
					to_chat(L, "<span class='changeling'>\The [M] [message]</span>")	//To any absorbed people in the pred
					if(L.is_preference_enabled(/datum/client_preference/say_sounds))
						if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
							L << sound(pick(voice_sounds_list), volume = 25)
					f = TRUE

	//Let's also check and see if there's anyone inside of us to send the message to.
	for(var/I in M.contents)
		if(istype(I, /mob/living/dominated_brain))
			var/mob/living/dominated_brain/db = I
			to_chat(db, "<span class='changeling'><b>\The [M] [message]</b></span>")	//To any dominated brains inside us
			if(db.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					db << sound(pick(voice_sounds_list), volume = 25)
			f = TRUE
	for(var/B in M.vore_organs)
		for(var/mob/living/L in B)
			if(L.absorbed)
				to_chat(L, "<span class='changeling'><b>\The [M] [message]</b></span>")	//To any absorbed people inside us
				if(L.is_preference_enabled(/datum/client_preference/say_sounds))
					if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
						L << sound(pick(voice_sounds_list), volume = 25)
				f = TRUE

	if(f)	//We found someone to send the message to
		if(pb)
			to_chat(M, "<span class='changeling'>\The [M] [message]</span>")	//To us if we are the prey
			if(M.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					M << sound(pick(voice_sounds_list), volume = 25)
		else
			to_chat(M, "<span class='changeling'><b>\The [M] [message]</b></span>")	//To us if we are the pred
			if(M.is_preference_enabled(/datum/client_preference/say_sounds))
				if(voice_sounds_list)	//CHOMPEdit, changes subtle emote sound to use mob voice instead
					M << sound(pick(voice_sounds_list), volume = 25)
		for (var/mob/G in player_list)
			if (istype(G, /mob/new_player))
				continue
			else if(isobserver(G) && G.is_preference_enabled(/datum/client_preference/ghost_ears))
				if(is_preference_enabled(/datum/client_preference/whisubtle_vis) || G.client.holder)
					to_chat(G, "<span class='changeling'>\The [M] [message]</span>")
		log_say(message,M)
	else	//There wasn't anyone to send the message to, pred or prey, so let's just emote it instead and correct our psay just in case.
		M.forced_psay = FALSE
		M.me_verb(message)

/mob/living/verb/player_narrate(message as message)
	set category = "IC"
	set name = "Narrate (Player)"
	set desc = "Narrate an action or event! An alternative to emoting, for when your emote shouldn't start with your name!"

	if(src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return
	if(!message)
		message = tgui_input_text(usr, "Type a message to narrate.","Narrate")
	message = sanitize_or_reflect(message,src)
	if(!message)
		return
	if(stat == DEAD)
		return say_dead(message)
	if(stat)
		to_chat(src, "<span class= 'warning'>You need to be concious to narrate: [message]</span>")
		return
	message = "<span class='name'>([name])</span> <span class='pnarrate'>[message]</span>"

	//Below here stolen from emotes
	var/turf/T = get_turf(src)

	if(!T) return

	var/ourfreq = null
	if(voice_freq > 0 )
		ourfreq = voice_freq

	if(client)
		playsound(T, pick(emote_sound), 25, TRUE, falloff = 1 , is_global = TRUE, frequency = ourfreq, ignore_walls = FALSE, preference = /datum/client_preference/emote_sounds)

	var/list/in_range = get_mobs_and_objs_in_view_fast(T,world.view,2,remote_ghosts = client ? TRUE : FALSE)
	var/list/m_viewers = in_range["mobs"]

	for(var/mob/M as anything in m_viewers)
		if(M)
			if(isnewplayer(M))
				continue
			if(M.stat == UNCONSCIOUS || M.sleeping > 0)
				continue
			to_chat(M, "<span class='filter_say'>[isobserver(M) ? "[message] ([ghost_follow_link(src, M)])" : message]</span>")
	log_emote(message, src)

/mob/verb/select_speech_bubble()
	set name = "Select Speech Bubble"
	set category = "OOC"

	var/new_speech_bubble = tgui_input_list(src, "Pick new voice (default for automatic selection)", "Character Preference", selectable_speech_bubbles)
	if(new_speech_bubble)
		custom_speech_bubble = new_speech_bubble
