//copy pasta of the space piano, don't hurt me -Pete
/obj/item/device/instrument
	name = "generic instrument"
	var/datum/song/handheld/song
	var/instrumentId = "generic"
	var/instrumentExt = "mid"
	icon = 'icons/obj/musician.dmi'
	force = 10
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_instruments.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_instruments.dmi',
		)

/obj/item/device/instrument/New()
	..()
	song = new(instrumentId, src)
	song.instrumentExt = instrumentExt

/obj/item/device/instrument/Destroy()
	qdel(song)
	song = null
	..()

/obj/item/device/instrument/attack_self(mob/user as mob)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return 1
	interact(user)

/obj/item/device/instrument/interact(mob/user as mob)
	if(!user)
		return

	if(user.incapacitated() || user.lying)
		return

	user.set_machine(src)
	song.interact(user)

/obj/item/device/instrument/violin
	name = "violin"
	desc = "A wooden musical instrument with four strings and a bow. A true classic."
	icon_state = "violin"
	attack_verb = list("smashed")
	instrumentId = "violin"
	item_state = "violin"

/obj/item/device/instrument/violin/gold
	name = "golden violin"
	desc = "A wooden musical instrument with four strings and a bow. \"The devil went down to space, he was looking for an assistant to grief.\""
	icon = 'icons/obj/musician_yw.dmi'
	icon_state = "golden_violin"
	attack_verb = list("smashed")
