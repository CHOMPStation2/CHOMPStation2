/mob/living/simple_mob/mechanical/mecha/eclipse
	health = 600
	maxHealth = 600
	faction = FACTION_ECLIPSE
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	has_repair_droid = TRUE
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)
	special_attack_cooldown = 10 //This things attack soley via speical attacks hence basically no cooldown
	grab_resist = 100
	shock_resist = -0.2
	deflect_chance = 0
	movement_cooldown = 10
	damage_fatigue_mult = 0
	status_flags = null
	special_attack_min_range = 0
	special_attack_max_range = 14
	wreckage = /obj/item/prop/tyrlore/gatekeeper

	melee_miss_chance = 0
	see_in_dark = 14
	melee_damage_lower = 20
	melee_damage_upper = 20
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt
	var/attackcycle = 1
	var/artidrop = /obj/effect/artillery_attack
	var/rng_cycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/do_special_attack(atom/A)
	bullet_heck(A, 3, 3)

/mob/living/simple_mob/mechanical/mecha/eclipse/hitby(atom/movable/source, datum/thrownthing/throwingdatum) //removal of E net cheese
	if(source == /obj/item/projectile/beam/energy_net)
		return
	..(source, throwingdatum)

/datum/ai_holder/simple_mob/intentional/three_phases
	use_astar = TRUE
	wander = FALSE
	respect_confusion = FALSE
	vision_range = 14
	var/closest_desired_distance = 6

/datum/ai_holder/simple_mob/intentional/three_phases/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/intentional/three_phases/pre_special_attack(atom/A)
	if(isliving(A))
		if((holder.health / holder.getMaxHealth()) <= 0.35) //Phase three!
			holder.a_intent = I_DISARM

		else if((holder.health / holder.getMaxHealth()) <= 0.7) //Phase two
			holder.a_intent = I_GRAB

		else
			holder.a_intent = I_HURT


/datum/ai_holder/simple_mob/intentional/three_phases/no_movement

/datum/ai_holder/simple_mob/intentional/three_phases/no_movement/move_once()
	return
