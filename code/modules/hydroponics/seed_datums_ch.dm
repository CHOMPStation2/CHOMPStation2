//////CHOMP PLANTS//////

/datum/seed/soybean/sapbean
	name = PLANT_SAPBEAN
	seed_name = PLANT_SAPBEAN
	display_name = PLANT_SAPBEAN + "s"
	chems = list()

/datum/seed/soybean/sapbean/orange
	name = PLANT_ORANGESAPBEAN
	seed_name = "orange sapbean"
	display_name = "orange sapbean"
	mutants = list(PLANT_PURPLESAPBEAN,PLANT_BLUESAPBEAN,PLANT_BLACKSAPBEAN)
	chems = list(REAGENT_ID_ORANGESAP = list(0,10))

/datum/seed/soybean/sapbean/purple
	name = PLANT_PURPLESAPBEAN
	seed_name = "purple sapbean"
	display_name = "purple sapbean"
	mutants = list(PLANT_ORANGESAPBEAN,PLANT_BLUESAPBEAN,PLANT_BLACKSAPBEAN)
	chems = list(REAGENT_PURPLESAP = list(0,10))

/datum/seed/soybean/sapbean/blue
	name = PLANT_BLUESAPBEAN
	seed_name = "blue sapbean"
	display_name = "blue sapbean"
	mutants = list(PLANT_ORANGESAPBEAN,PLANT_PURPLESAPBEAN,PLANT_BLACKSAPBEAN)
	chems = list(REAGENT_ID_BLUESAP = list(0,10))

/datum/seed/soybean/sapbean/black //A bean with all the power but in so little quanitity
	name = PLANT_BLACKSAPBEAN
	seed_name = "black sapbean"
	display_name = "black sapbean"
	chems = list(REAGENT_ID_BLUESAP = list(1,2),REAGENT_ID_ORANGESAP = list(1,2),REAGENT_PURPLESAP = list(1,2))

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

//Commenting out because self_harvesting can be troublesome.
//  /datum/seed/apple/falling
// 	name = "fallingapple"
// 	mutants = list("poisonapple")
// 	can_self_harvest = 1
// 	chems = list(REAGENT_ID_NUTRIMENT = list(1,5),REAGENT_ID_APPLEJUICE = list(5,10),REAGENT_ID_CYANIDE = list(1,3))

/datum/seed/wheat/meatwheat
	name = PLANT_MEATWHEAT
	seed_name = PLANT_MEATWHEAT
	display_name = "meatwheat stalks"
	mutants = null
	chems = list(REAGENT_ID_NUTRIMENT = list(1,25), REAGENT_ID_PROTEIN = list(4,10))

/datum/seed/wheat/meatwheat/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#440000")

/datum/seed/potato/voltato
	name = PLANT_VOLTATO
	seed_name = PLANT_VOLTATO
	display_name = REAGENT_ID_NUTRIMENT + "s"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_SHOCKCHEM = list(0,10))
	mutants = null

/datum/seed/potato/voltato/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#E4EC2F")
	set_trait(TRAIT_POTENCY,30)
	set_trait(TRAIT_MATURATION,12)
	set_trait(TRAIT_PRODUCTION,3)
	set_trait(TRAIT_YIELD,3)

/datum/seed/flower/sunflower/solarflower
	name = PLANT_SOLARFLOWER
	seed_name = PLANT_SOLARFLOWER
	display_name = PLANT_SOLARFLOWER + "s"
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
	name = PLANT_MILKDEW
	seed_name = "milk dew"
	display_name = "milk dew"
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_MILK = list(4,5))
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
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_SERAZINE = list(1,10))
	mutants = null

/datum/seed/flower/lavender/sweetbreeze/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#df9898")
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_MATURATION,20)
	set_trait(TRAIT_PRODUCTION,7)
	set_trait(TRAIT_YIELD,3)

/datum/seed/cinnamon //WIP - I have no idea what I'm doing with growables in code right now.
	name = PLANT_CINNAMON
	seed_name = PLANT_CINNAMON
	display_name = "cinnamon tree"
	chems = list(REAGENT_ID_CINNAMONPOWDER = list(5,25))
	mutants = null
	kitchen_tag = PLANT_CINNAMON

/datum/seed/cinnamon/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON, "stalk")
	set_trait(TRAIT_PRODUCT_COLOUR, "#FF9A85")
	set_trait(TRAIT_PLANT_ICON,"tree2")
