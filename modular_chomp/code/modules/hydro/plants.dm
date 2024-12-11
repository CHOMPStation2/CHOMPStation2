/datum/seed/flower/sunflower
	mutants = list(PLANT_SOLARFLOWER, PLANT_SOULFLOWER)

/datum/seed/cherries
	mutants = list(PLANT_CHERRYBOMB)

/datum/seed/citrus/orange
	mutants = list(PLANT_NUCLEARORANGE, PLANT_LIVEWIREORANGE )

/datum/seed/flower/sunflower/soulflower
	name = PLANT_SOULFLOWER
	seed_name = PLANT_SOULFLOWER
	display_name = PLANT_SOULFLOWER + "s"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_SOULDEW = list(1,13))
	mutants = null

/datum/seed/flower/sunflower/soulflower/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#00FFFF")
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#00FFFF")
	set_trait(TRAIT_POTENCY,25)
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_YIELD,1)
	set_trait(TRAIT_SPREAD,1)

/datum/seed/cherries/cherrybomb
	name = PLANT_CHERRYBOMB
	seed_name = PLANT_CHERRYBOMB
	seed_noun = "pits"
	display_name = "cherry bomb tree"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,15), REAGENT_ID_LIQUIDFIRE = list(1,15), REAGENT_ID_CHERRYJELLY = list(10,15))

/datum/seed/cherries/cherrybomb/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#993399")
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#993399")

/datum/seed/citrus/orange/livewireorange
	name = PLANT_LIVEWIREORANGE
	seed_name = PLANT_LIVEWIREORANGE
	seed_noun = PLANT_LIVEWIREORANGE
	display_name = "livewire orange tree"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,15), REAGENT_ID_LIQUIDLIFE = list(1,15), REAGENT_ID_ORANGEJUICE = list(10,15))

/datum/seed/citrus/orange/nuclearorange
	name = PLANT_NUCLEARORANGE
	seed_name = PLANT_NUCLEARORANGE
	seed_noun = PLANT_NUCLEARORANGE
	display_name = "nuclear orange tree"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,15), REAGENT_ID_DEATHBLOOD = list(1,15), REAGENT_ID_LEMONJUICE = list(10,15))
