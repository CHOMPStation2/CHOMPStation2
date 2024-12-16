/datum/seed/soybean
	name = PLANT_SOYBEAN
	seed_name = PLANT_SOYBEAN
	display_name = PLANT_SOYBEAN + "s"
	kitchen_tag = PLANT_SOYBEAN
<<<<<<< HEAD
	mutants = list(PLANT_ORANGESAPBEAN,PLANT_BLUESAPBEAN,PLANT_PURPLESAPBEAN) //CHOMPEdit - Adding mutation strain for sap beans.
=======
>>>>>>> 3083f0b730 (Adds a new ghost vis blocking area flag (#16696))
	chems = list(REAGENT_ID_NUTRIMENT = list(1,20), REAGENT_ID_SOYMILK = list(10,20))

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
