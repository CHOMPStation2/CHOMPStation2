// AS-Val magazines
/datum/design_techweb/rifle_mag_9mmval
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AS-9mm)")
	id = "rifle_mag_9mmval"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/asval
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_9mmval_ap
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AS-9mm armor piercing)")
	id = "rifle_mag_9mmval_ap"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 300)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/asval/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_9mmval_rubber
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AS-9mm rubber)")
	id = "rifle_mag_9mmval_rubber"
	materials = list(MAT_STEEL = 500)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/asval/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// AKM magazines
/datum/design_techweb/rifle_mag_akm762
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AKM-7.62mm)")
	id = "rifle_mag_akm762"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_akm762_ap
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AKM-7.62mm armor piercing)")
	id = "rifle_mag_akm762_ap"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 300)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_akm762_hp
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AKM-7.62mm hollowpoint)")
	id = "rifle_mag_akm762_hp"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 200)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_akm762_rubber
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AKM-7.62mm rubber)")
	id = "rifle_mag_akm762_rubber"
	materials = list(MAT_STEEL = 500)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// AK/AKM drums
/datum/design_techweb/rifle_drum_rpk762
	SET_AMMO_DESIGN_NAMEDESC("drum magazine (RPK-7.62mm)")
	id = "rifle_drum_rpk762"
	materials = list(MAT_STEEL = 1700)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm/drum
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_drum_rpk762_ap
	SET_AMMO_DESIGN_NAMEDESC("drum magazine (RPK-7.62mm armor piercing)")
	id = "rifle_drum_rpk762_ap"
	materials = list(MAT_STEEL = 1700, MAT_PLASTEEL = 550)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/akm/drum/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// AK74 magazines
/datum/design_techweb/rifle_mag_ak74762
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AK74-5.45mm)")
	id = "rifle_mag_ak74"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ak74
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_ak74762_ap
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AK74-5.45mm armor piercing)")
	id = "rifle_mag_ak74_ap"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 300)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ak74/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_ak74762_hp
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AK74-5.45mm hollowpoint)")
	id = "rifle_mag_ak74_hp"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 200)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ak74/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_ak74762_rubber
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (AK74-5.45mm rubber)")
	id = "rifle_mag_ak74_rubber"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ak74/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// M16 magazines
/datum/design_techweb/rifle_mag_m16
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (M16-5.56mm)")
	id = "rifle_mag_m16"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m16
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_m16_ap
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (M16-5.56mm armor piercing)")
	id = "rifle_mag_m16_ap"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 300)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m16/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_m16_rubber
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (M16-5.56mm rubber)")
	id = "rifle_mag_m16_rubber"
	materials = list(MAT_STEEL = 650)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m16/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_m16_hp
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (M16-5.56mm hollowpoint)")
	id = "rifle_mag_m16_hp"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 200)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m16/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// plamya
/datum/design_techweb/rifle_drum_playma
	SET_AMMO_DESIGN_NAMEDESC("drum magazine (Playma-9mm)")
	id = "rifle_drum_playma"
	materials = list(MAT_STEEL = 4600)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/plamya
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_drum_playma_ap
	SET_AMMO_DESIGN_NAMEDESC("drum magazine (Playma-9mm armor piercing)")
	id = "rifle_drum_playma_ap"
	materials = list(MAT_STEEL = 4600, MAT_PLASTEEL = 1400)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/plamya/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_drum_playma_rubber
	SET_AMMO_DESIGN_NAMEDESC("drum magazine (Playma-9mm rubber)")
	id = "rifle_drum_playma_rubber"
	materials = list(MAT_STEEL = 4600)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/plamya/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// TP23
/datum/design_techweb/rifle_mag_mp59mm
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (mp5-9mm)")
	id = "rifle_mag_mp59mm"
	materials = list(MAT_STEEL = 800)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/mp5mag
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_mp59mm_rubber
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (mp5-9mm rubber)")
	id = "rifle_mag_mp59mm_rubber"
	materials = list(MAT_STEEL = 800)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/mp5mag/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_mp59mm_ap
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (mp5-9mm armor piercing)")
	id = "rifle_mag_mp59mm_ap"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 300)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/mp5mag/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

/datum/design_techweb/rifle_mag_mp59mm_hp
	SET_AMMO_DESIGN_NAMEDESC("rifle magazine (mp5-9mm hollowpoint)")
	id = "rifle_mag_mp59mm_hp"
	materials = list(MAT_STEEL = 650, MAT_PLASTEEL = 200)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/mp5mag/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_RIFLE
	)

// VP70

/datum/design_techweb/pistol_mag_vp70
	SET_AMMO_DESIGN_NAMEDESC("pistol magazine (vp70-9mm)")
	id = "pistol_mag_vp70"
	materials = list(MAT_STEEL = 1080)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m9mm/vp70
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_PISTOL
	)

/datum/design_techweb/pistol_mag_vp70_ap
	SET_AMMO_DESIGN_NAMEDESC("pistol magazine (vp70-9mm armor piercing)")
	id = "pistol_mag_vp70_ap"
	materials = list(MAT_STEEL = 1080, MAT_PLASTEEL = 600)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m9mm/vp70/ap
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_PISTOL
	)

/datum/design_techweb/pistol_mag_vp70_hp
	SET_AMMO_DESIGN_NAMEDESC("pistol magazine (vp70-9mm hollow point)")
	id = "pistol_mag_vp70_hp"
	materials = list(MAT_STEEL = 1080, MAT_PLASTIC = 600)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m9mm/vp70/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_PISTOL
	)

/datum/design_techweb/pistol_mag_vp70_rubber
	SET_AMMO_DESIGN_NAMEDESC("pistol magazine (vp70-9mm rubber)")
	id = "pistol_mag_vp70_rubber"
	materials = list(MAT_STEEL = 900)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m9mm/vp70/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_PISTOL
	)

/datum/design_techweb/pistol_mag_vp70_flash
	SET_AMMO_DESIGN_NAMEDESC("pistol magazine (vp70-9mm flash)")
	id = "pistol_mag_vp70_flash"
	materials = list(MAT_STEEL = 900)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/m9mm/vp70/flash
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_PISTOL
	)

// 9mm ammo boxes

/datum/design_techweb/ammobox_9mm
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm)")
	id = "ammobox_9mm"
	materials = list(MAT_STEEL = 1500)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)

/datum/design_techweb/ammobox_9mm_practice
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm practice)")
	id = "ammobox_9mm_practice"
	materials = list(MAT_STEEL = 1100)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm/practice
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)

/datum/design_techweb/ammobox_9mm_ap
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm armor piercing)")
	id = "ammobox_9mm_ap"
	materials = list(MAT_STEEL = 1200, MAT_PLASTEEL = 600)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm/practice
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)

/datum/design_techweb/ammobox_9mm_hp
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm hollow point)")
	id = "ammobox_9mm_hp"
	materials = list(MAT_STEEL = 1100)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm/hp
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)

/datum/design_techweb/ammobox_9mm_rubber
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm hollow point)")
	id = "ammobox_9mm_rubber"
	materials = list(MAT_STEEL = 1100)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm/rubber
	category = list(
		RND_CATEGORY_INITIAL,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)

/datum/design_techweb/ammobox_9mm_flash
	SET_AMMO_DESIGN_NAMEDESC("ammo box (9mm flash)")
	id = "ammobox_9mm_flash"
	materials = list(MAT_STEEL = 1100)
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_magazine/ammo_box/b9mm/flash
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_HACKED,
		RND_SUBCATEGORY_WEAPONS_AMMO + RND_SUBCATEGORY_WEAPONS_AMMO_BOXES
	)
