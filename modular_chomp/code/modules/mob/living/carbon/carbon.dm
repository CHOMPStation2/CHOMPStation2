/mob/living/carbon
	var/datum/looping_sound/mob/cozyloop/cozyloop
	var/slip_reflex = FALSE
	var/synth_reag_processing = TRUE

/mob/living/carbon/Initialize()
	. = ..()

	cozyloop = new(list(src), FALSE)

/* //fix hard qdels - move overrides to code/modules/mob/living/carbon/carbon.dm
/mob/living/carbon/Destroy()
	if(cozyloop)
		QDEL_NULL(cozyloop)
	. = ..()
*/
