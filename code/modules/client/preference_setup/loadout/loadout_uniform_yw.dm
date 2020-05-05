/datum/gear/uniform/victsuit
	description = "A victorian style suit, fancy!"
	display_name = "Victorian suit selection"

/datum/gear/uniform/victsuit/New()
	..()
	var/list/victsuits = list()
	for(var/suitvict in (typesof(/obj/item/clothing/under/yw/victsuit) - typesof(/obj/item/clothing/under/yw/victsuit/victdress)))
		var/obj/item/clothing/under/yw/victsuit/suitvict_type = suitvict
		victsuits[initial(suitvict_type.name)] = suitvict_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(victsuits))

/datum/gear/uniform/victdress
	description = "A victorian style dress, fancy!"
	display_name = "Victorian dress, Black"
	path = /obj/item/clothing/under/yw/victsuit/victdress

/datum/gear/uniform/redvictdress
	description = "A victorian style dress, fancy!"
	display_name = "Victorian Dress, Red"
	path = /obj/item/clothing/under/yw/victsuit/victdress/red