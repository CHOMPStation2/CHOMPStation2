/datum/gear/uniform/suit/expeditionsuit
	display_name = "Expeditionary jumpsuit Selection"
	path = /obj/item/clothing/under/utility/expeditionary/

/datum/gear/uniform/suit/expeditionsuit/New()
	..()
	var/list/expsuits = list()
	for(var/expsuit in typesof(/obj/item/clothing/under/utility/expeditionary/))
		var/obj/item/clothing/suit/expsuit_type = expsuit
		expsuits[initial(expsuit_type.name)] = expsuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(expsuits))