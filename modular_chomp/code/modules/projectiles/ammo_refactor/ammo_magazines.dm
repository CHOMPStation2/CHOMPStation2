//Pistol magazine and subtypes
/obj/item/ammo_magazine/pistol
	name = "pistol magazine"
	icon_state = "m91"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(MAT_STEEL = 600)
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol/empty
	initial_ammo = 0

/obj/item/ammo_magazine/pistol/flash
	name = "pistol magazine (flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/pistol/rubber
	name = "pistol magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/pistol/practice
	name = "pistol magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/pistol/ap
	name = "pistol magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/pistol/hp
	name = "pistol magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp

/obj/item/ammo_magazine/pistol/emp
	name = "pistol magazine (EMP)"
	ammo_type = /obj/item/ammo_casing/simple/small/emp

//Large pistol magazine.
/obj/item/ammo_magazine/pistol_large
	name = "extended pistol magazine"
	// cringe ammo ban lore begone
	icon_state = "m93"
	origin_tech = list(TECH_COMBAT = 2, TECH_ILLEGAL = 1)
	mag_type = MAGAZINE
	matter = list(MAT_STEEL = 1000)
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small
	max_ammo = 17
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol_large/empty
	initial_ammo = 0

/obj/item/ammo_magazine/pistol_large/flash
	name = "extended pistol magazine (flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/pistol_large/rubber
	name = "extended pistol magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/pistol_large/practice
	name = "extended pistol magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/pistol_large/ap
	name = "extended pistol magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/pistol_large/hp
	name = "extended pistol magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp


//SMG Magazine
/obj/item/ammo_magazine/smg
	name = "SMG magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "mp5mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "small"
	matter = list(MAT_STEEL = 800)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/simple/small

/obj/item/ammo_magazine/smg/empty
	initial_ammo = 0

/obj/item/ammo_magazine/smg/flash
	name = "SMG magazine (flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/smg/rubber
	name = "SMG magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/smg/practice
	name = "SMG magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/smg/ap
	name = "SMG magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/smg/hp
	name = "SMG magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp

/obj/item/ammo_magazine/smg/emp
	name = "SMG magazine (EMP)"
	ammo_type = /obj/item/ammo_casing/simple/small/emp

//SMG drum magazine
/obj/item/ammo_magazine/smg_drum
	name = "SMG drum magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "small"
	icon_state = "ppshmag"
	max_ammo = 50
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 1500)
	ammo_type = /obj/item/ammo_casing/simple/small

/obj/item/ammo_magazine/smg_drum/empty
	initial_ammo = 0

/obj/item/ammo_magazine/smg_drum/flash
	name = "SMG drum magazine (flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/smg_drum/rubber
	name = "SMG drum magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/smg_drum/practice
	name = "SMG drum magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/smg_drum/ap
	name = "SMG drum magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/smg_drum/hp
	name = "SMG drum magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp

//Medium magazines
/obj/item/ammo_magazine/medium
	name = "medium magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "556mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "medium"
	matter = list(MAT_STEEL = 1400)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/simple/medium

/obj/item/ammo_magazine/medium/empty
	initial_ammo = 0

/obj/item/ammo_magazine/medium/rubber
	name = "medium ammo magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/medium/rubber

/obj/item/ammo_magazine/medium/practice
	name = "medium ammo magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice

/obj/item/ammo_magazine/medium/ap
	name = "medium ammo magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap

/obj/item/ammo_magazine/medium/hp
	name = "medium ammo magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp

/obj/item/ammo_magazine/medium/hunter
	name = "medium ammo magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hunter

//Medium short-capacity
/obj/item/ammo_magazine/medium_small
	name = "medium ammo short-capacity magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "medium"
	icon_state = "t12"
	max_ammo = 20
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 1800)
	ammo_type = /obj/item/ammo_casing/simple/medium

/obj/item/ammo_magazine/medium_small/empty
	initial_ammo = 0

