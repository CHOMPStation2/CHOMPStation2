/mob/living/carbon/human/proc/telepathy(mob/M as mob in oview())
	set name = "Project mind"
	set desc = "Talk telepathically to someone over a distance."
	set category = "Abilities"

	var/msg = sanitize(input("Message:", "Project mind") as text|null)
	if(msg)
		var/mob/living/carbon/human/H = M
		log_say("(GreyTP to [key_name(M)]) [msg]", src)
		if(ishuman(M))
			if(H.species.name == src.species.name)
				to_chat(M, "<font color='purple'>you hear [src.name]'s voice: <i>[msg]</i></font>")
				to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")
			else
				to_chat(M, "<font color='purple'>you hear a voice echo in your head... <i>[msg]</i></font>")
				to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")
		else
			to_chat(M, "<font color='purple'>you hear a voice echo in your head... <i>[msg]</i></font>")
			to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")

	return