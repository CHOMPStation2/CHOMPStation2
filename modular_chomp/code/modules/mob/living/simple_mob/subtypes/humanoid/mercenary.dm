/mob/living/simple_mob/humanoid/merc/ranged/laser
	projectiletype = /obj/item/projectile/energy/mob/midlaser

/mob/living/simple_mob/humanoid/merc
	armor = list(melee = 20, bullet = 30, laser = 30, energy = 10, bomb = 10, bio = 100, rad = 100) //Leave the 150 health value to reflect carbon players, slightly reduced melee armor because fuck it.

/mob/living/simple_mob/humanoid/merc/melee/sword
	attack_sound = 'sound/weapons/blade1.ogg' //Use the proper sword noise

//Keeping the bullet lethality without bullet hosing
/mob/living/simple_mob/humanoid/merc/ranged/smg
	base_attack_cooldown = 1.5 SECONDS

/mob/living/simple_mob/humanoid/merc/ranged/rifle
	base_attack_cooldown = 2 SECONDS
	reload_max = 10

/mob/living/simple_mob/humanoid/merc/ranged/laser
	base_attack_cooldown = 2 SECONDS

/mob/living/simple_mob/humanoid/merc/ranged/sniper
	reload_time = 4 SECONDS
	ranged_attack_delay = 1.5 SECONDS //They are a push over, a lil faster ;)

/mob/living/simple_mob/humanoid/merc/voxpirate/ranged/suppressor
	ranged_attack_delay = 1 SECONDS
	reload_max = 20
