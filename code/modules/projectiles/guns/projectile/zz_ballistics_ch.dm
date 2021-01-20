//Time to add our own awesome guns! >:D
/obj/item/weapon/gun/projectile/fiveseven
	name = "Five-seven handgun"
	desc = "A unique pistol that fires 5.7x28mm instead of typical handgun cartridges"
	caliber = "5.7x28mm"
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	magazine_type = /obj/item/ammo_magazine/a57
	allowed_magazines = list(/obj/item/ammo_magazine/a57)
	projectile_type = /obj/item/projectile/bullet/a57
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "fiveseven"
	load_method = MAGAZINE
	muzzle_velocity = 650

/obj/item/weapon/gun/projectile/fiveseven/update_icon()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

//Was originally expecting to be able to have 64x64 guns and just shrink them but that's just like not a thing because code doesn't allow it
//And Kasssc kinda explained to me that even if the code did allow it, it wouldn't look right.
//So, we have the mp5 as the only one that does have this, and it just uses filters to convert the 64x64 sprite into 32x32 for now.
/obj/item/weapon/gun/projectile/automatic/cballistic
	name = "I AM NOT SUPPOSED TO EXIST"
	desc = "Yes hello I'm not supposed to exist, I'm just a weird code artefact thing please contact a developer."
	icon = 'icons/obj/gun64_ch.dmi'
	icon_state = "mp5a5"
	appearance_flags = 288
	icon_expected_height = 64
	icon_expected_width = 64
	//icon_scale_x = 0.5
	//icon_scale_y = 0.5

/obj/item/weapon/gun/projectile/automatic/cballistic/Initialize()
	. = ..()
	update_transform()

/obj/item/weapon/gun/projectile/automatic/cballistic/update_transform()
	. = ..()
	transform = transform.Scale(0.5,0.5)
	transform = transform.Translate(-16,-16)

/obj/item/weapon/gun/projectile/automatic/cballistic/update_icon()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

/obj/item/weapon/gun/projectile/automatic/cballistic/mp5a5
	name = "MP5A5 submachine gun"
	desc = "An old, but extremely reliable machine gun from earth. Known for its use in counter-terrorist forces."
	caliber = "9mm"
	magazine_type = /obj/item/ammo_magazine/mp5mag
	allowed_magazines = list(/obj/item/ammo_magazine/mp5mag)
	icon_state = "mp5a5"
	projectile_type = /obj/item/projectile/bullet/pistol
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 400

//Following guns are thanks to Serdy/Przyjaciel for the sprites and lore for WKHM. Naming the classes after him in honor <3
/obj/item/weapon/gun/projectile/automatic/serdy
	name = "I AM NOT SUPPOSED TO EXIST"
	desc = "Yes hello I'm not supposed to exist, I'm just a weird code artefact thing please contact a developer."
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "asval"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/weapon/gun/projectile/automatic/serdy/Initialize()
	. = ..()
	update_transform()

/obj/item/weapon/gun/projectile/automatic/serdy/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)
//AK Variants

/obj/item/weapon/gun/projectile/automatic/serdy/asval
	name = "AS-VAL"
	desc = "A somewhat competent remake of an ancient russian assault rifle. Commonly found in the hands of criminals, and on pan-slavic rimworlds. Integrally suppressed, chambered in 7.62x39mm."
	caliber = "9x39mm"
	magazine_type = /obj/item/ammo_magazine/asval
	allowed_magazines = list(/obj/item/ammo_magazine/asval)
	icon_state = "asval"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 295

/obj/item/weapon/gun/projectile/automatic/serdy/krinkov
	name = "Krinkov"
	desc = "A professionally cut down AKM made to be easily concealable. With a 12 inch barrel, this is a very loud short barrel rifle. Illegal pretty much everywhere, and easy to get a hold of, these classic russian firearms are a mainstay amidst the various criminal organizations across the galaxy."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "krinkov"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 680

