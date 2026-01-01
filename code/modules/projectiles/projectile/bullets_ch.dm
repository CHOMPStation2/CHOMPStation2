//Pistol projectiles
/obj/item/projectile/bullet/pistol	//9x19mm
	fire_sound = 'sound/weapons/ballistics/a9mm.ogg'

/obj/item/projectile/bullet/pistol/ap
	armor_penetration = 15

/obj/item/projectile/bullet/pistol/hp
	armor_penetration = -10

/obj/item/projectile/bullet/pistol/medium 	//.45
	fire_sound = 'sound/weapons/ballistics/a45.ogg'

/obj/item/projectile/bullet/pistol/medium/hp
	armor_penetration = -10

/obj/item/projectile/bullet/a57
	fire_sound = 'sound/weapons/ballistics/smg_heavy.ogg'
	damage = 10
	armor_penetration = 15	//Unfortunately my penetration code doesn't recognize the glory of 5.7x28 FN, so we must show it the wae.
	hud_state = "smg_light"

/obj/item/projectile/bullet/a57/ap
	damage = 15
	armor_penetration = 25		//Also, no, this isn't as high as it looks because of the formulas I was using. This would have around a 35% chance of piercing combat armor(50 bullet armor)
	hud_state = "smg_ap"

/obj/item/projectile/bullet/a57/hp
	damage = 15
	armor_penetration = -10
	hud_state = "smg"

/obj/item/projectile/bullet/a357
	fire_sound = 'sound/weapons/gunshot4.ogg'
	damage = 20
	hud_state = "revolver"

/obj/item/projectile/bullet/a357/ap
	armor_penetration = 15
	hud_state = "revolver_heavy"

/obj/item/projectile/bullet/a357/hp
	armor_penetration = -10
	hud_state = "revolver_slim"

/obj/item/projectile/bullet/a38
	fire_sound = 'sound/weapons/gunshot2.ogg'
	hud_state = "revolver_small"

/obj/item/projectile/bullet/a38/ap
	armor_penetration = 15
	hud_state = "pistol_lightap"

/obj/item/projectile/bullet/a38/hp
	armor_penetration = -10
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a762x25
	fire_sound = 'sound/weapons/gunshot2.ogg'
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a9x18
	fire_sound = 'sound/weapons/gunshot2.ogg'
	hud_state = "pistol"

/obj/item/projectile/bullet/a9x18/rubber
	armor_penetration = -10
	damage = 10
	agony = 40
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/a10mm
	fire_sound = 'sound/weapons/gunshot2.ogg'
	hud_state = "pistol"
	damage = 20

/obj/item/projectile/bullet/a10mm/ap
	armor_penetration = 15
	hud_state = "pistol_ap"

/obj/item/projectile/bullet/a10mm/hp
	armor_penetration = -10
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a10mm/rubber
	armor_penetration = -10
	damage = 10
	agony = 50
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/a380
	fire_sound = 'sound/weapons/gunshot2.ogg'
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a380/ap
	armor_penetration = 15
	hud_state = "pistol_lightap"

/obj/item/projectile/bullet/a380/hp
	armor_penetration = -10
	hud_state = "pistol_hollow"

/obj/item/projectile/bullet/a22lr
	fire_sound = 'sound/weapons/gunshot_pathetic.ogg'
	hud_state = "pistol_light"

/obj/item/projectile/bullet/a22lr/ap
	armor_penetration = 15
	hud_state = "pistol_ap"

/obj/item/projectile/bullet/a22lr/hp
	armor_penetration = -5
	hud_state = "pistol_hollow"

//Shotgun projectiles

/obj/item/projectile/bullet/shotgun	//Slug
	fire_sound = 'sound/weapons/ballistics/a12g.ogg'
	armor_penetration = -15		//Slugs needed a nerf. Will probably fix the stats for shotguns in general in future updates.

/obj/item/projectile/bullet/shotgun/buckshot	//#00 Buckshot
	damage = 13
	name = "buckshot pellet"
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

/obj/item/projectile/bullet/rifle/a762/ap
	armor_penetration = 25

/obj/item/projectile/bullet/rifle/a762/hp
	armor_penetration = -10

/obj/item/projectile/bullet/rifle/a762/rubber
	armor_penetration = -10
	damage = 25 //this still hurts like a motherfucker
	agony = 100
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a762x39 //7.62x39 Soviet
	fire_sound = 'sound/weapons/ballistics/a762.ogg'
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a762x39/ap
	armor_penetration = 25
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a762x39/hp
	armor_penetration = -10
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a762x39/rubber
	armor_penetration = -10
	damage = 15 //this still hurts like a motherfucker
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a545
	fire_sound = 'sound/weapons/ballistics/a545.ogg'

/obj/item/projectile/bullet/rifle/a545/ap
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/a545/rubber
	armor_penetration = -10
	damage = 15
	agony = 60
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a545/hp
	armor_penetration = -10

/obj/item/projectile/bullet/rifle/a556 //5.56x45mm NATO
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a556/ap
	armor_penetration = 25
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a556/hp
	armor_penetration = -10
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a556/rubber
	armor_penetration = -10
	damage = 15
	agony = 60
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a145 // 14.5×114mm
	fire_sound = 'sound/weapons/ballistics/a145.ogg'

/obj/item/projectile/bullet/rifle/a44rifle
	fire_sound = 'sound/weapons/ballistics/a44rifle.ogg'

//beware of cadyn cope above ^^ - Ocelot

/obj/item/projectile/bullet/rifle/a9x39 //We also have actual 9x39mm
	damage = 30 //9mm pistol with 7.62 cartridge? idk russiain chambers.
	fire_sound = 'sound/weapons/ballistics/a545.ogg'
	hud_state = "smartgun"

/obj/item/projectile/bullet/rifle/a9x39/ap
	armor_penetration = 25
	hud_state = "minigun"

/obj/item/projectile/bullet/rifle/a9x39/rubber
	armor_penetration = -10
	damage = 20
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a10x24/rubber
	armor_penetration = -10
	damage = 20
	agony = 80
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a762x54
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	hitscan = 1
	hud_state = "sniper_crude"

/obj/item/projectile/bullet/rifle/a762x54/ap
	armor_penetration = 35
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a338
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	damage = 45
	hitscan = 1
	penetrating = 2
	hud_state = "sniper_crude"

/obj/item/projectile/bullet/rifle/a338/ap
	armor_penetration = 50
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a50bmg
	fire_sound = 'sound/weapons/ballistics/a145.ogg'
	damage = 65
	hitscan = 1
	penetrating = 2
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a50bmg/ap
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a127x108 //Bigass fuckoff LMG round, bigger than 50 BMG
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	damage = 60
	penetrating = 2
	armor_penetration = 30
	hud_state = "sniper_fire"

/obj/item/projectile/bullet/rifle/a45lc
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/a45lc/rubber
	armor_penetration = -10
	damage = 20
	agony = 70
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"
