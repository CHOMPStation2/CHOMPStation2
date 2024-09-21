/obj/item/weapon/card/id/casino
	name = "casino id"
	desc = "An ID card for an employee of the golden goose casino."
	icon = 'icons/obj/card_ch.dmi'
	base_icon = 'icons/obj/card_ch.dmi'
	icon_state = "ch_casino"
	item_state = "gold_id"

	access = list(160)

/obj/item/weapon/card/id/casino/both
	name = "casino both id"
	desc = "An ID card for an employee of the golden goose casino with extra access to prize both."
	access = list(160, 200)

/obj/item/weapon/card/id/casino/medical
	name = "casino medical id"
	desc = "An ID card for an employee of the golden goose casino that oversees medical care."
	icon_state = "ch_casino_med"
	access = list(160, 202)

/obj/item/weapon/card/id/casino/engineering
	name = "casino engineering id"
	desc = "An ID card for an employee of the golden goose casino that oversees maintenance."
	icon_state = "ch_casino_eng"
	access = list(160, 203)

/obj/item/weapon/card/id/casino/security
	name = "casino security id"
	desc = "An ID card for an employee of the golden goose casino that oversees security."
	icon_state = "ch_casino_sec"
	access = list(160, 200, 201, 202, 203)

/obj/item/weapon/card/id/casino/manager
	name = "casino manager id"
	desc = "An ID card for the manager of the golden goose casino, fancy!"
	icon_state = "ch_casino_manager"
	access = list(160, 200, 201, 202, 203, 300)

/obj/item/weapon/card/id/security/brigphysician
	name = JOB_BRIG_PHYSICIAN + "'s ID"
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n", "pips-medblu", "stripe-white")
