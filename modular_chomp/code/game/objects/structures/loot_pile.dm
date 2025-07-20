//Micro mecha loot.
/obj/structure/loot_pile/mecha/mouse_tank
	name = "\improper Whisker wreckage"
	desc = "The ruins of a small tank. Perhaps some child's toy?"
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "whisker-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	loot_element_path = /datum/element/lootable/mecha/mouse_tank

/obj/structure/loot_pile/mecha/mouse_tank/livewire
	name = "\improper Livewire wreckage"
	desc = "The smoldering ruins of a small tank. Perhaps some child's toy?"
	icon_state = "livewire-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	loot_element_path = /datum/element/lootable/mecha/mouse_tank/livewire

/obj/structure/loot_pile/mecha/mouse_tank/eraticator
	name = "\improper Eraticator wreckage"
	desc = "The blasted ruins of a small tank. Perhaps some child's toy?"
	icon_state = "eraticator-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a b

	loot_element_path = /datum/element/lootable/mecha/mouse_tank/eraticator

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

	loot_element_path = /datum/element/lootable/mecha/odd_gygax

/obj/structure/loot_pile/mecha/odd_ripley
	name = "\improper mecha wreckage"
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "mine-broken"
	density = TRUE
	anchored = FALSE

	loot_element_path = /datum/element/lootable/mecha/odd_riplay

/obj/structure/loot_pile/christmas_tree
	name = "festive tree"
	desc = "Happy Holidays!"
	icon = 'modular_chomp/icons/obj/loot_piles.dmi'
	icon_state = "festivetree"
	plane = ABOVE_MOB_PLANE
	pixel_x = -32
	bound_width = 96
	bound_height = 64
	density = 1

	loot_element_path = /datum/element/lootable/christmas_tree
