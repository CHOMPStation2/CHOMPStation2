/mob/living/carbon/alien/larva
	name = "alien larva"
	real_name = "alien larva"
	adult_form = /mob/living/carbon/human
	speak_emote = list("hisses")
	icon_state = "larva"
	language = "Hivemind"
<<<<<<< HEAD
	maxHealth = 50 //CHOMPedit. Larva can gain a little more health on weeds/phoron to make them just a little harder to kill
	health = 25
||||||| parent of eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul
	maxHealth = 25
	health = 25
=======
	maxHealth = 50
	health = 50
>>>>>>> eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul
	faction = "xeno"
<<<<<<< HEAD
	max_grown = 325 //CHOMPedit. Since xenos can reproduce without people now I decided to drastically increase the growth time
||||||| parent of eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul
=======
	max_grown = 325 //Increase larva growth time due to not needing hosts.
>>>>>>> eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul

/mob/living/carbon/alien/larva/Initialize()
	. = ..()
	add_language("Xenolingua") //Bonus language. CHOMPedit
	internal_organs |= new /obj/item/organ/internal/xenos/hivenode(src)
