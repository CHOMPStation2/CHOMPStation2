/mob/living/simple_mob/animal/tyr/mineral_ants
	name = "metal ant"
	desc = "A large ant."
	icon_state = "new_ant"
	icon_dead = "dead_new"
	maxHealth = 15
	health = 15
	pass_flags = PASSTABLE
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	see_in_dark = 3
	melee_damage_lower = 16 //6.25 hits unarmored.
	melee_damage_upper = 16 //Rng numbers are wierd
	attack_sharp = TRUE
	attack_edge = 1

	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/tyrant

	tame_items = list(/obj/item/reagent_containers/food/snacks/crabmeat = 20)

	faction = FACTION_TYR_ANT

	butchery_loot = list(\
		/obj/item/stack/material/steel = 6\
		)

	tame_items = list(
	/obj/item/reagent_containers/food/snacks/jellyfishcore = 70
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

/mob/living/simple_mob/animal/tyr/mineral_ants/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.mode_flags = DM_FLAG_THICKBELLY | DM_FLAG_NUMBING
	B.digest_brute = 0
	B.digest_burn = 3
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 25

/mob/living/simple_mob/animal/tyr/mineral_ants/bronze //knock back ant
	name = "bronze metal ant"
	icon_state = "bronze_ant"
	icon_living = "bronze_ant"
	butchery_loot = list(\
		/obj/item/stack/material/bronze = 18\
		)
	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/bronzeant

/mob/living/simple_mob/animal/tyr/mineral_ants/bronze/apply_melee_effects(atom/A)
	..()

	if(isliving(A) && a_intent == I_HURT)
		var/mob/living/L = A
		if(L.mob_size <= MOB_MEDIUM)
			visible_message(span_danger("\The [src] sends \the [L] flying with the impact!"))
			playsound(src, "punch", 50, 1)
			L.Weaken(1)
			var/throwdir = get_dir(src, L)
			L.throw_at(get_edge_target_turf(L, throwdir), 3, 1, src)
		else
			to_chat(L, span_warning("\The [src] hits you with incredible force, but you remain in place."))
			visible_message(span_danger("\The [src] hits \the [L] with incredible force, to no visible effect!")) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.
			playsound(src, "punch", 50, 1) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.

/mob/living/simple_mob/animal/tyr/mineral_ants/copper //lighting ants
	name = "copper metal ant"
	icon_state = "copper_ant"
	icon_living = "copper_ant"
	butchery_loot = list(\
		/obj/item/stack/material/copper = 18\
		)
	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/copperant

	special_attack_min_range = 0
	special_attack_max_range = 2
	special_attack_cooldown = 10 SECONDS

/mob/living/simple_mob/animal/tyr/mineral_ants/copper/do_special_attack(atom/A)
	empulse(src.loc, 1, 2, 3, 4)
	playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)

/mob/living/simple_mob/animal/tyr/mineral_ants/agate //rushes at you and explodes
	name = "agate metal ant"
	icon_state = "agate_ant"
	icon_living = "agate_ant"
	movement_cooldown = -3
	butchery_loot = list(\
		/obj/item/stack/material/weathered_agate = 18\
		)
	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/agateant

	special_attack_min_range = 0
	special_attack_max_range = 2
	special_attack_cooldown = 10 SECONDS

/mob/living/simple_mob/animal/tyr/mineral_ants/agate/do_special_attack(atom/A)
	explosion(src.loc, 2, 1, 1, 1)

