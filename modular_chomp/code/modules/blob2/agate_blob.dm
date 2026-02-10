/obj/structure/blob/core/living_agate
	desired_blob_type = /datum/blob_type/living_agate

/datum/blob_type/living_agate
	name = "agate hive"
	desc = "A tide of precursor technolgy gone wrong, energerized agate taking on an aggressive desire to spread and consume."
	effect_desc = "Spreads much faster than average"
	ai_desc = "genocidal"
	difficulty = BLOB_DIFFICULTY_SUPERHARD // Fastest spread of them all and has snowballing capabilities.
	color = "#FF3300"
	complementary_color = "#FF5125"
	spread_modifier = 1.0
	slow_spread_with_size = FALSE
	ai_aggressiveness = 95
	can_build_resources = TRUE
	attack_message = "The tide tries to swallow you"
	attack_message_living = ", and you feel your skin dissolve"
	attack_message_synth = ", and your external plating dissolves"
	faction = FACTION_TYR

	damage_type = SEARING
	armor_check = "melee"
	armor_pen = 30
	damage_lower = 35
	damage_upper = 35

	brute_multiplier = 0.5
	burn_multiplier = 0.5

	can_build_factories = TRUE
	can_build_resources = TRUE
	can_build_nodes = TRUE

	ranged_spores = TRUE
	spore_range = 7
	spore_projectile = /obj/item/projectile/energy/eclipse_boss/tyrjavelin

	spore_type = /mob/living/simple_mob/blob/spore/infesting

/datum/blob_type/living_agate/on_received_damage(var/obj/structure/blob/B, damage, damage_type, mob/living/attacker)
	if(damage > 0 && attacker && get_dist(B, attacker) <= 1)
		B.visible_message(span_danger("The [name] retaliates, lashing out at \the [attacker]!"))
		B.blob_attack_animation(attacker, B.overmind)
		attacker.blob_act(B)
	return ..()

/datum/blob_type/living_agate/on_attack(obj/structure/blob/B, mob/living/victim, def_zone)
	victim.electrocute_act(10, src, 1, def_zone)
	victim.stun_effect_act(0, 40, BP_TORSO, src, electric = TRUE)

/datum/blob_type/living_agate/on_spore_death(mob/living/simple_mob/blob/spore/S)
	if(S.is_infesting)
		return // Don't make blobs if they were on someone's head.
	var/turf/T = get_turf(S)
	var/obj/structure/blob/B = locate(/obj/structure/blob) in T
	if(B) // Is there already a blob here?  If so, just heal it.
		B.adjust_integrity(10)
	else
		B = new /obj/structure/blob/normal(T, S.overmind) // Otherwise spread it.
		B.visible_message(span_danger("\A [B] forms on \the [T] as \the [S] bursts!"))
