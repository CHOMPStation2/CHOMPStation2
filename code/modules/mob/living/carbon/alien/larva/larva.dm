/mob/living/carbon/alien/larva
	name = "alien larva"
	real_name = "alien larva"
	adult_form = /mob/living/carbon/human
	speak_emote = list("hisses")
	icon_state = "larva"
	language = "Hivemind"
	maxHealth = 50 //CHOMPedit. Larva can gain a little more health on weeds/phoron to make them just a little harder to kill
	health = 25
	faction = "xeno"
	max_grown = 325 //CHOMPedit. Since xenos can reproduce without people now I decided to drastically increase the growth time

/mob/living/carbon/alien/larva/Initialize()
	. = ..()
	add_language("Xenolingua") //Bonus language. CHOMPedit
	internal_organs |= new /obj/item/organ/internal/xenos/hivenode(src)
