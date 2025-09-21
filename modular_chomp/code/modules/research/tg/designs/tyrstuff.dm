/datum/design_techweb/tyrenergyballchain
	name = "Tyrian Melee Weapon"
	id = "tyr_meleegun"
	build_type = PROTOLATHE
	materials = list(MAT_STEEL = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_MYDRO = 3000,MAT_QUARTZ = 3000,MAT_WEATHERED_AGATE = 3000)
	build_path = /obj/item/gun/energy/energyballchain
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyrenergyshotgun
	name = "Tyrian Enforcer Firearm"
	id = "tyr_shotgun"
	build_type = PROTOLATHE
	materials = list(MAT_STEEL = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_MYDRO = 3000,MAT_QUARTZ = 3000,MAT_WEATHERED_AGATE = 3000)
	build_path = /obj/item/gun/energy/curse_tyrshotgun
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyrenergyrifle
	name = "Tyrian Infantry Firearm"
	id = "tyr_rifle"
	build_type = PROTOLATHE
	materials = list(MAT_STEEL = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_MYDRO = 3000,MAT_QUARTZ = 3000,MAT_WEATHERED_AGATE = 3000)
	build_path = /obj/item/gun/energy/curse_blaster
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
