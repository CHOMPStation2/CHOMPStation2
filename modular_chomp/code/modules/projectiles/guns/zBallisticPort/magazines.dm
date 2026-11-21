//This enables you to load mag to mag too. This includes from box to mag.
/obj/item/ammo_magazine/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/L = W
		if(L.caliber != caliber)
			to_chat(user, span_warning("The ammo in [L] does not fit into [src]."))
			return
		if(!L.stored_ammo.len)
			to_chat(user, span_warning("There's no more ammo [L]!"))
			return
		if(stored_ammo.len >= max_ammo)
			to_chat(user, span_warning("[src] is full!"))
			return
		while(L.stored_ammo.len && stored_ammo.len < max_ammo)
			var/obj/item/ammo_casing/AC = L.stored_ammo[1] //select the next casing.
			L.stored_ammo -= AC //Remove this casing from loaded list of the clip.
			AC.forceMove(src)
			stored_ammo.Insert(1, AC) //add it to the head of our magazine's list
		L.update_icon()
	..()

/obj/item/ammo_magazine/asval
	name = "AS-Val magazine(9mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "asval"
	max_ammo = 20
	mag_type = MAGAZINE
	caliber = "9mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.5))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a9mm

/obj/item/ammo_magazine/asval/ap
	name = "AS-Val magazine(9mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.6))
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/asval/rubber
	name = "AS-Val magazine(9mm less-lethal)"
	icon_state = "asvalrubber"
	matter = list(MAT_STEEL = MATERIAL_COST(0.5))
	ammo_type = /obj/item/ammo_casing/a9mm/rubber
/obj/item/ammo_magazine/akm
	name = "AKM magazine (7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.8))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/akm/ap
	name = "AKM magazine (7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/akm/hp
	name = "AKM magazine (7.62mm hollow-point)"
	matter = list(MAT_STEEL = MATERIAL_COST(1))
	ammo_type = /obj/item/ammo_casing/a762/hp

/obj/item/ammo_magazine/akm/rubber
	name = "AKM magazine (7.62mm less-lethal)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762rubbermag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.6))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762/rubber

/obj/item/ammo_magazine/ak74
	name = "AK74 magazine (5.45mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "545bake"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "5.45mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a545

/obj/item/ammo_magazine/ak74/ap
	name = "AK74 magazine (5.45mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.9))
	ammo_type = /obj/item/ammo_casing/a545/ap

/obj/item/ammo_magazine/ak74/hp
	name = "AK74 magazine (5.45mm hollow-point)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.9))
	ammo_type = /obj/item/ammo_casing/a545/hp

/obj/item/ammo_magazine/ak74/rubber
	name = "AK74 magazine (5.45mm less-lethal)"
	icon_state = "545bakerubber"
	matter = list(MAT_STEEL = MATERIAL_COST(0.6))
	ammo_type = /obj/item/ammo_casing/a545/rubber

/obj/item/ammo_magazine/ak74/plum
	icon_state = "545plum"

/obj/item/ammo_magazine/ak74/plum/rubber
	name = "AK74 magazine (5.45mm less-lethal)"
	icon_state = "545plumrubber"
	matter = list(MAT_STEEL = MATERIAL_COST(0.6))
	ammo_type = /obj/item/ammo_casing/a545/rubber

/obj/item/ammo_magazine/m16
	name = "M16 magazine (5.56mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "556mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "5.56mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a556

/obj/item/ammo_magazine/m16/ap
	name = "M16 magazine (5.56mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.85))
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_magazine/m16/rubber
	name = "M16 magazine (5.56mm less-lethal)"
	icon_state = "556rubbermag"
	matter = list(MAT_STEEL = MATERIAL_COST(0.85))
	ammo_type = /obj/item/ammo_casing/a556/rubber


/obj/item/ammo_magazine/m16/hp
	name = "M16 magazine (5.56mm hollow-point)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.85))
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/ammo_magazine/m16/patriot
	name = "Patriot magazine (5.56mm)"
	matter = list(MAT_STEEL = MATERIAL_COST(2.5))
	max_ammo = 100
	icon_state = "patriotmag"

/obj/item/ammo_magazine/m41
	name = "M41A magazine (10x24mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "m41mag"
	max_ammo = 40
	mag_type = MAGAZINE
	caliber = "10x24mm"
	matter = list(MAT_STEEL = MATERIAL_COST(5))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a10x24

/obj/item/ammo_magazine/m41/rubber
	name = "M41A magazine (10x24mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "m41rubbermag"
	max_ammo = 40
	matter = list(MAT_STEEL = MATERIAL_COST(3.5))
	ammo_type = /obj/item/ammo_casing/a10x24/rubber

