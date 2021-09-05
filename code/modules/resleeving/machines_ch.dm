/obj/machinery/clonepod/transhuman/growclone(var/datum/transhuman/body_record/current_project)
	. = ..()
	//Extra clonepod behavior
	var/mob/living/carbon/human/H = occupant
	var/datum/dna2/record/R = current_project.mydna

	H.digitigrade = R.dna.digitigrade
	H.update_icons_body()