/obj/item/holder/proc/sync(var/mob/living/M)
	dir = 2
	overlays.Cut()
	if(M.item_state)
		item_state = M.item_state
	color = M.color
	name = M.name
	desc = M.desc
	overlays |= M.overlays

/obj/item/holder/protoblob
	slot_flags = SLOT_HEAD | SLOT_OCLOTHING | SLOT_HOLSTER | SLOT_ICLOTHING | SLOT_ID | SLOT_EARS
	w_class = ITEMSIZE_TINY
	allowed = list(/obj/item/gun,/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/melee/baton)
	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/lefthand_holder.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/righthand_holder.dmi',
		slot_head_str = 'modular_chomp/icons/mob/head_ch.dmi',
		slot_w_uniform_str = 'modular_chomp/icons/mob/uniform_ch.dmi',
		slot_wear_suit_str = 'modular_chomp/icons/mob/suit_ch.dmi',
		slot_r_ear_str = 'modular_chomp/icons/mob/ears.dmi',
		slot_l_ear_str = 'modular_chomp/icons/mob/ears.dmi')