/obj/item/ammo_magazine/t12
	name = "T-12 magazine (10x24mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "t12"
	max_ammo = 40
	mag_type = MAGAZINE
	caliber = "10x24mm"
	matter = list(MAT_STEEL = MATERIAL_COST(5))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a10x24

/obj/item/ammo_magazine/clip/sks
	name = "Ammo clip(7.62mm)"
	icon_state = "gclip"
	max_ammo = 10
	caliber = "7.62mm"
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.2))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/clip/sks/ap
	name = "Ammo clip(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.35))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/clip/mosin
	name = "Ammo clip(7.62mm)"
	icon_state = "clip_rifle"
	max_ammo = 5
	caliber = "7.62mm"
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.15))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/clip/mosin/ap
	name = "Ammo clip(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(0.3))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/type901
	name = "Type-901 magazine(7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "762mag"
	max_ammo = 30
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/type901/ap
	name = "Type-901 magazine(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1.5))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/ar10
	name = "AR-10 magazine(7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "t12"
	max_ammo = 20
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.9))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/ar10/ap
	name = "AR-10 magazine(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/fal
	name = "FAL magazine(7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "t12"
	max_ammo = 20
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.9))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/fal/ap
	name = "FAL magazine(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/awp
	name = "AWP magazine(.338 Lapua)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = ".338"
	icon_state = "awp"
	max_ammo = 5
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a338

/obj/item/ammo_magazine/awp/ap
	name = "AWP magazine(.338 Lapua armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1.5))
	ammo_type = /obj/item/ammo_casing/a338/ap

/obj/item/ammo_magazine/hectate
	name = "Hectate II magazine(.50 BMG)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = ".50 BMG"
	icon_state = "hectate"
	max_ammo = 7
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(2))
	ammo_type = /obj/item/ammo_casing/a50bmg

/obj/item/ammo_magazine/hectate/ap
	name = "Hectate II magazine(.50 BMG armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(2.5))
	ammo_type = /obj/item/ammo_casing/a50bmg/ap

/obj/item/ammo_magazine/ppsh
	name = "PPSH-17b drum magazine(.45)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = ".45"
	icon_state = "ppshmag"
	max_ammo = 71
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.75))
	ammo_type = /obj/item/ammo_casing/a45

/obj/item/ammo_magazine/plamya
	name = "Plamya drum magazine(9mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "9mm"
	icon_state = "plamyamag"
	max_ammo = 50
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1.25))
	ammo_type = /obj/item/ammo_casing/a9mm

/obj/item/ammo_magazine/plamya/ap
	name = "Plamya drum magazine(9mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(1.5))
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/plamya/rubber
	name = "Plamya drum magazine(9mm less-lethal)"
	matter = list(MAT_STEEL = MATERIAL_COST(1))
	ammo_type = /obj/item/ammo_casing/a9mm/rubber
	icon_state = "plamyarubbermag"

/obj/item/ammo_magazine/strela
	name = "Strela magazine(12 gauge buckshot)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "12g"
	icon_state = "strelamag"
	max_ammo = 7
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.4))
	ammo_type = /obj/item/ammo_casing/a12g/pellet

/obj/item/ammo_magazine/strela/slug
	name = "Strela magazine(12 gauge slug)"
	ammo_type = /obj/item/ammo_casing/a12g

/obj/item/ammo_magazine/molniya
	name = "Molniya magazine box(7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "molniyamag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(4))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/molniya/ap
	name = "Molniya magazine box(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(5))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/kord
	name = "Kord magazine box(12.7x108mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "12.7x108mm"
	icon_state = "kordmag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(10))
	ammo_type = /obj/item/ammo_casing/a127x108

/obj/item/ammo_magazine/pkm
	name = "PKM magazine box(7.62mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "molniyamag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(4))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/pkm/ap
	name = "PKM magazine box(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(5))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/rpd
	name = "RPD Drum magazine(7.62mm)" //Lil side note. These mags don't work with the AK, because the rounds inside are actually on a belt, but they might still fit inside an AK and just break it? Couldn't find any more details on what happens if you try.
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "rpdmag"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(4))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/rpd/ap
	name = "PPD Drum magazine(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(5))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/akm/drum
	name = "RPK Drum magazine(7.62mm)" //These ARE interchangeable with AK magazines in the same caliber
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "7.62mm"
	icon_state = "rpdmag"
	max_ammo = 75
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(3))
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/akm/drum/ap
	name = "RPK magazine box(7.62mm armor-piercing)"
	matter = list(MAT_STEEL = MATERIAL_COST(3.75))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/ssp4
	name = "SSP4 magazine(10mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "10mm"
	icon_state = "10mmmag"
	max_ammo = 8
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.2))
	ammo_type = /obj/item/ammo_casing/a10mm

