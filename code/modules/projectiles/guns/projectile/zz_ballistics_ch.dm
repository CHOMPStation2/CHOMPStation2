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
	firemodes = list()
	var/is_picked_up = FALSE
	var/is_long = TRUE

/obj/item/weapon/gun/projectile/automatic/serdy/Initialize()
	. = ..()
	update_transform()

/obj/item/weapon/gun/projectile/automatic/serdy/update_transform()
	. = ..()
	if(is_picked_up && is_long)
		transform = transform.Turn(-45)
	transform = transform.Translate(-16,0)

/obj/item/weapon/gun/projectile/automatic/serdy/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/projectile/automatic/serdy/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/projectile/automatic/serdy/dropped()
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/weapon/gun/projectile/automatic/serdy/update_icon()
	. = ..()
	if(load_method == MAGAZINE)
		icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"
	else
		icon_state = bolt_open ? "[initial(icon_state)]-e" : "[initial(icon_state)]"


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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

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
	is_long = FALSE

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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60

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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 70

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
	w_class = ITEMSIZE_HUGE

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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

/obj/item/weapon/gun/projectile/automatic/serdy/patriot
	name = "Patriot"
	desc = "I raised you, and loved you, I've given you weapons, taught you techniques, endowed you with knowledge. There's nothing more for me to give you. All that's left for you to take is my life. 'Still in a dream' is stamped into the receiver, and it has no serial number. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	magazine_type = /obj/item/ammo_magazine/m16/patriot
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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 40

//Other rifles

/obj/item/weapon/gun/projectile/automatic/serdy/m41ab //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
	name = "M41A/2"
	desc = "The Armat M41A Pulse Rifle is a pulse-action assault rifle chambered for 10×24mm Caseless ammunition. This one is a rare, and fairly competent replica of the original by Scarborough Arms, with some minor design improvements over the original. The aluminium chassis is painted steel blue, and it has 'Scarborough Arms - Per falcis, per pravitas' inscribed on the stock."
	caliber = "10x24mm caseless"
	magazine_type = /obj/item/ammo_magazine/m41
	allowed_magazines = list(/obj/item/ammo_magazine/m41)
	icon_state="m41b"
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 840
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

/obj/item/weapon/gun/projectile/automatic/serdy/m41a //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

/obj/item/weapon/gun/projectile/automatic/serdy/sks 	//Reminder to myself to make sure this works and also to make sure that people are able to empty the internal mag
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
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60

/obj/item/weapon/gun/projectile/automatic/serdy/mosin
	name = "Mosin Nagant"
	desc = "A reproduction of some old russian bolt-action rifle from some backwater rimworld. Smells strongly of cosmoline. The inscriptions on it are in pan-slavic. Chambered in 7.62x54mmR."
	caliber = "7.62x54mmR"
	auto_loading_type = NO_AUTO_LOAD
	load_method = SINGLE_CASING|SPEEDLOADER
	only_open_load = TRUE
	icon_state = "mosin"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54
	muzzle_velocity = 865
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a762x54
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 70
	bolt_name = "bolt"
	sound_eject = 'sound/weapons/ballistics/boltactionopen.ogg'
	sound_chamber = 'sound/weapons/ballistics/boltactionclose.ogg'

/obj/item/weapon/gun/projectile/automatic/serdy/mosin/scoped
	name = "Scoped Mosin Nagant"
	icon_state = "scopedmosin"
	desc = "A reproduction of some old russian bolt-action rifle from some backwater rimworld. Smells strongly of cosmoline. The inscriptions on it are in pan-slavic. This one has a scope attached to it. Chambered in 7.62x54mmR."
	action_button_name = "Use Scope"
	accuracy = -15
	scoped_accuracy = 50
	one_handed_penalty = 70

/obj/item/weapon/gun/projectile/automatic/serdy/mosin/scoped/ui_action_click()
	scope()

/obj/item/weapon/gun/projectile/automatic/serdy/mosin/scoped/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/weapon/gun/projectile/automatic/serdy/type901
	name = "Type 901 Assault rifle"
	desc = "A heavy bullpup assault rifle of unknown make, with a very high muzzle velocity and fair accuracy. A favorite of scum and villainy everywhere due to its complete lack of identification markings. Popularized by the 2541 movie, 'Boarding Party'. Chambered in 7.62x51mm."
	caliber = "7.62mm"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	magazine_type = /obj/item/ammo_magazine/type901
	allowed_magazines = list(/obj/item/ammo_magazine/type901)
	icon_state = "type901"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 910
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60

