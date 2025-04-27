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
	maxHealth = 1.5 LASERS_TO_KILL // 60 hp
	health = 1.5 LASERS_TO_KILL
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	desc = "A robot with strange gardening looking gear."
	loot_list = list(/obj/structure/foamedmetal = 100
			)
	pass_flags = PASSTABLE
	movement_cooldown = -3
	icon_state = "janitor"
	icon_living = "janitor"

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr
	name = "ai control center"
	desc = "A large, very important looking ai. Plating appears similiar to albative plating."
	icon_state = "powertower"
	icon_living = "powertower"
	movement_cooldown = 7
	size_multiplier = 2
	maxHealth = 500
	health = 500
	wreckage = /obj/item/prop/tyrlore/reddisc
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases/nomove
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
		addtimer(CALLBACK(src, PROC_REF(burst), A, 3), 6 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
		addtimer(CALLBACK(src, PROC_REF(alpha_slash), A, 4), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
		addtimer(CALLBACK(src, PROC_REF(omega), A, 5), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 5)
		specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
		addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, 1, 0.5 SECONDS), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr/proc/summon_janitor(atom/target, var/amount, var/next_cycle)
	if(!target)
		return
	new /mob/living/simple_mob/mechanical/combat_drone/artillery
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(summon_drones), target, amount, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/obj/item/projectile/energy/spikeenergy_ball/boss
	damage = 40
	armor_penetration = 60
	speed = 10

