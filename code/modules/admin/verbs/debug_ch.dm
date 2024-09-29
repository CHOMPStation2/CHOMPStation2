/datum/admins/proc/quick_authentic_nif()
	set category = "Fun.Add Nif"
	set name = "Quick Auth NIF"
	set desc = "Spawns an authentic NIF into someone in quick-implant mode."

	if(!check_rights(R_ADMIN|R_EVENT|R_DEBUG))	//CHOMPStation Edit TFF 24/4/19: Allow Devs to use Quick-NIF verb.
		return

	var/mob/living/carbon/human/H = input("Pick a mob with a player","Quick Authentic NIF") as null|anything in player_list

	if(!H)
		return

	if(!istype(H))
		to_chat(usr,"<span class='warning'>That mob type ([H.type]) doesn't support NIFs, sorry.</span>")
		return

	if(!H.get_organ(BP_HEAD))
		to_chat(usr,"<span class='warning'>Target is unsuitable.</span>")
		return

	if(H.nif)
		to_chat(usr,"<span class='warning'>Target already has a NIF.</span>")
		return

	if(H.species.flags & NO_SCAN)
		new /obj/item/nif/authenticbio(H)
	else
		new /obj/item/nif/authentic(H)

	log_and_message_admins("[key_name(src)] Quick Authentic NIF'd [H.real_name].")
	feedback_add_details("admin_verb","QANIF") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
