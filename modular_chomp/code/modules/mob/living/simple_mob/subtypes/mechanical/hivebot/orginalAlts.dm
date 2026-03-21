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

/mob/living/simple_mob/mechanical/hivebot/tyr //not a hivebot but stealing the 'oil puddle on death' thing
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	pass_flags = PASSTABLE
	hovering = TRUE
	movement_cooldown = 1
	faction = FACTION_TYR
	melee_damage_lower = 12
	melee_damage_upper = 12
	icon_state = "orange"
	icon_living = "orange"

/mob/living/simple_mob/mechanical/hivebot/tyr/swarm
	name = "replicating swarmer"
	maxHealth = 3
	health = 3
	icon_state = "bright_green"
	icon_living = "bright_green"

/mob/living/simple_mob/mechanical/hivebot/tyr/meteor
	name = "repair drone"
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	maxHealth = 6 LASERS_TO_KILL // 240 hp
	health = 6 LASERS_TO_KILL // 240 hp
	icon_state = "guardian"
	icon_living = "guardian"
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting/dodge
	projectiletype = /obj/item/projectile/energy/agate_lighting/fast

/mob/living/simple_mob/mechanical/hivebot/tyr/meteor/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	projectiletype = Proj
	..()

/datum/ai_holder/simple_mob/ranged/kiting/dodge

/datum/ai_holder/simple_mob/ranged/kiting/dodge/post_ranged_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)

/obj/item/projectile/energy/spikeenergy_ball/boss
	damage = 40
	armor_penetration = 60
	speed = 10
	crawl_destroy = TRUE


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

