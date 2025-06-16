/mob/living/simple_mob/vore/xeyakin
	name = "xeyakin"
	desc = "A strange creature, it's fur shifting, looking like liquid metal."
	catalogue_data = list(/datum/category_item/catalogue/fauna/xeyakin)
	meat_amount = 30
	meat_type = /obj/item/reagent_containers/food/snacks/meat/xeyakin

	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	icon_state = "xeyakin" //horrid coder sprite, yay
	icon_living = "xeyakin"
	icon_dead = "xeyakin-dead"

	melee_damage_lower = 15
	melee_damage_upper = 25
	melee_miss_chance = 0
	melee_attack_delay = 0
	movement_cooldown = 0
	maxHealth = 200
	attacktext = list("slashed")
	see_in_dark = 8
	minbodytemp = 0
	maxbodytemp = 99999
	min_oxy = 0
	devourable = 0

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0


/datum/category_item/catalogue/fauna/xeyakin
	name = "Indangered Fauna - Xeyakin"
	desc = "A strange anamalous creature. There numebers were already sparse but due to the potent chemical\
	within their meat, they have been culled to a near exctinct numeber."
	value = CATALOGUER_REWARD_SUPERHARD //Stupidly rare, hopefully anyway


/obj/item/reagent_containers/food/snacks/meat/xeyakin

/obj/item/reagent_containers/food/snacks/meat/xeyakin/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_XEYAKIN_BLOOD, 2)


/datum/reagent/xeyakinblood
	name = REAGENT_XEYAKIN_BLOOD
	id = REAGENT_ID_XEYAKIN_BLOOD
	description = "The blood of a legendary beast."
	taste_description = "divine"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#FF8000"
	overdose = REAGENTS_OVERDOSE * 0.25
	scannable = 0

/datum/reagent/xeyakinblood/affect_blood(var/mob/living/carbon/M, var/alien, var/removed) //should proabaly make something more special but this isn't meant to be a proper chem
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		M.adjustBruteLoss(12 * removed) //This will uber merc prometheans. It wants to turn them to crystal.
	if(alien == IS_DIONA)
		M.heal_organ_damage(0, 12 * removed * chem_effective)
	if(alien != IS_DIONA)
		M.heal_organ_damage(8, 8 * removed * chem_effective)