/obj/item/weapon/gun/projectile/automatic/serdy/akm
	name = "AKM"
	desc = "The tried and true, old fashioned chatterbox. Ivan's favorite. Best used while at least somewhat inebriated. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "akm"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 715

/obj/item/weapon/gun/projectile/automatic/serdy/scrapak
	name = "AKM"
	desc = "The 'Stalingrad Special'. This rickety old AKM has seen better days. Better bring some vodka, because every shot this gun manages to squeeze off without blowing up in your face is worthy of celebration. Chambered in 7.62x39mm"
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "scrapak"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 700

// AR Variants

/obj/item/weapon/gun/projectile/automatic/serdy/m16a2
	name = "M16A2"
	desc = "A favorite service rifle everywhere, even today. It might be a reproduction, but Eugene Stoner smiles upon every man or woman who wields this beautiful democracy dispensing machine, even if it's never seen the soil of Terra, and never will. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"

	magazine_type = /obj/item/ammo_magazine/m16
	allowed_magazines = list(/obj/item/ammo_magazine/m16)
	icon_state="m16"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	muzzle_velocity = 960

/obj/item/weapon/gun/projectile/automatic/serdy/m4a1
	name = "M4A1"
	desc = "The M16's shorter, more lightweight little brother. An old terran flag is stamped into the receiver. These guns can be found just about everywhere. A favorite on the rimworlds due to its simplicity to produce, and reliability. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	magazine_type = /obj/item/ammo_magazine/m16
	allowed_magazines = list(/obj/item/ammo_magazine/m16)
	icon_state="m4"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	load_method = MAGAZINE
	muzzle_velocity = 910

/obj/item/weapon/gun/projectile/automatic/serby/patriot
	name = "Patriot"
	desc = "I raised you, and loved you, I've given you weapons, taught you techniques, endowed you with knowledge. There's nothing more for me to give you. All that's left for you to take is my life. 'Still in a dream' is stamped into the receiver, and it has no serial number. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	magazine_type = /obj/item/ammo_magazine/m16
	allowed_magazines = list(/obj/item/ammo_magazine/m16)
	icon_state="patriot"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	load_method = MAGAZINE
	muzzle_velocity = 960

//Other rifles

/obj/item/weapon/gun/projectile/automatic/serby/m41ab //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
	name = "M41A/2"
	desc = "The Armat M41A Pulse Rifle is a pulse-action assault rifle chambered for 10×24mm Caseless ammunition. This one is a rare, and fairly competent replica of the original by Scarborough Arms, with some minor design improvements over the original. The aluminium chassis is painted steel blue, and it has 'Scarborough Arms - Per falcis, per pravitas' inscribed on the stock."
	caliber = "10x24mm caseless"
	magazine_type = /obj/item/ammo_magazine/m41
	allowed_magazines = list(/obj/item/ammo_magazine/m41)
	icon_state="m41ab"
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 840

/obj/item/weapon/gun/projectile/automatic/serby/m41a //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
	name = "M41A"
	desc = "A tried and true original. The Armat M41A Pulse Rifle is a pulse-action assault rifle chambered for 10×24mm Caseless ammunition. 'PEACE THROUGH SUPERIOR FIREPOWER' is stamped into the side of the aluminium chassis."
	caliber = "10x24mm caseless"
	magazine_type = /obj/item/ammo_magazine/m41
	allowed_magazines = list(/obj/item/ammo_magazine/m41)
	icon_state="m41a"
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 840

/obj/item/weapon/gun/projectile/automatic/serby/sks 	//Reminder to myself to make sure this works and also to make sure that people are able to empty the internal mag
	name = "SKS"
	desc = "Just looking at it makes you want to buy a tacticool turtleneck, go into the woods, and -operate-. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	load_method = SINGLE_CASING|SPEEDLOADER
	icon_state = "sks"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	muzzle_velocity = 735
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/a762x39


//Time to give all these existing guns some new properties.
//automatic.dm
/obj/item/weapon/gun/projectile/automatic
	bolt_name="charging handle"
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'

