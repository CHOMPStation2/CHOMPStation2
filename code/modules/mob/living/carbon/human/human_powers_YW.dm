/mob/living/carbon/human/proc/telepathy(mob/M as mob in oview())
	set name = "Project mind"
	set desc = "Talk telepathically to someone over a distance."
	set category = "Abilities.General" //CHOMPEdit

	var/msg = sanitize(tgui_input_text(src, "Message:", "Project mind"))
	if(msg)
		var/mob/living/carbon/human/H = M
		log_say("(GreyTP to [key_name(M)]) [msg]", src)
		if(ishuman(M))
			if(H.species.name == src.species.name)
				to_chat(M, span_purple("you hear [src.name]'s voice: <i>[msg]</i>"))
				to_chat(src, span_purple("you said: \"[msg]\" to [M]"))
			else
				to_chat(M, span_purple("you hear a voice echo in your head... <i>[msg]</i>"))
				to_chat(src, span_purple("you said: \"[msg]\" to [M]"))
		else
			to_chat(M, span_purple("you hear a voice echo in your head... <i>[msg]</i>"))
			to_chat(src, span_purple("you said: \"[msg]\" to [M]"))

	return
