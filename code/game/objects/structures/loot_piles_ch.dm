//Micro mecha loot.
/obj/structure/loot_pile/mecha/mouse_tank
	name = "\improper Whisker wreckage"
	desc = "The ruins of a small tank. Perhaps some child's toy?"
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "whisker-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	chance_uncommon = 20
	chance_rare = 10

	loot_depletion = TRUE
	loot_left = 5

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

/obj/structure/loot_pile/mecha/mouse_tank/livewire
	name = "\improper Livewire wreckage"
	desc = "The smoldering ruins of a small tank. Perhaps some child's toy?"
	icon_state = "livewire-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	chance_uncommon = 20
	chance_rare = 10

	loot_depletion = TRUE
	loot_left = 5

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
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged,
		/obj/item/mecha_parts/mecha_equipment/tool/extinguisher
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer,
		/obj/item/mecha_parts/mecha_equipment/generator
		)

/obj/structure/loot_pile/mecha/mouse_tank/eraticator
	name = "\improper Eraticator wreckage"
	desc = "The blasted ruins of a small tank. Perhaps some child's toy?"
	icon_state = "eraticator-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	chance_uncommon = 20
	chance_rare = 10

	loot_depletion = TRUE
	loot_left = 5

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
		/obj/item/ammo_magazine/m75,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/mortar
		)

	rare_loot = list(
		/obj/item/gun/projectile/gyropistol,
		/obj/item/mecha_parts/mecha_equipment/generator/nuclear
		)

/obj/structure/loot_pile/mecha/ripley/pirate
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "pirate-broken"


/obj/structure/loot_pile/maint/technical
	density = FALSE

/obj/structure/loot_pile/maint/boxfort
	density = FALSE

//Eclipse mecha
/obj/structure/loot_pile/mecha/odd_gygax
	name = "\improper mecha wreckage"
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "orb-broken"
	density = TRUE
	anchored = FALSE

	chance_uncommon = 20
	chance_rare = 10

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

/obj/structure/loot_pile/mecha/odd_ripley
	name = "\improper mecha wreckage"
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "mine-broken"
	density = TRUE
	anchored = FALSE

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