/obj/item/weapon/gun/projectile/automatic/serdy/type901/carbine
	name = "Type 901-C Carbine"
	desc = "A lightweight bullpup assault carbine of unknown make, with a very high muzzle velocity and fair accuracy. A favorite of scum and villainy everywhere due to its complete lack of identification markings. Popularized by the 2541 movie, 'Boarding Party'. This one is smaller and more compact than its larger counterpart. Chambered in 7.62x39mm."
	icon_state = "type901b"
	muzzle_velocity = 880
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 30

/obj/item/weapon/gun/projectile/automatic/serdy/awp
	name = "AWP"
	desc = "A galaxy-wide favorite for hunting, target shooting, and rushing B. Legend has it, this rifle originated from three guys in a garage. This one is a reproduction. It has 'Scarborough Arms - Per falcis, per pravitas' inscribed on the stock. Chambered in .338 Lapua."
	caliber = ".338"
	auto_loading_type = NO_AUTO_LOAD
	magazine_type = /obj/item/ammo_magazine/awp
	allowed_magazines = list(/obj/item/ammo_magazine/awp)
	icon_state = "awp"
	projectile_type = /obj/item/projectile/bullet/rifle/a338
	load_method = MAGAZINE
	muzzle_velocity = 936
	action_button_name = "Use Scope"
	accuracy = -30
	scoped_accuracy = 50
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 90
	bolt_name = "bolt"
	sound_eject = 'sound/weapons/ballistics/boltactionopen.ogg'
	sound_chamber = 'sound/weapons/ballistics/boltactionclose.ogg'

/obj/item/weapon/gun/projectile/automatic/serdy/awp/ui_action_click()
	scope()

/obj/item/weapon/gun/projectile/automatic/serdy/awp/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/weapon/gun/projectile/automatic/serdy/hectate
	name = "Hectate II"
	desc = "An old world anti material rifle. Ideal for dealing with mechs, armored personnel, and space dragons. Chambered in .50 BMG."
	caliber = ".50 BMG"
	auto_loading_type = NO_AUTO_LOAD
	magazine_type = /obj/item/ammo_magazine/hectate
	allowed_magazines = list(/obj/item/ammo_magazine/hectate)
	icon_state = "hectate"
	projectile_type = /obj/item/projectile/bullet/rifle/a50bmg
	load_method = MAGAZINE
	muzzle_velocity = 825
	action_button_name = "Use Scope"
	accuracy = -60
	scoped_accuracy = 15
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 120
	bolt_name = "bolt"
	sound_eject = 'sound/weapons/ballistics/boltactionopen.ogg'
	sound_chamber = 'sound/weapons/ballistics/boltactionclose.ogg'


/obj/item/weapon/gun/projectile/automatic/serdy/hectate/ui_action_click()
	scope()

/obj/item/weapon/gun/projectile/automatic/serdy/hectate/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/weapon/gun/projectile/automatic/serdy/memegun
	name = "Hardbass Special"
	desc = "Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски. Chambered in 7.62x39mm"
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "memegun"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 715
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 40

/obj/item/weapon/gun/projectile/automatic/serdy/tkb408
	name = "TKB-408"
	desc ="An odd, bullpup, slavic assault rifle from some distant rimworld. Very sturdy, unbeleivably reliable. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "tkb"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 750
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60

/obj/item/weapon/gun/projectile/automatic/serdy/groza
	name = "OTs-14"
	desc = "A strangely ergonomic bullpup version of an AK. Commonly found in Pan-slavic speaking regions of space. All of the inscriptions on this thing are in pan-slavic. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "groza"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK
	muzzle_velocity = 685

