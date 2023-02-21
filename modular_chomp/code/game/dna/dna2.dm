//DNA entries for digitigrade functionality

/datum/dna
	var/digitigrade = 0 //0, Not FALSE, for future use as indicator for digitigrade types (0 = None, 1 = default, 2 = digitigrade birdfeet, ...ect)

/datum/dna/Clone()
	. = ..()
	var/datum/dna/D = .
	//Data for inclusion of digitigrade leg settings in DNA
	D.digitigrade = src.digitigrade

/datum/dna/ResetUIFrom(var/mob/living/carbon/human/character)
	//inclusion of digitigrade
 	src.digitigrade = character.digitigrade
 	. = ..()