#define GRAINS_PER_KG 15432.4

/obj/item/projectile/bullet
	var/diam = 9	//mm
	var/energy_add = 0
	var/velocity = 500	//Meters per second
	var/hollow_point = FALSE
	var/grains = 115	//I hope the unit is obvious
	var/energy	//Joules
	var/old_bullet_act = FALSE

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

//Pistol projectiles

/obj/item/projectile/bullet/pistol	//9x19mm
	diam = 9
	grains = 108
	velocity = 381

/obj/item/projectile/bullet/pistol/ap
	grains = 66
	energy_add = 893
	velocity = 595
	armor_penetration = 25

/obj/item/projectile/bullet/pistol/hp
	grains = 131
	velocity = 350
	energy_add = -96.18
	hollow_point = TRUE
	armor_penetration = -50

/obj/item/projectile/bullet/pistol/medium 	//.45
	diam = 11.43
	grains = 230
	velocity = 295

/obj/item/projectile/bullet/pistol/medium/ap
	grains = 173
	energy_add = 374
	velocity = 347
	armor_penetration = 25

/obj/item/projectile/bullet/pistol/medium/hp
	grains = 230
	velocity = 286
	armor_penetration = -50

/obj/item/projectile/bullet/pistol/strong	//.357 and .44 are grouped because ftw
	grains = 240
	velocity = 360

//Shotgun projectiles

/obj/item/projectile/bullet/shotgun	//Slug
	grains = 657
	velocity = 489
	armor_penetration = -50		//Slugs needed a nerf. Will probably fix the stats for shotguns in general in future updates.

/obj/item/projectile/bullet/shotgun/buckshot	//#00 Buckshot
	damage = 5
	name = "buckshot pellet"
	diam = 8.38
	grains = 53.8
	velocity = 489
	armor_penetration = -30

/obj/item/projectile/bullet/shotgun/buckshot/shell
	use_submunitions = TRUE
	submunition_spread_max = 67.5
	submunitions = list(/obj/item/projectile/bullet/shotgun/buckshot = 8)

/obj/item/ammo_casing/a12g/pellet
	name = "shotgun buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/buckshot/shell

//Rifle projectiles
/obj/item/projectile/bullet/rifle
	armor_penetration = 0 //No. Rifle rounds don't get extra AP by default, their nature already makes them more armor penetrating.

/obj/item/projectile/bullet/rifle/a762 //7.62x51 NATO
	diam = 7.62
	grains = 147
	velocity = 850

/obj/item/projectile/bullet/rifle/a762/ap
	grains = 150.5
	velocity = 854.6
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a762/hp
	grains = 175
	energy_add = -539.978
	velocity = 792
	armor_penetration = -50
	hollow_point = TRUE

/obj/item/projectile/bullet/rifle/a545
	diam = 5.45
	grains = 53
	velocity = 880

/obj/item/projectile/bullet/rifle/a545/ap
	grains = 57
	velocity = 890
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a545/hp
	hollow_point = TRUE
	armor_penetration = -50

/obj/item/projectile/bullet/rifle/a145 // 14.5×114mm
	grains = 921
	velocity = 1000

/obj/item/projectile/bullet/rifle/a145/highvel
	grains = 700
	energy_add = 9979
	velocity = 1200

/obj/item/projectile/bullet/rifle/a44rifle
	diam = 10.9
	grains = 240
	velocity = 536.448

/obj/item/projectile/bullet/rifle/a95 //I hate you. There is no real world analog for 9.5x40mm, I will guestimate from the 9x39mm russian round and give it some bonus for future points or whatever
	diam = 9.5
	grains = 310
	velocity = 365

/obj/item/projectile/bullet/rifle/a762/lmg	//This is actually 7.92x57 ffs
	diam = 7.92
	grains = 181
	velocity = 820

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