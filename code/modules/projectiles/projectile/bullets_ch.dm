#define GRAINS_PER_KG 15432.4

/obj/item/projectile/bullet
	var/diam = 9	//mm
	var/energy_add = 0 //See note below. Adds velocity, basically.
	var/velocity = 500	//Meters per second
	var/hollow_point = FALSE	//Determines if the round leaves additional shrapnel in the wound
	var/grains = 115	//I hope the unit is obvious
	var/energy	//Joules
	var/old_bullet_act = TRUE //This makes it so that the game ignores the new ballistic stuff and uses old damage system for the bullet.

/*energy_add
Pretty much, when a bullet is a fired from a gun, it replaces the default muzzle velocity of the round with it's own muzzle velocity,
so if you want a certain round to have extra velocity, you have the option to add energy. For example,
if I have an AP round that shoots 650 m/s and the base round only shoots 600 m/s, I need to take the weight of the round in grains (say 60),
convert it to kilograms (divide by 15432 or some wacky number like that, just google grains to kilograms), then multiply the weight in kilograms by
the velocity squared for  both the 650, and 600, and subtract the result for 650 from the result for 600, then that number is what I would put there.
If you want to be lazy, or you can't find more specific numbers for the AP/HP versions of a round, then just don't bother with changing any of that and
only use the hollow_point and armor_penetration values.*/

/obj/item/projectile/bullet/launch_projectile(atom/target, target_zone, mob/user, params, angle_override, forced_spread = 0)
	energy = 0.5 * velocity * velocity * (grains / GRAINS_PER_KG) + energy_add
	sub_energy(0)
	return ..()

/obj/item/projectile/bullet/proc/sub_velocity(var/amount)
	velocity = max(0,velocity - amount)
	energy = 0.5 * velocity * velocity * (grains / GRAINS_PER_KG)

/obj/item/projectile/bullet/proc/sub_energy(var/amount)
	energy = max(0,energy - amount)
	velocity = sqrt(2*energy/(grains / GRAINS_PER_KG))

#undef GRAINS_PER_KG

//Pistol projectiles
/obj/item/projectile/bullet/pistol	//9x19mm
	fire_sound = 'sound/weapons/ballistics/a9mm.ogg'
	diam = 9
	grains = 108
	velocity = 381

/obj/item/projectile/bullet/pistol/ap
	grains = 66
	energy_add = 893
	velocity = 595
	armor_penetration = 15

/obj/item/projectile/bullet/pistol/hp
	grains = 131
	velocity = 350
	energy_add = -96.18
	hollow_point = TRUE
	armor_penetration = -10

/obj/item/projectile/bullet/pistol/medium 	//.45
	fire_sound = 'sound/weapons/ballistics/a45.ogg'
	diam = 11.43
	grains = 230
	velocity = 295

/obj/item/projectile/bullet/pistol/medium/ap
	grains = 173
	energy_add = 374
	velocity = 347
	armor_penetration = 15

/obj/item/projectile/bullet/pistol/medium/hp
	grains = 230
	velocity = 286
	armor_penetration = -10

/obj/item/projectile/bullet/pistol/strong	//.357 and .44 are grouped because ftw //Time to fix that ffs, this is just .44 now.
	diam = 10.9
	grains = 240
	velocity = 360

/obj/item/projectile/bullet/a57
	fire_sound = 'sound/weapons/ballistics/smg_heavy.ogg'
	diam = 5.7
	grains = 31
	velocity = 716
	damage = 10
	armor_penetration = 15	//Unfortunately my penetration code doesn't recognize the glory of 5.7x28 FN, so we must show it the wae.
	hud_state = "smg_light"

/obj/item/projectile/bullet/a57/ap
	grains = 23
	energy_add = 312.75
	velocity = 850
	damage = 15
	armor_penetration = 25		//Also, no, this isn't as high as it looks because of the formulas I was using. This would have around a 35% chance of piercing combat armor(50 bullet armor)
	hud_state = "smg_ap"

