//Overrides
/obj/item/ammo_casing/a38
	projectile_type = /obj/item/projectile/bullet/a38

/obj/item/ammo_casing/a380
	projectile_type = /obj/item/projectile/bullet/a380

/obj/item/ammo_casing/a357
	projectile_type = /obj/item/projectile/bullet/a357

/obj/item/ammo_casing/a12g/pellet
	name = "shotgun buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/buckshot/shell

/*
 * P90 ROUNDS
*/

/obj/item/ammo_casing/a57
	name = "\improper 5.7x28mm cartridge"
	desc = "A standard caseless 5.7x28mm round."
	caliber = "5.7x28mm"
	projectile_type = /obj/item/projectile/bullet/a57
	matter = list(DEFAULT_WALL_MATERIAL = 60)
	caseless = 1 // Does not leave casings when fired. Better for performance and garbage cleanup.

/obj/item/ammo_casing/a57/ap
	desc = "A caseless armor-piercing 5.7x28mm round."
	projectile_type = /obj/item/projectile/bullet/a57/ap

/obj/item/ammo_casing/a57/hp
	desc = "A caseless hollow-point 5.7x28mm round."
	projectile_type = /obj/item/projectile/bullet/a57/hp

/obj/item/ammo_casing/a57/rubber
	desc = "A caseless rubber 5.7x28mm round."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber

/*
 * C-20R ROUNDS
*/

/obj/item/ammo_casing/a10mm
	name = "\improper 10mm cartridge"
	desc = "A standard caseless 10mm round."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/a10mm
	matter = list(MAT_STEEL = 60)
	caseless = 1

/obj/item/ammo_casing/a10mm/ap
	desc = "A caseless armor-piercing 10mm round."
	projectile_type = /obj/item/projectile/bullet/a10mm/ap

/obj/item/ammo_casing/a10mm/hp
	desc = "A caseless hollow-point 10mm round."
	projectile_type = /obj/item/projectile/bullet/a10mm/hp

/obj/item/ammo_casing/a10mm/practice
	desc = "A caseless practice 10mm round."
	icon_state = "r-casing"
	projectile_type = /obj/item/projectile/bullet/practice

/obj/item/ammo_casing/a10mm/rubber
	desc = "A caseless rubber 10mm round."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"

/obj/item/ammo_casing/a10mm/emp
	name = "\improper 10mm EMP cartridge"
	desc = "A caseless, technologically advanced 10mm round with an electromagnetic payload."
	projectile_type = /obj/item/projectile/ion/small
	icon_state = "empcasing"
	matter = list(MAT_STEEL = 60, MAT_URANIUM = 50)

/*
 * PLACEHOLDER
*/
/obj/item/ammo_casing/a762x25
	desc = "A standard 7.62x25mm Tokarev round"
	caliber = "7.62x25mm"
	projectile_type = /obj/item/projectile/bullet/a762x25

/obj/item/ammo_casing/a9x18
	desc = "A standard 9x18mm Makarov round"
	caliber = "9x18mm"
	projectile_type = /obj/item/projectile/bullet/a9x18

/obj/item/ammo_casing/a9x18/rubber
	desc = "A rubber 9x18mm Makarov round"
	caliber = "9x18mm"
	projectile_type = /obj/item/projectile/bullet/a9x18/rubber

/obj/item/ammo_casing/a762x54
	desc = "A standard 7.62x54mmR round"
	caliber = "7.62x54mmR"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	matter = list(DEFAULT_WALL_MATERIAL = 160)

/obj/item/ammo_casing/a762x54/ap
	desc = "An armor piercing 7.62x54mmR round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/ap

/obj/item/ammo_casing/a338
	desc = "A standard .338 Lapua round"
	caliber = ".338"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a338

/obj/item/ammo_casing/a338/ap
	desc = "An armor piercing .338 Lapua round"
	projectile_type = /obj/item/projectile/bullet/rifle/a338/ap

/obj/item/ammo_casing/a50bmg
	desc = "A standard .50 BMG round"
	caliber = ".50 BMG"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145

/obj/item/ammo_casing/a50bmg/ap
	desc = "An armor piercing .50 BMG round"
	projectile_type = /obj/item/projectile/bullet/rifle/a145

/obj/item/ammo_casing/a127x108
	desc = "A standard 12.7x108mm round"
	caliber = "12.7x108mm"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a127x108

/obj/item/ammo_casing/a127x108/hv
	desc = "A high velocity 12.7x108mm round"
	caliber = "12.7x108mm"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145

/obj/item/ammo_casing/a9x39
	desc = "A standard 9x39mm round"
	caliber = "9x39mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39

/obj/item/ammo_casing/a9x39/ap
	desc = "An armor piercing 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/ap

/obj/item/ammo_casing/a9x39/rubber
	desc = "A less-lethal 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/rubber

/obj/item/ammo_casing/a762x39
	desc = "A standard 7.62x39mm round"
	caliber = "7.62x39mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39

/obj/item/ammo_casing/a762x39/ap
	desc = "An armor piercing 7.62x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39/ap

/obj/item/ammo_casing/a762x39/hp
	desc = "A hollow point 7.62x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39/hp

/obj/item/ammo_casing/a762x39/rubber
	desc = "A less-lethal 7.62x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39/rubber

/obj/item/ammo_casing/a545/rubber
	desc = "A 5.45mm less-lethal bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a545/rubber

/obj/item/ammo_casing/a556
	desc = "A standard 5.56x45mm round"
	caliber = "5.56x45mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a556

/obj/item/ammo_casing/a556/ap
	desc = "An armor piercing 5.56x45mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/ap

/obj/item/ammo_casing/a556/hp
	desc = "A hollow point 5.56x45mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/hp

/obj/item/ammo_casing/a556/rubber
	desc = "A less-lethal 5.56x45mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/rubber


/obj/item/ammo_casing/a10x24
	desc = "A standard 10x24mm caseless round"
	icon_state = "rifle-casing"
	caseless = 1
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24

/obj/item/ammo_casing/a10x24/rubber
	desc = "A less-lethal 10x24mm caseless round"
	icon_state = "rifle-casing"
	caseless = 1
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24/rubber

/obj/item/ammo_casing/a45lc
	desc = "A long silver bullet... .45 LC stamped into the base."
	caliber = ".45 LC"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a45lc
	matter = list(DEFAULT_WALL_MATERIAL = 169)

/obj/item/ammo_casing/a45lc/rifle
	desc = "A long silver bullet... +P, and .45 LC stamped into the base."
	projectile_type = /obj/item/projectile/bullet/rifle/a45lc/rifle

/obj/item/ammo_casing/a45lc/rubber
	desc = "A long silver bullet... Has a rubber tip, and .45 LC stamped into the base."
	projectile_type = /obj/item/projectile/bullet/rifle/a45lc/rubber
