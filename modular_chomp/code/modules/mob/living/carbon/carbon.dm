/mob/living/carbon
	var/datum/looping_sound/mob/cozyloop/cozyloop
	var/slip_reflex = FALSE
	var/synth_reag_processing = TRUE

/mob/living/carbon/Initialize()
	. = ..()

	cozyloop = new(list(src), FALSE)

/mob/living/carbon/Destroy()
	. = ..()
	QDEL_NULL(cozyloop)

/mob/living/carbon/handle_diseases()
	for(var/thing in viruses)
		var/datum/disease/D = thing
		if(prob(D.infectivity))
			D.spread()

		if(stat != DEAD || D.allow_dead)
			D.stage_act()