/obj/item/ammo_magazine/ssp4/rubber
	name = "SSP4 magazine(10mm)"
	ammo_type = /obj/item/ammo_casing/a10mm/rubber
	icon_state = "10mmrubbermag"
	matter = list(MAT_STEEL = MATERIAL_COST(0.15))

/obj/item/ammo_magazine/makarov
	name = "Makarov magazine(9mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	caliber = "9mm"
	icon_state = "9mmmag"
	max_ammo = 8
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.2))
	ammo_type = /obj/item/ammo_casing/a9mm

/obj/item/ammo_magazine/makarov/rubber
	name = "Makarov magazine(9mm Makarov rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber
	icon_state = "9mmrubbermag"

/obj/item/ammo_magazine/m9mm/vp70
	name = "VP70 magazine (9mm)"
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
	name = "TP-23 TS magazine (.44 magnum)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "45mag"
	max_ammo = 10
	mag_type = MAGAZINE
	caliber = ".44"
	matter = list(MAT_STEEL = MATERIAL_COST(0.4))
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
	matter = list(MAT_STEEL = MATERIAL_COST(0.4))
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

/obj/item/ammo_magazine/mp5mag
	name = "mp5 magazine(9mm)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "mp5mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "9mm"
	matter = list(MAT_STEEL = MATERIAL_COST(0.4))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a9mm

/obj/item/ammo_magazine/mp5mag/rubber
	name = "mp5 magazine(9x19mm rubber)"
	ammo_type = /obj/item/ammo_casing/a9mm/rubber

/obj/item/ammo_magazine/mp5mag/ap
	name = "mp5 magazine(9x19mm AP)"
	ammo_type = /obj/item/ammo_casing/a9mm/ap

/obj/item/ammo_magazine/mp5mag/hp
	name = "mp5 magazine(9x19mm HP)"
	ammo_type = /obj/item/ammo_casing/a9mm/hp

/obj/item/ammo_magazine/pitchmag
	name = "pitchgun magazine(.44)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "pitchmag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = ".44"
	matter = list(MAT_STEEL = MATERIAL_COST(0.4))
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a44




// ------------------------- GATTENING EARLY PORT STUFF, THIS IS (i pray to god) TEMPORARY ------------------------- //




/obj/item/ammo_magazine/lynx
	name = "Lynx magazine (7.76x55mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "7.76mm"
	icon_state = "rifle_medium"
	max_ammo = 10
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a776

/obj/item/ammo_magazine/zvir
	name = "Zvir magazine (7.62)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "7.62mm"
	icon_state = "rifle_box"
	max_ammo = 100
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(2.7))
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/barka
	name = "Drobarka magazine (15x80mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "15mm"
	icon_state = "rifle_magnum_box"
	max_ammo = 50
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(2.7))
	ammo_type = /obj/item/ammo_casing/a15mm


/obj/item/ammo_magazine/bm51
	name = "BM51 magazine (6.5x50mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "6.5mm"
	icon_state = "rifle_light_large"
	max_ammo = 25
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	ammo_type = /obj/item/ammo_casing/a6550mm

/obj/item/ammo_magazine/bm51/ap
	name = "armor-piercing BM51 magazine (6.5x50mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "6.5mm"
	icon_state = "rifle_light_large"
	max_ammo = 25
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	ammo_type = /obj/item/ammo_casing/a6550mm/ap

/obj/item/ammo_magazine/bm109
	name = "BM109 magazine (8.6x65mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "8.6mm"
	icon_state = "rifle_heavy_alt"
	max_ammo = 11
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1.2))
	ammo_type = /obj/item/ammo_casing/a86

/obj/item/ammo_magazine/pmx
	name = "PMX magazine (10mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "10mm"
	icon_state = "pistol_light"
	max_ammo = 8
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	ammo_type = /obj/item/ammo_casing/a10mm

/obj/item/ammo_magazine/viper
	name = "Ka12 Viper magazine (10mm)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = "10mm"
	icon_state = "smg_light"
	max_ammo = 25
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(1))
	ammo_type = /obj/item/ammo_casing/a10mm

/obj/item/ammo_magazine/sdiyaab
	name = "Super Diyaab magazine (.44)"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	caliber = ".44"
	icon_state = "pistol_heavy"
	max_ammo = 11
	mag_type = MAGAZINE
	multiple_sprites = 1
	matter = list(MAT_STEEL = MATERIAL_COST(0.7))
	ammo_type = /obj/item/ammo_casing/a44

/obj/item/ammo_magazine/ammo_box/a86
	name = "ammo box (8.6x65mm)"
	desc = "A box of 8.6x65mm rounds."
	icon_state = "rifle"
	caliber = "8.6mm"
	ammo_type = /obj/item/ammo_casing/a86
	matter = list(MAT_STEEL = MATERIAL_COST(3))
	max_ammo = 31
	multiple_sprites = 1
