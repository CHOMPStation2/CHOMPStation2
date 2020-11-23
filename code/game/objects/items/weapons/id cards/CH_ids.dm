/obj/item/weapon/card/id/casino
	name = "casino employee id"
	desc = "An ID card for an employee of the golden goose casino."
	icon_state = "ch_casino"
	item_state = "gold_id"

	access = list(160)

/obj/item/weapon/card/id/casino/booth
	name = "casino booth employee id"
	desc = "An ID card for an employee of the golden goose casino with extra access to prize booth."
	access = list(160, 200)

/obj/item/weapon/card/id/casino
	name = "casino employee id"
	desc = "An ID card for an employee of the golden goose casino."
	icon_state = "ch_casino"
	item_state = "gold_id"

	access = list(160, 200, 201)

/obj/item/weapon/card/id/casino/manager
	name = "casino manager id"
	desc = "An ID card for the manager of the golden goose casino."
	icon_state = "ch_casino_manager"
	access = list(160, 200, 201, 300)