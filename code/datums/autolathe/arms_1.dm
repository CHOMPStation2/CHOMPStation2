/datum/design/item/autolathe
	var/hidden = 0
	build_type = AUTOLATHE	 	//Flag as to what kind machine the design is built in. See defines.

/datum/design/item/autolathe/arms						//Datum for object designs, used in construction	//IDs of that techs the object originated from and the minimum level requirements.
	category = "Arms and Ammunition"			//category item goes to


////////////////
/*Ammo casings*/
////////////////
//Shotgun

/datum/design/item/autolathe/arms/shotgun_blanks
	name = "ammunition (12g, blank)"
	id = "shotgun_blanks"
	build_path = /obj/item/ammo_casing/a12g/blank
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 112)

/datum/design/item/autolathe/arms/shotgun_beanbag
	name = "ammunition (12g, beanbag)"
	id = "shotgun_beanbag"
	build_path = /obj/item/ammo_casing/a12g/beanbag
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 225)

/datum/design/item/autolathe/arms/shotgun_flash
	name = "ammunition (12g, flash)"
	id = "shotgun_flash"
	build_path = /obj/item/ammo_casing/a12g/flash
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 112, "glass" = 112)

/datum/design/item/autolathe/arms/shotgun_slug
	name = "ammunition (12g, slug)"
	id = "shotgun_slug"
	build_path = /obj/item/ammo_casing/a12g
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 450)
	hidden = 1

/datum/design/item/autolathe/arms/shotgun_pellet
	name = "ammunition (12g, pellet)"
	id = "shotgun_pellet"
	build_path = /obj/item/ammo_casing/a12g/pellet
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 450)
	hidden = 1

/datum/design/item/autolathe/arms/stunshell
	name = "ammunition (stun cartridge, shotgun)"
	id = "shotgun_stunshell"
	build_path = /obj/item/ammo_casing/a12g/stunshell
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 450, "glass" = 900)
	hidden = 1

//////////////////
/*Ammo magazines*/
//////////////////

/////// .45
/datum/design/item/autolathe/arms/pistol_45
	name = "pistol magazine (.45)"
	id = "pistol_45"
	build_path = /obj/item/ammo_magazine/m45
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 656)
	hidden = 1

/datum/design/item/autolathe/arms/pistol_45p
	name = "pistol magazine (.45 practice)"
	id = "pistol_45p"
	build_path = /obj/item/ammo_magazine/m45/practice
	materials = list(DEFAULT_WALL_MATERIAL = 656)


/datum/design/item/autolathe/arms/pistol_45r
	name = "pistol magazine (.45 rubber)"
	id = "pistol_45r"
	build_path = /obj/item/ammo_magazine/m45/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 656)

/datum/design/item/autolathe/arms/pistol_45f
	name = "pistol magazine (.45 flash)"
	id = "pistol_45f"
	build_path = /obj/item/ammo_magazine/m45/flash
	materials = list(DEFAULT_WALL_MATERIAL = 656)

/datum/design/item/autolathe/arms/pistol_45uzi
	name = "uzi magazine (.45)"
	id = "pistol_45uzi"
	build_path = /obj/item/ammo_magazine/m45uzi
	materials = list(DEFAULT_WALL_MATERIAL = 656)
	hidden = 1

/datum/design/item/autolathe/arms/tommymag
	name = "Tommy Gun magazine (.45)"
	id = "tommymag"
	build_path = /obj/item/ammo_magazine/m45tommy
	materials = list(DEFAULT_WALL_MATERIAL = 1875)
	hidden = 1

/datum/design/item/autolathe/arms/tommydrum
	name = "Tommy Gun drum magazine (.45)"
	id = "tommydrum"
	build_path = /obj/item/ammo_magazine/m45tommydrum
	materials = list(DEFAULT_WALL_MATERIAL = 4687)
	hidden = 1

/////// 9mm

// Full size pistol mags.

/datum/design/item/autolathe/arms/pistol_9mm
	name = "pistol magazine (9mm)"
	id = "pistol_9mm"
	build_path = /obj/item/ammo_magazine/m9mm
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1

/datum/design/item/autolathe/arms/pistol_9mmr
	name = "pistol magazine (9mm rubber)"
	id = "pistol_9mm_rubber"
	build_path = /obj/item/ammo_magazine/m9mm/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 750)


