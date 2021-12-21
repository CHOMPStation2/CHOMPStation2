/mob/living/simple_mob/animal/passive/mouse/event
	desc = "This one looks like it is growing huge!"
	var/amount_grown = 0

/mob/living/simple_mob/animal/passive/mouse/event/Life()
	. = ..()
	if(amount_grown >= 0)
		amount_grown += rand(0,4)
	if(amount_grown >= 100 && icon_state != icon_dead)
		rat()
		return

/mob/living/simple_mob/animal/passive/mouse/event/proc/rat()
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	if(prob(99.5))
		new /mob/living/simple_mob/vore/aggressive/rat/event(get_turf(src))
		qdel(src)
	else
		new /mob/living/simple_mob/vore/aggressive/chungus(get_turf(src))