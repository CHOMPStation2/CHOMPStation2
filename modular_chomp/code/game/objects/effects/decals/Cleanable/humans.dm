// Touch dirty, get virus. Stupid.
/obj/effect/decal/cleanable/vomit/attackby(obj/item/I, mob/user)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(user,D)
	..()

/obj/effect/decal/cleanable/mucus/attackby(obj/item/I, mob/user)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(user,D)

	if(istype(I, /obj/item/reagent_containers/glass/beaker/vial) && virus2.len && !sampled)
		var/obj/item/virusdish/sample
		user.balloon_alert_visible("Takes a virus sample", "Taking a virus sample")
		for(var/datum/disease2/disease/D in virus2)
			sample = new /obj/item/virusdish(src.loc)
			sample.take_sample(D)
			sampled = TRUE
	..()

/obj/effect/decal/cleanable/vomit/attackby(obj/item/I, mob/user)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(user,D)
	..()

// "Yeah, let me step on this mucus" Bad. Get virus.

/obj/effect/decal/cleanable/blood/Crossed(mob/living/carbon/human/perp)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(perp, 2)
	..()

/obj/effect/decal/cleanable/mucus/Crossed(mob/living/carbon/human/perp)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(perp, 2)
	..()

/obj/effect/decal/cleanable/vomit/Crossed(mob/living/carbon/human/perp)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(perp, 2)
	..()
