//Bullets from z-ballistic ported over with simplified calibers, only porting whatever isnt inside of the base game

//////////////////////////////////
//								//
//			CASINGS				//
//								//
//////////////////////////////////

/obj/item/ammo_casing/a9x39
	desc = "A 9x39mm round"
	caliber = "9x39mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39

/obj/item/ammo_casing/a9x39/ap
	desc = "An armor piercing 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/ap

/obj/item/ammo_casing/a9x39/rubber
	desc = "A less-lethal 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/rubber

/obj/item/ammo_casing/a762/rubber
	desc = "A less-lethal 7.62mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/rubber

/obj/item/ammo_casing/a545/rubber
	desc = "A 5.45mm less-lethal bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a545/rubber

/obj/item/ammo_casing/a556
	desc = "A 5.56mm round"
	caliber = "5.56mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a556

/obj/item/ammo_casing/a556/ap
	desc = "An armor piercing 5.56mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/ap

/obj/item/ammo_casing/a556/hp
	desc = "A hollow point 5.56mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/hp

/obj/item/ammo_casing/a556/rubber
	desc = "A less-lethal 5.56mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/rubber

/obj/item/ammo_casing/a10x24
	desc = "A 10x24mm caseless round"
	caliber = "10x24mm"
	icon_state = "rifle-casing"
	caseless = 1
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24

/obj/item/ammo_casing/a10x24/rubber
	desc = "A less-lethal 10x24mm caseless round"
	icon_state = "rifle-casing"
	caseless = 1
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24/rubber

/obj/item/ammo_casing/a338
	desc = "A .338 Lapua round"
	caliber = ".338"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a338

/obj/item/ammo_casing/a338/ap
	desc = "An armor piercing .338 Lapua round"
	projectile_type = /obj/item/projectile/bullet/rifle/a338/ap

/obj/item/ammo_casing/a50bmg
	desc = "A .50 BMG round"
	caliber = ".50 BMG"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145

/obj/item/ammo_casing/a50bmg/ap
	desc = "An armor piercing .50 BMG round"
	projectile_type = /obj/item/projectile/bullet/rifle/a145

/obj/item/ammo_casing/a127x108
	desc = "A 12.7x108mm round. This looks scary."
	caliber = "12.7x108mm"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a127x108

/obj/item/ammo_casing/a127x108/hv
	desc = "A high velocity 12.7x108mm round"
	caliber = "12.7x108mm"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145
//////////////////////////////////
//								//
//			PROJECTILES			//
//								//
//////////////////////////////////
/obj/item/projectile/bullet/rifle/a556 //5.56mm NATO
	damage = 30
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a556/ap
	damage = 20
	armor_penetration = 25
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a556/hp
	damage = 40
	hollow_point = TRUE
	armor_penetration = -10
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a556/rubber
	armor_penetration = -10
	damage = 15
	agony = 60
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a10x24
	damage = 30
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a10x24/rubber
	armor_penetration = -10
	damage = 20
	agony = 80
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"

/obj/item/projectile/bullet/rifle/a338
	fire_sound = 'sound/weapons/ballistics/a762x54.ogg'
	damage = 45
	hitscan = 1
	penetrating = 2
	hud_state = "sniper_crude"

/obj/item/projectile/bullet/rifle/a338/ap
	armor_penetration = 50
	hud_state = "sniper_supersonic"

/obj/item/projectile/bullet/rifle/a127x108 //Bigass fuckoff LMG round, bigger than 50 BMG
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	damage = 60
	penetrating = 2
	armor_penetration=30
	hud_state = "sniper_fire"
