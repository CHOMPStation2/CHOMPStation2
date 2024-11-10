/datum/trait/neutral/metabolism_up
	can_take = ORGANICS|SYNTHETICS

/datum/trait/neutral/metabolism_down
	can_take = ORGANICS|SYNTHETICS

/datum/trait/neutral/metabolism_apex
	can_take = ORGANICS|SYNTHETICS

/datum/trait/neutral/hide
	name = "Hide"
	desc = "You can hide beneath objects!"
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/hide/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/hide) //CHOMPEdit TGPanel