/obj/item/ammo_magazine/medium_small/rubber
	name = "medium ammo short-capacity magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/medium/rubber

/obj/item/ammo_magazine/medium_small/practice
	name = "medium ammo short-capacity magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice

/obj/item/ammo_magazine/medium_small/ap
	name = "medium ammo short-capacity magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap

/obj/item/ammo_magazine/medium_small/hp
	name = "medium ammo short-capacity magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp

/obj/item/ammo_magazine/medium_small/hunter
	name = "medium ammo short-capacity magazine (hunter)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hunter

//Medium drum
/obj/item/ammo_magazine/medium_drum
	name = "medium ammo drum magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "medium"
	icon_state = "plamyamag"
	max_ammo = 50
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 2500)
	ammo_type = /obj/item/ammo_casing/simple/medium

/obj/item/ammo_magazine/medium_drum/empty
	initial_ammo = 0

/obj/item/ammo_magazine/medium_drum/rubber
	name = "medium ammo drum magazine (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/medium/rubber

/obj/item/ammo_magazine/medium_drum/practice
	name = "medium ammo drum magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice

/obj/item/ammo_magazine/medium_drum/ap
	name = "medium ammo drum magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap

/obj/item/ammo_magazine/medium_drum/hp
	name = "medium ammo drum magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp


//Medium clip
/obj/item/ammo_magazine/clip/medium
	name = "medium ammo clip"
	icon_state = "enbloc"
	max_ammo = 10
	caliber = "medium"
	mag_type = MAGAZINE | SPEEDLOADER //Act as both, because the garand will use you like a magazine bb
	multiple_sprites = 1
	matter = list(MAT_STEEL = 400)
	ammo_type = /obj/item/ammo_casing/simple/medium

/obj/item/ammo_magazine/clip/medium/empty
	initial_ammo = 0

/obj/item/ammo_magazine/clip/medium/rubber
	name = "medium ammo clip (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/medium/rubber

/obj/item/ammo_magazine/clip/medium/practice
	name = "medium ammo clip (practice)"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice

/obj/item/ammo_magazine/clip/medium/ap
	name = "medium ammo clip (AP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap

/obj/item/ammo_magazine/clip/medium/hp
	name = "medium ammo clip (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp

/obj/item/ammo_magazine/clip/medium/hunter
	name = "medium ammo clip (hunter)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hunter


//Medium box
/obj/item/ammo_magazine/medium_box
	name = "medium ammo magazine box"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "medium"
	icon_state = "molniyamag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 8000)
	ammo_type = /obj/item/ammo_casing/simple/medium

/obj/item/ammo_magazine/medium_box/empty
	initial_ammo = 0

/obj/item/ammo_magazine/medium_box/rubber
	name = "medium ammo magazine box (rubber)"
	ammo_type = /obj/item/ammo_casing/simple/medium/rubber

/obj/item/ammo_magazine/medium_box/practice
	name = "medium ammo magazine box (practice)"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice

/obj/item/ammo_magazine/medium_box/ap
	name = "medium ammo magazine box (AP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap

/obj/item/ammo_magazine/medium_box/hp
	name = "medium ammo magazine box (HP)"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp


//Large magazine
/obj/item/ammo_magazine/large
	name = "large ammo magazine"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "large"
	icon_state = "awp"
	max_ammo = 7
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 2400)
	ammo_type = /obj/item/ammo_casing/simple/large

/obj/item/ammo_magazine/large/empty
	initial_ammo = 0

/obj/item/ammo_magazine/large/practice
	name = "large ammo magazine (practice)"
	ammo_type = /obj/item/ammo_casing/simple/large/practice

/obj/item/ammo_magazine/large/ap
	name = "large ammo magazine (AP)"
	ammo_type = /obj/item/ammo_casing/simple/large/ap

/obj/item/ammo_magazine/large/hp
	name = "large ammo magazine (HP)"
	ammo_type = /obj/item/ammo_casing/simple/large/hp


