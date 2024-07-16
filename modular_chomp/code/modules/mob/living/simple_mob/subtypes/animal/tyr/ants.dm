/mob/living/simple_mob/animal/tyr/mineral_ants
	name = "metal ant"
	desc = "A large ant."
	icon_state = "normal_ant"
	maxHealth = 25 //two hits with agate sword, three with spear, one with hammer, four with bow
	health = 25
	pass_flags = PASSTABLE
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

	faction = "mineral ant"

	see_in_dark = 12 //stealth action time?
	melee_damage_lower = 8 //12.5 hits unarmored. 15.625 with the tribal armor
	melee_damage_upper = 8 //Rng numbers are wierd
	attack_sharp = TRUE
	attack_edge = 1

	meat_amount = 3
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/ant

	tame_items = list(/obj/item/weapon/reagent_containers/food/snacks/crabmeat = 20)

	butchery_loot = list(\
		/obj/item/stack/material/steel = 6\
		)

	//I know very little of this
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

/mob/living/simple_mob/animal/tyr/mineral_ants/init_vore()
	if(!voremob_loaded) //CHOMPAdd
		return //CHOMPAdd
	.=..() //CHOMPEdit
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.mode_flags = DM_FLAG_THICKBELLY | DM_FLAG_NUMBING
	B.digest_brute = 0
	B.digest_burn = 3
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 25

/mob/living/simple_mob/animal/tyr/mineral_ants/plasteel
	butchery_loot = list(\
		/obj/item/stack/material/plasteel = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/bronze
	icon_state = "bronze_ant"
	butchery_loot = list(\
		/obj/item/stack/material/bronze = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/copper
	icon_state = "copper_ant"
	butchery_loot = list(\
		/obj/item/stack/material/copper = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/agate
	icon_state = "agate_ant"
	butchery_loot = list(\
		/obj/item/stack/material/weathered_agate = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/quartz
	butchery_loot = list(\
		/obj/item/stack/material/quartz = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/painite
	butchery_loot = list(\
		/obj/item/stack/material/painite = 6\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/concrete
	butchery_loot = list(\
		/obj/item/stack/material/concrete = 6\
		)
//builder types
/mob/living/simple_mob/animal/tyr/mineral_ants/builder
	var/build_type = /obj/random/ant_building

/mob/living/simple_mob/animal/tyr/mineral_ants/builder/handle_special()
	set waitfor = FALSE
	if(get_AI_stance() == STANCE_IDLE && !is_AI_busy() && isturf(loc))
		build_tile(loc)

/mob/living/simple_mob/animal/tyr/mineral_ants/builder/proc/build_tile(turf/T)
	if(!istype(T))
		return FALSE

	var/obj/effect/ant_structure/W = locate() in T
	if(W)
		return FALSE // Already got webs here.

	visible_message(span("notice", "\The [src] begins to secrete a sticky substance.") )
	// Get our AI to stay still.
	set_AI_busy(TRUE)

	if(!do_mob(src, T, 5 SECONDS))
		set_AI_busy(FALSE)
		to_chat(src, span("warning", "You need to stay still to spin a web on \the [T]."))
		return FALSE

	W = locate() in T
	if(W)
		return FALSE // Spamclick protection.

	set_AI_busy(FALSE)
	new build_type(T)
	return TRUE