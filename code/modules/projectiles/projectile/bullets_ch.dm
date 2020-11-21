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
	fire_sound = 'sound/weapons/ballistics/a9mm.ogg'
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
	fire_sound = 'sound/weapons/ballistics/a45.ogg'
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

/obj/item/projectile/bullet/pistol/strong	//.357 and .44 are grouped because ftw //Time to fix that ffs, this is just .44 now.
	diam = 10.9
	grains = 240
	velocity = 360

/obj/item/projectile/bullet/a57
	fire_sound = 'sound/weapons/ballistics/a57.ogg'
	diam = 5.7
	grains = 31
	velocity = 716
	damage = 15
	armor_penetration = 100	//Unfortunately my penetration code doesn't recognize the glory of 5.7x28 FN, so we must show it the wae.

/obj/item/projectile/bullet/a57/ap
	grains = 23
	energy_add = 312.75
	velocity = 850
	armor_penetration = 150		//Also, no, this isn't as high as it looks because of the formulas I was using. This would have around a 35% chance of piercing combat armor(50 bullet armor)

/obj/item/projectile/bullet/a57/hp
	hollow_point = TRUE
	armor_penetration = -50

/obj/item/projectile/bullet/a357
	fire_sound = 'sound/weapons/gunshot4.ogg'
	diam = 9.1
	grains = 125
	velocity = 440
	damage = 20

/obj/item/projectile/bullet/a357/ap
	energy_add = 298.07
	velocity = 480
	armor_penetration = 25

/obj/item/projectile/bullet/a357/hp
	hollow_point = TRUE
	armor_penetration = -50

/obj/item/projectile/bullet/a38
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 9.1
	grains = 147
	velocity = 270

/obj/item/projectile/bullet/a38/ap
	grains = 125
	energy_add = 138
	velocity = 300
	armor_penetration = 25

/obj/item/projectile/bullet/a38/hp
	grains = 158
	energy_add = 175.07
	velocity = 297
	hollow_point = TRUE
	armor_penetration = -50

/obj/item/projectile/bullet/a10mm
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 10.17
	grains = 180
	velocity = 400

/obj/item/projectile/bullet/a10mm/ap
	grains = 200
	energy_add = 435
	velocity = 440
	armor_penetration = 50

/obj/item/projectile/bullet/a10mm/hp
	grains = 135
	energy_add = 700.7
	velocity = 490
	armor_penetration = -50
	hollow_point = TRUE

/obj/item/projectile/bullet/a380
	fire_sound = 'sound/weapons/gunshot2.ogg'
	diam = 9
	grains= 95
	velocity = 300

/obj/item/projectile/bullet/a380/ap
	grains = 45
	energy_add = 648.74
	velocity = 559
	armor_penetration = 25

/obj/item/projectile/bullet/a380/hp
	grains = 95
	energy_add = 170
	velocity = 343
	armor_penetration = -50
	hollow_point = TRUE

//Shotgun projectiles

/obj/item/projectile/bullet/shotgun	//Slug
	fire_sound = 'sound/weapons/ballistics/a12g.ogg'
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
	fire_sound = 'sound/weapons/ballistics/a762.ogg'
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
	fire_sound = 'sound/weapons/ballistics/a545.ogg'
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
	fire_sound = 'sound/weapons/ballistics/a145.ogg'
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
	velocity = 365

/obj/item/projectile/bullet/rifle/a762/lmg	//This is actually 7.92x57 ffs
	diam = 7.92
	grains = 181
	velocity = 820

/obj/item/projectile/bullet/rifle/a762x54
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	diam = 7.62
	grains = 151
	velocity = 830
	hitscan = 1

/obj/item/projectile/bullet/rifle/a762x54/ap
	armor_penetration = 50

//Time to replace projectiles with their proper counterparts now that we have added them.
/obj/item/ammo_casing/a10mm
	projectile_type = /obj/item/projectile/bullet/a10mm

/obj/item/ammo_casing/a38
	projectile_type = /obj/item/projectile/bullet/a38

/obj/item/ammo_casing/a380
	projectile_type = /obj/item/projectile/bullet/a380

/obj/item/ammo_casing/a357
	projectile_type = /obj/item/projectile/bullet/a357

/obj/item/ammo_casing/a57
	desc = "A standard 5.7x28mm round"
	caliber = "5.7x28mm"
	projectile_type = /obj/item/projectile/bullet/a57
	matter = list(DEFAULT_WALL_MATERIAL = 60)

/obj/item/ammo_casing/a57/ap
	desc = "An armor piercing 5.7x28mm round"
	projectile_type = /obj/item/projectile/bullet/a57/ap

/obj/item/ammo_casing/a57/hp
	desc = "A hollow point 5.7x28mm round"
	projectile_type = /obj/item/projectile/bullet/a57/ap

/obj/item/ammo_casing/a57/rubber
	desc = "A rubber 5.7x28mm round"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber

/obj/item/ammo_magazine/m9mmp90	//congratulations you are now being converted 5.7x28mm, a.k.a the round the p90 actually uses.
	name = "large capacity top mounted magazine (5.7x28mm armor-piercing)"	//Ugh, we'll leave it AP I guess
	ammo_type = /obj/item/ammo_casing/a57/ap
	caliber = "5.7x28mm"

/obj/item/ammo_casing/a762x54
	desc = "A standard 7.62x54mmR round"
	caliber = "7.62x54mmR"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54
	matter = list(DEFAULT_WALL_MATERIAL = 160)

/obj/item/ammo_casing/a762x54/ap
	desc = "An armor piercing 7.62x54mmR round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54/ap

/obj/item/ammo_magazine/m762svd	//You are now being converted to 7.62x54mmR :3
	name = "\improper SVD magazine (7.62x54mmR)"
	caliber = "7.62x54mmR"
	ammo_type = /obj/item/ammo_casing/a762x54

/obj/item/ammo_magazine/m762svd/ap
	name = "\improper SVD magazine (7.62x54mmR armor-piercing)"
	ammo_type = /obj/item/ammo_casing/a762x54/ap

//New magazines
/obj/item/ammo_magazine/a57
	name = "five-seven magazine(5.7x28mm standard)"
	icon_state = "fiveseven"
	max_ammo = 20
	mag_type = MAGAZINE
	caliber= "5.7x28mm"
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	multiple_sprites = 0
	ammo_type = /obj/item/ammo_casing/a57

/obj/item/ammo_magazine/a57/ap
	name = "five-seven magazine(5.7x28mm armor-piercing)"
	ammo_type = /obj/item/ammo_casing/a57/ap

/obj/item/ammo_magazine/a57/hp
	name = "five-seven magazine(5.7x28mm hollow-point)"
	ammo_type = /obj/item/ammo_casing/a57/hp

/obj/item/ammo_magazine/a57/rubber
	name = "five-seven magazine(5.7x28mm rubber)"
	ammo_type = /obj/item/ammo_casing/a57/rubber

/obj/item/ammo_magazine/mp5mag
	name = "mp5 magazine(9x19mm standard)"
	icon = 'icons/obj/ammo_vr.dmi'
	icon_state = "smg"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "9mm"
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a9mm

/obj/item/ammo_magazine/mp5mag/ap
	name = "mp5 magazine(9x19mm armor-piercing)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/mp5mag/hp
	name = "mp5 magazine(9x19mm hollow-point)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/mp5mag/rubber
	name = "mp5 magazine(9x19mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber

//Add some autolathe entries for the new converted mags
/datum/category_item/autolathe/arms/smg_mp5
	name = "mp5 magazine(9x19mm standard)"
	path = /obj/item/ammo_magazine/mp5mag
	hidden = 1

/datum/category_item/autolathe/arms/smg_mp5_ap
	name = "mp5 magazine(9x19mm armor-piercing)"
	path = /obj/item/ammo_magazine/mp5mag/ap
	hidden = 1

/datum/category_item/autolathe/arms/smg_mp5_hp
	name = "mp5 magazine(9x19mm hollow-point)"
	path = /obj/item/ammo_magazine/mp5mag/hp
	hidden = 1

/datum/category_item/autolathe/arms/smg_mp5_rubber
	name = "mp5 magazine(9x19mm rubber)"
	path = /obj/item/ammo_magazine/mp5mag/rubber

/datum/category_item/autolathe/arms/pistol_fiveseven
	name = "five-seven magazine(5.7x28mm standard)"
	path = /obj/item/ammo_magazine/a57
	hidden = 1

/datum/category_item/autolathe/arms/pistol_fiveseven_ap
	name = "five-seven magazine(5.7x28mm armor-piercing)"
	path = /obj/item/ammo_magazine/a57/ap
	hidden = 1

/datum/category_item/autolathe/arms/pistol_fiveseven_hp
	name = "five-seven magazine(5.7x28mm hollow-point)"
	path = /obj/item/ammo_magazine/a57/hp
	hidden = 1

/datum/category_item/autolathe/arms/pistol_fiveseven_rubber
	name = "five-seven magazine(5.7x28mm rubber)"
	path = /obj/item/ammo_magazine/a57/rubber

/datum/category_item/autolathe/arms/smg_p90
	name = "large capacity top mounted magazine (5.7x28mm armor-piercing)"
	path = /obj/item/ammo_magazine/m9mmp90
	hidden = 1

/datum/category_item/autolathe/arms/svd_762
	name = "SVD magazine (7.62x54mmR)"
	path = /obj/item/ammo_magazine/m762svd
	hidden = 1

/datum/category_item/autolathe/arms/svd_762_ap
	name = "SVD magazine (7.62x54mmR armor-piercing)"
	path = /obj/item/ammo_magazine/m762svd/ap
	hidden = 1

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