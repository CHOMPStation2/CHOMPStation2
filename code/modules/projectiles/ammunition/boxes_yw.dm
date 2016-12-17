/********m2024 .45********/

/obj/item/ammo_magazine/c45m2024
	name = "m2024 pistol magazine (.45)"
	icon_state = "45"
	icon = 'icons/obj/gun_yw.dmi'
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c45m2024/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c45m2024/rubber
	name = "m2024 magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/c45r

/obj/item/ammo_magazine/c45m2024/practice
	name = "m2024 magazine (.45 practice)"
	ammo_type = /obj/item/ammo_casing/c45p

/obj/item/ammo_magazine/c45m2024/flash
	name = "m2024 magazine (.45 flash)"
	ammo_type = /obj/item/ammo_casing/c45f

/obj/item/ammo_magazine/c45m2024/ap
	name = "m2024 magazine (.45 AP)"
	ammo_type = /obj/item/ammo_casing/c45ap


/******** 9mm glock ********/
/obj/item/ammo_magazine/gl9mm
	name = "glock magazine (9mm)"
	icon_state = "glock-mag"
	icon = 'icons/obj/gun_yw.dmi'
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 480)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 17
	multiple_sprites = 0

/obj/item/ammo_magazine/gl9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/gl9mm/flash
	ammo_type = /obj/item/ammo_casing/c9mmf

/obj/item/ammo_magazine/gl9mm/rubber
	name = "glock magazine (9mm rubber)"
	ammo_type = /obj/item/ammo_casing/c9mmr

/obj/item/ammo_magazine/gl9mm/practice
	name = "glock magazine (9mm practice)"
	ammo_type = /obj/item/ammo_casing/c9mmp