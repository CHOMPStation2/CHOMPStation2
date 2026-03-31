/mob/living/simple_mob/animal/tyr/rainbow_fly
	name = "chromatic fly"
	desc = "A strange insect."
	icon_state = "firefly"
	icon_dead = "firefly_dead"
	maxHealth = 10 //One shotable by pratically anyweapon
	health = 10
	pass_flags = PASSTABLE
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/guard_limit/pointblank

	mob_size = MOB_MINISCULE //need to click the tiny sprite

	projectiletype = /obj/item/projectile/energy/blob/rainbowfly
	projectile_dispersion = 8
	projectile_accuracy = -15
	base_attack_cooldown = 5

	glow_color = "#FF3300"
	light_color = "#FF3300"
	glow_range = 4
	glow_intensity = 4

	melee_damage_lower = 5
	melee_damage_upper = 5

	hovering = TRUE

/obj/item/projectile/energy/blob/rainbowfly
	damage = 10
	check_armour = "melee"
	splatter = TRUE
	my_chems = list(REAGENT_ID_CRYPTOBIOLIN)

/mob/living/simple_mob/animal/tyr/rainbow_fly/handle_special()
	if(stat != DEAD)
		painbow_aura()
	..()

/mob/living/simple_mob/animal/tyr/rainbow_fly/proc/painbow_aura()
	for(var/mob/living/L in view(src, 7))
		L.druggy = max(L.druggy, 10)
