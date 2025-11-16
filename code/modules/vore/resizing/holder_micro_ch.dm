// Adds support to show teshari in-hand sprites when grabbing tesh
// Uses 'white plush' inhand/onback sprites
// Overrides the make_worn_icon to inject skin color setting on the sprite
// without changing the color of the icon in the hand slot
/obj/item/holder/micro/Initialize(mapload, mob/held)
	. = ..()
	var/mob/living/carbon/human/H = held_mob
	if(istype(H) && H.species.get_bodytype() == SPECIES_TESHARI)
		item_icons = list(
					slot_l_hand_str = 'icons/mob/items/lefthand_toys_yw.dmi',
					slot_r_hand_str = 'icons/mob/items/righthand_toys_yw.dmi',
					slot_back_str = 'icons/mob/toy_worn_yw.dmi',
					slot_head_str = 'icons/mob/toy_worn_yw.dmi')

		// Leaving the following two set makes the sprite not visible
		icon_override = null
		sprite_sheets = null
		icon_state = "teshariplushie_white"
		item_state = "teshariplushie_white"
		// Add back slot
		slot_flags = SLOT_FEET | SLOT_HEAD | SLOT_ID | SLOT_BACK

/obj/item/holder/micro/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer,var/icon/clip_mask = null)
	var/mob/living/carbon/human/H = held_mob
	// Only proceed if dealing with a tesh (or something shaped like a tesh)
	if(istype(H) && H.species.get_bodytype() == SPECIES_TESHARI)
		var/colortemp = color //save original color var to a temp var
		//convert numerical RGB to Hex #000000 format - is this necessary?
		//then 'inject' changed color (from skin color) into original proc call
		color = addtext("#", num2hex(H.r_skin, 2), num2hex(H.g_skin, 2), num2hex(H.b_skin, 2))
		. = ..()
		color = colortemp //reset color var to it's old value after original proc call before proceeding - otherwise we change hand-slot icon color too!
	else
		. = ..()
