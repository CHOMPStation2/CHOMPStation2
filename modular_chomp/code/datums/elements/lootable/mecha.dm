// Stuff you may find attached to a mouse tank.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/element/lootable/mecha/mouse_tank
	loot_left= 5

	common_loot = list(
		/obj/random/tool,
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/random/tech_supply/component,
		/obj/effect/decal/remains/mouse,
		/obj/item/stack/material/steel{amount = 20}
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg/rigged,
		/obj/item/mecha_parts/mecha_equipment/generator
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg,
		/obj/item/mecha_parts/mecha_equipment/generator/nuclear
		)

// Stuff you may find attached to a livewire mouse tank.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/element/lootable/mecha/mouse_tank/livewire

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged,
		/obj/item/mecha_parts/mecha_equipment/tool/extinguisher
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer,
		/obj/item/mecha_parts/mecha_equipment/generator
		)

// Stuff you may find attached to a eraticator mouse tank.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/element/lootable/mecha/mouse_tank/eraticator

	uncommon_loot = list(
		/obj/item/ammo_magazine/m75,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/mortar
		)

	rare_loot = list(
		/obj/item/gun/projectile/gyropistol,
		/obj/item/mecha_parts/mecha_equipment/generator/nuclear
		)

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
		/obj/item/weldingtool/silver,
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
