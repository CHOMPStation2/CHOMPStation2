/datum/dna
	var/digitigrade = 0

/datum/dna/Clone()
	. = ..()
	var/datum/dna/D = .
	//Data for inclusion of digitigrade leg settings in DNA
	D.digitigrade = src.digitigrade

/datum/dna/ResetUIFrom(var/mob/living/carbon/human/character)
	//inclusion of digitigrade
 	src.digitigrade = character.digitigrade
 	. = ..()