/datum/seed/flower/sunflower
	mutants = list("solarflower", "soulflower")

/datum/seed/cherries
	mutants = list("cherrybomb")

/datum/seed/citrus/orange
	mutants = list("nuclearorange", "livewireorange" )

/datum/seed/flower/sunflower/soulflower
	name = "soulflower"
	seed_name = "soulflower"
	display_name = "soulflowers"
	chems = list("nutriment" = list(1,10), "souldew" = list(1,13))
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
	name = "cherrybomb"
	seed_name = "cherrybomb"
	seed_noun = "pits"
	display_name = "cherry bomb tree"
	chems = list("nutriment" = list(1,15), "neoliquidfire" = list(1,15), "cherryjelly" = list(10,15))

/datum/seed/cherries/cherrybomb/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#993399")
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#993399")

/datum/seed/citrus/orange/livewireorange
	name = "livewireorange"
	seed_name = "livewireorange"
	seed_noun = "livewireorange"
	display_name = "livewire orange tree"
	chems = list("nutriment" = list(1,15), "liquidlife" = list(1,15), "orangejuice" = list(10,15))

/datum/seed/citrus/orange/nuclearorange
	name = "nuclearorange"
	seed_name = "nuclearorange"
	seed_noun = "nuclearorange"
	display_name = "nuclear orange tree"
	chems = list("nutriment" = list(1,15), "deathblood" = list(1,15), "lemonjuice" = list(10,15))