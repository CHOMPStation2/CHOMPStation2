/mob/living/simple_mob/animal/tyr/mineral_ants
	name = "metal ant"
	desc = "A large ant."
	icon_state = "normal_ant"
	icon_dead = "dead_ant"
	maxHealth = 25 //two hits with agate sword, three with spear, one with hammer, four with bow
	health = 25
	pass_flags = PASSTABLE
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

	see_in_dark = 12
	melee_damage_lower = 8 //12.5 hits unarmored. 15.625 with the tribal armor
	melee_damage_upper = 8 //Rng numbers are wierd
	attack_sharp = TRUE
	attack_edge = 1

	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/ant

	tame_items = list(/obj/item/reagent_containers/food/snacks/crabmeat = 20)

	faction = FACTION_TYR_ANT

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

/mob/living/simple_mob/animal/tyr/mineral_ants/builder
	butchery_loot = list(\
		/obj/item/stack/material/concrete = 6\
		)
	nutrition = 150
	var/build_type = /obj/random/ant_building

/mob/living/simple_mob/animal/tyr/mineral_ants/builder/handle_special()
	set waitfor = FALSE
	if(get_AI_stance() == STANCE_IDLE && !is_AI_busy() && isturf(loc))
		build_tile(loc)

/mob/living/simple_mob/animal/tyr/mineral_ants/builder/proc/build_tile(turf/T)
	if(nutrition < 75)
		return FALSE
	if(!istype(T))
		return FALSE

	var/obj/effect/ant_structure/W = locate() in T
	if(W)
		return FALSE // Already got webs here.

	visible_message(span_notice("\The [src] begins to secrete a sticky substance."))
	// Get our AI to stay still.
	set_AI_busy(TRUE)

	if(!do_mob(src, T, 5 SECONDS))
		set_AI_busy(FALSE)
		to_chat(src, span_warning("You need to stay still to spin a web on \the [T]."))
		return FALSE

	W = locate() in T
	if(W)
		return FALSE // Spamclick protection.

	adjust_nutrition(-30)
	set_AI_busy(FALSE)
	new build_type(T)
	return TRUE


/mob/living/simple_mob/animal/tyr/mineral_ants/queen //There will only be two queens on the map, and the source of further ants. Farming dies if they die.
	name = "queen ant"
	icon_state = "queen_ant"
	maxHealth = 60 //four hits with agate sword, five with spear, two with hammer, eight with bow
	health = 60
	butchery_loot = list(\
		/obj/item/stack/material/valhollide = 4\
		)
	nutrition = 480
	var/build_type = /obj/effect/spider/spiderling/antling


/mob/living/simple_mob/animal/tyr/mineral_ants/queen/handle_special()
	set waitfor = FALSE
	if(get_AI_stance() == STANCE_IDLE && !is_AI_busy() && isturf(loc))
		build_tile(loc)

/mob/living/simple_mob/animal/tyr/mineral_ants/queen/proc/build_tile(turf/T)
	if(nutrition < 30)
		return FALSE
	if(!istype(T))
		return FALSE

	var/obj/effect/ant_structure/W = locate() in T
	if(W)
		return FALSE // Already got webs here.

	visible_message(span_notice("\The [src] begins to secrete a sticky substance."))
	// Get our AI to stay still.
	set_AI_busy(TRUE)

	if(!do_mob(src, T, 5 SECONDS))
		set_AI_busy(FALSE)
		to_chat(src, span_warning("You need to stay still to spin a web on \the [T]."))
		return FALSE

	W = locate() in T
	if(W)
		return FALSE // Spamclick protection.

	adjust_nutrition(-75)
	set_AI_busy(FALSE)
	new build_type(T)
	return TRUE

/*
ANT STRUCTURES
*/

/obj/structure/mob_spawner/ant_hill
	name = "ant hole"
	desc = "An entrance to the nest of metallic ants."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "hole"
	anchored = TRUE

	spawn_delay = 10 MINUTES

	spawn_types = list(
	/mob/living/simple_mob/animal/tyr/mineral_ants = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/bronze = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/copper = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/agate = 3,
	/mob/living/simple_mob/animal/tyr/mineral_ants/quartz = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/painite = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/builder = 1
	)

	simultaneous_spawns = 5

	destructible = 1
	health = 50 //Unsure why you would want to break it but you can


