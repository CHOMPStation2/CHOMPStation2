//automatic.dm
/obj/item/weapon/gun/projectile/automatic
	bolt_name="charging handle"

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
	bolt_name="charging_handle"
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 960 //Prototype PU-21(https://en.wikipedia.org/wiki/IP-2)

/obj/item/weapon/gun/projectile/automatic/as24
	muzzle_velocity = 470 //Temporary, might be changed.

/obj/item/weapon/gun/projectile/automatic/mini_uzi
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 280 //Mac-10 .45

/obj/item/weapon/gun/projectile/automatic/p90	//Finally a gun that exists irl. oh wait fuck they decided to chamber the p90 in 9mm kms
	muzzle_velocity = 397	//Guestimation. Will hopefully be able to replace with actual 5.7mm at some point.

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
	bolt_name="charging_handle"
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
/obj/item/weapon/gun/projectile/garand	//To be updated to use .30 springfield.
	bolt_name="charging handle"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | CHAMBER_ON_RELOAD
	bolt_release = null
	muzzle_velocity = 853	//Actual gun.

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

/obj/item/weapon/gun/projectile/SVD	//To be updated to use actual 7.62x54 instead of 7.62 NATO
	bolt_name = "charging handle"
	muzzle_velocity = 830	//Actual gun.