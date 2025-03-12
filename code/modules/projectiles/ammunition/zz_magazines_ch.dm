//Overrides

/*
 * P90 MAGAZINES
*/

/obj/item/ammo_magazine/a57p90	//congratulations you are now being converted 5.7x28mm, a.k.a the round the p90 actually uses.
	name = "\improper P90K Top-Mounted Magazine (5.7x28mm Standard)"
	desc = "A 50-round magazine for the P90K, loaded with caseless ammunition."
	icon_state = "p90"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a57
	matter = list(MAT_STEEL = 2500) // Reduced from 2700 to 2500 for rounding.
	caliber = "5.7x28mm"
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/a57p90/ap
	name = "\improper P90K Top-Mounted Magazine (5.7x28mm Armor-Piercing)"
	desc = "A 50-round magazine for the P90K, loaded with caseless armor-piercing ammunition."
	ammo_type = /obj/item/ammo_casing/a57/ap
	matter = list(MAT_STEEL = 3000)

/obj/item/ammo_magazine/a57p90/rubber
	name = "\improper P90K Top-Mounted Magazine (5.7x28mm Rubber)"
	desc = "A 50-round magazine for the P90K, loaded with less-than-lethal caseless rubber ammunition."
	ammo_type = /obj/item/ammo_casing/a57/rubber
	matter = list(MAT_STEEL = 2000) // Slightly cheaper.

/obj/item/ammo_magazine/a57p90/hp
	name = "\improper P90K Top-Mounted Magazine (5.7x28mm Hollow-Point)"
	desc = "A 50-round magazine for the P90K, loaded with caseless hollow-point ammunition."
	ammo_type = /obj/item/ammo_casing/a57/hp
	matter = list(MAT_STEEL = 3000)

/obj/item/ammo_magazine/a57p90/empty
	initial_ammo = 0

/*
 * C-20R MAGAZINES
*/

/obj/item/ammo_magazine/m10mm
	name = "\improper C-20R Magazine (10mm Standard)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless ammunition."
	icon_state = "10mm"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a10mm
	matter = list(MAT_STEEL = 3000)
	caliber = "10mm"
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/m10mm/ap
	name = "\improper C-20R Magazine (10mm Armor-Piercing)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless armor-piercing ammunition."
	matter = list(MAT_STEEL = 3500)
	ammo_type = /obj/item/ammo_casing/a10mm/ap

/obj/item/ammo_magazine/m10mm/hp
	name = "\improper C-20R Magazine (10mm Hollow-Point)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless hollow-point ammunition."
	matter = list(MAT_STEEL = 3500)
	ammo_type = /obj/item/ammo_casing/a10mm/hp

/obj/item/ammo_magazine/m10mm/practice
	name = "\improper C-20R Magazine (10mm Practice)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless practice rounds."
	matter = list(MAT_STEEL = 1500)
	ammo_type = /obj/item/ammo_casing/a10mm/practice

/obj/item/ammo_magazine/m10mm/rubber
	name = "\improper C-20R Magazine (10mm Rubber)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless rubber ammunition."
	matter = list(MAT_STEEL = 2500)
	ammo_type = /obj/item/ammo_casing/a10mm/rubber

/obj/item/ammo_magazine/m10mm/emp
	name = "\improper C-20R Magazine (10mm Haywire EMP)"
	desc = "A 20-round magazine for the C-20R, loaded with caseless electromagnetic ammunition."
	matter = list(MAT_STEEL = 3000, MAT_URANIUM = 1000)
	ammo_type = /obj/item/ammo_casing/a10mm/emp

/obj/item/ammo_magazine/m10mm/empty
	initial_ammo = 0

/*
 * PLACEHOLDER
*/

/obj/item/ammo_magazine/m762svd	//You are now being converted to 7.62x54mmR :3
	name = "\improper SVD magazine (7.62x54mmR)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "svd"
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
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "mp5mag"
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

/obj/item/ammo_magazine/pitchmag
	name = "pitchgun magazine(.44 magnum standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "pitchmag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = ".44"
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a44

/obj/item/ammo_magazine/pitchmag/rubber
	name = "pitchgun magazine(.44 magnum less-lethal)"
	icon_state = "pitchrubbermag"
	matter = list(DEFAULT_WALL_MATERIAL = 700)
	ammo_type = /obj/item/ammo_casing/a44/rubber