/obj/item/weapon/gun/projectile/automatic/serdy/plamya
	name = "WKHM 'Plamya' Mk. 1"
	desc = "The original Plamya assault rifle, produced by WKHM back in the 2330's. Highly sought after for their collectability, and their superb reliability. They don't quite make them like they used to. It may not fire as fast as the newer ones, but these old models haven't survived this long for no reason. This one has a classic walnut thumbhole stock and foregrip. It has a heavy titanium chassis, durasteel bolt, and the original style 'PPSh' heatshield. The gun is dated 2336, and bears the 'WKHM Endurance' arkship's production stamp on the buttstock. 'A light in the dark' is stamped into the receiver. Chambered in 9x39mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "9x39mm"
	magazine_type = /obj/item/ammo_magazine/plamya
	allowed_magazines = list(/obj/item/ammo_magazine/plamya)
	icon_state = "plamyac"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round bursts", burst=5, fire_delay=0.5, move_delay=3.5,    burst_accuracy=list(0,-10,-15,-20,-25), dispersion=list(0.0, 0.3, 0.6, 0.9, 1.1))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	muzzle_velocity = 285
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

/obj/item/weapon/gun/projectile/automatic/serdy/plamya/mk2
	name = "WKHM 'Plamya' Mk. 2"
	desc = "An old school assault rifle. A favorite on the rimworld for it's blisteringly high rate of fire. One of the best selling products of W-K Heavy Manufacturing. Virtually impossible to break. The gold standard, with a rosewood thumbhole stock, a full length barrel, and an improved heatshield. The most mass produced firearm in WKHM's lineup. This one bears the 'WKHM Adamant' arkship's production stamp. Chambered in 9x39mm."
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round bursts", burst=5, fire_delay=0.5, move_delay=3.5,    burst_accuracy=list(0,-5,-10,-10,-15), dispersion=list(0.0, 0.2, 0.35, 0.5, 0.6))
	)
	muzzle_velocity = 305

/obj/item/weapon/gun/projectile/automatic/serdy/plamya/mk3
	name = "WKHM 'Plamya' Mk. 3"
	desc = "An old school assault rifle with a modern twist. A favorite on the rimworld for it's blisteringly high rate of fire. One of the best selling products of W-K Heavy Manufacturing. Virtually impossible to break. This is a newer variant, with a fully synthetic stock, and a shorter barrel. The serial number and production stamp has been sanded off. Chambered in 9x39mm."
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round bursts", burst=5, fire_delay=0.5, move_delay=3.5,    burst_accuracy=list(0,-7.5,-10,-15,-20), dispersion=list(0.0, 0.2, 0.4, 0.6, 0.7))
	)
	muzzle_velocity = 290

//Auto-shotgun, closer to the rifles than anything else though.

/obj/item/weapon/gun/projectile/automatic/serdy/strela
	name = "WKHM 'Strela'"
	desc = "A fully automatic, 12 gauge assault shotgun, that goes by many names. The Strela, The Bear, The Mule- The list goes on. If the Plamya is the scalpel, This heavy chunk of forged steel and titanium is the sledgehammer. Bring a shoulder pad and some tramadol. This one has a nice walnut thumbhole stock, and an AK style fore end. It also bears the 'WKHM Endurance' arkship's production stamp. Chambered in 12 gauge."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "12g"
	magazine_type = /obj/item/ammo_magazine/strela
	allowed_magazines = list(/obj/item/ammo_magazine/strela)
	icon_state = "strela"
	projectile_type = /obj/item/projectile/bullet/shotgun
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=3,    burst_accuracy=list(0,-5), dispersion=list(0.0, 0.2)),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	muzzle_velocity = 470
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

//SMGs

/obj/item/weapon/gun/projectile/automatic/serdy/ppsh
	name = "PPSh-17b"
	desc = "A cheap remake of the venerable russian PPSh-41. Empties a 71 round magazine in less than 10 seconds. Compensates for poor accuracy with volume of bullet. Every inscription on this thing is in pan-slavic. Chambered in 7.62x25mm Tokarev."
	caliber = "7.62x25mm"
	magazine_type = /obj/item/ammo_magazine/ppsh
	allowed_magazines = list(/obj/item/ammo_magazine/ppsh)
	icon_state="ppsh"
	projectile_type = /obj/item/projectile/bullet/a762x25
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	auto_loading_type = OPEN_BOLT
	load_method = MAGAZINE
	muzzle_velocity = 488