//Large magazine box
/obj/item/ammo_magazine/large_box
	name = "large ammo magazine box"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "large"
	icon_state = "kordmag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = 20000)
	ammo_type = /obj/item/ammo_casing/simple/large

/obj/item/ammo_magazine/large_box/empty
	initial_ammo = 0

/obj/item/ammo_magazine/large_box/practice
	name = "large ammo magazine box (practice)"
	ammo_type = /obj/item/ammo_casing/simple/large/practice

/obj/item/ammo_magazine/large_box/ap
	name = "large ammo magazine box (AP)"
	ammo_type = /obj/item/ammo_casing/simple/large/ap

/obj/item/ammo_magazine/large_box/hp
	name = "large ammo magazine box (HP)"
	ammo_type = /obj/item/ammo_casing/simple/large/hp


//Small ammo boxes
/obj/item/ammo_magazine/ammo_box/small
	name = "ammo box (small)"
	desc = "A box of small rounds"
	icon_state = "pistol_s"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small
	matter = list(MAT_STEEL = 1800)
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/small/practice
	name = "ammo box (small practice)"
	desc = "A box of small practice rounds"
	icon_state = "pistol_p"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small/practice
	matter = list(MAT_STEEL = 1440)
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/small/ap
	name = "ammo box (small AP)"
	desc = "A box of small armor-piercing rounds"
	icon_state = "pistol_ap"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small/ap
	matter = list(MAT_STEEL = 1200, MAT_PLASTEEL = 600)
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/small/hp
	name = "ammo box (small HP)"
	desc = "A box of small hollow-point rounds"
	icon_state = "pistol_hp"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small/hp
	matter = list(MAT_STEEL = 1440, MAT_PLASTIC = 360)
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/small/rubber
	name = "ammo box (small rubber)"
	desc = "A box of small rubber rounds"
	icon_state = "pistol_r"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber
	matter = list(MAT_STEEL = 1440)
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/small/emp
	name = "ammo box (small haywire)"
	desc = "A box of small haywire rounds"
	icon_state = "pistol_hw"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small/emp
	matter = list(MAT_STEEL = 3120, MAT_URANIUM = 2400)
	max_ammo = 50
	multiple_sprites = 1


//Medium ammo boxes
/obj/item/ammo_magazine/ammo_box/medium
	name = "ammo box (medium)"
	desc = "A box of medium rounds"
	icon_state = "hrifle"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium
	matter = list(MAT_STEEL = 5400)
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/ap
	name = "ammo box (medium AP)"
	desc = "A box of medium armor-piercing rounds"
	icon_state = "hrifle-ap"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap
	matter = list(MAT_STEEL = 8100)
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/hp
	name = "ammo box (medium HP)"
	desc = "A box of medium hollow-point rounds"
	icon_state = "hrifle-hp"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp
	matter = list(MAT_STEEL = 5400)
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/practice
	name = "ammo box (medium practice)"
	desc = "A box of medium practice rounds"
	icon_state = "hrifle_p"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice
	matter = list(MAT_STEEL = 2700)
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/hunter
	name = "ammo box (medium hunter)"
	desc = "A box of medium hunter rounds"
	icon_state = "hrifle-hunter"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/hunter
	matter = list(MAT_STEEL = 5400)
	max_ammo = 30
	multiple_sprites = 1
