/mob/living/simple_mob/animal/crystalbeast
	faction = "livingcrystal"

//simple gimmick boss
/mob/living/simple_mob/animal/crystalbeast/snail
	name = "Crystal Goliath Snail"
	desc = "A massive hulking beast made of strange crystal. Normal attacks seem like they will be ineffective. Explosions or piercing might do the trick"
	health = 150
	maxHealth = 150

	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "crystal"
	icon_dead = "crystal_dead"

	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 0, bio = 100, rad = 100)
	armor_soak = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	heat_damage_per_tick = 0

	melee_damage_lower = 5
	melee_damage_upper = 65
	size_multiplier = 4

	melee_attack_delay = 8

	movement_cooldown = 13
	loot_list = list(/obj/item/rig/ch/crystal = 100,
			)

//Note to self, make the angel here when energy is gained