/obj/item/projectile/bullet/a57/hp
	hollow_point = TRUE
	damage = 15
	armor_penetration = -10
	hud_state = "smg"

/obj/item/projectile/bullet/a357
	fire_sound = 'sound/weapons/gunshot4.ogg'
	diam = 9.1
	grains = 125
	velocity = 440
	damage = 20
	hud_state = "revolver"

/obj/item/projectile/bullet/a357/ap
	energy_add = 298.07
	velocity = 480
	armor_penetration = 15
	hud_state = "revolver_heavy"

/obj/item/projectile/bullet/a357/hp
	hollow_point = TRUE
	armor_penetration = -10
	hud_state = "revolver_slim"

/obj/item/projectile/bullet/a38
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 9.1
	grains = 147
	velocity = 270
	hud_state = "revolver_small"

/obj/item/projectile/bullet/a38/ap
	grains = 125
	energy_add = 138
	velocity = 300
	armor_penetration = 15
	hud_state = "pistol_lightap"

/obj/item/projectile/bullet/a38/hp
	grains = 158
	energy_add = 175.07
	velocity = 297
	hollow_point = TRUE
	armor_penetration = -10
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a762x25
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 7.92
	grains = 85
	velocity = 469
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a9x18
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 9.27
	grains = 95
	velocity = 319
	hud_state = "pistol"

/obj/item/projectile/bullet/a9x18/rubber
	armor_penetration = -10
	grains = 102
	velocity = 301
	damage = 10
	agony = 40
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/a10mm
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 10.17
	grains = 180
	velocity = 400
	hud_state = "pistol"
	damage = 20

/obj/item/projectile/bullet/a10mm/ap
	grains = 200
	energy_add = 435
	velocity = 440
	armor_penetration = 15
	hud_state = "pistol_ap"

/obj/item/projectile/bullet/a10mm/hp
	grains = 135
	energy_add = 700.7
	velocity = 490
	armor_penetration = -10
	hollow_point = TRUE
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a10mm/rubber
	armor_penetration = -10
	grains = 142
	velocity = 301
	damage = 10
	agony = 50
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/a380
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 9
	grains= 95
	velocity = 300
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a380/ap
	grains = 45
	energy_add = 648.74
	velocity = 559
	armor_penetration = 15
	hud_state = "pistol_lightap"

/obj/item/projectile/bullet/a380/hp
	grains = 95
	energy_add = 170
	velocity = 343
	armor_penetration = -10
	hollow_point = TRUE
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a22lr
	fire_sound = 'sound/weapons/gunshot_pathetic.ogg'
	grains = 40
	diam = 5.7
	velocity = 370
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a22lr/ap
	grains = 31
	velocity = 530
	armor_penetration = 15
	hud_state = "pistol_ap"

/obj/item/projectile/bullet/a22lr/hp
	grains = 38
	velocity = 380
	hollow_point = TRUE
	armor_penetration = -5
	hud_state = "pistol_hollow"

//Shotgun projectiles

/obj/item/projectile/bullet/shotgun	//Slug
	fire_sound = 'sound/weapons/ballistics/a12g.ogg'
	grains = 657
	velocity = 489
	armor_penetration = -15		//Slugs needed a nerf. Will probably fix the stats for shotguns in general in future updates.

/obj/item/projectile/bullet/shotgun/buckshot	//#00 Buckshot
	damage = 13
	name = "buckshot pellet"
	diam = 8.38
	grains = 53.8
	velocity = 489
	armor_penetration = 0

/obj/item/projectile/bullet/shotgun/buckshot/shell
	use_submunitions = TRUE
	submunition_spread_max = 67.5
	submunitions = list(/obj/item/projectile/bullet/shotgun/buckshot = 8)
	hud_state = "shotgun_buckshot"