/obj/item/weapon/gun/projectile/automatic/advanced_smg
	muzzle_velocity = 390	//Based off MPX

/obj/item/weapon/gun/projectile/automatic/c20r
	muzzle_velocity = 285	//Based off UMP-45, since apparently this 10mm smg fires .45 ftw. May be fixed in future updates.

/obj/item/weapon/gun/projectile/automatic/sts35
	muzzle_velocity = 900	//Based off AK-74

/obj/item/weapon/gun/projectile/automatic/wt550
	muzzle_velocity = 375	//Guestimation

/obj/item/weapon/gun/projectile/automatic/z8
	muzzle_velocity = 750	//Based off HK417 16 in barrel.

/obj/item/weapon/gun/projectile/automatic/l6_saw
	bolt_name="charging handle"
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 960 //Prototype PU-21(https://en.wikipedia.org/wiki/IP-2)

/obj/item/weapon/gun/projectile/automatic/as24
	muzzle_velocity = 470 //Temporary, might be changed.

/obj/item/weapon/gun/projectile/automatic/mini_uzi
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 280 //Mac-10 .45

/obj/item/weapon/gun/projectile/automatic/p90	//Finally a gun that exists irl. oh wait fuck they decided to chamber the p90 in 9mm //Fixed bb
	muzzle_velocity = 715	//Guestimation. Will hopefully be able to replace with actual 5.7mm at some point. //Done
	desc = "The H90K is a compact, large capacity submachine gun produced by MarsTech. Despite its fierce reputation, it still manages to feel like a toy. Uses 5.7x28mm rounds."
	caliber = "5.7x28mm"
	allowed_magazines = list(/obj/item/ammo_magazine/m9mmp90)

/obj/item/weapon/gun/projectile/automatic/tommygun	//Phew, an actual gun that fires the correct cartridge.
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 285

/obj/item/weapon/gun/projectile/automatic/bullpup
	muzzle_velocity = 880	//7.62 NATO Bullpup was unsurprisingly difficult to find https://en.wikipedia.org/wiki/Kel-Tec_RFB 

/obj/item/weapon/gun/projectile/automatic/combatsmg
	muzzle_velocity = 370	//Guestimation

//automatic_vr.dm

/obj/item/weapon/gun/projectile/automatic/battlerifle
	muzzle_velocity = 370	//Not a real rifle or cartridge. Guestimating.

/obj/item/weapon/gun/projectile/automatic/pdw
	muzzle_velocity = 390 	//MPX

/obj/item/weapon/gun/projectile/automatic/stg
	muzzle_velocity = 685	//STG-44

/obj/item/weapon/gun/projectile/automatic/sol
	muzzle_velocity = 380	//Guestimation

//automatic_yw.dm
/obj/item/weapon/gun/projectile/automatic/mg42
	bolt_name="charging handle"
	auto_loading_type = OPEN_BOLT
	bolt_release = null
	muzzle_velocity = 740	//Real gun.

//boltaction.dm
/obj/item/weapon/gun/projectile/shotgun/pump/rifle
	muzzle_velocity = 860	//Guestimation

//caseless.dm
/obj/item/weapon/gun/projectile/caseless
	bolt_name="charging handle"
	muzzle_velocity = 380 //Based of 9mm, because this fires 9mm projectiles. Will be fixed in future updates, likely.

//contender.dm
/obj/item/weapon/gun/projectile/contender	//To be updated to use .357
	manual_chamber = FALSE
	muzzle_velocity = 370

//dartgun.dm
/obj/item/weapon/gun/projectile/dartgun
	manual_chamber = FALSE

//pistol.dm
/obj/item/weapon/gun/projectile/colt
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911

/obj/item/weapon/gun/projectile/sec
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911

/obj/item/weapon/gun/projectile/silenced
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 240	//Guestimation, minus velocity for suppressor

/obj/item/weapon/gun/projectile/deagle
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 430	//Guestimation, everyone uses .50AE lol

/obj/item/weapon/gun/projectile/gyropistol
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY

