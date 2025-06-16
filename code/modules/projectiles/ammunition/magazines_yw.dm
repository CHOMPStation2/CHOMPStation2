/************************************************************************/
/*
#    An explaination of the naming format for guns and ammo:
#
#    a = Ammo, as in individual rounds of ammunition.
#    b = Box, intended to have ammo taken out one at a time by hand. Really obsolete. Don't use this.
#    c = Clips, intended to reload magazines or guns quickly.
#    m = Magazine, intended to hold rounds of ammo.
#    s = Speedloaders, intended to reload guns quickly.
#
#    Use this format, followed by the caliber. For example, a shotgun's caliber
#    variable is "12g" as a result. Ergo, a shotgun round's path would have "a12g",
#    or a magazine with shotgun shells would be "m12g" instead. To avoid confusion
#    for developers and in-game admins spawning these items, stick to this format.
#    Likewise, when creating new rounds, the caliber variable should match whatever
#    the name says.
#
#    This comment is copied in rounds.dm as well.
#
#    Also, if a magazine is only meant for a specific gun, include the name
#    of the specific gun in the path. Example: m45uzi is only for the Uzi.
*/
/************************************************************************/

///////// 12g /////////


/obj/item/ammo_magazine/clip/c12g/scatter
	name = "ammo clip (12g scatter)"
	icon = 'icons/obj/ammo_yw.dmi'
	icon_state = "12gclipscatter"
	desc = "A color-coded metal clip for holding and quickly loading shotgun shells. This one is loaded with scattershot."
	ammo_type = /obj/item/ammo_casing/a12g/scatter
	matter = list(DEFAULT_WALL_MATERIAL = 1337)


///////// .45 /////////

// m2024 //

/obj/item/ammo_magazine/m2024
	name = "m2024 pistol magazine (.45)"
	icon_state = "45"
	icon = 'icons/obj/gun_yw.dmi'
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/m2024/empty
	initial_ammo = 0

/obj/item/ammo_magazine/m2024/rubber
	name = "m2024 magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/a45/rubber

/obj/item/ammo_magazine/m2024/practice
	name = "m2024 magazine (.45 practice)"
	ammo_type = /obj/item/ammo_casing/a45/practice

/obj/item/ammo_magazine/m2024/flash
	name = "m2024 magazine (.45 flash)"
	ammo_type = /obj/item/ammo_casing/a45/flash

/obj/item/ammo_magazine/m2024/ap
	name = "m2024 magazine (.45 AP)"
	ammo_type = /obj/item/ammo_casing/a45/ap

///////// 9mm /////////

// 9mm glock //
/obj/item/ammo_magazine/mglock9mm
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

/obj/item/ammo_magazine/mglock9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mglock9mm/flash
	ammo_type = /obj/item/ammo_casing/a9mm/flash

/obj/item/ammo_magazine/mglock9mm/rubber
	name = "glock magazine (9mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber

/obj/item/ammo_magazine/mglock9mm/practice
	name = "glock magazine (9mm practice)"
	ammo_type = /obj/item/ammo_casing/a9mm/practice

// MG42 //
/obj/item/ammo_magazine/mg42
	name = "drum mag (7.92x57mm Mauser)"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "mg42_75rnd"
	caliber = "mauser"
	ammo_type = /obj/item/ammo_casing/a792x57m
	max_ammo = 75
	multiple_sprites = 0
	w_class = ITEMSIZE_NORMAL
	mag_type = MAGAZINE
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 10000)

/obj/item/ammo_magazine/mg42/empty
	initial_ammo = 0
