/obj/machinery/autolathe/tyrfabricator
	name = "fabricator"
	desc = "A strange machine."


/obj/machinery/autolathe/armory/tgui_static_data(mob/user)
	var/list/data = ..()

	var/list/categories = list()
	var/list/recipes = list()
	for(var/datum/category_group/autolathe/A in autolathe_recipes.categories)
		categories += A.name
		for(var/datum/category_item/autolathe/whfabricator/M in A.items)
			if(M.hidden && !hacked)
				continue
			if(M.man_rating > man_rating)
				continue
			recipes.Add(list(list(
				"category" = A.name,
				"name" = M.name,
				"ref" = REF(M),
				"requirements" = M.resources,
				"hidden" = M.hidden,
				"coeff_applies" = !M.no_scale,
				"is_stack" = M.is_stack,
			)))
	data["recipes"] = recipes
	data["categories"] = categories

	return data

/datum/category_group/autolathe/whfabricator
	name = "Fabricator"
	category_item_type = /datum/category_item/autolathe/whfabricator


/datum/category_item/autolathe/whfabricator

/****************************
* What you can make *
****************************/
/datum/category_item/autolathe/whfabricator/pwmelee
	name = "Prototype Weaponery - Melee"
	path = /obj/item/weapon/gun/energy/energyballchain
	resources = list(MAT_WAGATE = 7000, MAT_MOPRHIUM = 3000, MAT_COPPER = 7000, MAT_METALHYDROGEN = 5000)

/datum/category_item/autolathe/whfabricator/pwclosequarters
	name = "Prototype Weaponery - Close Quarters"
	path = /obj/item/weapon/gun/energy/curse_tyrshotgun
	resources = list(MAT_WAGATE = 7000, MAT_MOPRHIUM = 3000, MAT_COPPER = 7000, MAT_METALHYDROGEN = 5000)

/datum/category_item/autolathe/whfabricator/pwblaster
	name = "Prototype Weaponery - Blaster"
	path = /obj/item/weapon/gun/energy/curse_blaster
	resources = list(MAT_WAGATE = 7000, MAT_MOPRHIUM = 3000, MAT_COPPER = 7000, MAT_METALHYDROGEN = 5000)

/datum/category_item/autolathe/whfabricator/pwcrystal
	name = "Prototype Weaponery - Crystal"
	path = /obj/item/weapon/gun/energy/curse_lasershooter
	resources = list(MAT_WAGATE = 7000, MAT_MOPRHIUM = 3000, MAT_COPPER = 7000, MAT_METALHYDROGEN = 5000)