/datum/design/item/autolathe/arms/pistol_9mmp
	name = "pistol magazine (9mm practice)"
	id = "pistol_9mm_practice"
	build_path = /obj/item/ammo_magazine/m9mm/practice
	materials = list(DEFAULT_WALL_MATERIAL = 750)

/datum/design/item/autolathe/arms/pistol_9mmf
	name = "pistol magazine (9mm flash)"
	id = "pistol_9mm_flash"
	build_path = /obj/item/ammo_magazine/m9mm/flash
	materials = list(DEFAULT_WALL_MATERIAL = 750)

/datum/design/item/autolathe/arms/pistol_9mm_compact
	name = "compact pistol magazine (9mm)"
	id = "pistol_9mm_compact"
	build_path = /obj/item/ammo_magazine/m9mm/compact
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1

/datum/design/item/autolathe/arms/pistol_9mmr_compact
	name = "compact pistol magazine (9mm rubber)"
	id = "pistol_9mm_compact_rubber"
	build_path = /obj/item/ammo_magazine/m9mm/compact/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1
/datum/design/item/autolathe/arms/pistol_9mmp_compact
	name = "compact pistol magazine (9mm)"
	id = "pistol_9mm_compact_practice"
	build_path = /obj/item/ammo_magazine/m9mm/compact/practice
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1

/datum/design/item/autolathe/arms/pistol_9mmf_compact
	name = "compact pistol magazine (9mm)"
	id = "pistol_9mm_compact_flash"
	build_path = /obj/item/ammo_magazine/m9mm/compact/flash
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1

/////// SMG Mags

/datum/design/item/autolathe/arms/smg_9mm
	name = "top-mounted SMG magazine (9mm)"
	id = "smg_9mm"
	build_path = /obj/item/ammo_magazine/m9mmt
	materials = list(DEFAULT_WALL_MATERIAL = 750)
	hidden = 1

/datum/design/item/autolathe/arms/smg_9mmr
	name = "top-mounted SMG magazine (9mm rubber)"
	id = "smg_9mmr"
	build_path = /obj/item/ammo_magazine/m9mmt/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 380)

/datum/design/item/autolathe/arms/smg_9mmp
	name = "top-mounted SMG magazine (9mm practice)"
	id = "smg_9mmp"
	build_path = /obj/item/ammo_magazine/m9mmt/practice
	materials = list(DEFAULT_WALL_MATERIAL = 380)

/datum/design/item/autolathe/arms/smg_9mmf
	name = "top-mounted SMG magazine (9mm flash)"
	id = "smg_9mmf"
	build_path = /obj/item/ammo_magazine/m9mmt/flash
	materials = list(DEFAULT_WALL_MATERIAL = 380)


/////// 10mm

/datum/design/item/autolathe/arms/smg_10mm
	name = "SMG magazine (10mm)"
	id = "smg_10mm"
	build_path = /obj/item/ammo_magazine/m10mm
	materials = list(DEFAULT_WALL_MATERIAL = 1875)

/datum/design/item/autolathe/arms/pistol_44
	name = "pistol magazine (.44)"
	id = "pistol_44"
	build_path = /obj/item/ammo_magazine/m44
	materials = list(DEFAULT_WALL_MATERIAL = 1575)

/////// 5.45mm
/datum/design/item/autolathe/arms/rifle_545
	name = "rifle magazine (5.45mm)"
	id = "rifle_545"
	build_path = /obj/item/ammo_magazine/m545
	materials = list(DEFAULT_WALL_MATERIAL = 2250)
	hidden = 1

/datum/design/item/autolathe/arms/rifle_545p
	name = "rifle magazine (5.45mm practice)"
	id = "rifle_545_practice"
	build_path = /obj/item/ammo_magazine/m545/practice
	materials = list(DEFAULT_WALL_MATERIAL = 2250)

/datum/design/item/autolathe/arms/machinegun_545
	name = "machinegun box magazine (5.45)"
	id = "machinegun_545"
	build_path = /obj/item/ammo_magazine/m545saw
	materials = list(DEFAULT_WALL_MATERIAL = 12500)
	hidden = 1

/////// 7.62