//Rifle projectiles
/obj/item/projectile/bullet/rifle
	armor_penetration = 0 //No. Rifle rounds don't get extra AP by default, their nature already makes them more armor penetrating.

/obj/item/projectile/bullet/rifle/a762 //7.62x51 NATO
	fire_sound = 'sound/weapons/ballistics/a762.ogg'
	diam = 7.82
	grains = 147
	velocity = 850

/obj/item/projectile/bullet/rifle/a762/ap
	grains = 150.5
	velocity = 854.6
	armor_penetration = 25

/obj/item/projectile/bullet/rifle/a762/hp
	grains = 175
	energy_add = -539.978
	velocity = 792
	armor_penetration = -10
	hollow_point = TRUE

/obj/item/projectile/bullet/rifle/a762/rubber
	armor_penetration = -10
	grains = 142
	velocity = 661
	damage = 25 //this still hurts like a motherfucker
	agony = 100
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a762x39 //7.62x39 Soviet
	fire_sound = 'sound/weapons/ballistics/a762.ogg'
	diam = 7.85
	grains = 122
	velocity = 730
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a762x39/ap
	grains = 123
	velocity = 740
	energy_add = 117.16
	armor_penetration = 25
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a762x39/hp
	hollow_point = TRUE
	armor_penetration = -10
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a762x39/rubber
	armor_penetration = -10
	grains = 142
	velocity = 661
	damage = 15 //this still hurts like a motherfucker
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a545
	fire_sound = 'sound/weapons/ballistics/a545.ogg'
	diam = 5.6
	grains = 53
	velocity = 880

/obj/item/projectile/bullet/rifle/a545/ap
	grains = 57
	velocity = 890
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/a545/rubber
	armor_penetration = -10
	grains = 82
	velocity = 761
	damage = 15
	agony = 60
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a545/hp
	hollow_point = TRUE
	armor_penetration = -10

/obj/item/projectile/bullet/rifle/a556 //5.56x45mm NATO
	diam = 5.7
	grains = 62
	velocity = 961
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a556/ap
	grains = 52
	velocity = 1030
	energy_add = 462.92
	armor_penetration = 25
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a556/hp
	hollow_point = TRUE
	armor_penetration = -10
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a556/rubber
	armor_penetration = -10
	grains = 82
	velocity = 861
	damage = 15
	agony = 60
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a145 // 14.5×114mm
	fire_sound = 'sound/weapons/ballistics/a145.ogg'
	diam = 14.88
	grains = 921
	velocity = 1000

/obj/item/projectile/bullet/rifle/a145/highvel
	grains = 700
	energy_add = 9979
	velocity = 1200

/obj/item/projectile/bullet/rifle/a44rifle
	fire_sound = 'sound/weapons/ballistics/a44rifle.ogg'
	diam = 10.9
	grains = 240
	velocity = 536.448

/obj/item/projectile/bullet/rifle/a95 //I hate you. There is no real world analog for 9.5x40mm, I will guestimate from the 9x39mm russian round and give it some bonus for future points or whatever
	diam = 9.5
	grains = 310
	velocity = 365 //cadyn cope above, beware ^^
	hud_state = "rifle"

//beware of cadyn cope above ^^ - Ocelot

/obj/item/projectile/bullet/rifle/a9x39 //We also have actual 9x39mm
	damage = 30 //9mm pistol with 7.62 cartridge? idk russiain chambers.
	fire_sound = 'sound/weapons/ballistics/a545.ogg'
	diam = 9.25
	grains = 259
	velocity = 280
	hud_state = "smartgun"

/obj/item/projectile/bullet/rifle/a9x39/ap
	grains = 267
	armor_penetration = 25
	hud_state = "minigun"

