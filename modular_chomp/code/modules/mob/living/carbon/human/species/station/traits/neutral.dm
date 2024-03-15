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
	H.verbs |= /mob/living/proc/hide

/datum/trait/neutral/boneless
	name = "Boneless"
	desc = "You have no bones! Though your limbs are also easier to gib in exchange."
	cost = 0
	custom_only = TRUE
	can_take = ORGANICS

/datum/trait/neutral/boneless/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	for(var/obj/item/organ/external/ex_organ in H.organs)
		ex_organ.cannot_break = 1
		ex_organ.dislocated = -1
		ex_organ.spread_dam = 1
		ex_organ.max_damage = floor(ex_organ.max_damage * 0.45)
		if(istype(ex_organ, /obj/item/organ/external/head) || istype(ex_organ, /obj/item/organ/external/chest))
			ex_organ.encased = 0
