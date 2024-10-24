/*
//////////////////////////////////////

Telepathy

	Hidden.
	Decreases resistance.
	Decreases stage speed significantly.
	Decreases transmittablity tremendously.
	Critical Level.

Bonus
	The user gains telepathy.

//////////////////////////////////////
*/

/datum/symptom/telepathy
	name = "Pineal Gland Decalcification"
	stealth = 2
	resistance = -2
	stage_speed = -3
	transmittable = -4
	level = 5

/datum/symptom/telepathy/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/human/H = A.affected_mob
		switch(A.stage)
			if(5, 6)
				if(!H.dna.GetSEState(REMOTETALKBLOCK))
					H.dna.SetSEState(REMOTETALKBLOCK, 1)
					domutcheck(H, null, MUTCHK_FORCED)
					to_chat(H, span_notice("Your mind expands..."))
