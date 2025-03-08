/obj/item/storage/firstaid/experimental
	name = "experimental firstaid kit"
	icon = 'modular_chomp/icons/obj/storage.dmi'
	icon_state = "expirmentalaid"
	starts_with = list(
		/obj/item/storage/pill_bottle/neotane,
		/obj/item/storage/pill_bottle/burncard,
		/obj/item/storage/pill_bottle/flamecure,
		/obj/item/storage/pill_bottle/juggernog,
		/obj/item/storage/pill_bottle/curea,
		/obj/item/storage/pill_bottle/souldew,
		/obj/item/storage/pill_bottle/purifyingagent)


/obj/item/storage/pill_bottle/neotane
	name = "pill bottle (" + REAGENT_NEOTANE + ")"
	desc = "Contains experimental pills, good for soothing burns but tends to mangle the flesh."
	starts_with = list(/obj/item/reagent_containers/pill/neotane = 7)
	wrapper_color = COLOR_ORANGE

/obj/item/storage/pill_bottle/burncard
	name = "pill bottle (" + REAGENT_BURNCARD + ")"
	desc = "Contains experimental pills, good for sealing cuts and bruises but is quite searing."
	starts_with = list(/obj/item/reagent_containers/pill/burncard = 7)
	wrapper_color = COLOR_RED

/obj/item/storage/pill_bottle/flamecure
	name = "pill bottle (" + REAGENT_FLAMECURE + ")"
	desc = "Contains experimental pills, good for searing shut internal wounds."
	starts_with = list(/obj/item/reagent_containers/pill/flamecure = 7)
	wrapper_color = COLOR_ORANGE

/obj/item/storage/pill_bottle/juggernog
	name = "pill bottle (" + REAGENT_JUGGERNOG + ")"
	desc = "Contains experimental pills good for letting folks keep standing underneath relentless pummeling."
	starts_with = list(/obj/item/reagent_containers/pill/juggernog = 7)
	wrapper_color = COLOR_RED

/obj/item/storage/pill_bottle/curea
	name = "pill bottle (" + REAGENT_CUREA + ")"
	desc = "Contains experimental pills, very effective for frostfly and poisonfly hunting."
	starts_with = list(/obj/item/reagent_containers/pill/curea = 7)
	wrapper_color = COLOR_BLUE

/obj/item/storage/pill_bottle/souldew
	name = "pill bottle (" + REAGENT_SOULDEW + ")"
	desc = "Contains experimental pills, for feeding the dead."
	starts_with = list(/obj/item/reagent_containers/pill/souldew = 7)
	wrapper_color = COLOR_GREEN

/obj/item/storage/pill_bottle/purifyingagent
	name = "pill bottle (" + REAGENT_PURIFYINGAGENT + ")"
	desc = "Contains experimental pills, having application as an anti-toxin."
	starts_with = list(/obj/item/reagent_containers/pill/purifyingagent = 7)
	wrapper_color = COLOR_GREEN

/obj/item/storage/pill_bottle/methylphenidate
	name = "pill bottle (" + REAGENT_METHYLPHENIDATE + ")"
	desc = "Contains pills used to help a patient concentrate. Usually prescribed for ADHD or similar conditions."
	starts_with = list(/obj/item/reagent_containers/pill/methylphenidate = 7)
	wrapper_color = COLOR_GUNMETAL

/obj/item/storage/pill_bottle/paroxetine
	name = "pill bottle (" + REAGENT_PAROXETINE + ")"
	desc = "Contains pills used to help treat severe depression. Side effects can include hallucinations."
	starts_with = list(/obj/item/reagent_containers/pill/paroxetine = 7)
	wrapper_color = COLOR_GRAY40

/obj/item/storage/pill_bottle/adranol
	name = "pill bottle (" + REAGENT_ADRANOL + ")"
	desc = "Contains pills used to help treat jitters, blurred vision, and confusion."
	starts_with = list(/obj/item/reagent_containers/pill/adranol = 7)
	wrapper_color = COLOR_YELLOW

/obj/item/storage/pill_bottle/aphrodisiac //this is totally first aid shut up
	name = "pill bottle (" + REAGENT_APHRODISIAC + ")"
	desc = "Contains pills used to help get it on."
	starts_with = list(/obj/item/reagent_containers/pill/aphrodisiac = 14)
	wrapper_color = COLOR_PINK

//Pills
/obj/item/reagent_containers/pill/neotane
	name = REAGENT_NEOTANE + " (10u)"
	desc = "An experimental pill."

	icon_state = "pill2"

/obj/item/reagent_containers/pill/neotane/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_NEOTANE, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/burncard
	name = REAGENT_BURNCARD + " (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/burncard/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_BURNCARD, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/flamecure
	name = REAGENT_FLAMECURE + " (5u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/flamecure/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_FLAMECURE, 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/juggernog
	name = REAGENT_JUGGERNOG + " (5u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/juggernog/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_JUGGERNOG, 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/curea
	name = REAGENT_CUREA + " (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/curea/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_CUREA, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/souldew
	name = REAGENT_SOULDEW + " (10u)"
	desc = "An experimental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/souldew/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_SOULDEW, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/purifyingagent
	name = REAGENT_PURIFYINGAGENT + " (10u)"

	desc = "An expirmental pill."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/purifyingagent/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PURIFYINGAGENT, 10)

	color = reagents.get_color()

/obj/item/reagent_containers/pill/methylphenidate
	name =  REAGENT_METHYLPHENIDATE + " (10u)"
	desc = "A pill to help you concentrate."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/methylphenidate/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_METHYLPHENIDATE, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/paroxetine
	name = REAGENT_PAROXETINE + " (10u)"
	desc = "A pill to help treat severe depression."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/paroxetine/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PAROXETINE, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/adranol
	name = REAGENT_ADRANOL + " (10u)"
	desc = "A pill to help treat jitters, confusion, and blurred vision."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/adranol/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_ADRANOL, 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/aphrodisiac
	name = REAGENT_APHRODISIAC + " (20u)"
	desc = "Just one couldn't hurt, right?"
	icon_state = "pill2"

/obj/item/reagent_containers/pill/aphrodisiac/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_APHRODISIAC, 20)
	color = reagents.get_color()