/obj/item/weapon/gun/projectile/automatic/serdy/mp5
	name = "MP5"
	desc = "A favorite of law enforcement and corporate security across the galaxy for centuries. This old H&K design has survived the test of time. And while in many places it has been replaced long ago, it still stands as a reliable weapon platform. No need to fix what isn't broken. Chambered in 9mm."
	caliber = "9mm"
	magazine_type = /obj/item/ammo_magazine/mp5mag
	allowed_magazines = list(/obj/item/ammo_magazine/mp5mag)
	icon_state="mp5"
	projectile_type = /obj/item/projectile/bullet/pistol
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 400
	is_long = FALSE

/obj/item/weapon/gun/projectile/automatic/serdy/vityaz
	name = "WKHM 'Vityaz'"
	desc = "A swarm of angry bees. The Plamya's baby brother. With 12 total moving parts, including the trigger mechanism, this gun was built with one purpose. Longevity and reliability. Commonly found in the hands of private security, criminals, and law enforcement alike across many worlds. This one is unmarked. Chambered in 10mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "10mm"
	magazine_type = /obj/item/ammo_magazine/m10mm
	allowed_magazines = list(/obj/item/ammo_magazine/m10mm)
	icon_state = "vityaz"
	projectile_type = /obj/item/projectile/bullet/a10mm
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	muzzle_velocity = 430
	is_long = FALSE

//LMGs

/obj/item/weapon/gun/projectile/automatic/serdy/molniya
	name = "WKHM 'Molniya'"
	desc = "A light machinegun manufactured by WKHM for various paramilitaries, private security companies, and rimworld governments. Big, heavy, and with a fire rate similar to that of an MG42. Often used in emplacements and on top of armored vehicles, or as a squad support weapon. Nicknamed the 'Pig' or the 'Sawzall', this one has a solid oak stock, and bears the 'WKHM Adamant' arkship's production stamp. If you ever see this gun, there is no doubt shit's about to go down. Chambered in 7.62x51mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "7.62mm"
	magazine_type = /obj/item/ammo_magazine/molniya
	allowed_magazines = list(/obj/item/ammo_magazine/molniya)
	icon_state = "molniya"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)
	load_method = MAGAZINE
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 860
	one_handed_penalty = 90

//Pistols

/obj/item/weapon/gun/projectile/automatic/serdy/ssp4
	name = "WKHM SSP4"
	desc = "A unique, high end service pistol carried by W-K security personnel in the outer rim, and various law enforcement agencies across the galaxy. Features a hidden ejector port, and an integral laser sight. Surprisingly reliable despite its unorthodox design. This one bears the 'WKHM Obsidian' arkship's production stamp. Chambered in 10mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "10mm"
	magazine_type = /obj/item/ammo_magazine/ssp4
	allowed_magazines = list(/obj/item/ammo_magazine/ssp4)
	icon_state = "ssp4"
	projectile_type = /obj/item/projectile/bullet/a10mm
	load_method = MAGAZINE
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 405
	is_long = FALSE

/obj/item/weapon/gun/projectile/automatic/serdy/ssp4/silenced
	name = "WKHM SSP4-S"
	desc = "A unique, high end service pistol carried by W-K security personnel in the outer rim, and various law enforcement agencies across the galaxy. Features a hidden ejector port, and an integral laser sight. Surprisingly reliable despite its unorthodox design. This one is unmarked and is suppressed. Due to the minimal amount of moving parts, this gun is almost completely silent when used with subsonic ammunition. Chambered in 10mm."
	silenced = 1
	icon_state = "ssp4s"

/obj/item/weapon/gun/projectile/serdy_pistols
	icon = 'icons/obj/gun_ch.dmi'
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	load_method = MAGAZINE

/obj/item/weapon/gun/projectile/serdy_pistols/makarov
	name = "Makarov PM"
	desc = "The venerable Makarov. An easily concealable 9x18mm pistol design from Russia. This one is old and worn, but still reliable as ever. Chambered in 9x18mm makarov."
	icon_state = "makarov"
	caliber = "9x18mm"
	magazine_type = /obj/item/ammo_magazine/makarov
	allowed_magazines = list(/obj/item/ammo_magazine/makarov)
	projectile_type = /obj/item/projectile/bullet/a9x18
	muzzle_velocity = 315

