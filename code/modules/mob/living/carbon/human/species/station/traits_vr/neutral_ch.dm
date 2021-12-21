/datum/trait/neutral/mobegglaying
	name = "Egg Laying"
	desc = "You can lay eggs, much like an avian."
	cost = 0

/datum/trait/neutral/mobegglaying/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/mobegglaying

/datum/trait/neutral/succubus_bite
	name = "Succubus Bite"
	desc = "Allows you to inject your prey with poison, much like a venemous snake."
	cost = 0

/datum/trait/neutral/succubus_bite/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/succubus_bite
	
/datum/trait/neutral/nutritiongrow
	name = "Growing"
	desc = "After you consume enough nutrition, you start to slowly grow while metabolizing nutrition faster."
	cost = 0
	var_changes = list("grows" = TRUE)

/datum/trait/neutral/nutritionshrink
	name = "Shrinking"
	desc = "If you don't eat enough, your body starts shrinking to make up the difference!"
	cost = 0
	var_changes = list("shrinks" = TRUE)

/datum/trait/neutral/mudking
	name = "Mudking"
	desc = "Somehow you are so filthy that tiles get dirty four times as quick from you walking on them."
	cost = 0
	var_changes = list("mudking" = TRUE)

/datum/trait/neutral/singularity_metabolism
	name = "Singularity Metabolism"
	desc = "You are insanely hungry. You can seemingly never get enough to eat. Perhaps you had a singularity as an ancestor, or maybe one is currently living inside of your gut."
	cost = 0
	var_changes = list("metabolic_rate" = 2, "hunger_factor" = 1.6, "metabolism" = 0.012)	//2x metabolism speed, 32x hunger speed
