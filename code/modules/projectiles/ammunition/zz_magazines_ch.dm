//Overrides
/obj/item/ammo_magazine/m9mmp90	//congratulations you are now being converted 5.7x28mm, a.k.a the round the p90 actually uses.
	name = "large capacity top mounted magazine (5.7x28mm armor-piercing)"	//Ugh, we'll leave it AP I guess
	ammo_type = /obj/item/ammo_casing/a57/ap
	caliber = "5.7x28mm"

/obj/item/ammo_magazine/m762svd	//You are now being converted to 7.62x54mmR :3
	name = "\improper SVD magazine (7.62x54mmR)"
	caliber = "7.62x54mmR"
	ammo_type = /obj/item/ammo_casing/a762x54

/obj/item/ammo_magazine/m762svd/ap
	name = "\improper SVD magazine (7.62x54mmR armor-piercing)"
	ammo_type = /obj/item/ammo_casing/a762x54/ap

//New stuff
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
	matter = list(DEFAULT_WALL_MATERIAL = 900)
	ammo_type = /obj/item/ammo_casing/a57/ap

/obj/item/ammo_magazine/a57/hp
	name = "five-seven magazine(5.7x28mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 900)
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
	matter = list(DEFAULT_WALL_MATERIAL = 900)

/obj/item/ammo_magazine/mp5mag/hp
	name = "mp5 magazine(9x19mm hollow-point)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/mp5mag/rubber
	name = "mp5 magazine(9x19mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber

/obj/item/ammo_magazine/asval
	name = "AS-Val magazine(9x39mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "sts35"
	max_ammo = 20
	mag_type = MAGAZINE
	caliber = "9x39mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a9x39

/obj/item/ammo_magazine/asval/ap
	name = "AS-Val magazine(9x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	ammo_type = /obj/item/ammo_casing/a9x39/ap

/obj/item/ammo_magazine/akm
	name = "AKM magazine (7.62x39mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62x39mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1600)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762x39

/obj/item/ammo_magazine/akm/ap
	name = "AKM magazine (7.62x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/akm/hp
	name = "AKM magazine (7.62x39mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a762x39/hp

/obj/item/ammo_magazine/m16
	name = "M16 magazine (5.56x45mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "556mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "5.56x45mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1400)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a556

/obj/item/ammo_magazine/m16/ap
	name = "M16 magazine (5.56x45mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 1700)
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_magazine/m16/hp
	name = "M16 magazine (5.56x45mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 1700)
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/ammo_magazine/m41
	name = "M41A magazine (10x24mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "m41mag"
	max_ammo = 40
	mag_type = MAGAZINE
	caliber = "5.56x45mm"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a10x24

/obj/item/ammo_magazine/clip/sks
	name = "Ammo clip(7.62x39mm)"
	icon_state = "gclip"
	max_ammo = 10
	caliber = "7.62x39mm"
	matter = list(DEFAULT_WALL_MATERIAL = 400)

