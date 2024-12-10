/datum/seed/soybean
	name = PLANT_SOYBEAN
	seed_name = PLANT_SOYBEAN
	display_name = "soybeans"
	kitchen_tag = "soybeans"
<<<<<<< HEAD
	mutants = list("orangesapbean","bluesapbean","purplesapbean") //CHOMPEdit - Adding mutation strain for sap beans.
	chems = list("nutriment" = list(1,20), "soymilk" = list(10,20))
=======
	chems = list(REAGENT_ID_NUTRIMENT = list(1,20), REAGENT_ID_SOYMILK = list(10,20))
>>>>>>> af544e406f (Merge pull request #16674 from Kashargul/reagentToDefines)

/datum/seed/soybean/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,4)
	set_trait(TRAIT_PRODUCTION,4)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,5)
	set_trait(TRAIT_PRODUCT_ICON,"bean")
	set_trait(TRAIT_PRODUCT_COLOUR,"#EBE7C0")
	set_trait(TRAIT_PLANT_ICON,"stalk")
