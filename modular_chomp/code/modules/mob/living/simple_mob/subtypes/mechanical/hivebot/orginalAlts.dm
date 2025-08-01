/mob/living/simple_mob/mechanical/hivebot/ranged_damage/dot
	name = "ember hivebot"
	desc = "A robot that appears to utilize fire to cook their enemies."
	icon_state = "yellow"
	icon_living = "yellow"

/mob/living/simple_mob/mechanical/hivebot/ranged_damage/declone
	name = "irradiating hivebot"
	desc = "A robot that appears to utilize radiation to destablize their foes."
	icon_state = "yellow"
	icon_living = "yellow"

	projectiletype = /obj/item/projectile/energy/declone

/mob/living/simple_mob/mechanical/hivebot/ranged_damage/siege
	projectiletype = /obj/item/projectile/arc //Polaris, don't make the same mob twice.

/mob/living/simple_mob/mechanical/hivebot/tyr
	name = "terraforming hivebot"
	maxHealth = 0.5 LASERS_TO_KILL // 20 hp
	health = 0.5 LASERS_TO_KILL
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	desc = "A robot with strange gardening looking gear."
	loot_list = list(/obj/structure/foamedmetal = 100
			)
	pass_flags = PASSTABLE
	hovering = TRUE
	movement_cooldown = -3
	icon_state = "janitor"
	icon_living = "janitor"

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr
	name = "ai control center"
	desc = "A large, very important looking ai. Plating appears similiar to albative plating."
	icon_state = "powertower"
	icon_living = "powertower"
	faction = FACTION_HIVEBOT
	movement_cooldown = 10
	size_multiplier = 2
	maxHealth = 500
	health = 500
	wreckage = /obj/item/prop/tyrlore/reddisc
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases
	anchored = 1
	armor = list(melee = 40, bullet = 40, laser = 80, energy = 80, bomb = 50, bio = 100, rad = 100)

/datum/ai_holder/simple_mob/intentional/three_phases/nomove/walk_to_destination()
	return

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(summon_janitor), A, 5, 2), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		say("Prepare. Area. Cleanse. Radiation.")
		specialattackprojectile = /obj/item/projectile/beam/gamma
		addtimer(CALLBACK(src, PROC_REF(giant_burst), A, 3), 6 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 4, 20), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 12, 1, 0.5 SECONDS), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr/proc/summon_janitor(atom/target, var/amount, var/next_cycle)
	if(!target)
		return
	new /mob/living/simple_mob/mechanical/hivebot/tyr (src.loc)
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(summon_janitor), target, amount, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/obj/item/projectile/energy/spikeenergy_ball/boss
	damage = 40
	armor_penetration = 60
	speed = 10
	crawl_destroy = TRUE

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/nanoweavetower
	name = "ai control center"
	desc = "A large, very important looking ai."
	icon_state = "bluetower"
	icon_living = "bluetower"
	faction = FACTION_HIVEBOT
	movement_cooldown = 10
	size_multiplier = 2
	maxHealth = 500
	health = 500
	wreckage = /obj/structure/loot_pile/surface/alien/engineering
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases/nomove
	anchored = 1
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 50, bio = 100, rad = 100)
	loot_list = list(/obj/item/prop/alien/junk = 100,
		/obj/item/multitool/alien = 30,
		/obj/item/stack/cable_coil/alien = 30,
		/obj/item/tool/crowbar/alien = 30,
		/obj/item/tool/screwdriver/alien = 30,
		/obj/item/weldingtool/alien = 30,
		/obj/item/tool/wirecutters/alien = 30,
		/obj/item/tool/wrench/alien = 30,
		/obj/item/cell/device/weapon/recharge/alien = 40,
		/obj/item/prop/nanoweave/terraformers = 50,
		/obj/item/prop/nanoweave/cyan = 50,
		/obj/item/prop/nanoweave/lime = 50,
		/obj/item/perfect_tele/alien = 100
			)

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/nanoweavetower/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	var/rng_cycle
	if(attackcycle == 1)
		specialattackprojectile = /obj/item/projectile/beam/burstlaser
		rng_cycle = rand(1,4)
		say("PROTOCOL: CROSS X.")
		addtimer(CALLBACK(src, PROC_REF(star_burst), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
		rng_cycle = rand(1,4)
		say("PROTOCOL: PRECISION. SWEEP.")
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 25), 2 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		specialattackprojectile = /obj/item/projectile/energy/lightingspark/nanoweave
		rng_cycle = rand(1,4)
		say("PROTOCOL: DISCHARGE.")
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 12, rng_cycle, 15), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		specialattackprojectile = /obj/item/projectile/arc/explosive_rocket/big
		rng_cycle = rand(1,4)
		Beam(A, icon_state = "r_beam", time = 1 SECOND, maxdistance = INFINITY)
		say("PROTOCOL: MISSILE.")
		addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0


/mob/living/simple_mob/mechanical/hivebot/eclipse
	name = "repurposed hivebot"
	maxHealth = 1.5 LASERS_TO_KILL // 60 hp
	health = 1.5 LASERS_TO_KILL
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	desc = "A repurposed hivebot."
	faction = FACTION_ECLIPSE
	pass_flags = PASSTABLE
	icon_state = "janitor"
	icon_living = "janitor"
	projectiletype = /obj/item/projectile/beam/midlaser/shortrange
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/pointblank

