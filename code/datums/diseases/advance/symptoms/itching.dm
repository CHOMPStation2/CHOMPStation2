/*
//////////////////////////////////////

Itching

	Not noticable or unnoticable.
	Resistant.
	Increases stage speed.
	Little transmittable.
	Low Level.

BONUS
	Displays an annoying message.

//////////////////////////////////////
*/

/datum/symptom/itching
	name = "Itching"
	stealth = 0
	resistance = 3
	stage_speed = 3
	transmittable = 1
	level = 1
	severity = 1

/datum/symptom/itching/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		to_chat(M, span_warning("Your [pick("back", "arm", "leg", "elbow", "head")] itches."))
	return
