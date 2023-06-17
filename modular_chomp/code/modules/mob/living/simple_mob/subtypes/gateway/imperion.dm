/mob/living/simple_mob/mechanical/mecha/imperion
	name = "imperion"
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "imperion"
	icon_living = "imperion"
	icon_dead = "imperion"
	maxHealth = 400
	health = 400
	movement_cooldown = -1
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/gaussrifle
	melee_attack_delay = 4 SECOND
	damage_fatigue_mult = 0
	has_repair_droid = TRUE

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = null

/mob/living/simple_mob/mechanical/mecha/imperion/phase1 //Simple phase that is mostly dodge rockects
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/bullet/srmrocket
	melee_attack_delay = 4 SECOND
	ranged_attack_delay = 1.5 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase2

	var/pull_radius = 1
	var/pull_strength = STAGE_THREE

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/electric_defense(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span("warning", "\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 3)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span("warning", "\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span("warning", "\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/launch_rockets(atom/target)
	visible_message(span("warning", "\The [src] activates gravity generators!"))
	for(var/atom/A in range(pull_radius, src))
		A.singularity_pull(src, pull_strength)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/pistol/medium/hp(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase2 //Boss uses crowd control.
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/bola
	melee_attack_delay = 4 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase3

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/electric_defense(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span("warning", "\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/spore(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/ion/small(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)


/mob/living/simple_mob/mechanical/mecha/imperion/phase3 //DPS check
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/energy/gaussrifle
	melee_attack_delay = 4 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase4

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/proc/electric_defense(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/forcebolt(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/homing_bolt/wizard/lighting(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/radioactive(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase4 //Starts to slow down
	movement_cooldown = 0
	projectiletype = /obj/item/projectile/energy/plasma/vepr
	melee_attack_delay = 4 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase5

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/electric_defense(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span("warning", "\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 3)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span("warning", "\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span("warning", "\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/srmrocket(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/pistol/medium/hp(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5 //Final stand
	icon_state = "imperion-phase"
	icon_living = "imperion-phase"
	icon_dead = "imperion-phase"
	movement_cooldown = 8
	projectiletype = /obj/item/projectile/bullet/magnetic/fuelrod/tritium
	melee_attack_delay = 4 SECOND
	ranged_attack_delay = 1.5 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = null
	var/grenade_type = /obj/item/weapon/grenade/shooter/energy/tesla
	var/grenade_timer = 10
	var/grenade_type2 = /obj/item/weapon/grenade/shooter/rubber
	var/grenade_type3 = /obj/item/weapon/grenade/shooter/laserpellet

	//This is a place holder loot list
	loot_list = list(/obj/item/clothing/suit/armor/alien = 30,
			/obj/item/clothing/suit/armor/alien/tank = 30,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/weapon/gun/energy/alien = 30,
			/obj/item/weapon/gun/energy/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/item/weapon/cell/device/weapon/recharge/alien = 30,
			/obj/item/weapon/cell/device/weapon/recharge/alien = 30,
			/obj/item/clothing/suit/armor/alien = 30,
			/obj/item/clothing/suit/armor/alien/tank = 30,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/weapon/gun/energy/alien = 30,
			/obj/item/weapon/gun/energy/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/item/weapon/cell/device/weapon/recharge/alien = 30,
			/obj/item/weapon/cell/device/weapon/recharge/alien = 30,
			)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/electric_defense(atom/target)
	set waitfor = FALSE
	visible_message(span("warning", "\The [src] crackles with lighting!"))

	var/obj/item/weapon/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer
		G.activate(src)

	set_AI_busy(FALSE)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/launch_rockets(atom/target)
	set waitfor = FALSE
	visible_message(span("warning", "\The [src] prepares lasers!"))

	var/obj/item/weapon/grenade/G = new grenade_type2(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer
		G.activate(src)

	set_AI_busy(FALSE)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE
	visible_message(span("warning", "\The [src] prepares it's machine gun!"))

	var/obj/item/weapon/grenade/G = new grenade_type3(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer
		G.activate(src)

	set_AI_busy(FALSE)


//Cool boss visuals, auras, and me saying no to stun.

/obj/item/weapon/grenade/shooter/laserpellet
	name = "laser pellet grenade"
	desc = "Unleashes not hit scan lasers."
	projectile_types = list(/obj/item/projectile/energy/mob/midlaser)


/datum/modifier/bossbuff
	name = "boss_buff"
	mob_overlay_state = "red_electricity_constant"

	on_created_text = "<span class='critical'>You feel an intense and overwhelming rage overtake you as you go berserk!</span>"
	on_expired_text = "<span class='notice'>The blaze of rage inside you has ran out.</span>"
	stacks = MODIFIER_STACK_EXTEND

	disable_duration_percent = 0

/mob/living/simple_mob/mechanical/mecha/imperion/Initialize()
	add_modifier(/datum/modifier/bossbuff, null, src) // Slime is always swole.
	return ..()

/datum/modifier/aura/despair
	name = "ruin"
	mob_overlay_state = "cult_aura"

	aura_max_distance = 28

	on_created_text = "<span class='critical'>You feel like you're falling into ruin!</span>"
	on_expired_text = "<span class='notice'>The ruin feeling is gone.</span>"
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/aura/despair/tick()
	if(holder.stat == DEAD)
		expire()

	if(ishuman(holder)) // Robolimbs need this code sadly.
		var/mob/living/carbon/human/H = holder
		for(var/obj/item/organ/external/E in H.organs)
			var/obj/item/organ/external/O = E
			O.heal_damage(-0.1, -0.1, 0, 0)
	else
		holder.adjustBruteLoss(0.1)
		holder.adjustFireLoss(0,1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/proc/heal_aura()
	for(var/mob/living/L in view(src, 28))
		if(L.stat == DEAD)
			continue
		L.add_modifier(/datum/modifier/aura/despair, null, src)