/obj/item/ammo_magazine/asval
	name = "AS-Val magazine(9x39mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "asval"
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

/obj/item/ammo_magazine/asval/rubber
	name = "AS-Val magazine(9x39mm less-lethal)"
	icon_state = "asvalrubber"
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	ammo_type = /obj/item/ammo_casing/a9x39/rubber

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

/obj/item/ammo_magazine/akm/rubber
	name = "AKM magazine (7.62x39mm less-lethal)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762rubbermag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62x39mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762x39/rubber

/obj/item/ammo_magazine/ak74
	name = "AK74 magazine (5.45mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "545bake"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "5.45mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1400)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a545

/obj/item/ammo_magazine/ak74/ap
	name = "AK74 magazine (5.45mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a545/ap

/obj/item/ammo_magazine/ak74/hp
	name = "AK74 magazine (5.45mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a545/hp

/obj/item/ammo_magazine/ak74/rubber
	name = "AK74 magazine (5.45mm less-lethal)"
	icon_state = "545bakerubber"
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	ammo_type = /obj/item/ammo_casing/a545/rubber

/obj/item/ammo_magazine/ak74/plum
	icon_state = "545plum"

/obj/item/ammo_magazine/ak74/plum/rubber
	name = "AK74 magazine (5.45mm less-lethal)"
	icon_state = "545plumrubber"
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	ammo_type = /obj/item/ammo_casing/a545/rubber

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

/obj/item/ammo_magazine/m16/rubber
	name = "M16 magazine (5.56x45mm less-lethal)"
	icon_state = "556rubbermag"
	matter = list(DEFAULT_WALL_MATERIAL = 1700)
	ammo_type = /obj/item/ammo_casing/a556/rubber


/obj/item/ammo_magazine/m16/hp
	name = "M16 magazine (5.56x45mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 1700)
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/ammo_magazine/m16/patriot
	name = "Patriot magazine (5.56x45mm standard)"
	matter = list(DEFAULT_WALL_MATERIAL = 5000)
	max_ammo = 100
	icon_state = "patriotmag"

/obj/item/ammo_magazine/m41
	name = "M41A magazine (10x24mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "m41mag"
	max_ammo = 40
	mag_type = MAGAZINE
	caliber = "10x24mm"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a10x24

/obj/item/ammo_magazine/m41/rubber
	name = "M41A magazine (10x24mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "m41rubbermag"
	max_ammo = 40
	matter = list(DEFAULT_WALL_MATERIAL = 7000)
	ammo_type = /obj/item/ammo_casing/a10x24/rubber

/obj/item/ammo_magazine/t12
	name = "T-12 magazine (10x24mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "t12"
	max_ammo = 40
	mag_type = MAGAZINE
	caliber = "10x24mm"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a10x24

/obj/item/ammo_magazine/clip/sks
	name = "Ammo clip(7.62x39mm standard)"
	icon_state = "gclip"
	max_ammo = 10
	caliber = "7.62x39mm"
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 400)
	ammo_type = /obj/item/ammo_casing/a762x39

/obj/item/ammo_magazine/clip/sks/ap
	name = "Ammo clip(7.62x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 700)
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/clip/mosin
	name = "Ammo clip(7.62x54mmR standard)"
	icon_state = "clip_rifle"
	max_ammo = 5
	caliber = "7.62x54mmR"
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 300)
	ammo_type = /obj/item/ammo_casing/a762x54

/obj/item/ammo_magazine/clip/mosin/ap
	name = "Ammo clip(7.62x54mmR armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	ammo_type = /obj/item/ammo_casing/a762x54/ap

/obj/item/ammo_magazine/type901
	name = "Type-901 magazine(7.62x51mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "762mag"
	max_ammo = 30
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 2400)
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/type901/ap
	name = "Type-901 magazine(7.62x51mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 3000)
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/ar10
	name = "AR-10 magazine(7.62x51mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "t12"
	max_ammo = 20
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/ar10/ap
	name = "AR-10 magazine(7.62x51mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 2400)
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/fal
	name = "FAL magazine(7.62x51mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "t12"
	max_ammo = 20
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/fal/ap
	name = "FAL magazine(7.62x51mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 2400)
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/awp
	name = "AWP magazine(.338 Lapua standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = ".338"
	icon_state = "awp"
	max_ammo = 5
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 2400)
	ammo_type = /obj/item/ammo_casing/a338

