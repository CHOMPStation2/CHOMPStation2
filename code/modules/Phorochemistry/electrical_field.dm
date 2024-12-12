/obj/effect/electrical_field
	name = "electric field"
	icon = 'icons/rust.dmi'
	icon_state = "emfield_s1"
	pixel_x = 0
	pixel_y = 0
	var/last_x = -1
	var/last_y = -1

/obj/effect/electrical_field/proc/process_field()
	if(last_x == -1 && last_y == -1)
		last_x = x
		last_y = y

	if(last_x != x || last_y != y)
		qdel(src)

/obj/effect/electrical_field/proc/shock(var/mob/living/L, var/damage = 2.5)
	for(var/datum/reagent/phororeagent/R in L.reagents.reagent_list)
		if(R.id == REAGENT_ID_FULGURACIN)
			if(prob(20))
				L << span_notice("Your hairs stand up, but you resist the shock for the most part.")
			return //no shock for you

	if(L.stat != DEAD)
		L.jitteriness = 140
		if(!L.is_jittery)
			spawn(0)
				L.jittery_process()

	var/isHuman = ishuman(L)
	if(isHuman)
		var/mob/living/carbon/human/H = L
		H.apply_effect(10, STUN, 0)
		H.apply_effect(10, WEAKEN, 0)
		H.apply_effect(10, STUTTER, 0)
		H.take_overall_damage(0, damage) //has to be high or they just heal it away instantly
	else
		L.Stun(10)
		L.apply_damage(3, BURN)




/obj/effect/electrical_field/small
	name = "small electric field"

/obj/effect/electrical_field/small/process_field()
	..()
	for(var/mob/living/L in loc.contents)
		shock(L, 4) //more damage than big field because it's more condensed or something

/obj/effect/electrical_field/big
	name = "large electric field"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "emfield_s3"
	pixel_x = -32
	pixel_y = -32

/obj/effect/electrical_field/big/process_field()
	..()
	var/turf/T = null
	for(var/i = src.x - 1 to src.x + 1)
		for(var/j = src.y - 1 to src.y + 1)
			T = locate(i, j, z)
			for(var/mob/living/L in T.contents) //only the middle X 9
				shock(L)
