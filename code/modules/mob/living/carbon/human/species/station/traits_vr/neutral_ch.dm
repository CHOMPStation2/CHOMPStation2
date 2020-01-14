/datum/trait/mobegglaying
	name = "Egg laying"
	desc = "you can lay eggs"
	cost = 0

/datum/trait/mobegglaying/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/mobegglaying


/datum/trait/succubus_bite
	name = "Succubus bite"
	desc = "allows you to inject your prey with your posion"
	cost = 0

/datum/trait/succubus_bite/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/succubus_bite