/obj/item/ammo_magazine/awp/ap
	name = "AWP magazine(.338 Lapua armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 3000)
	ammo_type = /obj/item/ammo_casing/a338/ap

/obj/item/ammo_magazine/hectate
	name = "Hectate II magazine(.50 BMG standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = ".50 BMG"
	icon_state = "hectate"
	max_ammo = 7
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 4000)
	ammo_type = /obj/item/ammo_casing/a50bmg

/obj/item/ammo_magazine/hectate/ap
	name = "Hectate II magazine(.50 BMG armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 5000)
	ammo_type = /obj/item/ammo_casing/a50bmg/ap

/obj/item/ammo_magazine/ppsh
	name = "PPSH-17b drum magazine(7.62x25mm Tokarev standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62x25mm"
	icon_state = "ppshmag"
	max_ammo = 71
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1500)
	ammo_type = /obj/item/ammo_casing/a762x25

/obj/item/ammo_magazine/plamya
	name = "Plamya drum magazine(9x39mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "9x39mm"
	icon_state = "plamyamag"
	max_ammo = 50
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 2500)
	ammo_type = /obj/item/ammo_casing/a9x39

/obj/item/ammo_magazine/plamya/ap
	name = "Plamya drum magazine(9x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 3000)
	ammo_type = /obj/item/ammo_casing/a9x39/ap

/obj/item/ammo_magazine/plamya/rubber
	name = "Plamya drum magazine(9x39mm less-lethal)"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a9x39/rubber
	icon_state = "plamyarubbermag"

/obj/item/ammo_magazine/strela
	name = "Strela magazine(12 gauge buckshot)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "12g"
	icon_state = "strelamag"
	max_ammo = 7
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	ammo_type = /obj/item/ammo_casing/a12g/pellet

/obj/item/ammo_magazine/strela/slug
	name = "Strela magazine(12 gauge slug)"
	ammo_type = /obj/item/ammo_casing/a12g

/obj/item/ammo_magazine/molniya
	name = "Molniya magazine box(7.62x51mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "molniyamag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 8000)
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/molniya/ap
	name = "Molniya magazine box(7.62x51mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/kord
	name = "Kord magazine box(12.7x108mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "12.7x108mm"
	icon_state = "kordmag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 20000)
	ammo_type = /obj/item/ammo_casing/a127x108

/obj/item/ammo_magazine/pkm
	name = "PKM magazine box(7.62x54mmR standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62x54mmR"
	icon_state = "molniyamag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 8000)
	ammo_type = /obj/item/ammo_casing/a762x54

/obj/item/ammo_magazine/pkm/ap
	name = "PKM magazine box(7.62x54mmR armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	ammo_type = /obj/item/ammo_casing/a762x54/ap

/obj/item/ammo_magazine/rpd
	name = "RPD Drum magazine(7.62x39mm standard)" //Lil side note. These mags don't work with the AK, because the rounds inside are actually on a belt, but they might still fit inside an AK and just break it? Couldn't find any more details on what happens if you try.
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62x39mm"
	icon_state = "rpdmag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 8000)
	ammo_type = /obj/item/ammo_casing/a762x39

/obj/item/ammo_magazine/rpd/ap
	name = "PPD Drum magazine(7.62x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/akm/drum
	name = "RPK Drum magazine(7.62x39mm standard)" //These ARE interchangeable with AK magazines in the same caliber
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62x39mm"
	icon_state = "rpdmag"
	max_ammo = 75
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 6000)
	ammo_type = /obj/item/ammo_casing/a762x39

/obj/item/ammo_magazine/akm/drum/ap
	name = "RPK magazine box(7.62x39mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 7500)
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/ssp4
	name = "SSP4 magazine(10mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "10mm"
	icon_state = "10mmmag"
	max_ammo = 8
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 400)
	ammo_type = /obj/item/ammo_casing/a10mm

