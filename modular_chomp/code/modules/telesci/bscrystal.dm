// This proc turns the BSC or arti-BSC into a phased-creature mine.
/obj/item/bluespace_crystal/Crossed(atom/movable/M)
	. = ..()
	if(istype(M, /mob/living))
		var/mob/living/L = M
		var/datum/component/shadekin/SK = L.get_shadekin_component()
		if(SK && SK.in_phase)
			var/turf/T = get_turf(src)
			visible_message(span_notice("[src] fizzles and disappears as something interacts with it!"))
			playsound(src, pick('sound/effects/Glassbr1.ogg', 'sound/effects/Glassbr2.ogg', 'sound/effects/Glassbr3.ogg'), 50, 1)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread()
			s.set_up(5, 1, T)
			s.start()
			SK.attack_dephase(T, src)
			qdel(src)


// This proc is the 'Dephase grenade' check. range is changeable. 0=self, 1=3x3, 2=5x5, 3=7x7...
/obj/item/bluespace_crystal/proc/dephase_shadekin()
	var/turf/T = get_turf(src)
	for(var/mob/living/living in range(3, T))
		var/datum/component/shadekin/SK = living.get_shadekin_component()
		if(SK && SK.in_phase)
			SK.attack_dephase(null, src)
