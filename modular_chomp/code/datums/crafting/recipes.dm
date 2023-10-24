/datum/crafting_recipe/ziplaser
	name = "Ziplaser"
	result = /obj/item/weapon/gun/energy/zip/craftable
	reqs = list(list(/obj/item/weapon/cell/high  = 1),
		list(/obj/item/stack/rods  = 2),
		list(/obj/item/stack/material/steel  = 8),
		list(/obj/item/stack/material/plastic  = 5),
		list(/obj/item/weapon/cell/device  = 2)
		)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/primitive_platecarrier
	name = "primitive plate carrier"
	result = /obj/item/clothing/suit/armor/pcarrier/primative
	reqs = list(
		list(/obj/item/stack/material/leather = 10),
		list(/obj/item/stack/rod = 4),
		list(/obj/item/stack/material/cloth = 5)
	)
	time = 120
	category = CAT_CLOTHING

/datum/crafting_recipe/surgerytable
	name = "surgery table"
	result = /obj/machinery/optable
	reqs = list(
		list(/obj/item/stack/material/silver = 12),
		list(/obj/item/stack/rod = 10),
		list(/obj/item/stack/material/leather = 1)
	)
	time = 240
	category = CAT_MISC