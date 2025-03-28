/mob/living/simple_mob/mechanical/hivebot/nanoevent
	name = "strange hivebot"
	maxHealth = 0.5 LASERS_TO_KILL // 20 hp
	health = 0.5 LASERS_TO_KILL
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "precursorhive"
	icon_living = "precursorhive"
	movement_cooldown = 0
	melee_damage_lower = 13
	melee_damage_upper = 13
	attack_armor_pen = 40
	water_resist = 1
	melee_miss_chance = 0

/mob/living/simple_mob/mechanical/hivebot/nanoevent/bright_green //swarm melee creature
	icon_state = "bright_green"
	icon_living = "bright_green"
	pass_flags = PASSTABLE

/mob/living/simple_mob/mechanical/hivebot/nanoevent/cyan //cracks the shell
	icon_state = "cyan"
	icon_living = "cyan"
	projectiletype = /obj/item/projectile/energy/wallbreaker

/mob/living/simple_mob/mechanical/hivebot/nanoevent/pink //firing squad
	icon_state = "pink"
	icon_living = "pink"
	projectiletype = /obj/item/projectile/bullet/alterhivebot

/mob/living/simple_mob/mechanical/hivebot/nanoevent/yellow
	icon_state = "yellow"
	icon_living = "yellow"
	projectiletype = /obj/item/projectile/energy/electrode

/mob/living/simple_mob/mechanical/hivebot/nanoevent/orange //Need to siege the dungeon otherwise this get involved
	icon_state = "orange"
	icon_living = "orange"
	maxHealth = 1.5 LASERS_TO_KILL // 60 hp
	health = 1.5 LASERS_TO_KILL
	projectiletype = /obj/item/projectile/bullet/incendiary/dragonflame

/mob/living/simple_mob/mechanical/hivebot/nanoevent/orange/up
	maxHealth = 3 LASERS_TO_KILL // 120
	health = 3 LASERS_TO_KILL

/mob/living/simple_mob/mechanical/hivebot/nanoevent/orange/upper
	maxHealth = 3 LASERS_TO_KILL // 120
	health = 3 LASERS_TO_KILL
	projectiletype = /obj/item/projectile/bullet/dragon

/mob/living/simple_mob/mechanical/hivebot/nanoevent/orange/max //if the station gets pushed to this then wins, I will be impressed
	maxHealth = 5 LASERS_TO_KILL //200
	health = 5 LASERS_TO_KILL
	projectiletype = /obj/item/projectile/bullet/dragon
	projectiletype = /datum/ai_holder/hostile/ranged/robust

/obj/item/projectile/energy/wallbreaker
	name = "energy bolt"
	icon_state = "chronobolt"
	damage = 13
	armor_penetration = 40
	range = 16
	penetrating = 5

/obj/item/projectile/energy/wallbreaker/boss
	damage = 30
	speed = 10

/obj/item/projectile/bullet/alterhivebot
	damage = 20
	armor_penetration = 40
	icon_state = "bullet_alt"

/obj/item/projectile/bullet/alterhivebot/boss
	damage = 30
	speed = 10

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/corehivebot
	name = "command tower hivebot"
	desc = "A large, very important looking robot."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'

/obj/item/projectile/beam/midlaser/shortrange
	range = 3

/obj/item/projectile/knockback
	name = "sonic blast"
	icon_state = "sound"
	damage = 0 //No
	damage_type = BRUTE
	check_armour = "melee"
	embed_chance = 0
	range = 12

/obj/item/projectile/pummel/on_hit(var/atom/movable/target, var/blocked = 0)
	if(isliving(target))
		var/mob/living/L = target
		var/throwdir = get_dir(firer,L)
		L.throw_at(get_edge_target_turf(L, throwdir), rand(3,6), 10)


/obj/item/projectile/metalball
	name = "ball of metal"
	icon_state = "bolter"
	speed = 0.5 //we need this to hit for the follow up, the sooner the better
	damage = 0 //but hey no real harm
	embed_chance = 0
	damage_type = BRUTE
	muzzle_type = null
	combustion = FALSE

/obj/item/projectile/metalball/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target.loc))
		var/obj/structure/foamedmetal/W = locate() in get_turf(target)
		if(!W)
			visible_message(span_danger("\The [src] splatters a lump of metal on \the [target]!"))
			new /obj/structure/foamedmetal(target.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebotboss
	name = "central command tower hivebot"
	desc = "A large, very important looking robot."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "mining_mecha"
	movement_cooldown = 7
	size_multiplier = 2
	maxHealth = 3000
	health = 3000
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebotboss/sane //Use this one in mapping, above has horribly inflated health vaules for event
	maxHealth = 900
	health = 900

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebotboss/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: BARRIER WIPE")
				specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 4), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				say("PROTOCOL: SPRAY FIRE")
				specialattackprojectile = /obj/item/projectile/bullet/alterhivebot/boss
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, 5, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 6), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				say("PROTOCOL: MICROWAVE.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 7), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 7)
				say("PROTOCOL: MACROWAVE.")
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(beglaser), A, 8), 2 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 8)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 9), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 9)
				say("PROTOCOL: WORMHOLE.")
				specialattackprojectile = /obj/item/projectile/arc/microsingulo
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 10), 2 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 10), 2 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 10)
				say("PROTOCOL: FIREWALL.")
				specialattackprojectile = /obj/item/projectile/energy/infernosphere
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 1), 2 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 1), 2 SECONDS, TIMER_DELETE_ME)

		if(I_HURT) // Phase 1. Teaching the player the three funny attacks
			if(attackcycle == 1) //metal ball
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2) //laser to be blocked by the foam we set up.
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3) //The knock back AoE.
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 4), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4) //The Get away from me AoE.
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: BARRIER WIPE")
				specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 4), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 5), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				say("PROTOCOL: MICROWAVE.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 6), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 7), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 7)
				say("PROTOCOL: FIREWALL.")
				specialattackprojectile = /obj/item/projectile/energy/infernosphere
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 1), 3 SECONDS, TIMER_DELETE_ME)


//phase 1, the tutortial
/mob/living/simple_mob/mechanical/mecha/eclipse/proc/singleproj/(atom/target, var/next_cycle)
	if(!target)
		return
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/burst(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)
	upfour(target)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	downfour(target)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	downone_leftfour(target)
	leftfour(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/miniburst_a(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/miniburst_b(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	attackcycle = next_cycle

