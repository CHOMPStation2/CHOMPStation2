// Touch dirty, get virus. Stupid.
/obj/effect/decal/cleanable/vomit/attackby(obj/item/I, mob/user)
	if(viruses.len)
		for(var/datum/disease/D in viruses)
			user.ContractDisease(D)
	..()

/obj/effect/decal/cleanable/vomit/attackby(obj/item/I, mob/user)
	if(viruses.len)
		for(var/datum/disease/D in viruses)
			user.ContractDisease(D)
	..()

// "Yeah, let me step on this mucus" Bad. Get virus.

/obj/effect/decal/cleanable/blood/Crossed(mob/living/carbon/human/perp)
	if(viruses.len)
		for(var/datum/disease/D in viruses)
			perp.ContractDisease(D)
	..()

/obj/effect/decal/cleanable/mucus/Crossed(mob/living/carbon/human/perp)
	if(viruses.len)
		for(var/datum/disease/D in viruses)
			perp.ContractDisease(D)
	..()

/obj/effect/decal/cleanable/vomit/Crossed(mob/living/carbon/human/perp)
	if(viruses.len)
		for(var/datum/disease/D in viruses)
			perp.ContractDisease(D)
	..()