/mob/living/simple_mob/animal/tyr/mineral_ants/quartz //irl quartz is apparently tough?
	name = "quartz metal ant"
	icon_state = "quartz_ant"
	icon_living = "quartz_ant"
	armor = list(melee = 60, bullet = 50, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	butchery_loot = list(\
		/obj/item/stack/material/quartz = 18\
		)
	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/quartzant

/mob/living/simple_mob/animal/tyr/mineral_ants/painite
	name = "painite metal ant"
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
	icon_state = "painite_ant"
	icon_living = "painite_ant"
	butchery_loot = list(\
		/obj/item/stack/material/painite = 18\
		)
	meat_amount = 3
	meat_type = /obj/item/reagent_containers/food/snacks/painiteant

/mob/living/simple_mob/animal/tyr/mineral_ants/diamond //slower, tankier, more damage
	name = "diamond metal ant"
	icon_state = "diamond_ant"
	icon_living = "diamond_ant"
	maxHealth = 50
	health = 50
	melee_damage_lower = 24
	melee_damage_upper = 24
	movement_cooldown = 3
	butchery_loot = list(\
		/obj/item/stack/material/diamond = 18\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/verdantium
	name = "green metal ant"
	icon_state = "verdantium_ant"
	icon_living = "verdantium_ant"
	butchery_loot = list(\
		/obj/item/stack/material/verdantium = 18\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/uranium //if it melees, it unleashes rads
	name = "glowing metal ant"
	icon_state = "rad_ant"
	icon_living = "rad_ant"
	butchery_loot = list(\
		/obj/item/stack/material/uranium = 18\
		)
/mob/living/simple_mob/animal/tyr/mineral_ants/uranium/do_special_attack(atom/A)
	SSradiation.radiate(src, 15)

/mob/living/simple_mob/animal/tyr/mineral_ants/tritium
	name = "tritium ant"
	icon_state = "tritium_ant"
	icon_living = "tritium_ant"
	butchery_loot = list(\
		/obj/item/stack/material/tritium = 18\
		)

/mob/living/simple_mob/animal/tyr/mineral_ants/mhydro //secondary spawner
	name = "mhydro ant"
	icon_state = "mhydro_ant"
	icon_living = "mhydro_ant"
	butchery_loot = list(\
		/obj/item/stack/material/mhydrogen = 6\
		)

	special_attack_min_range = 4
	special_attack_max_range = 7
	special_attack_cooldown = 15 SECONDS

/mob/living/simple_mob/animal/tyr/mineral_ants/mydro/do_special_attack(atom/A)
	for(var/i =1 to 3)
		new /obj/effect/spider/spiderling/antling(src.loc)
	new /obj/effect/spider/spiderling/antling(src.loc)

/mob/living/simple_mob/animal/tyr/mineral_ants/builder
	name = "concrete ant"
	icon_state = "builder_ant"
	icon_living = "builder_ant"
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

	if(!do_after(src, 5 SECONDS, T))
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


/mob/living/simple_mob/animal/tyr/mineral_ants/queen //the nurses of the ants
	name = "queen ant"
	icon_state = "queen_ant"
	maxHealth = 60 //four hits with agate sword, five with spear, two with hammer, eight with bow
	health = 60
	butchery_loot = list(\
		/obj/item/stack/material/valhollide = 4\
		)
	nutrition = 630
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

	if(!do_after(src, 5 SECONDS, T))
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
	/mob/living/simple_mob/animal/tyr/mineral_ants/bronze = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/builder = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/copper = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/quartz = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/agate = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/painite = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/diamond = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/verdantium = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/tritium = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/uranium = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/mhydro = 1
	)

	simultaneous_spawns = 3

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

/obj/effect/ant_structure/trap/Crossed(atom/movable/source)
	if(source.is_incorporeal())
		return
	if(anchored && isliving(source))
		var/mob/living/L = source
		if(L.faction == FACTION_TYR_ANT)
			return
		else if(L.m_intent == I_RUN)
			L.visible_message(
				span_danger("[L] steps in \the [src]."),
				span_danger("You step in \the [src]!"),
				span_hear(span_bold("You hear a strange rustling!"))
				)
			attack_mob(L)
			update_icon()
	..()

/obj/effect/ant_structure/trap/proc/attack_mob(mob/living/L)
	L.add_modifier(modifiertype, 5 SECONDS)

/obj/effect/ant_structure/trap/burn
	icon_state = "burn_trap"
	//No modifier.

/obj/effect/ant_structure/trap/burn/attack_mob(mob/living/L)
	L.adjust_fire_stacks(5)
	L.ignite_mob()

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
				/obj/effect/ant_structure/trap/slowdown)


/obj/effect/spider/spiderling/antling
	name = "antling"
	desc = "A tiny ant."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "antling"
	anchored = FALSE
	layer = HIDING_LAYER
	health = 3
	grow_as = list(/mob/living/simple_mob/animal/tyr/mineral_ants/bronze,
	/mob/living/simple_mob/animal/tyr/mineral_ants/builder,
	/mob/living/simple_mob/animal/tyr/mineral_ants/copper,
	/mob/living/simple_mob/animal/tyr/mineral_ants/quartz,
	/mob/living/simple_mob/animal/tyr/mineral_ants/agate,
	/mob/living/simple_mob/animal/tyr/mineral_ants/painite,
	/mob/living/simple_mob/animal/tyr/mineral_ants/diamond,
	/mob/living/simple_mob/animal/tyr/mineral_ants/verdantium,
	/mob/living/simple_mob/animal/tyr/mineral_ants/tritium,
	/mob/living/simple_mob/animal/tyr/mineral_ants/uranium,
	/mob/living/simple_mob/animal/tyr/mineral_ants/mhydro)
	faction = FACTION_TYR_ANT

/obj/effect/ant_structure/webbarrier
	name = "weblike barrier"
	icon_state = "web"

/obj/effect/ant_structure/webbarrier/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /mob/living/simple_mob/animal/tyr/mineral_ants))
		return TRUE
	else if(istype(mover, /mob/living))
		if(prob(80))
			to_chat(mover, span_warning("You get stuck in \the [src] for a moment."))
			return FALSE
	else if(istype(mover, /obj/item/projectile))
		return prob(30)
	return TRUE
