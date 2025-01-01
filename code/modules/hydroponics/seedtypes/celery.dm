/datum/seed/celery
	name = PLANT_CELERY
	seed_name = PLANT_CELERY
	display_name = PLANT_CELERY
	kitchen_tag = PLANT_CELERY
	chems = list(REAGENT_ID_NUTRIMENT = list(5,20))

/datum/seed/celery/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,4)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,8)
	set_trait(TRAIT_PRODUCT_ICON,"stalk")
	set_trait(TRAIT_PRODUCT_COLOUR,"#56FD56")
	set_trait(TRAIT_PLANT_ICON,"stalk3")
