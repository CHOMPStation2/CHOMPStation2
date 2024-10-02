/datum/gear/fluff
	path = /obj/item
	sort_category = "Fluff Items"
	display_name = "If this item can be chosen or seen, ping a coder immediately!"
	ckeywhitelist = list("This entry should never be choosable with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard
	character_name = list("This entry should never be choosable with this variable set.")
	cost = 0
/*
/datum/gear/fluff/testhorn
	path = /obj/item/bikehorn
	display_name = "Airhorn - Example Item"
	description = "An example item that you probably shouldn't see!"
	ckeywhitelist = list("mewchild")
	allowed_roles = list("Station Engineer")
*/
//The above is a direct copy of the core info from the _vr file
