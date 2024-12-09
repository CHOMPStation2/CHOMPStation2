/mob/living/simple_mob/animal/tyr
	minbodytemp = 175
	maxbodytemp = 500
	cold_resist = -0.5
	heat_resist = 0.75

	see_in_dark = 3 //stealth time?

	icon = 'modular_chomp/icons/mob/tyr.dmi'

	faction = FACTION_TYR

	can_be_drop_prey = FALSE
	can_be_drop_pred = TRUE

	//I know very little of this and yes, I copy and pasted from ants
	swallowTime = 3 SECONDS
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 10
	vore_stomach_name = "Stomach"
	vore_default_item_mode = IM_DIGEST
	vore_pounce_chance = 50
	vore_pounce_cooldown = 10
	vore_pounce_successrate	= 75
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE

/mob/living/simple_mob/animal/tyr/init_vore()
	if(!voremob_loaded) //CHOMPAdd
		return //CHOMPAdd
	.=..() //CHOMPEdit
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.mode_flags = DM_FLAG_THICKBELLY | DM_FLAG_NUMBING
	B.digest_brute = 1
	B.digest_burn = 1
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 25