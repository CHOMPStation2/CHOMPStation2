/obj/item/clothing/head/wiggler
	icon_override = 'icons/vore/misc_ch.dmi'
	icon = 'icons/vore/misc_ch.dmi'//lets use our own DMI with blackjack and deers
	icon_state = "flailing_helmet"
	item_state = "flailing_helmet_worn"
	name = "Flailing hat"
	desc = "It's a hat, it flails."
	body_parts_covered = 0

/obj/item/clothing/head/wiggler/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer)
	var/image/so_far = ..()
	so_far.pixel_y += 16
	so_far.pixel_x += 0
	return so_far

/obj/item/clothing/head/soft/purple/wah
	name = "assistant cap"
	desc = "What a lovely purple cap, its said its given out as a trophy to assistants. Why does that sound so depressing?"
	icon_state = "wahcap"
	item_state_slots = list(slot_r_hand_str = "wahcap", slot_l_hand_str = "wahcap")
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head_ch.dmi'


/obj/item/clothing/head/crown //Generic crown doesnt exist, no sprites
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head_ch.dmi'
	icon_state = "crown"
	item_state = "crown"
	name = "crown"
	desc = "A crown, it's pretty."
	body_parts_covered = 0

/obj/item/clothing/head/crown/goose_king
	name = "Crown of the golden goose king"
	desc = "It's the crown given to the goose king from the golden goose casino, what an honor!"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head_ch.dmi'
	icon_state = "goose_king"
	item_state = "goose_king"

/obj/item/clothing/head/crown/goose_king/christmas
	name = "Crown of the Goose King of Holiday Spirit"
	desc = "It's the crown from the golden goose casino of the Goose King! Given to the one to uphold christmas spirit on Southern Cross, merry christmas!"


/obj/item/clothing/head/crown/goose_queen
	name = "Crown of the golden goose queen"
	desc = "It's the crown given to the goose queen from the golden goose casino, what an honor!"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head_ch.dmi'
	icon_state = "goose_queen"
	item_state = "goose_queen"

/obj/item/clothing/head/crown/goose_queen/christmas
	name = "Crown of the Goose Queen of Holiday Cheer"
	desc = "It's the crown from the golden goose casino of the Goose Queen! Given to the one to spread christmas cheer on Southern Cross, happy holidays!"