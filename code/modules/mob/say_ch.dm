/atom/proc/get_ultimate_mob() //seems like the wrong place for it, but other stuff uses this
	var/mob/ultimate_mob
	var/atom/to_check = loc
	var/n = 0
	while (to_check && !isturf(to_check) && n++ < 16)
		if (ismob(to_check))
			ultimate_mob = to_check
			to_check = to_check.loc
	return ultimate_mob

/mob/verb/say_verb_ch()
	set name = "Say CH"
	set category = "IC.Chat"

	client?.start_thinking()
	client?.start_typing()
	var/message = tgui_input_text(usr, "Speak to people in sight.\nType your message:", "Say")
	client?.stop_thinking()

	if(message)
		say_verb(message)

/mob/verb/me_verb_ch()
	set name = "Me CH"
	set category = "IC.Chat"
	set desc = "Emote to nearby people (and your pred/prey)"

	client?.start_thinking()
	client?.start_typing()
	var/message = tgui_input_text(usr, "Emote to people in sight (and your pred/prey).\nType your message:", "Emote", multiline = TRUE)
	client?.stop_thinking()

	if(message)
		me_verb(message)

/mob/verb/whisper_ch()
	set name = "Whisper CH"
	set category = "IC.Subtle"

	var/message = tgui_input_text(usr, "Speak to nearby people.\nType your message:", "Whisper")

	if(message)
		whisper(message)


/mob/verb/me_verb_subtle_ch()
	set name = "Subtle CH"
	set category = "IC.Subtle"
	set desc = "Emote to nearby people (and your pred/prey)"

	var/message = tgui_input_text(usr, "Emote to nearby people (and your pred/prey).\nType your message:", "Subtle", multiline = TRUE)

	if(message)
		me_verb_subtle(message)

/mob/verb/me_verb_subtle_custom_ch()
	set name = "Subtle (Custom) CH"
	set category = "IC.Subtle"
	set desc = "Emote to nearby people, with ability to choose which specific portion of people you wish to target."

	var/message = tgui_input_text(usr, "Emote to nearby people, with ability to choose which specific portion of people you wish to target.\nType your message:", "Subtle (Custom)", multiline = TRUE)

	if(message)
		me_verb_subtle_custom(message)

/mob/verb/psay_ch()
	set name = "Psay CH"
	set category = "IC.Subtle"

	var/message = tgui_input_text(usr, "Talk to people affected by complete absorbed or dominate predator/prey.\nType your message:", "Psay")

	if(message)
		psay(message)

/mob/verb/pme_ch()
	set name = "Pme CH"
	set category = "IC.Subtle"

	var/message = tgui_input_text(usr, "Emote to people affected by complete absorbed or dominate predator/prey.\nType your message:", "Pme")

	if(message)
		pme(message)

/mob/living/verb/player_narrate_ch()
	set name = "Narrate (Player) CH"
	set category = "IC.Chat"

	var/message = tgui_input_text(usr, "Narrate an action or event! An alternative to emoting, for when your emote shouldn't start with your name!\nType your message:", "Narrate (Player)")

	if(message)
		player_narrate(message)
