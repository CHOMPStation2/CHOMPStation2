/*
 *	This file is used as the 'host' or main file for the base creature.
 *	This ALSO hosts the Nightmare. They are extremely powerful and are not meant to be spawned more than ONCE.
*/

/mob/living/simple_mob/nightmare/
	name = "nightmare"
	desc = "You shouldn't see this. Tell a maintainer."
	icon = 'icons/mob/nightmare.dmi'
	mob_class = MOB_CLASS_ABERRATION // These things come from another reality. Duh.
	health = 20
	maxHealth = 20
	
	response_help  = "pets"
	response_disarm = "shoves"
	response_harm   = "hits"
	attacktext = "swipes at"
	
	vore_active = FALSE // These critters should not be capable of nomph. They are beings from another dimension.
	showvoreprefs = FALSE

	ai_holder_type = /datum/ai_holder/simple_mob/melee
	
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	
	minbodytemp = 0
	see_in_dark = 8

/datum/category_item/catalogue/aberration/mare
	name = "UNKNOWN - Aberration Classification: Mare"
	desc = "Classification: ????? \
	<br><br>\
	It is primarily a hunter but may also scavenge, with the capacity to eat and digest skin, bone and other animal waste. \
	The spotted hyena displays greater plasticity in its hunting and foraging behaviour than other similar carnivores; \
	it hunts alone, in small parties of 2–5 individuals or in large groups. \
	During a hunt, spotted hyenas often run through ungulate herds in order to select an individual to attack. \
	Once selected, their prey is chased over a long distance, often several kilometres, at speeds of up to 60 km/h."
	value = CATALOGUER_REWARD_SUPERHARD


/mob/living/simple_mob/nightmare/mare
	