/obj/item/ammo_magazine/ssp4/rubber
	name = "SSP4 magazine(10mm standard)"
	ammo_type = /obj/item/ammo_casing/a10mm/rubber
	icon_state = "10mmrubbermag"
	matter = list(DEFAULT_WALL_MATERIAL = 300)

/obj/item/ammo_magazine/makarov
	name = "Makarov magazine(9x18mm Makarov standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "9x18mm"
	icon_state = "9mmmag"
	max_ammo = 8
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(DEFAULT_WALL_MATERIAL = 400)
	ammo_type = /obj/item/ammo_casing/a9x18

/obj/item/ammo_magazine/makarov/rubber
	name = "Makarov magazine(9x18mm Makarov rubber)"
	ammo_type = /obj/item/ammo_casing/a9x18/rubber
	icon_state = "9mmrubbermag"

/obj/item/ammo_magazine/m9mm/vp70
	name = "VP70 magazine (9x19mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "9mmmag"
	ammo_type = /obj/item/ammo_casing/a9mm
	max_ammo = 18

/obj/item/ammo_magazine/m9mm/vp70/ap
	name = "VP70 magazine (9x19mm armor-piercing)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/m9mm/vp70/hp
	name = "VP70 magazine (9x19mm hollow-point)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/m9mm/vp70/rubber
	name = "VP70 magazine (9x19mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber
	icon_state = "9mmrubbermag"

/obj/item/ammo_magazine/m9mm/vp70/flash
	name = "VP70 magazine (9x19mm flash)"
	ammo_type = /obj/item/ammo_casing/a9mm/flash
	icon_state = "9mmrubbermag"

/obj/item/ammo_magazine/tp23s
	name = "TP-23 TS magazine (.44 magnum standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "45mag"
	max_ammo = 10
	mag_type = MAGAZINE
	caliber = ".44"
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a44

/obj/item/ammo_magazine/tp23s/rubber
	name = "TP-23 TS magazine (.44 magnum less-lethal)"
	ammo_type = /obj/item/ammo_casing/a44/rubber

/obj/item/ammo_magazine/tp23s/highpower
	name = "TP-23 TS magazine (.44 magnum +P)"
	desc = "This will probably void your warranty... If you have one."
	ammo_type = /obj/item/ammo_casing/a44/rifle

/obj/item/ammo_magazine/tp23
	name = "TP-23 magazine (.45 ACP)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "45mag"
	max_ammo = 14
	mag_type = MAGAZINE
	caliber = ".45"
	matter = list(DEFAULT_WALL_MATERIAL = 800)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a45

/obj/item/ammo_magazine/tp23/rubber
	name = "TP-23 magazine (.45 ACP rubber)"
	ammo_type = /obj/item/ammo_casing/a45/rubber

/obj/item/ammo_magazine/tp23/flash
	name = "TP-23 magazine (.45 ACP flash)"
	ammo_type = /obj/item/ammo_casing/a45/flash

/obj/item/ammo_magazine/tp23/hp
	name = "TP-23 magazine (.45 ACP hollow-point)"
	ammo_type = /obj/item/ammo_casing/a45/hp

/obj/item/ammo_magazine/tp23/ap
	name = "TP-23 magazine (.45 ACP armor piercing)"
	ammo_type = /obj/item/ammo_casing/a45/ap

/obj/item/ammo_magazine/tp23/emp
	name = "TP-23 magazine (.45 ACP low-yield EMP)"
	ammo_type = /obj/item/ammo_casing/a45/emp

/obj/item/ammo_magazine/s45lc
	name = "speedloader (.45 LC)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "44"
	ammo_type = /obj/item/ammo_casing/a45lc
	matter = list(MAT_STEEL = 1260) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45 LC"
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/s45lc/empty
	initial_ammo = 0

/obj/item/ammo_magazine/s45lc/rubber
	name = "speedloader (.45 LC rubber)"
	icon_state = "R44"
	ammo_type = /obj/item/ammo_casing/a45lc/rubber

/obj/item/ammo_magazine/s45lc/rifle
	name = "speedloader (.45 LC +P)"
	icon_state = "RI44"
	ammo_type = /obj/item/ammo_casing/a45lc/rifle
