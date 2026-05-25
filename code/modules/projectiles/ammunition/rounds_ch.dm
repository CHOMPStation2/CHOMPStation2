/obj/item/ammo_casing/a12g/silver
	name = " Silver shotgun shell"
	desc = "A 12 gauge slug. Bless and Sancitfied to banish otherworlds entities."
	icon_state = "agshell"
	caliber = "12g"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/silver
	matter = list(DEFAULT_WALL_MATERIAL = 360, "silver" = 240)

/// ---- PRE GATTENING STUFF ---- ///


/obj/item/ammo_casing/a80mm
	name = "Voroh recoilless rifle shell"
	desc = "A high explosive 80mm recoilless rifle shell."
	caliber = "80mm"
	w_class = ITEMSIZE_NORMAL
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "voroh"
	embed_chance = 0
	projectile_type = /obj/item/projectile/explosive_rocket/blackhole
	matter = list(MAT_STEEL = 2200)


/obj/item/ammo_casing/a6550mm
	desc = "A 6.5x50mm bullet casing."
	caliber = "6.5mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	matter = list(MAT_STEEL = 200)

/obj/item/ammo_casing/a6550mm/ap
	desc = "A 6.5x50mm armor-piercing bullet casing."
	caliber = "6.5mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a556/ap
	matter = list(MAT_STEEL = 200)

/obj/item/ammo_casing/a15mm
	desc = "A 15x80mm bullet casing."
	caliber = "15mm"
	icon_state = "lcasing"
	projectile_type = /obj/item/projectile/bullet/rifle/a545/bh3
	matter = list(MAT_STEEL = 200)

/obj/item/ammo_casing/a776
	desc = "A 7.76x55mm bullet casing."
	caliber = "7.76mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145/bh2
	matter = list(MAT_STEEL = 200)

/obj/item/ammo_casing/a86
	desc = "An 8.6x65mm bullet casing."
	caliber = "8.6mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a145/bh2
	matter = list(MAT_STEEL = 200)


