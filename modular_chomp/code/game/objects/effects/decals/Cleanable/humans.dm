/obj/effect/decal/cleanable/attackby(obj/item/I, mob/user)
	if(virus2.len)  // Touch dirty, get virus. Stupid.
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(user,D)

	if(istype(I, /obj/item/weapon/reagent_containers/glass/beaker/vial) && virus2.len && !sampled)
		var/obj/item/weapon/virusdish/sample
		user.balloon_alert_visible("Takes a virus sample", "Taking a virus sample")
		for(var/datum/disease2/disease/D in virus2)
			sample = new /obj/item/weapon/virusdish(src.loc)
			sample.take_sample(D)
			sampled = TRUE
	..()

/obj/effect/decal/cleanable/Crossed(mob/living/carbon/human/perp)
	if(virus2.len)
		for(var/datum/disease2/disease/D in virus2)
			infect_virus2(perp, 2)
	..()
