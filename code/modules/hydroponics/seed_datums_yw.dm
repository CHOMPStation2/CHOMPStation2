/datum/seed/lustflower
	name = PLANT_GARDENIA
	seed_name = "Gardenia"
	display_name = "Gardenia Produce"
	kitchen_tag = PLANT_GARDENIA
	chems = list(REAGENT_ID_NUTRIMENT = list(1), REAGENT_ID_PHENETHYLAMINE = list(12,24))

/datum/seed/lustflower/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,12)
	set_trait(TRAIT_PRODUCTION,12)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,2)
	set_trait(TRAIT_IDEAL_LIGHT, 3)
	set_trait(TRAIT_PLANT_COLOUR,"#8BD6B6")
	set_trait(TRAIT_PLANT_ICON,"flower4")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DD9DF2")
	set_trait(TRAIT_PRODUCT_ICON,"ambrosia")
