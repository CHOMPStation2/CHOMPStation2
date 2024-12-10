/datum/seed/wheat
	name = PLANT_WHEAT
	seed_name = PLANT_WHEAT
	display_name = "wheat stalks"
<<<<<<< HEAD
	kitchen_tag = "wheat"
	mutants = list("meatwheat") //CHOMPEdit - Adding mutation strain for meatwheat.
	chems = list("nutriment" = list(1,25), "flour" = list(10,30))
=======
	kitchen_tag = PLANT_WHEAT
	chems = list(REAGENT_ID_NUTRIMENT = list(1,25), REAGENT_ID_FLOUR = list(10,30))
>>>>>>> af544e406f (Merge pull request #16674 from Kashargul/reagentToDefines)

/datum/seed/wheat/New()
	..()
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,5)
	set_trait(TRAIT_PRODUCT_ICON,"wheat")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DBD37D")
	set_trait(TRAIT_PLANT_COLOUR,"#BFAF82")
	set_trait(TRAIT_PLANT_ICON,"stalk2")
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)
