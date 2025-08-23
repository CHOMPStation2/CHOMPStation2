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