/* Not fucking dealing with you right now >:(
/obj/item/ammo_magazine/ammo_box/medium/blank
	name = "ammo box (medium blank)"
	desc = "A box of medium blank rounds"
	icon_state = "hrifle-practice"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/blank
	matter = list(MAT_STEEL = 2700)
	max_ammo = 30
	multiple_sprites = 1
*/
/obj/item/ammo_magazine/ammo_box/medium/large
	name = "ammo box (medium)"
	desc = "A steel box of medium rounds"
	icon_state = "boxhrifle"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium
	matter = list(MAT_STEEL = 18000)
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/large/ap
	name = "ammo box (medium AP)"
	desc = "A steel box of medium armor-piercing rounds"
	icon_state = "boxhrifle-ap"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/ap
	matter = list(MAT_STEEL = 27000)
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/large/hp
	name = "ammo box (medium HP)"
	desc = "A steel box of medium hollow-point rounds"
	icon_state = "boxhrifle-hp"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/hp
	matter = list(MAT_STEEL = 18000)
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/large/practice
	name = "ammo box (medium practice)"
	desc = "A steel box of medium practice rounds"
	icon_state = "boxhrifle-practice"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/practice
	matter = list(MAT_STEEL = 9000)
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/medium/large/hunter
	name = "ammo box (medium hunter)"
	desc = "A steel box of medium hunter rounds"
	icon_state = "boxhrifle-hunter"
	caliber = "medium"
	ammo_type = /obj/item/ammo_casing/simple/medium/hunter
	matter = list(MAT_STEEL = 18000)
	max_ammo = 100
	multiple_sprites = 1


//Large ammo boxes
/obj/item/ammo_magazine/ammo_box/large
	name = "ammo box (large)"
	desc = "A box of large rounds"
	icon_state = "sniper"
	caliber = "large"
	ammo_type = /obj/item/ammo_casing/simple/large
	matter = list(MAT_STEEL = 8750)
	max_ammo = 25
	multiple_sprites = 1

/obj/item/ammo_magazine/ammo_box/large/ap
	name = "ammo box (large AP)"
	matter = list(MAT_STEEL = 10000)
	ammo_type = /obj/item/ammo_casing/simple/large/ap

/obj/item/ammo_magazine/ammo_box/large/hp
	name = "ammo box (large HP)"
	matter = list(MAT_STEEL = 10000)
	ammo_type = /obj/item/ammo_casing/simple/large/hp

/obj/item/ammo_magazine/ammo_box/large/practice
	name = "ammo box (large practice)"
	matter = list(MAT_STEEL = 3000)
	ammo_type = /obj/item/ammo_casing/simple/large/practice


//Speedloaders
/obj/item/ammo_magazine/speedloader_six
	name = "speedloader (6 round)"
	desc = "A speedloader for 6 round revolvers."
	icon_state = "38"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small
	matter = list(MAT_STEEL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader_six/flash
	name = "speedloader (6 round flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/speedloader_six/rubber
	name = "speedloader (6 round rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/speedloader_six/practice
	name = "speedloader (6 round practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/speedloader_six/ap
	name = "speedloader (6 round AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/speedloader_six/hp
	name = "speedloader (6 round HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp

/obj/item/ammo_magazine/speedloader_six/emp
	name = "speedloader (6 round EMP)"
	ammo_type = /obj/item/ammo_casing/simple/small/emp

/obj/item/ammo_magazine/speedloader_eight
	name = "speedloader (8 round)"
	desc = "A speedloader for 8 round revolvers."
	icon_state = "38"
	caliber = "small"
	ammo_type = /obj/item/ammo_casing/simple/small
	matter = list(MAT_STEEL = 1260)
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader_eight/flash
	name = "speedloader (8 round flash)"
	ammo_type = /obj/item/ammo_casing/simple/small/flash

/obj/item/ammo_magazine/speedloader_eight/rubber
	name = "speedloader (8 round rubber)"
	ammo_type = /obj/item/ammo_casing/simple/small/rubber

/obj/item/ammo_magazine/speedloader_eight/practice
	name = "speedloader (8 round practice)"
	ammo_type = /obj/item/ammo_casing/simple/small/practice

/obj/item/ammo_magazine/speedloader_eight/ap
	name = "speedloader (8 round AP)"
	ammo_type = /obj/item/ammo_casing/simple/small/ap

/obj/item/ammo_magazine/speedloader_eight/hp
	name = "speedloader (8 round HP)"
	ammo_type = /obj/item/ammo_casing/simple/small/hp

/obj/item/ammo_magazine/speedloader_eight/emp
	name = "speedloader (8 round EMP)"
	ammo_type = /obj/item/ammo_casing/simple/small/emp
