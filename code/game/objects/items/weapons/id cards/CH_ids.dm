/obj/item/card/id/casino // CHOMPEdit - Removal of obj/item/weapon
	name = "casino id"
	desc = "An ID card for an employee of the golden goose casino."
	icon = 'icons/obj/card_ch.dmi'
	base_icon = 'icons/obj/card_ch.dmi'
	icon_state = "ch_casino"
	item_state = "gold_id"

	access = list(160)

/obj/item/card/id/casino/both // CHOMPEdit - Removal of obj/item/weapon
	name = "casino both id"
	desc = "An ID card for an employee of the golden goose casino with extra access to prize both."
	access = list(160, 200)

/obj/item/card/id/casino/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "casino medical id"
	desc = "An ID card for an employee of the golden goose casino that oversees medical care."
	icon_state = "ch_casino_med"
	access = list(160, 202)

/obj/item/card/id/casino/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = "casino engineering id"
	desc = "An ID card for an employee of the golden goose casino that oversees maintenance."
	icon_state = "ch_casino_eng"
	access = list(160, 203)

/obj/item/card/id/casino/security // CHOMPEdit - Removal of obj/item/weapon
	name = "casino security id"
	desc = "An ID card for an employee of the golden goose casino that oversees security."
	icon_state = "ch_casino_sec"
	access = list(160, 200, 201, 202, 203)

/obj/item/card/id/casino/manager // CHOMPEdit - Removal of obj/item/weapon
	name = "casino manager id"
	desc = "An ID card for the manager of the golden goose casino, fancy!"
	icon_state = "ch_casino_manager"
	access = list(160, 200, 201, 202, 203, 300)