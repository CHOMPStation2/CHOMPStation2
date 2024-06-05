/obj/item/weapon/beartrap
	slot_flags = SLOT_MASK
	item_icons = list(
		slot_wear_mask_str = 'icons/inventory/face/mob_vr.dmi'
		)

/obj/item/weapon/beartrap/equipped()
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.wear_mask == src)
			add_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
		else
			remove_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()

/obj/item/weapon/beartrap/dropped(var/mob/user)
	remove_verb(user,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()
