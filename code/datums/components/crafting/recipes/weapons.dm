/datum/crafting_recipe/stunprod
	name = "Stunprod"
	result = /obj/item/melee/baton/cattleprod // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/handcuffs/cable = 1), // CHOMPEdit - Removal of obj/item/weapon
				list(/obj/item/stack/rods = 1),
				list(/obj/item/tool/wirecutters = 1)) // CHOMPEdit - Removal of obj/item/weapon
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/spear
	name = "Spear"
	result = /obj/item/material/twohanded/spear // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/handcuffs/cable = 1), // CHOMPEdit - Removal of obj/item/weapon
				list(/obj/item/stack/rods = 1),
				list(/obj/item/material/shard = 1, // CHOMPEdit - Removal of obj/item/weapon
					 /obj/item/material/butterflyblade = 1) // CHOMPEdit - Removal of obj/item/weapon
				)
	parts = list(/obj/item/material/shard = 1, // CHOMPEdit - Removal of obj/item/weapon
				 /obj/item/material/butterflyblade = 1) // CHOMPEdit - Removal of obj/item/weapon
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/shortbow
	name = "Shortbow"
	result = /obj/item/gun/launcher/crossbow/bow // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/stack/material/wood = 10),
		list(/obj/item/stack/material/cloth = 5))
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/arrow_sandstone
	name = "Wood arrow (sandstone tip)"
	result = /obj/item/arrow/standard // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/stack/material/wood = 2),
		list(/obj/item/stack/material/sandstone = 2))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/arrow_marble
	name = "Wood arrow (marble tip)"
	result = /obj/item/arrow/standard // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/stack/material/wood = 2),
		list(/obj/item/stack/material/marble = 2))
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/primitive_shield
	name = "Primitive Shield"
	result = /obj/item/shield/primitive // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/stack/material/wood = 2), list(/obj/item/reagent_containers/glass/bucket/wood =1), list(/obj/item/stack/material/cloth = 5)) // CHOMPEdit - Removal of obj/item/weapon
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/scopedrifle
	name = "Bolt scope to bolt-action (cannot be removed)"
	result = /obj/item/gun/projectile/shotgun/pump/rifle/scoped // CHOMPEdit - Removal of obj/item/weapon
	reqs = list(list(/obj/item/binoculars/scope = 1), // CHOMPEdit - Removal of obj/item/device
		list(/obj/item/gun/projectile/shotgun/pump/rifle = 1)) // CHOMPEdit - Removal of obj/item/weapon
	time = 180
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
