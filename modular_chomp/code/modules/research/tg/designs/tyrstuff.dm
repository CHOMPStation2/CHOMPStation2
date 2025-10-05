/datum/design_techweb/tyrenergyballchain
	name = "Tyrian Melee Weapon"
	id = "tyr_meleegun"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_METALHYDROGEN = 3000,MAT_QUARTZ = 3000,MAT_EAGATE = 3000)
	build_path = /obj/item/gun/energy/energyballchain
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyrenergyshotgun
	name = "Tyrian Enforcer Firearm"
	id = "tyr_shotgun"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_METALHYDROGEN = 3000,MAT_QUARTZ = 3000,MAT_EAGATE = 3000)
	build_path = /obj/item/gun/energy/curse_tyrshotgun
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyrenergyrifle
	name = "Tyrian Infantry Firearm"
	id = "tyr_rifle"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 12000,MAT_DIAMOND = 4000,MAT_URANIUM = 3000,MAT_COPPER = 3000,MAT_GOLD = 3000,MAT_METALHYDROGEN = 3000,MAT_QUARTZ = 3000,MAT_EAGATE = 3000)
	build_path = /obj/item/gun/energy/curse_blaster
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_RANGED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE


/datum/design_techweb/magnet_belt
	name = "Magnet Belt"
	id = "magnet_belt"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 12000,MAT_DIAMOND = 700,MAT_COPPER = 3000,MAT_METALHYDROGEN = 1000,MAT_QUARTZ = 5000,MAT_WEATHERED_AGATE = 8000)
	build_path = /obj/item/personal_shield_generator/belt/magnetbelt
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyr_sabre
	name = "Tyrian Energy Blade"
	id = "tyr_sabre"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 10000,MAT_DIAMOND = 6000,MAT_COPPER = 8000,MAT_METALHYDROGEN = 2000,MAT_QUARTZ = 2000,MAT_WEATHERED_AGATE = 6000)
	build_path = /obj/item/melee/energy/tyr_sabre
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/tyr_barrierbelt
	name = "Tyrian Barrier Bubble"
	id = "tyr_barrier"
	build_type = PROTOLATHE
	materials = list(MAT_BRONZE = 20000,MAT_DIAMOND = 15000,MAT_COPPER = 15000,MAT_METALHYDROGEN = 20000,MAT_QUARTZ = 50000,MAT_WEATHERED_AGATE = 60000)
	build_path = /obj/item/shield_projector/rectangle/automatic/tyrbarrier
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
