/********m2024 .45********/

/obj/item/ammo_magazine/c45m2024
	name = "m2024 pistol magazine (.45)"
	icon_state = "45"
	icon = 'icons/obj/gun_yw.dmi'
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c45m2024/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c45m2024/rubber
	name = "m2024 magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/a45/rubber

/obj/item/ammo_magazine/c45m2024/practice
	name = "m2024 magazine (.45 practice)"
	ammo_type = /obj/item/ammo_casing/a45/practice

/obj/item/ammo_magazine/c45m2024/flash
	name = "m2024 magazine (.45 flash)"
	ammo_type = /obj/item/ammo_casing/a45/flash

/obj/item/ammo_magazine/c45m2024/ap
	name = "m2024 magazine (.45 AP)"
	ammo_type = /obj/item/ammo_casing/a45/ap


/******** 9mm glock ********/
/obj/item/ammo_magazine/gl9mm
	name = "glock magazine (9mm)"
	icon_state = "glock-mag"
	icon = 'icons/obj/gun_yw.dmi'
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 480)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/a9mm
	max_ammo = 17
	multiple_sprites = 0

/obj/item/ammo_magazine/gl9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/gl9mm/flash
	ammo_type = /obj/item/ammo_casing/a9mm/flash

/obj/item/ammo_magazine/gl9mm/rubber
	name = "glock magazine (9mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber

/obj/item/ammo_magazine/gl9mm/practice
	name = "glock magazine (9mm practice)"
	ammo_type = /obj/item/ammo_casing/a9mm/practice

/******* MG42 ********/
/obj/item/ammo_magazine/mg42
	name = "drum mag (7.92x57mm Mauser)"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "mg42_75rnd"
	caliber = "mauser"
	ammo_type = /obj/item/ammo_casing/mg42
	max_ammo = 75
	multiple_sprites = 0
	w_class = ITEMSIZE_NORMAL
	mag_type = MAGAZINE
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 10000)

/obj/item/ammo_casing/mg42
	desc = "A 7.92×57mm Mauser casing."
	icon_state = "rifle-casing"
	caliber = "mauser"
	projectile_type = /obj/item/projectile/bullet/rifle/a762

/obj/item/ammo_magazine/mg42/empty
	initial_ammo = 0