/datum/disease/advance/agate_rot/New(process = 1, datum/disease/advance/D, copy = 0)
	if(!D)
		name = "Agate Corruption"
		symptoms = list(new /datum/symptom/blobspores/agate, /datum/symptom/confusion, /datum/symptom/stimulant, /datum/symptom/heal/water)
	..(process, D, copy)
