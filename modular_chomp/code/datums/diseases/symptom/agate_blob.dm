/datum/symptom/blobspores/agate
	name = "Agate Infection"
	desc = "This symptom causes the host to produce blob spores, which will leave the host at the later stages, and if the host dies, all of the spores will erupt from the host at the same time, while also producing a blob tile."
	stealth = 15
	resistance = 15
	stage_speed = -2
	transmission = 15
	level = 9
	severity = 3
	naturally_occuring = FALSE
	symptom_delay_min = 20 SECONDS
	symptom_delay_max = 40 SECONDS

/datum/symptom/blobspores/agate/pop(datum/disease/advance/A, mob/living/M)
	if(!A || !M)
		return
	var/list/blob_options = list(/obj/structure/blob/normal)
	if(factory_blob)
		blob_options += /obj/structure/blob/factory
	if(strong_blob)
		blob_options += /obj/structure/blob/shield
	if(node_blob)
		blob_options += /obj/structure/blob/node
	new /obj/structure/blob/core/living_agate(M.loc)

	M.visible_message(span_danger("A huge mass of blob and blob spores burst out of [M]!"))
