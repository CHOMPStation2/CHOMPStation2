// ******
// KBraid
// ******
/obj/item/clothing/glasses/fluff/avigoggles_yw
	name = "aviation goggles"
	desc = "You're such a goggle head!"
	icon_state = "avigoggles-g"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state_slots = list(slot_r_hand_str = "avigoggles-g", slot_l_hand_str = "avigoggles-g")
	action_button_name = "Flip Aviation Goggles"
	item_flags = AIRTIGHT
	var/up = 0

/obj/item/clothing/glasses/fluff/avigoggles_yw/attack_self()
	toggle()

/obj/item/clothing/glasses/fluff/avigoggles_yw/verb/toggle()
	set category = "Object"
	set name = "Adjust aviation goggles"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			to_chat(usr, "You flip \the [src] down to protect your eyes.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			to_chat(usr, "You push \the [src] up out of your face.")
		update_clothing_icon()
		usr.update_action_buttons()
