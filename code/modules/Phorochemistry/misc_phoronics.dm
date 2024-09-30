#define REM 0.2
#define SOLID 1
#define LIQUID 2
#define GAS 3

proc/gaseous_reagent_check(var/mob/living/carbon/human/H) //protective clothing check
	return (istype(H.wear_suit, /obj/item/clothing/suit/space) && istype(H.head, /obj/item/clothing/head/helmet/space)) \
		|| (istype(H.wear_suit, /obj/item/clothing/suit/bio_suit) && istype(H.head, /obj/item/clothing/head/bio_hood) && H.gloves) \
		|| (H.isSynthetic())

/datum/reagent/nitrate
	id = "nitrate"
	name = "Nitrate"
	description = "Nitrate, not that interesting."
	reagent_state = LIQUID
	color = "#D8DFE3"

/datum/reagent/aluminum_nitrate
	id = "aluminum_nitrate"
	name = "Aluminum Nitrate"
	description = "Aluminum Nitrate, now that's interesting!"
	reagent_state = LIQUID
	color = "#E1CFE3"

/datum/chemical_reaction/nitrate
	name = "Nitrate"
	id = "nitrate"
	result = "nitrate"
	required_reagents = list("nitrogen" = 1, "oxygen" = 3)
	result_amount = 4

/datum/chemical_reaction/aluminum_nitrate
	name = "Aluminum Nitrate"
	id = "aluminum_nitrate"
	result = "aluminum_nitrate"
	required_reagents = list("aluminum" = 1, "nitrate" = 3)
	result_amount = 4

/datum/chemical_reaction/brownies
	name = "Brownies"
	id = "brownies"
	result = null
	required_reagents = list("aluminum_nitrate" = 40, "tartrate" = 20)
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
		reagents.add_reagent("nutriment", 6)

/obj/item/induromol
	name = "Hardened Induromol"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore_platinum"
	desc = "Looks like it would make a great throwing weapon."
	throwforce = 20

/obj/structure/closet/l3closet/scientist/phoronics/New() //two sets of chemical protection
	..()

	new /obj/item/clothing/suit/bio_suit/scientist( src )
	new /obj/item/clothing/head/bio_hood/scientist( src )