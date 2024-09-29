// This proc turns the BSC or arti-BSC into a phased-creature mine.
/obj/item/bluespace_crystal/Crossed(atom/movable/M)
	. = ..()
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(H.get_species() == SPECIES_SHADEKIN && (H.ability_flags & AB_PHASE_SHIFTED))
			var/turf/T = get_turf(src)
			visible_message("<span class='notice'>[src] fizzles and disappears as something interacts with it!</span>")
			playsound(src, pick('sound/effects/Glassbr1.ogg', 'sound/effects/Glassbr2.ogg', 'sound/effects/Glassbr3.ogg'), 50, 1)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread()
			s.set_up(5, 1, T)
			s.start()
			H.attack_dephase(T, src)
			qdel(src)


// This proc is the 'Dephase grenade' check. range is changeable. 0=self, 1=3x3, 2=5x5, 3=7x7...
/obj/item/bluespace_crystal/proc/dephase_shadekin()
	var/turf/T = get_turf(src)
	for(var/thing in range(3, T))
		if(istype(thing, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = thing
			if(H.get_species() == SPECIES_SHADEKIN && (H.ability_flags & AB_PHASE_SHIFTED))
				H.attack_dephase(null, src)
