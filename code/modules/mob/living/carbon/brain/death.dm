/mob/living/carbon/brain/death(gibbed)
	if(!gibbed && istype(container, /obj/item/mmi)) //If not gibbed but in a container.
		container.icon_state = "mmi_dead"
		return ..(gibbed,"beeps shrilly as the MMI flatlines!")
	else
		return ..(gibbed, DEATHGASP_NO_MESSAGE)

/mob/living/carbon/brain/gib()
	if(istype(container, /obj/item/mmi))
		qdel(container)//Gets rid of the MMI if there is one
	if(loc)
		if(istype(loc,/obj/item/organ/internal/brain))
			qdel(loc)//Gets rid of the brain item
	..(null,1)
