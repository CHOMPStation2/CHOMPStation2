/mob/living/carbon/human/proc/telepathy(mob/M as mob in oview())
	set name = "Project mind"
	set desc = "Talk telepathically to someone over a distance."
	set category = "Abilities"

	var/msg = sanitize(input("Message:", "Project mind") as text|null)
	if(msg)
		log_say("(GreyTP to [key_name(M)]) [msg]", src)
		M << "<font color='purple'>you hear a voice echo across the room in your head... <i>[msg]</i></font>"
		to_chat(src, "<font color='purple'>You said: \"[msg]\" to [M]</font>")
	return