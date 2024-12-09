/obj/item/clothing/head/wiggler
	icon_override = 'icons/vore/misc_ch.dmi'
	icon = 'icons/vore/misc_ch.dmi'//lets use our own DMI with blackjack and deers
	icon_state = "flailing_helmet"
	item_state = "flailing_helmet_worn"
	name = "Flailing hat"
	desc = "It's a hat, it flails."
	body_parts_covered = 0

/obj/item/clothing/head/wiggler/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer,var/icon/clip_mask = null)
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
	icon_override = 'icons/mob/head.dmi'


/obj/item/clothing/head/crown //Generic crown doesnt exist, no sprites
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head.dmi'
	icon_state = "crown"
	item_state = "crown"
	name = "crown"
	desc = "A crown, it's pretty."
	body_parts_covered = 0

/obj/item/clothing/head/crown/goose_king
	name = "Crown of the golden goose king"
	desc = "It's the crown given to the goose king from the golden goose casino, what an honor!"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head.dmi'
	icon_state = "goose_king"
	item_state = "goose_king"

/obj/item/clothing/head/crown/goose_king/christmas
	name = "Crown of the Goose King of Holiday Spirit"
	desc = "It's the crown from the golden goose casino of the Goose King! Given to the one to uphold christmas spirit on Southern Cross, merry christmas!"


/obj/item/clothing/head/crown/goose_queen
	name = "Crown of the golden goose queen"
	desc = "It's the crown given to the goose queen from the golden goose casino, what an honor!"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head.dmi'
	icon_state = "goose_queen"
	item_state = "goose_queen"

/obj/item/clothing/head/crown/goose_queen/christmas
	name = "Crown of the Goose Queen of Holiday Cheer"
	desc = "It's the crown from the golden goose casino of the Goose Queen! Given to the one to spread christmas cheer on Southern Cross, happy holidays!"

/obj/item/clothing/head/pelt
	name = "Bear pelt"
	desc = "A luxurious bear pelt, good to keep warm in winter. Or to sleep through winter."
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_override = 'icons/mob/head.dmi'
	icon_state = "bearpelt_brown"
	item_state = "bearpelt_brown"

/obj/item/clothing/head/pelt/black
	icon_state = "bearpelt_black"
	item_state = "bearpelt_black"

/obj/item/clothing/head/pelt/wolfpelt
	name = "Wolf pelt"
	desc = "A fuzzy wolf pelt, demanding respect as a hunter, well if it isn't synthetic or anything at least. Or bought."
	icon_override = 'icons/mob/wolfpelt_ch.dmi'
	icon_state = "wolfpelt_brown"
	item_state = "wolfpelt_brown"

/obj/item/clothing/head/pelt/wolfpeltblack
	name = "Wolf pelt"
	desc = "A fuzzy wolf pelt, demanding respect as a hunter, well if it isn't synthetic or anything at least. Or bought."
	icon_override = 'icons/mob/wolfpelt_ch.dmi'
	icon_state = "wolfpelt_gray"
	item_state = "wolfpelt_gray"

/obj/item/clothing/head/pelt/tigerpelt
	name = "Shiny tiger pelt"
	desc = "A vibrant tiger pelt, particularly fabulous."
	icon_state = "tigerpelt_shiny"
	item_state = "tigerpelt_shiny"

/obj/item/clothing/head/pelt/tigerpeltsnow
	name = "Snow tiger pelt"
	desc = "A pelt of a less vibrant tiger, but rather warm."
	icon_state = "tigerpelt_snow"
	item_state = "tigerpelt_snow"

/obj/item/clothing/head/pelt/tigerpeltpink
	name = "Pink tiger pelt"
	desc = "A particularly vibrant tiger pelt, for those who want to be the most fabulous at parties."
	icon_state = "tigerpelt_pink"
	item_state = "tigerpelt_pink"
