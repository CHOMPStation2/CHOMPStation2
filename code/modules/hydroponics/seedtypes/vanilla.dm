/datum/seed/vanilla
	name = PLANT_VANILLA
	seed_name = PLANT_VANILLA
	display_name = PLANT_VANILLA
	kitchen_tag = PLANT_VANILLA
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_VANILLA = list(2,8), REAGENT_ID_SUGAR = list(1, 4))

/datum/seed/vanilla/New()
	..()
	set_trait(TRAIT_MATURATION,7)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_PRODUCT_ICON,"chili")
	set_trait(TRAIT_PRODUCT_COLOUR,"#B57EDC")
	set_trait(TRAIT_PLANT_COLOUR,"#6B8C5E")
	set_trait(TRAIT_PLANT_ICON,"bush5")
	set_trait(TRAIT_IDEAL_LIGHT, 8)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.3)
	set_trait(TRAIT_WATER_CONSUMPTION, 0.5)
