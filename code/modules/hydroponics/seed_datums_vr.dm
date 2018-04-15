
//Vore Originals

/datum/seed/size
	name = "microm"
	seed_name = "Shrinking Mushroom"
	display_name = "Shrinking mushroom trees"
	mutants = list("megam")
	kitchen_tag = "microm"
	chems = list("microcillin" = list(1,20))

/datum/seed/size/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom3")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DA00DA")
	set_trait(TRAIT_PLANT_ICON,"tree")


/datum/seed/size/megam
	name = "megam"
	seed_name = "Mega Mushroom"
	display_name = "Mega mushroom trees"
	mutants = list("microm")
	kitchen_tag = "megam"
	chems = list("macrocillin" = list(1,20))

/datum/seed/size/megam/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom6")
	set_trait(TRAIT_PLANT_ICON,"tree")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DADA00")


//Sticking here because I'm a lazy shit - Carl
// BoH/Yawn Aphro Plant. Because fucking degeneracy is abound.
/datum/seed/lustflower
	name = "gardenia"
	seed_name = "Gardenia"
	display_name = "Gardenia Produce"
	kitchen_tag = "gardenia"
	chems = list("nutriment" = list(1), "phenethylamine" = list(1,12))

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