/obj/effect/ant_structure
	name = "organic structure"
	desc = "A creation of metal ants."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "hole"
	anchored = TRUE
	density = FALSE
	var/health = 15 //1 thwack with sword, 2 with spear

/obj/effect/ant_structure/attackby(var/obj/item/W, var/mob/user)
	user.setClickCooldown(user.get_attack_speed(W))

	if(LAZYLEN(W.attack_verb))
		visible_message(span_warning("\The [src] has been [pick(W.attack_verb)] with \the [W][(user ? " by [user]." : ".")]"))
	else
		visible_message(span_warning("\The [src] has been attacked with \the [W][(user ? " by [user]." : ".")]"))

	var/damage = W.force / 4.0

	if(W.has_tool_quality(TOOL_WELDER))
		var/obj/item/weldingtool/WT = W.get_welder()

		if(WT.remove_fuel(0, user))
			damage = 15
			playsound(src, W.usesound, 100, 1)

	health -= damage
	healthcheck()


/obj/effect/ant_structure/bullet_act(var/obj/item/projectile/Proj)
	..()
	health -= Proj.get_structure_damage()
	healthcheck()

/obj/effect/ant_structure/proc/die()
	qdel(src)

/obj/effect/ant_structure/proc/healthcheck()
	if(health <= 0)
		die()
/obj/effect/ant_structure/trap
	name = "spore trap"
	var/modifiertype = /datum/modifier/berserk

/obj/effect/ant_structure/trap/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	if(anchored && isliving(AM))
		var/mob/living/L = AM
		if(L == /mob/living/simple_mob/animal/tyr/mineral_ants)
			return
		else if(L.m_intent == "run")
			L.visible_message(
				span_danger("[L] steps in \the [src]."),
				span_danger("You step in \the [src]!"),
				"<b>You hear a strange rustling!</b>"
				)
			attack_mob(L)
			update_icon()
	..()

/obj/effect/ant_structure/trap/proc/attack_mob(mob/living/L)
	L.add_modifier(modifiertype, 5 SECONDS)

/obj/effect/ant_structure/trap/knockdown
	icon_state = "knock_trap"
	modifiertype = /datum/modifier/poisoned

/obj/effect/ant_structure/trap/burn
	icon_state = "burn_trap"
	modifiertype = /datum/modifier/fire/weak

/obj/effect/ant_structure/trap/slowdown
	icon_state = "slow_trap"
	modifiertype = /datum/modifier/chilled

/obj/effect/ant_structure/wall
	name = "Metant wall"
	icon_state = "wall"
	density = TRUE
	health = 25 //two hits with sword.

/obj/random/ant_building
	name = "ant stucture"
	desc = "This is a metant build"
	icon_state = "tool"

/obj/random/ant_building/item_to_spawn()
	return pick(/obj/effect/ant_structure/wall,
				/obj/effect/ant_structure/trap/burn,
				/obj/effect/ant_structure/trap/knockdown,
				/obj/effect/ant_structure/trap/slowdown)


/obj/effect/spider/spiderling/antling
	name = "antling"
	desc = "A tiny ant."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "antling"
	anchored = FALSE
	layer = HIDING_LAYER
	health = 3
	grow_as = list(/mob/living/simple_mob/animal/tyr/mineral_ants,
	/mob/living/simple_mob/animal/tyr/mineral_ants/bronze,
	/mob/living/simple_mob/animal/tyr/mineral_ants/copper,
	/mob/living/simple_mob/animal/tyr/mineral_ants/agate,
	/mob/living/simple_mob/animal/tyr/mineral_ants/quartz,
	/mob/living/simple_mob/animal/tyr/mineral_ants/painite,
	/mob/living/simple_mob/animal/tyr/mineral_ants/builder)
	faction = FACTION_TYR

/obj/effect/ant_structure/webbarrier
	name = "weblike barrier"
	icon_state = "web"

/obj/effect/ant_structure/webbarrier/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /mob/living/simple_mob/animal/giant_spider))
		return TRUE
	else if(istype(mover, /mob/living))
		if(prob(80))
			to_chat(mover, span_warning("You get stuck in \the [src] for a moment."))
			return FALSE
	else if(istype(mover, /obj/item/projectile))
		return prob(30)
	return TRUE
