/obj/structure/prop/blackbox/tyr_precursor_a
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_a)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_a

/obj/structure/prop/blackbox/tyr_precursor_b
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_b)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_b

/obj/structure/prop/blackbox/tyr_precursor_c
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_c)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_c

//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir. Seems sealed shut."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "elevator"
	anchored = TRUE

//ant stuff
/obj/structure/mob_spawner/ant_hill
	name = "ant hole"
	desc = "An entrance to the nest of metallic ants."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "hole"
	anchored = TRUE

	spawn_delay = 10 MINUTES

	spawn_types = list(
	/mob/living/simple_mob/animal/tyr/mineral_ants = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/plasteel = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/bronze = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/copper = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/agate = 3,
	/mob/living/simple_mob/animal/tyr/mineral_ants/quartz = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/painite = 1,
	/mob/living/simple_mob/animal/tyr/mineral_ants/concrete = 1
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

/obj/effect/ant_structure/attackby(var/obj/item/weapon/W, var/mob/user)
	user.setClickCooldown(user.get_attack_speed(W))

	if(LAZYLEN(W.attack_verb))
		visible_message("<span class='warning'>\The [src] has been [pick(W.attack_verb)] with \the [W][(user ? " by [user]." : ".")]</span>")
	else
		visible_message("<span class='warning'>\The [src] has been attacked with \the [W][(user ? " by [user]." : ".")]</span>")

	var/damage = W.force / 4.0

	if(W.has_tool_quality(TOOL_WELDER))
		var/obj/item/weapon/weldingtool/WT = W.get_welder()

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


/obj/effect/ant_structure/knock_trap
	icon_state = "knock_trap"
/*
/obj/effect/ant_structure/knock_trap/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	Bumped(AM)

/obj/effect/ant_structure/knock_trap/Bumped(mob/M as mob|obj)
	if(istype(M, /mob/living/simple_mob/animal/tyr/mineral_ant))
		return

	if(istype(M, /mob/living/))
		if(L.hovering || L.flying) //Flying should ignore this?
			return
		else
			M.weaken(3)
*/

/obj/effect/ant_structure/burn_trap
	icon_state = "burn_trap"

/*
/obj/effect/ant_structure/burn_trap/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	Bumped(AM)

/obj/effect/ant_structure/burn_trap/Bumped(mob/M as mob|obj)
	if(istype(M, /mob/living/simple_mob/animal/tyr/mineral_ant))
		return

	if(istype(M, /mob/living/))
		if(L.hovering || L.flying) //Flying should ignore this?
			return
		else
			M.add_modifier(/datum/modifier/fire/weak, 10 SECONDS)
*/

/obj/effect/ant_structure/slow_trap
	icon_state = "slow_trap"

/*
/obj/effect/ant_structure/slow_trap/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	Bumped(AM)

/obj/effect/ant_structure/slow_trap/Bumped(mob/M as mob|obj)
	if(istype(M, /mob/living/simple_mob/animal/tyr/mineral_ant))
		return

	if(istype(M, /mob/living/))
		if(L.hovering || L.flying) //Flying should ignore this?
			return
		else
			M.add_modifier(/datum/modifier/entangled, 10 SECONDS)
*/

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
				/obj/structure/mob_spawner/ant_hill,
				/obj/effect/ant_structure/burn_trap,
				/obj/effect/ant_structure/knock_trap,
				/obj/effect/ant_structure/slow_trap)
