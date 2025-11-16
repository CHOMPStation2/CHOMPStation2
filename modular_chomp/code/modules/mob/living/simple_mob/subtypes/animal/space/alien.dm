
//what are this things?
/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/echo
	name = "alien Echopraetorian"
	color = "#424242"
	health = 300
	maxHealth = 300
	needs_reload = 1
	projectiletype = /obj/item/projectile/sonic/strong
	reload_time = 150 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/ion
	name = "alien Ionic praetorian"
	color = "#004cff"
	armor = list(melee = 0,bullet = 25,laser = 0,energy = 0,bomb = 0,bio = 100,rad = 100)
	health = 350
	maxHealth = 350
	needs_reload = 1
	projectiletype = /obj/item/projectile/arc/emp_blast
	reload_time = 150 SECONDS
	reload_max = 3
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful
	size_multiplier = 1.5

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/blaze
	name = "alien blazing praetorian"
	color = "Red"
	armor = list(melee = 0, bullet = 0, laser = 25, energy = 0, bomb = 0, bio = 100, rad = 100)
	health = 450
	maxHealth = 450
	needs_reload = 1
	projectiletype = /obj/item/projectile/energy/fireball
	reload_max = 3
	reload_time = 200
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/splat
	name = "alien splattetorian"
	color = "#a604b8"
	needs_reload = 1
	projectiletype = /obj/item/projectile/energy/blob/acid/splattering
	reload_max = 5
	reload_time = 150
	size_multiplier = 0.75

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/tank
	name = "alien Tankerling"
	armor_soak = list(melee = -15, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 0, rad = 0)
	base_attack_cooldown = 25
	color = "#ff8214"
	health = 700
	maxHealth = 700
	melee_damage_lower = 25
	melee_damage_upper = 35
	movement_cooldown = 10
	movement_shake_radius = 7
	movement_sound = 'sound/weapons/heavysmash.ogg'
	projectiletype = null
	size_multiplier = 2

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian/acid
	projectiletype = /obj/item/projectile/energy/acid

/mob/living/simple_mob/animal/space/alien/queen/empress/star
	name = "alien Staticlisk"
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful
	armor_soak = list(melee = -10, bullet = 10, laser = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	base_attack_cooldown = 15
	color = "#38b9ff"
	health = 500
	maxHealth = 500
	melee_damage_lower = 25
	melee_damage_upper = 30
	movement_cooldown = 12
	movement_shake_radius = 7
	needs_reload = 1
	projectilesound = null
	projectiletype = /obj/item/projectile/beam/chain_lightning/lesser
	reload_max = 3
	reload_time = 200
	size_multiplier = 1.5

/mob/living/simple_mob/animal/space/alien/queen/empress/tank
	name = "alien tankerlisk"
	armor_soak = list(melee = -10, bullet = 10, laser = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	base_attack_cooldown = 25
	color = "#4a4a4a"
	health = 1250
	maxHealth = 1250
	melee_damage_lower = 25
	melee_damage_upper = 30
	movement_cooldown = 12
	movement_shake_radius = 7
	needs_reload = 1
	projectilesound = null
	projectiletype = null
	size_multiplier = 3

/mob/living/simple_mob/animal/space/alien/sentinel/electro
	name = "alien Electrosentinel"
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful
	armor_soak = list(melee = 0, bullet = 5, laser = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	color = "#ccff4a"
	health = 200
	maxHealth = 200
	needs_reload = 1
	projectiletype = /obj/item/projectile/beam/stun/electric_spider
	reload_max = 5
	reload_time = 150
	size_multiplier = 1.5

/mob/living/simple_mob/animal/space/alien/sentinel/pyro
	name = "alien Pyrosentinel"
	armor = list (melee = 0, bullet = 0, laser = 15, energy = 0, bomb = 0, bio = 100, rad = 100)
	base_attack_cooldown = 15
	color = "#ff7373"
	health = 250
	maxHealth = 250
	needs_reload = 1
	projectiletype = /obj/item/projectile/bullet/incendiary/dragonflame
	reload_max = 2
	reload_time = 150

/mob/living/simple_mob/animal/space/alien/sentinel/cyro
	name = "alien cryosentinel"
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful
	armor = list(melee = 0, bullet = 15, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	color = "#4f83ff"
	health = 200
	maxHealth = 200
	needs_reload = 1
	projectiletype = /obj/item/projectile/energy/blob/freezing/splattering
	reload_max = 3
	reload_time = 100
	size_multiplier = 1.5

/mob/living/simple_mob/animal/space/alien/sentinel/acid
	projectiletype = /obj/item/projectile/energy/acid

/mob/living/simple_mob/animal/space/alien/tanky
	health = 200
	maxHealth = 200

/mob/living/simple_mob/animal/space/alien/hunterling
	name = "alien hunterling"
	attack_armor_pen = 1
	base_attack_cooldown = 2
	color = "#1cbdff"
	force_max_speed = 1
	health = 15
	maxHealth = 15
	melee_damage_lower = 1
	melee_damage_upper = 3
	size_multiplier = 0.5

/mob/living/simple_mob/animal/space/alien/hunterlisk
	name = "alien hunterlisk"
	base_attack_cooldown = 15
	color = "#575757"
	health = 150
	maxHealth = 150
	melee_damage_upper = 35
	movement_cooldown = 3
	size_multiplier = 1.25

/mob/living/simple_mob/animal/space/alien/queen/empress/mother/big
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/careful
	needs_reload = 1
	projectiletype = /obj/item/projectile/energy/blob/toxic/splattering
	reload_max = 5
	reload_time = 150
	size_multiplier = 2
