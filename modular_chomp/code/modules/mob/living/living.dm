/mob/living/Initialize(mapload)
	. = ..()

	deaf_loop = new(list(src), FALSE)
	firesoundloop = new(list(src), FALSE)
	// stunnedloop = new(list(src), FALSE)
	if(firesoundloop) // Partly safety, partly so we can have different probs for randomization
		if(prob(40)) // Randomize our end_sound. Can't really do this easily in looping_sound without some work
			if(prob(30))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish2.ogg'
			else if(prob(20))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish3.ogg'
			else
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish4.ogg'

/mob/living/Destroy()
	. = ..()

	QDEL_NULL(deaf_loop)
	QDEL_NULL(firesoundloop)
	// QDEL_NULL(stunnedloop)

/*
Maybe later, gotta figure out a way to click yourself when in a locker etc.

/mob/living/proc/click_self()
	set name = "Click Self"
	set desc = "Clicks yourself. Useful when you can't see yourself."
	set category = "IC.Game"

	ClickOn(src)

/mob/living/Initialize(mapload)
	. = ..()
	add_verb(src,/mob/living/proc/click_self) //CHOMPEdit TGPanel
*/

/mob/living/proc/handle_vorefootstep(m_intent, turf/T) // Moved from living_ch.dm
	return FALSE