/obj/item/weapon/gun/projectile/pistol
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 300	//P365

/obj/item/weapon/gun/projectile/pirate
	manual_chamber = FALSE

/obj/item/weapon/gun/projectile/derringer
	manual_chamber = FALSE
	muzzle_velocity = 350	//Guestimation

/obj/item/weapon/gun/projectile/luger
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 350	//Luger

/obj/item/weapon/gun/projectile/p92x
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 370

//pistol_vr.dm
/obj/item/weapon/gun/projectile/lamia
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 400	//Guestimation


/obj/item/weapon/gun/projectile/giskard	//To be updated to .380
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 300	//Guestimation

//pistol_yw.dm
/obj/item/weapon/gun/projectile/automatic/glock
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 375	//Actual gun.

/obj/item/weapon/gun/projectile/ppk
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 310	//Guestimation since PPK doesn't fire 9mm

/obj/item/weapon/gun/projectile/m2024
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 260	//Guestimation

/obj/item/weapon/gun/projectile/fluff/m1911
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911

//revolver.dm
/obj/item/weapon/gun/projectile/revolver 	//To be updated to use .375
	manual_chamber = FALSE
	muzzle_velocity = 330	//Guestimation

/obj/item/weapon/gun/projectile/revolver/detective 		//To be updated to use .38
	muzzle_velocity = 350	//Guestimation

/obj/item/weapon/gun/projectile/revolver/detective45	//Awful.
	muzzle_velocity = 230 	//Guestimation

/obj/item/weapon/gun/projectile/revolver/deckard		//To be updated to use .38
	muzzle_velocity = 365

/obj/item/weapon/gun/projectile/revolver/judge
	muzzle_velocity = 440	//Temporary

/obj/item/weapon/gun/projectile/revolver/lemat
	muzzle_velocity = 365

/obj/item/weapon/gun/projectile/revolver/webley
	muzzle_velocity = 340	//Guestimation

/obj/item/weapon/gun/projectile/revolver/consul
	muzzle_velocity = 350	//Guestimation

/obj/item/weapon/gun/projectile/revolver/nova
	muzzle_velocity = 330	//Guestimation

/obj/item/weapon/gun/projectile/revolver/cerberus
	muzzle_velocity = 340	//Guestimation

//semiauto.dm
/obj/item/weapon/gun/projectile/garand	//To be updated to use .30 springfield. //Leaving it as 7.62 for the purpose of making rounds more available.
	bolt_name="charging handle"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | CHAMBER_ON_RELOAD
	bolt_release = null
	muzzle_velocity = 853	//Actual gun.
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'

/obj/item/weapon/gun/projectile/revolvingrifle
	manual_chamber = FALSE
	muzzle_velocity = 500 //Guestimation from leveraction .44 minus some for being a revolver.

//shotgun.dm
/obj/item/weapon/gun/projectile/shotgun
	muzzle_velocity = 470 //Temporary

/obj/item/weapon/gun/projectile/shotgun/pump
	manual_chamber = FALSE

/obj/item/weapon/gun/projectile/shotgun/doublebarrel
	manual_chamber = FALSE

//shotgun_yw.dm
/obj/item/weapon/gun/projectile/revolvershotgun
	manual_chamber = FALSE
	muzzle_velocity = 470 //Temporary

//sniper.dm
/obj/item/weapon/gun/projectile/heavysniper
	manual_chamber = FALSE
	muzzle_velocity = 1132	//Istiglal IST-14.5 anti-materiel rifle

/obj/item/weapon/gun/projectile/SVD	//To be updated to use actual 7.62x54 instead of 7.62 NATO //Done!
	bolt_name = "charging handle"
	muzzle_velocity = 830	//Actual gun.
	desc = "The PCA S19 Jalgarr, also known by its translated name the 'Dragon', is mass produced with an Optical Sniper Sight so simple that even a Tajaran can use it. Too bad for you that the inscriptions are written in Siik. Uses 7.62x54mmR rounds."
	caliber = "7.62x54mmR"
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'