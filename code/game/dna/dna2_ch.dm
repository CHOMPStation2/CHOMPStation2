/datum/dna
	var/digitigrade = 0

/datum/dna/Clone()
	. = ..()
	//Data for inclusion of digitigrade leg settings in DNA
	var/datum/dna/new_dna = .
	new_dna.digitigrade = digitigrade
	return new_dna

/datum/dna/ResetUIFrom(var/mob/living/carbon/human/character)
	//inclusion of digitigrade
 	src.digitigrade = character.digitigrade
 	. = ..()