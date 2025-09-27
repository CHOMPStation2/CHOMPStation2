// Stuff you may find attached to an odd gygax.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/element/lootable/mecha/odd_gygax
	loot_depletion = FALSE

	common_loot = list(
		/obj/random/tool,
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 20}
		)

	uncommon_loot = list(
		/obj/item/holosign_creator/smokewand,
		/obj/item/holosign_creator/forcewand
		)

	rare_loot = list(
		/obj/item/weldingtool/alien,
		/obj/item/cell/slime/jellyfish
		)

// Stuff you may find attached to an odd gygax.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/element/lootable/mecha/odd_riplay
	chance_uncommon = 30
	chance_rare = 20

	loot_depletion = FALSE

	common_loot = list(
		/obj/random/tool,
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 20}
		)

	uncommon_loot = list(
		/obj/item/stack/material/durasteel{amount = 10},
		/obj/item/stack/material/morphium{amount = 5}
		)

	rare_loot = list(
		/obj/item/clothing/suit/armor/reactive,
		/obj/item/personal_shield_generator/belt/magnetbelt
		)
