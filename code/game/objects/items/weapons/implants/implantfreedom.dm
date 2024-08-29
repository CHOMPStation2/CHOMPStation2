//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/item/implant/freedom // CHOMPEdit - Removal of obj/item/weapon
	name = "freedom implant"
	desc = "Use this to escape from those evil Red Shirts."
	implant_color = "r"
	var/activation_emote = "chuckle"
	var/uses = 1.0


/obj/item/implant/freedom/New() // CHOMPEdit - Removal of obj/item/weapon
	src.activation_emote = pick("blink", "blink_r", "eyebrow", "chuckle", "twitch", "frown", "nod", "blush", "giggle", "grin", "groan", "shrug", "smile", "pale", "sniff", "whimper", "wink")
	src.uses = rand(1, 5)
	..()
	return


/obj/item/implant/freedom/trigger(emote, mob/living/carbon/source as mob) // CHOMPEdit - Removal of obj/item/weapon
	if (src.uses < 1)
		return 0

	if (emote == src.activation_emote)
		src.uses--
		to_chat(source, "You feel a faint click.")
		if (source.handcuffed)
			var/obj/item/W = source.handcuffed // CHOMPEdit - Removal of obj/item/weapon
			source.handcuffed = null
			if(source.buckled && source.buckled.buckle_require_restraints)
				source.buckled.unbuckle_mob()
			source.update_handcuffed()
			if (source.client)
				source.client.screen -= W
			if (W)
				W.loc = source.loc
				dropped(source)
				if (W)
					W.layer = initial(W.layer)
		if (source.legcuffed)
			var/obj/item/W = source.legcuffed // CHOMPEdit - Removal of obj/item/weapon
			source.legcuffed = null
			source.update_inv_legcuffed()
			if (source.client)
				source.client.screen -= W
			if (W)
				W.loc = source.loc
				dropped(source)
				if (W)
					W.layer = initial(W.layer)
	return

/obj/item/implant/freedom/post_implant(mob/source) // CHOMPEdit - Removal of obj/item/weapon
	source.mind.store_memory("Freedom implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.", 0, 0)
	to_chat(source, "The implanted freedom implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.")

/obj/item/implant/freedom/get_data() // CHOMPEdit - Removal of obj/item/weapon
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b> Freedom Beacon<BR>
<b>Life:</b> optimum 5 uses<BR>
<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
<HR>
<b>Implant Details:</b> <BR>
<b>Function:</b> Transmits a specialized cluster of signals to override handcuff locking
mechanisms<BR>
<b>Special Features:</b><BR>
<i>Neuro-Scan</i>- Analyzes certain shadow signals in the nervous system<BR>
<b>Integrity:</b> The battery is extremely weak and commonly after injection its
life can drive down to only 1 use.<HR>
No Implant Specifics"}
	return dat