/obj/item/weapon/gun/projectile/serdy_pistols/vp70m
	name = "VP70M"
	desc = "Old Matilda. An ancient design, one of the first, if not the first entirely polymer framed pistols. Can commonly be found in the hands of.. well, anybody with access to a 3d printer. The designs for this pistol are absolutely everywhere, and it's still a favorite to this day, 500 some-odd years later. Chambered in 9mm."
	icon_state = "vp70"
	caliber = "9mm"
	magazine_type = /obj/item/ammo_magazine/m9mm/vp70
	allowed_magazines = list(/obj/item/ammo_magazine/m9mm)
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-20,-40), dispersion=list(0.0, 0.9, 1.8))
	)
	projectile_type = /obj/item/projectile/bullet/pistol
	muzzle_velocity = 365

/obj/item/weapon/gun/projectile/serdy_pistols/glock71
	name = "Glock 71"
	desc = "Following the same design for centuries, the Glock 71 is one of the most reliable sidearms you can buy for cheap these days. These things are everywhere, and for good reason. Chambered in 9mm."
	icon_state = "glock"
	caliber = "9mm"
	magazine_type = /obj/item/ammo_magazine/m9mm/large
	allowed_magazines = list(/obj/item/ammo_magazine/m9mm)
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-20,-40), dispersion=list(0.0, 0.9, 1.8))
	)
	projectile_type = /obj/item/projectile/bullet/pistol
	muzzle_velocity = 375

/obj/item/weapon/gun/projectile/revolver/nagant
	name = "nagant revolver"
	desc = "A 7 shot, gas-seal revolver designed to have increased muzzle velocity by not allowing excess gasses to escape out of the sides of the cylinder. One of the few revolvers that can be suppressed. Good luck finding a suppressor for one, though. Chambered in .357."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "nagant"
	max_shells = 7

/obj/item/weapon/gun/projectile/revolver/nagant/skinned
	name = "nagant revolver"
	icon_state = "nagantb"

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
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "sts35"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/weapon/gun/projectile/automatic/sts35/update_icon()
	. = ..()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

/obj/item/weapon/gun/projectile/automatic/sts35/Initialize()
	. = ..()
	update_transform()

/obj/item/weapon/gun/projectile/automatic/sts35/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

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
	is64x32 = FALSE
	icon_expected_height = 32
	icon_expected_width = 32
	icon = 'icons/obj/gun.dmi'

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
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "m1911"

/obj/item/weapon/gun/projectile/colt/Initialize()
	.=..()
	update_icon()

/obj/item/weapon/gun/projectile/colt/update_icon()
	if(ammo_magazine)
		if(unique_reskin)
			icon = 'icons/obj/gun.dmi'
			icon_state = unique_reskin
		else
			icon_state = initial(icon_state)
	else
		if(unique_reskin)
			icon = 'icons/obj/gun.dmi'
			icon_state = "[unique_reskin]-e"
		else
			icon_state = "[initial(icon_state)]-e"

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
	only_open_load = TRUE

/obj/item/weapon/gun/projectile/revolvingrifle
	manual_chamber = FALSE
	muzzle_velocity = 500 //Guestimation from leveraction .44 minus some for being a revolver.

//shotgun.dm
/obj/item/weapon/gun/projectile/shotgun
	muzzle_velocity = 470 //Temporary

/obj/item/weapon/gun/projectile/shotgun/pump
	manual_chamber = FALSE
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "winchester"
	icon_expected_height = 32
	icon_expected_width = 64
	pump_animation = "winchester-pump"
	var/is64x32 = TRUE
	var/is_picked_up = FALSE

/obj/item/weapon/gun/projectile/shotgun/pump/Initialize()
	. = ..()
	if(is64x32)
		update_transform()

/obj/item/weapon/gun/projectile/shotgun/pump/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/projectile/shotgun/pump/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/projectile/shotgun/pump/dropped()
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/weapon/gun/projectile/shotgun/pump/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/weapon/gun/projectile/shotgun/pump/combat
	icon = 'icons/obj/64x32guns_ch.dmi'

/obj/item/weapon/gun/projectile/shotgun/doublebarrel
	manual_chamber = FALSE

//shotgun_vr.dm
/obj/item/weapon/gun/projectile/shotgun/pump/USDF
	is64x32 = FALSE
	icon_expected_height = 32
	icon_expected_width = 32

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