/obj/item/beartrap // CHOMPEdit - Removal of obj/item/weapon
	slot_flags = SLOT_MASK
	item_icons = list(
		slot_wear_mask_str = 'icons/inventory/face/mob_vr.dmi'
		)

/obj/item/beartrap/equipped() // CHOMPEdit - Removal of obj/item/weapon
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.wear_mask == src)
			add_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
		else
			remove_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()

/obj/item/beartrap/dropped(var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	remove_verb(user,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()
