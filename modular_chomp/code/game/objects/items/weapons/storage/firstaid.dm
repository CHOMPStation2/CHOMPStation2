/obj/item/storage/firstaid/experimental // CHOMPEdit - Removal of obj/item/weapon
	name = "experimental firstaid kit"
	icon = 'modular_chomp/icons/obj/storage.dmi'
	icon_state = "expirmentalaid"
	starts_with = list(
		/obj/item/storage/pill_bottle/neotane, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/burncard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/flamecure, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/juggernog, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/curea, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/souldew, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/purifyingagent) // CHOMPEdit - Removal of obj/item/weapon


/obj/item/storage/pill_bottle/neotane // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (neo kelotane)"
	desc = "Contains experimental pills, good for soothing burns but tends to mangle the flesh."
	starts_with = list(/obj/item/reagent_containers/pill/neotane = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_ORANGE

/obj/item/storage/pill_bottle/burncard // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (burning bicard)"
	desc = "Contains experimental pills, good for sealing cuts and bruises but is quite searing."
	starts_with = list(/obj/item/reagent_containers/pill/burncard = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_RED

/obj/item/storage/pill_bottle/flamecure // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (Flame Cure)"
	desc = "Contains experimental pills, good for searing shut internal wounds."
	starts_with = list(/obj/item/reagent_containers/pill/flamecure = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_ORANGE

/obj/item/storage/pill_bottle/juggernog // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (juggernog)"
	desc = "Contains experimental pills good for letting folks keep standing underneath relentless pummeling."
	starts_with = list(/obj/item/reagent_containers/pill/juggernog = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_RED

/obj/item/storage/pill_bottle/curea // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (curea)"
	desc = "Contains experimental pills, very effective for frostfly and poisonfly hunting."
	starts_with = list(/obj/item/reagent_containers/pill/curea = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_BLUE

/obj/item/storage/pill_bottle/souldew // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (soul dew)"
	desc = "Contains experimental pills, for feeding the dead."
	starts_with = list(/obj/item/reagent_containers/pill/souldew = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_GREEN

/obj/item/storage/pill_bottle/purifyingagent // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (purifying agent)"
	desc = "Contains experimental pills, having application as an anti-toxin."
	starts_with = list(/obj/item/reagent_containers/pill/purifyingagent = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_GREEN

/obj/item/storage/pill_bottle/methylphenidate // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (Methylphenidate)"
	desc = "Contains pills used to help a patient concentrate. Usually prescribed for ADHD or similar conditions."
	starts_with = list(/obj/item/reagent_containers/pill/methylphenidate = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_GUNMETAL

/obj/item/storage/pill_bottle/paroxetine // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (Paroxetine)"
	desc = "Contains pills used to help treat severe depression. Side effects can include hallucinations."
	starts_with = list(/obj/item/reagent_containers/pill/paroxetine = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_GRAY40

/obj/item/storage/pill_bottle/adranol // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (Adranol)"
	desc = "Contains pills used to help treat jitters, blurred vision, and confusion."
	starts_with = list(/obj/item/reagent_containers/pill/adranol = 7) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_YELLOW

/obj/item/storage/pill_bottle/aphrodisiac //this is totally first aid shut up // CHOMPEdit - Removal of obj/item/weapon
	name = "pill bottle (Aphrodisiac)"
	desc = "Contains pills used to help get it on."
	starts_with = list(/obj/item/reagent_containers/pill/aphrodisiac = 14) // CHOMPEdit - Removal of obj/item/weapon
	wrapper_color = COLOR_PINK

//Pills
/obj/item/reagent_containers/pill/neotane // CHOMPEdit - Removal of obj/item/weapon
	name = "Neo Kelotane (10u)"
	desc = "An experimental pill."

	icon_state = "pill2"

/obj/item/reagent_containers/pill/neotane/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("neotane", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/burncard // CHOMPEdit - Removal of obj/item/weapon
	name = "Burning Bicard (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/burncard/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("burncard", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/flamecure // CHOMPEdit - Removal of obj/item/weapon
	name = "Flame Cure (5u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/flamecure/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("flamecure", 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/juggernog // CHOMPEdit - Removal of obj/item/weapon
	name = "Juggernog (5u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/juggernog/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("juggernog", 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/curea // CHOMPEdit - Removal of obj/item/weapon
	name = "Curea (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/curea/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("curea", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/souldew // CHOMPEdit - Removal of obj/item/weapon
	name = "Souldew (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/souldew/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("souldew", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/purifyingagent // CHOMPEdit - Removal of obj/item/weapon
	name = "Purifying Agent (10u)"

	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/purifyingagent/Initialize() // CHOMPEdit - Removal of obj/item/weapon

	. = ..()
	reagents.add_reagent("purifyingagent", 10)

	color = reagents.get_color()

/obj/item/reagent_containers/pill/methylphenidate // CHOMPEdit - Removal of obj/item/weapon
	name = "Methylphenidate (10u)"
	desc = "A pill to help you concentrate."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/methylphenidate/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("methylphenidate", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/paroxetine // CHOMPEdit - Removal of obj/item/weapon
	name = "Paroxetine (10u)"
	desc = "A pill to help treat severe depression."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/paroxetine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("paroxetine", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/adranol // CHOMPEdit - Removal of obj/item/weapon
	name = "Adranol (10u)"
	desc = "A pill to help treat jitters, confusion, and blurred vision."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/adranol/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("adranol", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/aphrodisiac // CHOMPEdit - Removal of obj/item/weapon
	name = "Aphrodisiac (20u)"
	desc = "Just one couldn't hurt, right?"
	icon_state = "pill2"

/obj/item/reagent_containers/pill/aphrodisiac/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("aphrodisiac", 20)
	color = reagents.get_color()