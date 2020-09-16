//////CHOMP PLANTS//////

/datum/seed/soybean/sapbean
	name = "sapbean"
	seed_name = "sapbean"
	display_name = "sapbeans"
	chems = list()

/datum/seed/soybean/sapbean/orange
	name = "orangesapbean"
	mutants = list("Purplesapbean","bluesapbean","blacksapbean")
	chems = list("orangesap" = list(0,10))

/datum/seed/soybean/sapbean/purple
	name = "purplesapbean"
	mutants = list("Orangesapbean","bluesapbean","blacksapbean")
	chems = list("purplesap" = list(0,10))

/datum/seed/soybean/sapbean/blue
	name = "bluesapbean"
	mutants = list("orangesapbean","purplesapbean","blacksapbean")
	chems = list("bluesap" = list(0,10))

/datum/seed/soybean/sapbean/black //A bean with all the power but in so little quanitity
	name = "blacksapbean"
	chems = list("bluesap" = list(1,2),"orangesap" = list(1,2),"purplesap" = list(1,2))

/datum/seed/soybean/sapbean/orange/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#FF8700")
	set_trait(TRAIT_PLANT_COLOUR,"#FF8700")
/datum/seed/soybean/sapbean/purple/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#FF00FF")
	set_trait(TRAIT_PLANT_COLOUR,"#FF00FF")
/datum/seed/soybean/sapbean/blue/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#0000FF")
	set_trait(TRAIT_PLANT_COLOUR,"#0000FF")

/datum/seed/soybean/sapbean/black/New() //the only real positive is that its 1 plant to care for rather than 3
	..()
	set_trait(TRAIT_PRODUCT_ICON,"treefruit")
	set_trait(TRAIT_PRODUCT_COLOUR,"#333333")
	set_trait(TRAIT_PLANT_COLOUR,"#333333")
	set_trait(TRAIT_PRODUCTION,3)
	set_trait(TRAIT_MATURATION,8)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_YIELD,2)

//Adding self harvesting apples which contain poison and can mutate into poisonapples
/datum/seed/apple/falling
	name = "fallingapple"
	mutants = list("poisonapple")
	can_self_harvest = 1
	chems = list("nutriment" = list(1,5),"applejuice" = list(5,10),"cyanide" = list(1,3))

/datum/seed/wheat/meatwheat
	name = "meatwheat"
	seed_name = "meatwheat"
	display_name = "meatwheat stalks"
	mutants = null
	chems = list("nutriment" = list(1,25), "protein" = list(4,10))

/datum/seed/wheat/meatwheat/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#440000")

/datum/seed/potato/voltato
	name = "voltato"
	seed_name = "voltato"
	display_name = "voltatos"
	chems = list("nutriment" = list(1,10), "shockchem" = list(0,10))
	mutants = null

/datum/seed/potato/voltato/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#E4EC2F")
	set_trait(TRAIT_POTENCY,30)
	set_trait(TRAIT_MATURATION,12)
	set_trait(TRAIT_PRODUCTION,3)
	set_trait(TRAIT_YIELD,3)

/datum/seed/flower/sunflower/solarflower
	name = "solarflower"
	seed_name = "solarflower"
	display_name = "solarflowers"
	mutants = null

/datum/seed/flower/sunflower/solarflower/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#4466b3")
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#4e74cc")
	set_trait(TRAIT_POTENCY,25)
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_YIELD,1)
	set_trait(TRAIT_SPREAD,1)

/datum/seed/flower/lavender/milkdew
	name = "milkdew"
	seed_name = "milk dew"
	display_name = "milk dew"
	chems = list("nutriment" = list(1,10), "milk" = list(4,5))
	mutants = list("sweetbreeze")

/datum/seed/flower/lavender/milkdew/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#DFDFDF")
	set_trait(TRAIT_POTENCY,5)
	set_trait(TRAIT_YIELD,3)

/datum/seed/flower/lavender/sweetbreeze
	name = "sweetbreeze"
	seed_name = "sweet breeze"
	display_name = "sweet breeze"
	chems = list("nutriment" = list(1,10), "serazine" = list(1,10))
	mutants = null

/datum/seed/flower/lavender/sweetbreeze/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#df9898")
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_MATURATION,20)
	set_trait(TRAIT_PRODUCTION,7)
	set_trait(TRAIT_YIELD,3)

// Tea plants/variants.
/datum/seed/tea
	name = "tea"
	seed_name = "tea"
	display_name = "tea plant"
	chems = list("teamush" = list(3,10))
	mutants = null
	kitchen_tag = "tea"

/datum/seed/tea/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,6)
	set_trait(TRAIT_POTENCY,20)
	set_trait(TRAIT_PRODUCT_ICON,"tea")
	set_trait(TRAIT_PRODUCT_COLOUR,"#b7e496")
	set_trait(TRAIT_PLANT_COLOUR,"#b7e496")
	set_trait(TRAIT_PLANT_ICON,"bush4")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.25)

/datum/seed/hardlightseed    //WIP: havent ported the mob and such yet, best someone more keen on these mobs does it - Jack
	name = "Type NULL Hardlight Generator"
	seed_name = "Biomechanical Hardlight generator seed"
	display_name = "Biomechanical Hardlight stem"
	mutants = null
	can_self_harvest = 1
	has_mob_product = null

/datum/seed/hardlightseed/New()
	..()
	set_trait(TRAIT_IMMUTABLE,1) //Normal genetics wont be able to do much with the mechanical parts, its more a machine than a real plant
	set_trait(TRAIT_MATURATION,1)
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,1)
	set_trait(TRAIT_POTENCY,1)
	set_trait(TRAIT_PRODUCT_ICON,"alien4")
	set_trait(TRAIT_PRODUCT_COLOUR,"#00FFFF")
	set_trait(TRAIT_PLANT_COLOUR,"#00FFFF")
	set_trait(TRAIT_PLANT_ICON,"alien4") //spooky pods
	set_trait(TRAIT_IDEAL_HEAT, 283)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0)
	set_trait(TRAIT_WATER_CONSUMPTION, 0)