/obj/machinery/clonepod/transhuman/growclone(var/datum/transhuman/body_record/current_project)
	. = ..()
	//Extra clonepod behavior
	var/mob/living/carbon/human/H = occupant
	var/datum/dna2/record/R = current_project.mydna

	H.digitigrade = R.dna.digitigrade // ensure clone mob has digitigrade var set appropriately
	if(H.dna.digitigrade <> R.dna.digitigrade)
		H.dna.digitigrade = R.dna.digitigrade // ensure cloned DNA is set appropriately from record??? for some reason it doesn't get set right despite the override to datum/dna/Clone()

	H.update_icons_body()