/obj/item/projectile/bullet/rifle/a9x39/rubber
	armor_penetration = -10
	grains = 282
	velocity = 161
	damage = 20
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a10x24
	grains = 210
	diam = 10.2
	velocity = 840
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a10x24/rubber
	armor_penetration = -10
	grains = 280
	velocity = 400
	damage = 20
	agony = 80
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a762/lmg	//This is actually 7.92x57 ffs
	diam = 7.92
	grains = 181
	velocity = 820
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a762x54
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	diam = 7.92
	grains = 151
	velocity = 830
	hitscan = 1
	hud_state = "sniper_crude"

/obj/item/projectile/bullet/rifle/a762x54/ap
	armor_penetration = 35
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a338
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	damage = 45
	diam = 8.61
	grains = 250
	velocity = 921
	hitscan = 1
	penetrating = 2
	hud_state = "sniper_crude"

/obj/item/projectile/bullet/rifle/a338/ap
	armor_penetration = 50
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a50bmg
	fire_sound = 'sound/weapons/ballistics/a145.ogg'
	damage = 65
	diam = 13
	grains = 750
	velocity = 860
	hitscan = 1
	penetrating = 2
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a50bmg/ap
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a127x108 //Bigass fuckoff LMG round, bigger than 50 BMG
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	damage = 60
	diam = 13
	grains = 855
	velocity = 820
	penetrating = 2
	armor_penetration=30
	hud_state = "sniper_fire"

/obj/item/projectile/bullet/rifle/a45lc //yee haw
	diam = 11.43
	grains = 250
	velocity = 600

/obj/item/projectile/bullet/rifle/a45lc/rifle
	grains = 267
	velocity = 800
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/a45lc/rubber
	armor_penetration = -10
	grains = 282
	velocity = 200
	damage = 20
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

//NOTE: Ammo casings and magazines used to be in this part of the file. They have been moved to respective files in the projectiles/ammunition folder.

//Various "We're not dealing with this shit because of how bad it is" (Some of these may be implemented into the new system with later updates)
/obj/item/projectile/bullet/magnetic
	old_bullet_act = TRUE

/obj/item/projectile/bullet/pellet
	old_bullet_act = TRUE

/obj/item/projectile/bullet/pellet/shotgun/flak
	old_bullet_act = TRUE

/obj/item/projectile/bullet/rifle/a762/hunter
	old_bullet_act = TRUE

/obj/item/projectile/bullet/rifle/a545/hunter
	old_bullet_act = TRUE

/obj/item/projectile/bullet/suffocationbullet
	old_bullet_act = TRUE

/obj/item/projectile/bullet/cyanideround
	old_bullet_act = TRUE

/obj/item/projectile/bullet/burstbullet
	old_bullet_act = TRUE

/obj/item/projectile/bullet/incendiary
	old_bullet_act = TRUE

/obj/item/projectile/bullet/practice
	old_bullet_act = TRUE

/obj/item/projectile/bullet/blank
	old_bullet_act = TRUE

/obj/item/projectile/bullet/srmrocket
	old_bullet_act = TRUE

/obj/item/projectile/bullet/chemdart
	old_bullet_act = TRUE

/obj/item/projectile/bullet/gyro
	old_bullet_act = TRUE

/obj/item/projectile/bullet/pistol/medium/ap/suppressor // adminspawn only
	name = "suppressor bullet" // this guy is Important and also Hates You
	fire_sound = 'sound/weapons/doompistol.ogg' // converted from .wavs extracted from doom 2
	damage = 10 // high rof kinda fucked up lets be real
	agony = 10 // brute easily heals, agony not so much
	armor_penetration = 30 // reduces shield blockchance
	accuracy = -20 // he do miss actually
	speed = 0.4 // if the pathfinder gets a funny burst rifle, they deserve a rival
	// that's 2x projectile speed btw
	hud_state = "monkey"

/obj/item/projectile/bullet/pistol/medium/ap/suppressor/turbo // spicy boys
	speed = 0.2 // this is 4x projectile speed
	hud_state = "monkey"
