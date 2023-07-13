/obj/item/weapon/storage/firstaid/experimental
	name = "experimental firstaid kit"
	color = "#FF3300"
	icon = 'modular_chomp/icons/obj/storage.dmi'
	icon_state = "expirmentalaid"
	starts_with = list(
		/obj/item/weapon/storage/pill_bottle/neotane,
		/obj/item/weapon/storage/pill_bottle/burncard,
		/obj/item/weapon/storage/pill_bottle/flamecure,
		/obj/item/weapon/storage/pill_bottle/juggernog,
		/obj/item/weapon/storage/pill_bottle/curea,
		/obj/item/weapon/storage/pill_bottle/souldew,
		/obj/item/weapon/storage/pill_bottle/purifyingagent)


/obj/item/weapon/storage/pill_bottle/neotane
	name = "pill bottle (neo kelotane)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/neotane = 7)
	wrapper_color = COLOR_ORANGE

/obj/item/weapon/storage/pill_bottle/burncard
	name = "pill bottle (burning bicard)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/burncard = 7)
	wrapper_color = COLOR_RED

/obj/item/weapon/storage/pill_bottle/flamecure
	name = "pill bottle (Flame Cure)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/flamecure = 7)
	wrapper_color = COLOR_ORANGE

/obj/item/weapon/storage/pill_bottle/juggernog
	name = "pill bottle (juggernog)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/juggernog = 7)
	wrapper_color = COLOR_RED

/obj/item/weapon/storage/pill_bottle/curea
	name = "pill bottle (curea)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/curea = 7)
	wrapper_color = COLOR_BLUE

/obj/item/weapon/storage/pill_bottle/souldew
	name = "pill bottle (soul dew)"
	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/souldew = 7)
	wrapper_color = COLOR_GREEN

/obj/item/weapon/storage/pill_bottle/purifyingagent

	name = "pill bottle (purifying agent)"

	desc = "Contains experimental pills."
	starts_with = list(/obj/item/weapon/reagent_containers/pill/purifyingagent = 7)

	wrapper_color = COLOR_GREEN

//Pills
/obj/item/weapon/reagent_containers/pill/neotane
	name = "Neo Kelotane (15u)"
	desc = "An experimental pill."

	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/neotane/Initialize()
	. = ..()
	reagents.add_reagent("neotane", 10)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/burncard
	name = "Burning Bicard (10u)"
	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/burncard/Initialize()
	. = ..()
	reagents.add_reagent("burncard", 10)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/flamecure
	name = "Flame Cure (5u)"
	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/flamecure/Initialize()
	. = ..()
	reagents.add_reagent("flamecure", 5)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/juggernog
	name = "Juggernog (5u)"
	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/juggernog/Initialize()
	. = ..()
	reagents.add_reagent("juggernog", 5)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/curea
	name = "Curea (10u)"
	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/curea/Initialize()
	. = ..()
	reagents.add_reagent("curea", 10)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/souldew
	name = "Souldew (10u)"
	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/souldew/Initialize()
	. = ..()
	reagents.add_reagent("souldew", 10)
	color = reagents.get_color()

/obj/item/weapon/reagent_containers/pill/purifyingagent
	name = "Purifying Agent (10u)"

	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/purifyingagent/Initialize()

	. = ..()
	reagents.add_reagent("purifyingagent", 10)

	color = reagents.get_color()