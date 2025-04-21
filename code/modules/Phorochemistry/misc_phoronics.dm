proc/gaseous_reagent_check(var/mob/living/carbon/human/H) //protective clothing check
	return (istype(H.wear_suit, /obj/item/clothing/suit/space) && istype(H.head, /obj/item/clothing/head/helmet/space)) \
		|| (istype(H.wear_suit, /obj/item/clothing/suit/bio_suit) && istype(H.head, /obj/item/clothing/head/bio_hood) && H.gloves) \
		|| (H.isSynthetic())

/datum/reagent/nitrate
	id = REAGENT_ID_NITRATE
	name = REAGENT_NITRATE
	description = "Nitrate, not that interesting."
	reagent_state = LIQUID
	color = "#D8DFE3"

/datum/reagent/aluminum_nitrate
	id = REAGENT_ID_ALUMINUMNITRATE
	name = REAGENT_ALUMINUMNITRATE
	description = "Aluminum Nitrate, now that's interesting!"
	reagent_state = LIQUID
	color = "#E1CFE3"

/datum/chemical_reaction/nitrate
	name = REAGENT_NITRATE
	id = REAGENT_ID_NITRATE
	result = REAGENT_ID_NITRATE
	required_reagents = list(REAGENT_ID_NITROGEN = 1, REAGENT_ID_OXYGEN = 3)
	result_amount = 4

/datum/chemical_reaction/aluminum_nitrate
	name = REAGENT_ALUMINUMNITRATE
	id = REAGENT_ID_ALUMINUMNITRATE
	result = REAGENT_ID_ALUMINUMNITRATE
	required_reagents = list(REAGENT_ID_ALUMINIUM = 1, REAGENT_ID_NITRATE = 3)
	result_amount = 4

/datum/chemical_reaction/brownies
	name = "Brownies"
	id = "brownies"
	result = null
	required_reagents = list(REAGENT_ID_ALUMINUMNITRATE = 40, REAGENT_ID_TARTRATE = 20)
	result_amount = 1
	on_reaction(var/datum/reagents/holder, var/created_volume)
		for(var/i = 0; i < 3; i++)
			new /obj/item/reagent_containers/food/snacks/brownies(get_turf(holder.my_atom))
		return

/obj/item/reagent_containers/food/snacks/brownies
	name = "Brownies"
	icon_state = "waffles"
	desc = "Ovenless Brownies!"
	filling_color = "#A79459"

	New()
		..()
		reagents.add_reagent(REAGENT_ID_NUTRIMENT, 6)

/obj/item/induromol
	name = "Hardened Induromol"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore_platinum"
	desc = "Looks like it would make a great throwing weapon."
	throwforce = 20

/obj/structure/closet/l3closet/scientist/phoronics/Initialize(mapload) //two sets of chemical protection
	. = ..()

	new /obj/item/clothing/suit/bio_suit/scientist( src )
	new /obj/item/clothing/head/bio_hood/scientist( src )