/datum/design/item/autolathe/arms/rifle_762
	name = "rifle magazine (7.62mm)"
	id = "rifle_762"
	build_path = /obj/item/ammo_magazine/m762
	materials = list(DEFAULT_WALL_MATERIAL = 2500)
	hidden = 1


/////// Shotgun

/datum/design/item/autolathe/arms/shotgun_clip_beanbag
	name = "2-round 12g speedloader (beanbag)"
	id = "shotgun_speedloader_beanbag"
	build_path = /obj/item/ammo_magazine/clip/c12g/beanbag
	materials = list(DEFAULT_WALL_MATERIAL = 887)

/datum/design/item/autolathe/arms/shotgun_clip_pellet
	name = "2-round 12g speedloader (pellet)"
	id = "shotgun_speedloader_pellet"
	build_path = /obj/item/ammo_magazine/clip/c12g/pellet
	materials = list(DEFAULT_WALL_MATERIAL = 1337)
	hidden = 1

/datum/design/item/autolathe/arms/shotgun_clip_slug
	name = "2-round 12g speedloader (slug)"
	id = "shotgun_speedloader_slug"
	build_path = /obj/item/ammo_magazine/clip/c12g
	materials = list(DEFAULT_WALL_MATERIAL = 1337)
	hidden = 1


///////////////////////////////
/*Ammo clips and Speedloaders*/
///////////////////////////////

/datum/design/item/autolathe/arms/speedloader_357
	name = "speedloader (.357)"
	id = "speedloader_357"
	build_path = /obj/item/ammo_magazine/s357
	materials = list(DEFAULT_WALL_MATERIAL = 1575)
	hidden = 1

/datum/design/item/autolathe/arms/speedloader_38
	name = "speedloader (.38)"
	id = "speedloader_38"
	build_path = /obj/item/ammo_magazine/s38
	materials = list(DEFAULT_WALL_MATERIAL = 450)
	hidden = 1

/datum/design/item/autolathe/arms/speedloader_38r
	name = "speedloader (.38 rubber)"
	id = "speedloader_38_rubber"
	build_path = /obj/item/ammo_magazine/s38/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 450)

/datum/design/item/autolathe/arms/speedloader_45
	name = "speedloader (.45)"
	id = "speedloader_45"
	build_path = /obj/item/ammo_magazine/s45
	materials = list(DEFAULT_WALL_MATERIAL = 656)
	hidden = 1

/datum/design/item/autolathe/arms/speedloader_45r
	name = "speedloader (.45 rubber)"
	id = "speedloader_45_rubber"
	build_path = /obj/item/ammo_magazine/s45/rubber
	materials = list(DEFAULT_WALL_MATERIAL = 656)

/datum/design/item/autolathe/arms/rifle_clip_545
	name = "ammo clip (5.45mm)"
	id = "rifle_clip_545"
	build_path = /obj/item/ammo_magazine/clip/c545
	materials = list(DEFAULT_WALL_MATERIAL = 565)
	hidden = 1

/datum/design/item/autolathe/arms/rifle_clip_545_practice
	name = "ammo clip (5.45mm practice)"
	id = "rifle_clip_545p"
	build_path = /obj/item/ammo_magazine/clip/c545/practice
	materials = list(DEFAULT_WALL_MATERIAL = 565)

/datum/design/item/autolathe/arms/rifle_clip_762
	name = "ammo clip (7.62mm)"
	id = "rifle_clip_762"
	build_path = /obj/item/ammo_magazine/clip/c762
	materials = list(DEFAULT_WALL_MATERIAL = 1250)
	hidden = 1

/datum/design/item/autolathe/arms/rifle_clip_762_practice
	name = "ammo clip (7.62mm practice)"
	id = "rifle_clip_762p"
	build_path = /obj/item/ammo_magazine/clip/c762/practice
	materials = list(DEFAULT_WALL_MATERIAL = 1250)

/datum/design/item/autolathe/arms/knuckledusters
	name = "knuckle dusters"
	id = "knuckledusters"
	build_path = /obj/item/clothing/gloves/knuckledusters
	materials = list(DEFAULT_WALL_MATERIAL = 625)
	hidden = 1

/datum/design/item/autolathe/arms/flamethrower
	name = "flamethrower"
	id = "flamethrower"
	build_path = /obj/item/weapon/flamethrower/full
	materials = list(DEFAULT_WALL_MATERIAL = 625)
	hidden = 1


