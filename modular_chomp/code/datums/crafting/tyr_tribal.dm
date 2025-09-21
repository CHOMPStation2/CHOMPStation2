/datum/crafting_recipe/arrow_agate
	name = "Wood arrow (agate tip)"
	result = /obj/item/arrow/standard
	reqs = list(list(/obj/item/stack/material/wood = 2),
		list(/obj/item/stack/material/weathered_agate = 2))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/agate_blade
	name = "agate blade"
	result = /obj/item/melee/agate_sword
	reqs = list(list(/obj/item/stack/material/wood = 2),
		list(/obj/item/stack/material/weathered_agate = 6))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/agate_hammer
	name = "agate hammer"
	result = /obj/item/melee/agate_hammer
	reqs = list(list(/obj/item/stack/material/wood = 4),
		list(/obj/item/stack/material/weathered_agate = 2))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/agate_spear
	name = "agate spear"
	result = /obj/item/melee/agate_spear
	reqs = list(list(/obj/item/stack/material/wood = 3),
		list(/obj/item/stack/material/weathered_agate = 3))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/tyr_leaf_cloak
	name = "tyr leaf cloak"
	result = /obj/item/clothing/suit/armor/tyrtribalcloak
	reqs = list(
		list(/obj/item/reagent_containers/food/snacks/weatherlily = 1),
		list(/obj/item/stack/material/fiber = 6),
		list(/obj/item/stack/material/cloth = 3)
	)
	time = 120
	category = CAT_CLOTHING

