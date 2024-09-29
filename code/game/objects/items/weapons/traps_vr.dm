/obj/item/beartrap
	slot_flags = SLOT_MASK
	item_icons = list(
		slot_wear_mask_str = 'icons/inventory/face/mob_vr.dmi'
		)

/obj/item/beartrap/equipped()
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.wear_mask == src)
			add_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
		else
			remove_verb(H,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()

<<<<<<< HEAD
/obj/item/weapon/beartrap/dropped(var/mob/user)
	remove_verb(user,/mob/living/proc/shred_limb_temp) //CHOMPEdit TGPanel
	..()
=======
/obj/item/beartrap/dropped(var/mob/user)
	user.verbs -= /mob/living/proc/shred_limb_temp
	..()
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
