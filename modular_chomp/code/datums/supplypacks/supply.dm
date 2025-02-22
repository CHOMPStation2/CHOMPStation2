/datum/supply_pack/supply/postal_service
	name = "Postal Service Supplies"
	contains = list(
		/obj/item/mail/blank = 10,
		/obj/item/pen/fountain,
		/obj/item/pen/multi,
		/obj/item/destTagger,
		/obj/item/storage/bag/mail
	)
	cost = 15
	containertype = /obj/structure/closet/crate/nanotrasen
	containername = "Postal Service crate"

/datum/supply_pack/supply/freezer
	name = "Freezer crate"
	desc = "An empty freezer for storing perishable items."
	contains = list()
	cost = 20
	containertype = /obj/structure/closet/crate/freezer
	containername = "Freezer crate"
