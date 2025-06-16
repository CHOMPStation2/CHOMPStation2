//Time to add our own awesome guns! >:D
/obj/item/gun/projectile/fiveseven
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
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/fiveseven/update_icon()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

//Was originally expecting to be able to have 64x64 guns and just shrink them but that's just like not a thing because code doesn't allow it
//And Kasssc kinda explained to me that even if the code did allow it, it wouldn't look right.
//So, we have the mp5 as the only one that does have this, and it just uses filters to convert the 64x64 sprite into 32x32 for now.
/obj/item/gun/projectile/automatic/cballistic
	name = "I AM NOT SUPPOSED TO EXIST"
	desc = "Yes hello I'm not supposed to exist, I'm just a weird code artefact thing please contact a developer."
	icon = 'icons/obj/gun64_ch.dmi'
	icon_state = "mp5a5"
	appearance_flags = 288
	icon_expected_height = 64
	icon_expected_width = 64
	//icon_scale_x = 0.5
	//icon_scale_y = 0.5

/obj/item/gun/projectile/automatic/cballistic/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/cballistic/update_transform()
	. = ..()
	transform = transform.Scale(0.5,0.5)
	transform = transform.Translate(-16,-16)

/obj/item/gun/projectile/automatic/cballistic/update_icon()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

/obj/item/gun/projectile/automatic/cballistic/mp5a5
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
/obj/item/gun/projectile/automatic/serdy
	name = "I AM NOT SUPPOSED TO EXIST"
	desc = "Yes hello I'm not supposed to exist, I'm just a weird code artefact thing please contact a developer."
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "asval"
	icon_expected_height = 32
	icon_expected_width = 64
	firemodes = list()
	var/is_picked_up = FALSE
	var/is_long = TRUE

/obj/item/gun/projectile/automatic/serdy/Initialize(mapload)
	. = ..()
	update_transform()
	update_icon()

/obj/item/gun/projectile/automatic/serdy/update_transform()
	. = ..()
	if(is_picked_up && is_long)
		transform = transform.Turn(-45)
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/serdy/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/automatic/serdy/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/automatic/serdy/dropped(mob/living/user)
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/gun/projectile/automatic/serdy/update_icon()
	. = ..()
	if(load_method == MAGAZINE)
		icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"
	else
		icon_state = bolt_open ? "[initial(icon_state)]-e" : "[initial(icon_state)]"


//AK Variants

/obj/item/gun/projectile/automatic/serdy/asval
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
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 295
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/krinkov
	name = "Krinkov"
	desc = "A professionally cut down AKM made to be easily concealable. With a 12 inch barrel, this is a very loud short barrel rifle. Illegal pretty much everywhere, and easy to get a hold of, these classic russian firearms are a mainstay amidst the various criminal organizations across the galaxy."
	caliber = "7.62x39mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "krink"
	wielded_item_state = "krink-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "krinkov"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 680
	is_long = FALSE
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/akm
	name = "AKM"
	desc = "The tried and true, old fashioned chatterbox. Ivan's favorite. Best used while at least somewhat inebriated. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "akm"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 715
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/scrapak
	name = "AKM"
	desc = "The 'Stalingrad Special'. This rickety old AKM has seen better days. Better bring some vodka, because every shot this gun manages to squeeze off without blowing up in your face is worthy of celebration. Chambered in 7.62x39mm"
	caliber = "7.62x39mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "scrapak"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 700
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 70
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/ak74
	name = "AK-74"
	desc = "The tried and true, old fashioned chatterbox. Ivan's favorite. Best used while at least somewhat inebriated. Chambered in 5.45x39mm."
	caliber = "5.45mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/ak74
	allowed_magazines = list(/obj/item/ammo_magazine/ak74)
	icon_state = "ak74"
	projectile_type = /obj/item/projectile/bullet/rifle/a545
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 880
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/ak74/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = istype(ammo_magazine,/obj/item/ammo_magazine/ak74/plum) ? "[initial(icon_state)]plum" : "[initial(icon_state)]"

/obj/item/gun/projectile/automatic/serdy/ak74/variantu
	name = "AKS-74U"
	desc = "A shorter version of the classic AK-74, the AKS-74U. The same reliability of the AK platform, in a smaller package. Chambered in 5.45x39mm."
	icon_state = "aks74u"
	w_class = ITEMSIZE_LARGE
	one_handed_penalty = 25
	muzzle_velocity = 790

/obj/item/gun/projectile/automatic/serdy/ak74/variantun
	name = "AKS-74UN"
	desc = "A shorter version of the classic AK-74, the AKS-74UN. The same reliability of the AK platform, in a smaller package. Now with a classic triangle side folder. Chambered in 5.45x39mm."
	icon_state = "aks74un"
	one_handed_penalty = 35
	muzzle_velocity = 790

/obj/item/gun/projectile/automatic/serdy/ak74/variantm
	name = "AK-74M"
	desc = "A modernized AK-74, lightweight, with very nice plum furniture. Perfect for the modern ICCG soldier, or Pan-slav PMC. Chambered in 5.45x39mm."
	one_handed_penalty = 40
	icon_state = "ak74m"
	magazine_type = /obj/item/ammo_magazine/ak74/plum

// These are more of AK Pattern rifles than AK Variants.

/obj/item/gun/projectile/automatic/serdy/hunter
	name = "SOK-94"
	desc = "Otherwise known as a Vepr Super. An AK pattern rifle, based on the beefier RPK chassis, to handle larger caliber rounds. Like an SVD but cooler. Chambered in 7.62x54mmR."
	caliber = "7.62x54mmR"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/m762svd
	allowed_magazines = list(/obj/item/ammo_magazine/m762svd)
	icon_state = "hunter"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 810
	w_class = ITEMSIZE_HUGE
	actions_types = list(/datum/action/item_action/use_scope)
	accuracy = -30
	scoped_accuracy = 50
	one_handed_penalty = 70
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/hunter/ui_action_click()
	scope()

/obj/item/gun/projectile/automatic/serdy/hunter/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

// AR Variants

/obj/item/gun/projectile/automatic/serdy/m16a2
	name = "M16A2"
	desc = "A favorite service rifle everywhere, even today. It might be a reproduction, but Eugene Stoner smiles upon every man or woman who wields this beautiful democracy dispensing machine, even if it's never seen the soil of Terra, and never will. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "m16"
	wielded_item_state = "m16-wielded"
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

/obj/item/gun/projectile/automatic/serdy/m4a1
	name = "M4A1"
	desc = "The M16's shorter, more lightweight little brother. An old terran flag is stamped into the receiver. These guns can be found just about everywhere. A favorite on the rimworlds due to its simplicity to produce, and reliability. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "m4"
	wielded_item_state = "m4-wielded"
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
	fire_sound = "sound/weapons/serdy/m41a.ogg"

/obj/item/gun/projectile/automatic/serdy/patriot
	name = "Patriot"
	desc = "I raised you, and loved you, I've given you weapons, taught you techniques, endowed you with knowledge. There's nothing more for me to give you. All that's left for you to take is my life. 'Still in a dream' is stamped into the receiver, and it has no serial number. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "m16"
	wielded_item_state = "m16-wielded"
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
	w_class = ITEMSIZE_LARGE
	one_handed_penalty = 40

/obj/item/gun/projectile/automatic/serdy/ar10
	name = "AR-10"
	desc = "A semi-auto replica of an original AR-10. The precursor to the M16 and the M4 that everyone loves. Chambered in 7.62x51mm."
	caliber = "7.62mm"
	magazine_type = /obj/item/ammo_magazine/ar10
	allowed_magazines = list(/obj/item/ammo_magazine/ar10)
	icon_state = "ar10"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 820
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 60
	fire_sound = "sound/weapons/serdy/sks.ogg"

//Other rifles

/obj/item/gun/projectile/automatic/serdy/m41ab //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
	name = "M41A/2"
	desc = "The Armat M41A Pulse Rifle is a pulse-action assault rifle chambered for 10×24mm Caseless ammunition. This one is a rare, and fairly competent replica of the original by Scarborough Arms, with some minor design improvements over the original. The aluminium chassis is painted steel blue, and it has 'Scarborough Arms - Per falcis, per pravitas' inscribed on the stock."
	caliber = "10x24mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "m41ab"
	wielded_item_state = "m41ab-wielded"
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
	fire_sound = "sound/weapons/serdy/m41a.ogg"

/obj/item/gun/projectile/automatic/serdy/m41a //This gun is pretty overpowered. Leaving it as an admin spawn. Might even interfere with lore.
	name = "M41A"
	desc = "A tried and true original. The Armat M41A Pulse Rifle is a pulse-action assault rifle chambered for 10×24mm Caseless ammunition. 'PEACE THROUGH SUPERIOR FIREPOWER' is stamped into the side of the aluminium chassis."
	caliber = "10x24mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "m41a"
	wielded_item_state = "m41a-wielded"
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
	fire_sound = "sound/weapons/serdy/m41a.ogg"

/obj/item/gun/projectile/automatic/serdy/t12 //This gun is pretty overpowered. Leaving it as an admin spawn.
	name = "T-12"
	desc = "The standard issue rifle of both the SGC and the USDF nowadays, alongside the newer versions of the M41A/2. A caseless version of the classic G36E. Some folk call it the lego gun because of how light it is, even when loaded. Chambered in 10x24mm Caseless."
	caliber = "10x24mm"
	magazine_type = /obj/item/ammo_magazine/t12
	allowed_magazines = list(/obj/item/ammo_magazine/t12)
	icon_state="t12"
	projectile_type = /obj/item/projectile/bullet/rifle/a10x24
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 840
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50
	fire_sound = "sound/weapons/serdy/type901.ogg"

/obj/item/gun/projectile/automatic/serdy/fal
	name = "FN-FAL"
	desc = "The right arm of the free galaxy. Chambered in 7.62x51mm."
	caliber = "7.62mm"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/fal
	allowed_magazines = list(/obj/item/ammo_magazine/fal)
	icon_state = "fal"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	muzzle_velocity = 840
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 40
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/keltec
	name = "RDB-S"
	desc = "A snazzy survival rifle, small enough to fit into a backpack. Despite it's odd shape, it's pretty comfortable in the hands. This one is OD green. Chambered in 5.56x45mm."
	caliber = "5.56x45mm"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m16
	allowed_magazines = list(/obj/item/ammo_magazine/m16)
	icon_state = "keltecG"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	muzzle_velocity = 950
	w_class = ITEMSIZE_LARGE
	one_handed_penalty = 40
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/keltec/black
	icon_state = "keltecB"
	desc = "A snazzy survival rifle, small enough to fit into a backpack. Despite it's odd shape, it's pretty comfortable in the hands. This one is black. Chambered in 5.56x45mm."

/obj/item/gun/projectile/automatic/serdy/keltec/blue
	icon_state = "keltecN"
	desc = "A snazzy survival rifle, small enough to fit into a backpack. Despite it's odd shape, it's pretty comfortable in the hands. This one is Sif-blue. Chambered in 5.56x45mm."

/obj/item/gun/projectile/automatic/serdy/keltec/white
	icon_state = "keltecW"
	desc = "A snazzy survival rifle, small enough to fit into a backpack. Despite it's odd shape, it's pretty comfortable in the hands. This one is snow white. Chambered in 5.56x45mm."

/obj/item/gun/projectile/automatic/serdy/keltec/tan
	icon_state = "keltecD"
	desc = "A snazzy survival rifle, small enough to fit into a backpack. Despite it's odd shape, it's pretty comfortable in the hands. This one is coyote tan. Chambered in 5.56x45mm."

/obj/item/gun/projectile/automatic/serdy/sks 	//Reminder to myself to make sure this works and also to make sure that people are able to empty the internal mag
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
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/mosin
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
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/mosin/scoped
	name = "Scoped Mosin Nagant"
	icon_state = "scopedmosin"
	desc = "A reproduction of some old russian bolt-action rifle from some backwater rimworld. Smells strongly of cosmoline. The inscriptions on it are in pan-slavic. This one has a scope attached to it. Chambered in 7.62x54mmR."
	actions_types = list(/datum/action/item_action/use_scope)
	accuracy = -15
	scoped_accuracy = 50
	one_handed_penalty = 70

/obj/item/gun/projectile/automatic/serdy/mosin/scoped/ui_action_click()
	scope()

/obj/item/gun/projectile/automatic/serdy/mosin/scoped/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/gun/projectile/automatic/serdy/type901
	name = "Type 901 Assault rifle"
	desc = "A heavy bullpup assault rifle of unknown make, with a very high muzzle velocity and fair accuracy. A favorite of scum and villainy everywhere due to its complete lack of identification markings. Popularized by the 2541 movie, 'Boarding Party'. Chambered in 7.62x51mm."
	caliber = "7.62mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "t901"
	wielded_item_state = "t901-wielded"
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
	fire_sound = "sound/weapons/serdy/type901.ogg"

/obj/item/gun/projectile/automatic/serdy/type901/carbine
	name = "Type 901-C Carbine"
	desc = "A lightweight bullpup assault carbine of unknown make, with a very high muzzle velocity and fair accuracy. A favorite of scum and villainy everywhere due to its complete lack of identification markings. Popularized by the 2541 movie, 'Boarding Party'. This one is smaller and more compact than its larger counterpart. Chambered in 7.62x39mm."
	icon_state = "type901b"
	muzzle_velocity = 880
	w_class = ITEMSIZE_LARGE
	one_handed_penalty = 30

/obj/item/gun/projectile/automatic/serdy/awp
	name = "AWP"
	desc = "A galaxy-wide favorite for hunting, target shooting, and rushing B. Legend has it, this rifle originated from three guys in a garage. This one is a reproduction. It has 'Scarborough Arms - Per falcis, per pravitas' inscribed on the stock. Chambered in .338 Lapua."
	caliber = ".338"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "awp"
	wielded_item_state = "awp-wielded"
	auto_loading_type = NO_AUTO_LOAD
	magazine_type = /obj/item/ammo_magazine/awp
	allowed_magazines = list(/obj/item/ammo_magazine/awp)
	icon_state = "awp"
	projectile_type = /obj/item/projectile/bullet/rifle/a338
	load_method = MAGAZINE
	muzzle_velocity = 936
	actions_types = list(/datum/action/item_action/use_scope)
	accuracy = -30
	scoped_accuracy = 50
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 90
	bolt_name = "bolt"
	sound_eject = 'sound/weapons/ballistics/boltactionopen.ogg'
	sound_chamber = 'sound/weapons/ballistics/boltactionclose.ogg'
	fire_sound = "sound/weapons/serdy/sks.ogg"

/obj/item/gun/projectile/automatic/serdy/awp/ui_action_click()
	scope()

/obj/item/gun/projectile/automatic/serdy/awp/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/gun/projectile/automatic/serdy/hectate
	name = "Hectate II"
	desc = "An old world anti material rifle. Ideal for dealing with mechs, armored personnel, and space dragons. Chambered in .50 BMG."
	caliber = ".50 BMG"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "hectate"
	wielded_item_state = "hectate-wielded"
	auto_loading_type = NO_AUTO_LOAD
	magazine_type = /obj/item/ammo_magazine/hectate
	allowed_magazines = list(/obj/item/ammo_magazine/hectate)
	icon_state = "hectate"
	projectile_type = /obj/item/projectile/bullet/rifle/a145 //the old round type was ass
	load_method = MAGAZINE
	muzzle_velocity = 825
	actions_types = list(/datum/action/item_action/use_scope)
	accuracy = -60
	scoped_accuracy = 15
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 120
	bolt_name = "bolt"
	sound_eject = 'sound/weapons/ballistics/boltactionopen.ogg'
	sound_chamber = 'sound/weapons/ballistics/boltactionclose.ogg'
	fire_sound = "sound/weapons/serdy/sks.ogg"


/obj/item/gun/projectile/automatic/serdy/hectate/ui_action_click()
	scope()

/obj/item/gun/projectile/automatic/serdy/hectate/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/gun/projectile/automatic/serdy/memegun
	name = "Hardbass Special"
	desc = "Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски Три полоски, три по три полоски. Chambered in 7.62x39mm"
	caliber = "7.62x39mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
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
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/tkb408
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
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/groza
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
	fire_sound = "sound/weapons/serdy/ak74.ogg"

/obj/item/gun/projectile/automatic/serdy/plamya
	name = "WKHM 'Plamya' Mk. 1"
	desc = "The original Plamya assault rifle, produced by WKHM back in the 2330's. Highly sought after for their collectability, and their superb reliability. They don't quite make them like they used to. It may not fire as fast as the newer ones, but these old models haven't survived this long for no reason. This one has a classic walnut thumbhole stock and foregrip. It has a heavy titanium chassis, durasteel bolt, and the original style 'PPSh' heatshield. The gun is dated 2336, and bears the 'WKHM Endurance' arkship's production stamp on the buttstock. 'A light in the dark' is stamped into the receiver. Chambered in 9x39mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "9x39mm"
	magazine_type = /obj/item/ammo_magazine/plamya
	allowed_magazines = list(/obj/item/ammo_magazine/plamya)
	icon_state = "plamyab"
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
	fire_sound = "sound/weapons/serdy/plamya.ogg"

/obj/item/gun/projectile/automatic/serdy/plamya/mk2
	name = "WKHM 'Plamya' Mk. 2"
	icon_state = "plamya"
	desc = "An old school assault rifle. A favorite on the rimworld for it's blisteringly high rate of fire. One of the best selling products of W-K Heavy Manufacturing. Virtually impossible to break. The gold standard, with a rosewood thumbhole stock, a full length barrel, and an improved heatshield. The most mass produced firearm in WKHM's lineup. This one bears the 'WKHM Adamant' arkship's production stamp. Chambered in 9x39mm."
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round bursts", burst=5, fire_delay=0.5, move_delay=3.5,    burst_accuracy=list(0,-5,-10,-10,-15), dispersion=list(0.0, 0.2, 0.35, 0.5, 0.6))
	)
	muzzle_velocity = 305

/obj/item/gun/projectile/automatic/serdy/plamya/mk3
	name = "WKHM 'Plamya' Mk. 3"
	icon_state = "plamyac"
	desc = "An old school assault rifle with a modern twist. A favorite on the rimworld for it's blisteringly high rate of fire. One of the best selling products of W-K Heavy Manufacturing. Virtually impossible to break. This is a newer variant, with a fully synthetic stock, and a shorter barrel. The serial number and production stamp has been sanded off. Chambered in 9x39mm."
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round bursts", burst=5, fire_delay=0.5, move_delay=3.5,    burst_accuracy=list(0,-7.5,-10,-15,-20), dispersion=list(0.0, 0.2, 0.4, 0.6, 0.7))
	)
	muzzle_velocity = 290

//shotguns

/obj/item/gun/projectile/automatic/serdy/strela
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
	fire_sound = "sound/weapons/serdy/strela.ogg"

/obj/item/gun/projectile/automatic/serdy/spas35
	name = "Spas-35"
	desc = "A complex pump shotgun, modelled after the classic Spas-12. Upgraded with durable parts to fix the flaws of the classic. Also sometimes called the T-35, if you're with the SGC or the USDF. The absolute king of CQC encounters. 8 round capacity, chambered in 12 gauge."
	caliber = "12g"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "spas12"
	wielded_item_state = "spas12-wielded"
	icon_state = "spas12"
	ammo_type = /obj/item/ammo_casing/a12g/pellet
	projectile_type = /obj/item/projectile/bullet/shotgun
	max_shells = 7
	bolt_name = "bolt"
	bolt_release = null //No bolt release on spas-12
	load_method = SINGLE_CASING | SPEEDLOADER
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_MANUAL_LOCK
	misc_loading_flags = INTERNAL_MAG_SEPARATE
	var/semiauto_mode = TRUE
	muzzle_velocity = 470
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 50

//SMGs

/obj/item/gun/projectile/automatic/serdy/ppsh
	name = "PPSh-17b"
	desc = "A cheap remake of the venerable russian PPSh-41. Empties a 71 round magazine in less than 10 seconds. Compensates for poor accuracy with volume of bullet. Every inscription on this thing is in pan-slavic. Chambered in 7.62x25mm Tokarev."
	caliber = "7.62x25mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "ppsh"
	wielded_item_state = "ppsh-wielded"
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
	fire_sound = "sound/weapons/Gunshot1.ogg"

/obj/item/gun/projectile/automatic/serdy/mp5
	name = "MP5"
	desc = "A favorite of law enforcement and corporate security across the galaxy for centuries. This old H&K design has survived the test of time. And while in many places it has been replaced long ago, it still stands as a reliable weapon platform. No need to fix what isn't broken. Chambered in 9mm."
	caliber = "9mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "mp5"
	wielded_item_state = "mp5-wielded"
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
	fire_sound = "sound/weapons/Gunshot1.ogg"

/obj/item/gun/projectile/automatic/serdy/pitchgun
	name = "Pitch-gun"
	desc = "A home-made submachine gun, affectionately called by those who use it, the 'Pitch-gun.' It's light, it shoots fast, and it's chambered in .44 magnum. The classy killer, or the rim-world tank crewman's weapon of choice. Mind the recoil."
	caliber = ".44"
	magazine_type = /obj/item/ammo_magazine/pitchmag
	allowed_magazines = list(/obj/item/ammo_magazine/pitchmag)
	icon_state="pitchgun"
	projectile_type = /obj/item/projectile/bullet/pistol/strong
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	muzzle_velocity = 400
	is_long = FALSE

/obj/item/gun/projectile/automatic/serdy/vityaz
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
	fire_sound = "sound/weapons/serdy/vityaz.ogg"
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/automatic/serdy/vityazb
	name = "WKHM 'Vityaz-B'"
	desc = "A swarm of angry bees. The Plamya's baby brother. With 12 total moving parts, including the trigger mechanism, this gun was built with one purpose. Longevity and reliability. Commonly found in the hands of private security, criminals, and law enforcement alike across many worlds. This one is a B model, made to fire faster, at the expense of reliability. Chambered in 10mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "10mm"
	magazine_type = /obj/item/ammo_magazine/m10mm
	allowed_magazines = list(/obj/item/ammo_magazine/m10mm)
	icon_state = "vityaz"
	burst_delay = 1
	projectile_type = /obj/item/projectile/bullet/a10mm
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-10,-10), dispersion=list(0.0, 0.3, 0.6))
	)
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	muzzle_velocity = 430
	is_long = FALSE
	fire_sound = "sound/weapons/serdy/vityaz.ogg"
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0


//LMGs

/obj/item/gun/projectile/automatic/serdy/molniya //this is essentially a space MG42
	name = "WKHM 'Molniya'"
	desc = "A light machinegun manufactured by WKHM for various paramilitaries, private security companies, and rimworld governments. Big, heavy, and with a fire rate similar to that of an MG42. Often used in emplacements and on top of armored vehicles, or as a squad support weapon. Nicknamed the 'Pig' or the 'Sawzall', this one has a solid oak stock, and bears the 'WKHM Adamant' arkship's production stamp. If you ever see this gun, there is no doubt shit's about to go down. Chambered in 7.62x51mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "7.62mm"
	burst_delay = 1
	magazine_type = /obj/item/ammo_magazine/molniya
	allowed_magazines = list(/obj/item/ammo_magazine/molniya)
	icon_state = "molniya"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts", burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=15, move_delay=8, burst_accuracy = list(0,-15,-15,-30,-30,0,-15,-15,-30,-30,0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2,0.6, 1.0, 1.0, 1.0, 1.2,0.6, 1.0, 1.0, 1.0, 1.2))
	)
	w_class = ITEMSIZE_HUGE
	load_method = MAGAZINE
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 860
	one_handed_penalty = 90
	fire_sound = "sound/weapons/serdy/molniyab.ogg"

/obj/item/gun/projectile/automatic/serdy/pkm
	name = "PKM"
	desc = "A traditional russian machinegun. A classic Pan-slav weapon. Chambered in 7.62x54mmR."
	caliber = "7.62x54mmR"
	magazine_type = /obj/item/ammo_magazine/pkm
	allowed_magazines = list(/obj/item/ammo_magazine/pkm)
	icon_state = "pkm"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)
	w_class = ITEMSIZE_HUGE
	load_method = MAGAZINE
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 825
	one_handed_penalty = 90
	fire_sound = "sound/weapons/serdy/molniyab.ogg"

/obj/item/gun/projectile/automatic/serdy/rpd
	name = "RPDM"
	desc = "An unusual LMG that shares similarities with both the AK and the PKM. Perfect for storming the Reichstag. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/rpd
	allowed_magazines = list(/obj/item/ammo_magazine/rpd)
	icon_state = "rpd"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)
	w_class = ITEMSIZE_HUGE
	load_method = MAGAZINE
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 735
	one_handed_penalty = 90
	fire_sound = "sound/weapons/serdy/molniyab.ogg"

/obj/item/gun/projectile/automatic/serdy/rpk //RPK is the imposter of the LMGs, not a true LMG! Close enough to be in this section, though.
	name = "RPK"
	desc = "The AK's bigger brother, and the PKM's little brother. More of an LSW than an LMG. Chambered in 7.62x39mm."
	caliber = "7.62x39mm"
	magazine_type = /obj/item/ammo_magazine/akm/drum
	allowed_magazines = list(/obj/item/ammo_magazine/akm) //Yes it is intercompatible with AK magazines.
	icon_state = "rpk47"
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)
	w_class = ITEMSIZE_HUGE
	load_method = MAGAZINE
	auto_loading_type = CLOSED_BOLT
	muzzle_velocity = 745
	one_handed_penalty = 90
	fire_sound = "sound/weapons/serdy/molniyab.ogg"

/obj/item/gun/projectile/automatic/serdy/rpk/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = istype(ammo_magazine,/obj/item/ammo_magazine/akm/drum) ? "[initial(icon_state)]drum" : "[initial(icon_state)]"

/obj/item/gun/projectile/automatic/serdy/kord //ADMINSPAWN ONLY. This gun is-- absurd. BE CAREFUL. IT WILL HURT MICROS.
	name = "Kord 6P50"
	desc = "This is what Ivan uses when he sees lots of things he doesn't like. This thing belongs on a mount, but some madlad took it off. Capable of causing great harm to anything infront of it, and you, if you're too small. Chambered in 12.7x108mm."
	caliber = "12.7x108mm"
	magazine_type = /obj/item/ammo_magazine/kord
	allowed_magazines = list(/obj/item/ammo_magazine/kord)
	icon_state = "kord"
	projectile_type = /obj/item/projectile/bullet/rifle/a127x108
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)
	w_class = ITEMSIZE_HUGE
	load_method = MAGAZINE
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 860
	one_handed_penalty = 90
	fire_sound = 'sound/weapons/serdy/strela.ogg'

//commented this out because it seems to be breaking the Kord -- Ocelot
/*
/obj/item/gun/projectile/automatic/serdy/kord/afteratt(atom/A, mob/living/user, adjacent, params)
	if(user.size_multiplier <= 0.5) //They're 50% or lower. If they fire this gun, they're gonna get obliterated.
		to_chat(user,span_warning("You struggle to reach the trigger. Maybe shooting such a big gun isn't such a good idea..."))
		if(do_after(user, 5 SECONDS)) //Give them a chance to take it back.
			. = ..() //RIP

/obj/item/gun/projectile/automatic/serdy/kord/handle_post_fire(mob/living/user, atom/target, var/pointblank=0, var/reflex=0)
	. = ..()
	var/unhappy_factor = 1.3333333*(user.size_multiplier - 0.5) //Unhappy factor based on size. Below 50% is a really bad day, and above 125% is fine, everything inbetween is varying.
	if(unhappy_factor >= 1) //They're fine
		return

	if(unhappy_factor <= 0) //RIP them
		var/is_human = FALSE
		var/mob/living/carbon/human/H = user
		if(istype(H))
			is_human = TRUE
		var/deafening = FALSE
		if(user.get_ear_protection() < 2 && is_human)
			deafening = TRUE
		if(is_human && H.eyecheck() < 1)
			user.flash_eyes() //Flashbang effect

		user.visible_message(/*What other people experience*/span_notice("[user] manages to pull the trigger on the [src], causing a large bang and a big flash before [src] recoils backwards, crashing violently into [user] and causing them to go flying!"), \
		/*What you experience*/ span_warning("As you pull the trigger, you suddenly see a flash of bright white light and a loud bang which immediately triggers ringing in your ears. Before you can even react, you feel the giant gun crashing into you and propelling you backwards, and then everything goes black!"))
		if(user.organs && user.organs.len) //You are going to break a lot of bones.
			user.apply_damage(15, BRUTE, BP_L_ARM)
			user.apply_damage(15, BRUTE, BP_R_ARM)
			user.apply_damage(7, BRUTE, BP_L_HAND)
			user.apply_damage(8, BRUTE, BP_R_HAND)
			user.apply_damage(25, BRUTE, BP_TORSO)
			//70 damage total
			for(var/def_zone in list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_TORSO))
				var/obj/item/organ/external/hit_organ = user.get_organ(def_zone)
				if(hit_organ)
					hit_organ.fracture() //Bone crunching noises intensifies
		else
			user.apply_damage(80, BRUTE)
		user.drop_item() //Yea you're not holding onto it for long

		if(deafening) //Very loud, ears go ouch. Should not make you permanently deaf, though.
			H.ear_damage += 60
			H.ear_deaf += 80

		user.apply_damage(150, HALLOSS) //That hurt a lot.
		user.AdjustSleeping(50) //Knocked out
		var/recoil_dir = turn(user.dir,180)
		var/turf/target_turf = get_step(get_step(user,recoil_dir),recoil_dir)
		user.throw_at(target_turf,3,3) //Yeet
	else //They're not gonna have a fun time, but they'll be fine. For between 50% and 125% size
		var/damage_factor = (1 - unhappy_factor) //Unhappy factor is 0 at max unhappiness. Damage_factor is 1 at max unhappiness.
		var/prob_to_drop = (33 + damage_factor*66) //100% if just above 50%, 33% if just below 125%
		var/damage_taken = 5 + 10 * damage_factor //15 damage if just above 50%, 5 if just below 125%
		var/message_on_fire = span_notice("As you pull the trigger, you feel the gun painfully slam into your shoulder, leaving a painful bruise!")
		var/in_left_hand = TRUE
		if(user.r_hand == src)
			in_left_hand = FALSE
		var/damaged_body_part = in_left_hand ? pick(list(BP_L_ARM,BP_TORSO)) : pick(list(BP_R_ARM,BP_TORSO)) //50/50 whether your arm holding the gun gets damaged, or your chest.
		user.apply_damage(damage_taken,BRUTE,damaged_body_part) //Bruise
		user.apply_damage(damage_taken * 3,HALLOSS) //Ouchie juice
		if(prob(prob_to_drop))
			message_on_fire += span_notice(" The force causes you to stumble backwards, dropping the gun and falling to the ground.")
			user.drop_item()
			user.apply_effect(25,WEAKEN)
*/

//Pistols

/obj/item/gun/projectile/automatic/serdy/ssp4_silenced
	name = "WKHM SSP4-S"
	desc = "A unique, high end service pistol carried by W-K security personnel in the outer rim, and various law enforcement agencies across the galaxy. Features a hidden ejector port, and an integral laser sight. Surprisingly reliable despite its unorthodox design. This one is unmarked and is suppressed. Due to the minimal amount of moving parts, this gun is almost completely silent when used with subsonic ammunition. Chambered in 10mm."
	caliber = "10mm"
	magazine_type = /obj/item/ammo_magazine/ssp4
	allowed_magazines = list(/obj/item/ammo_magazine/ssp4)
	projectile_type = /obj/item/projectile/bullet/a10mm
	load_method = MAGAZINE
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 405
	is_long = FALSE
	silenced = 1
	icon_state = "ssp4s"
	move_delay = 0

/obj/item/gun/projectile/serdy_pistols
	icon = 'icons/obj/gun_ch.dmi'
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	load_method = MAGAZINE
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/serdy_pistols/ssp4
	name = "WKHM SSP4"
	desc = "A unique, high end service pistol carried by W-K security personnel in the outer rim, and various law enforcement agencies across the galaxy. Features a hidden ejector port, and an integral laser sight. Surprisingly reliable despite its unorthodox design. This one bears the 'WKHM Obsidian' arkship's production stamp. Chambered in 10mm."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	caliber = "10mm"
	magazine_type = /obj/item/ammo_magazine/ssp4
	allowed_magazines = list(/obj/item/ammo_magazine/ssp4)
	icon_state = "ssp4"
	projectile_type = /obj/item/projectile/bullet/a10mm
	muzzle_velocity = 405
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/serdy_pistols/makarov
	name = "Makarov PM"
	desc = "The venerable Makarov. An easily concealable 9x18mm pistol design from Russia. This one is old and worn, but still reliable as ever. Chambered in 9x18mm makarov."
	icon_state = "makarov"
	caliber = "9x18mm"
	magazine_type = /obj/item/ammo_magazine/makarov
	allowed_magazines = list(/obj/item/ammo_magazine/makarov)
	projectile_type = /obj/item/projectile/bullet/a9x18
	muzzle_velocity = 315

/obj/item/gun/projectile/serdy_pistols/vp70m
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
	fire_sound = "sound/weapons/serdy/40pistol.ogg"

/obj/item/gun/projectile/serdy_pistols/glock71
	name = "Glock 71"
	desc = "Following the same design for centuries, the Glock 71 is one of the most reliable sidearms you can buy for cheap these days. These things are everywhere, and for good reason. Chambered in 9mm."
	icon_state = "glock"
	caliber = "9mm"
	magazine_type = /obj/item/ammo_magazine/m9mm/large
	allowed_magazines = list(/obj/item/ammo_magazine/m9mm)
	projectile_type = /obj/item/projectile/bullet/pistol
	muzzle_velocity = 375
	fire_sound = "sound/weapons/serdy/9mmpistol.ogg"

/obj/item/gun/projectile/serdy_pistols/tp23s
	name = "TP-23 Terran Special"
	desc = "A high end service pistol, that outclasses most of its type, due to its slick operation, ease of concealment, and its built in laser/flashlight combo, and its unusual choice of caliber. Spits some pretty nasty fireballs from the muzzle. Most often seen in the holsters of high ranking SGC, or NT officials. Chambered in .44 magnum."
	icon_state = "tp23b"
	caliber = ".44"
	magazine_type = /obj/item/ammo_magazine/tp23s
	allowed_magazines = list(/obj/item/ammo_magazine/tp23s)
	projectile_type = /obj/item/projectile/bullet/pistol/strong
	muzzle_velocity = 465
	fire_sound = "sound/weapons/serdy/deagle.ogg"

/obj/item/gun/projectile/serdy_pistols/tp23
	name = "TP-23"
	desc = "A classic service pistol, that outclasses most of its type, due to its slick operation, ease of concealment, and its built in laser/flashlight combo, and its unusual choice of caliber. Most often seen in the holsters of SGC and USDF troops and peacekeepers, or in the hands of NT security personnel with money to spend, and officers. Chambered in .45 ACP."
	icon_state = "tp23"
	caliber = ".45"
	magazine_type = /obj/item/ammo_magazine/tp23/rubber
	allowed_magazines = list(/obj/item/ammo_magazine/tp23)
	projectile_type = /obj/item/projectile/bullet/pistol/medium
	muzzle_velocity = 300
	fire_sound = "sound/weapons/serdy/pistol_service.ogg"


/obj/item/gun/projectile/revolver/nagant
	name = "nagant revolver"
	desc = "A 7 shot, gas-seal revolver designed to have increased muzzle velocity by not allowing excess gasses to escape out of the sides of the cylinder. One of the few revolvers that can be suppressed. Good luck finding a suppressor for one, though. Chambered in .357."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "nagant"
	max_shells = 7
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/revolver/saa
	name = "Colt Single Action Army"
	desc = "A Colt Single Action Army. The greatest handgun ever made. Six shots. More than enough to kill anything that moves... Chambered in .45 Long-Colt." //sue me -- Ocelot
	icon = 'icons/obj/gun_ch.dmi'
	caliber = ".45 LC"
	icon_state = "saa"
	fire_delay = 0 //fastest gun in the west
	ammo_type = /obj/item/ammo_casing/a45lc
	max_shells = 6
	move_delay = 0
	fire_sound = "sound/weapons/serdy/44mag.ogg"

/obj/item/gun/projectile/revolver/nagant/skinned
	name = "nagant revolver"
	icon_state = "nagantb"

//Time to give all these existing guns some new properties.
//automatic.dm
/obj/item/gun/projectile/automatic
	bolt_name="charging handle"
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'

/obj/item/gun/projectile/automatic/advanced_smg
	muzzle_velocity = 390	//Based off MPX

/obj/item/gun/projectile/automatic/c20r
	muzzle_velocity = 285	//Based off UMP-45, since apparently this 10mm smg fires .45 ftw. May be fixed in future updates.
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "c20r-20"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/gun/projectile/automatic/c20r/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "c20r-[round(CLAMP(ammo_magazine.stored_ammo.len*2/3,0,20),4)]"
	else
		icon_state = "c20r"
	return

/obj/item/gun/projectile/automatic/c20r/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/c20r/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/sts35
	muzzle_velocity = 900	//Based off AK-74
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "sts35"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/gun/projectile/automatic/sts35/update_icon()
	. = ..()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

/obj/item/gun/projectile/automatic/sts35/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/sts35/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/wt550
	muzzle_velocity = 375	//Guestimation
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "wt550-20"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/gun/projectile/automatic/wt550/update_icon()
	. = ..()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"

/obj/item/gun/projectile/automatic/wt550/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/wt550/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/z8
	muzzle_velocity = 750	//Based off HK417 16 in barrel.
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "carbine-10"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/gun/projectile/automatic/z8/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "carbine-[round(CLAMP(ammo_magazine.stored_ammo.len/2,0,10),2)]"
	else
		icon_state = "carbine-e"
	return

/obj/item/gun/projectile/automatic/z8/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/z8/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/l6_saw
	bolt_name = "charging handle"
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 960 //Prototype PU-21(https://en.wikipedia.org/wiki/IP-2)


/obj/item/gun/projectile/automatic/as24
	muzzle_velocity = 470 //Temporary, might be changed.

/obj/item/gun/projectile/automatic/mini_uzi
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 280 //Mac-10 .45
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "mini-uzi"
	icon_expected_height = 32
	icon_expected_width = 64

/obj/item/gun/projectile/automatic/mini_uzi/update_icon()
	. = ..()
	icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-empty"

/obj/item/gun/projectile/automatic/mini_uzi/Initialize(mapload)
	. = ..()
	update_transform()

/obj/item/gun/projectile/automatic/mini_uzi/update_transform()
	. = ..()
	transform = transform.Translate(-16,0)

/obj/item/gun/projectile/automatic/p90
	muzzle_velocity = 715	//Guestimation. Will hopefully be able to replace with actual 5.7mm at some point. //Done
	allowed_magazines = list(/obj/item/ammo_magazine/a57p90)

/obj/item/gun/projectile/automatic/tommygun	//Phew, an actual gun that fires the correct cartridge.
	auto_loading_type = OPEN_BOLT
	muzzle_velocity = 285

/obj/item/gun/projectile/automatic/bullpup
	muzzle_velocity = 880	//7.62 NATO Bullpup was unsurprisingly difficult to find https://en.wikipedia.org/wiki/Kel-Tec_RFB

/obj/item/gun/projectile/automatic/combatsmg
	muzzle_velocity = 370	//Guestimation

//automatic_vr.dm

/obj/item/gun/projectile/automatic/battlerifle
	muzzle_velocity = 370	//Not a real rifle or cartridge. Guestimating.

/obj/item/gun/projectile/automatic/pdw
	muzzle_velocity = 390 	//MPX

/obj/item/gun/projectile/automatic/stg
	muzzle_velocity = 685	//STG-44

/obj/item/gun/projectile/automatic/sol
	muzzle_velocity = 380	//Guestimation

//automatic_yw.dm
/obj/item/gun/projectile/automatic/mg42
	bolt_name="charging handle"
	auto_loading_type = OPEN_BOLT
	bolt_release = null
	muzzle_velocity = 740	//Real gun.

//boltaction.dm
/obj/item/gun/projectile/shotgun/pump/rifle
	muzzle_velocity = 860	//Guestimation
	is64x32 = FALSE
	icon_expected_height = 32
	icon_expected_width = 32
	icon = 'icons/obj/gun.dmi'

//caseless.dm
/obj/item/gun/projectile/caseless
	bolt_name="charging handle"
	muzzle_velocity = 380 //Based of 9mm, because this fires 9mm projectiles. Will be fixed in future updates, likely.

//contender.dm
/obj/item/gun/projectile/contender	//To be updated to use .357
	manual_chamber = FALSE
	muzzle_velocity = 370

//dartgun.dm
/obj/item/gun/projectile/dartgun
	manual_chamber = FALSE

//pistol.dm
/obj/item/gun/projectile/colt
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "m1911"

/obj/item/gun/projectile/colt/Initialize(mapload)
	.=..()
	update_icon()

/obj/item/gun/projectile/colt/update_icon()
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

/obj/item/gun/projectile/sec
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/silenced
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 240	//Guestimation, minus velocity for suppressor
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/deagle
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 430	//Guestimation, everyone uses .50AE lol
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/gyropistol
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/pistol
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 300	//P365
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/pirate
	manual_chamber = FALSE
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/derringer
	manual_chamber = FALSE
	muzzle_velocity = 350	//Guestimation
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/luger
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 350	//Luger
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/p92x
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 370
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

//pistol_vr.dm
/obj/item/gun/projectile/lamia
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 400	//Guestimation
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0


/obj/item/gun/projectile/giskard	//To be updated to .380
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 300	//Guestimation
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

//pistol_yw.dm
/obj/item/gun/projectile/automatic/glock
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 375	//Actual gun.
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/ppk
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 310	//Guestimation since PPK doesn't fire 9mm
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/m2024
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 260	//Guestimation

/obj/item/gun/projectile/fluff/m1911
	bolt_name="slide"
	bolt_release = "slide release"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY
	muzzle_velocity = 253	//M1911

//revolver.dm
/obj/item/gun/projectile/revolver 	//To be updated to use .375
	manual_chamber = FALSE
	muzzle_velocity = 330	//Guestimation
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0

/obj/item/gun/projectile/revolver/detective 		//To be updated to use .38
	muzzle_velocity = 350	//Guestimation

/obj/item/gun/projectile/revolver/detective45	//Awful.
	muzzle_velocity = 230 	//Guestimation

/obj/item/gun/projectile/revolver/deckard		//To be updated to use .38
	muzzle_velocity = 365

/obj/item/gun/projectile/revolver/judge
	muzzle_velocity = 440	//Temporary

/obj/item/gun/projectile/revolver/lemat
	muzzle_velocity = 365

/obj/item/gun/projectile/revolver/webley
	muzzle_velocity = 340	//Guestimation

/obj/item/gun/projectile/revolver/consul
	muzzle_velocity = 350	//Guestimation

/obj/item/gun/projectile/revolver/nova
	muzzle_velocity = 330	//Guestimation

/obj/item/gun/projectile/revolver/cerberus
	muzzle_velocity = 340	//Guestimation

//semiauto.dm
/obj/item/gun/projectile/garand	//To be updated to use .30 springfield. //Leaving it as 7.62 for the purpose of making rounds more available.
	bolt_name="charging handle"
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | CHAMBER_ON_RELOAD
	bolt_release = null
	muzzle_velocity = 853	//Actual gun.
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'
	only_open_load = TRUE

/obj/item/gun/projectile/revolvingrifle
	manual_chamber = FALSE
	muzzle_velocity = 500 //Guestimation from leveraction .44 minus some for being a revolver.

//shotgun.dm
/obj/item/gun/projectile/shotgun
	muzzle_velocity = 470 //Temporary

/obj/item/gun/projectile/shotgun/pump
	manual_chamber = FALSE
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "winchester"
	icon_expected_height = 32
	icon_expected_width = 64
	pump_animation = "winchester-pump"
	var/is64x32 = TRUE
	var/is_picked_up = FALSE

/obj/item/gun/projectile/shotgun/pump/Initialize(mapload)
	. = ..()
	if(is64x32)
		update_transform()

/obj/item/gun/projectile/shotgun/pump/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/shotgun/pump/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/shotgun/pump/dropped(mob/living/user)
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/gun/projectile/shotgun/pump/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/gun/projectile/shotgun/pump/combat
	icon = 'icons/obj/64x32guns_ch.dmi'

/obj/item/gun/projectile/shotgun/pump/shorty
	name = "sawn-off pump shotgun"
	desc = "A professionally cut down pump-action shotgun, with a checkered pistol grip, and a 6 round tube. Come with me if you want to live. Chambered in 12 gauge."
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "shorty"
	max_shells = 6
	pump_animation = "shorty-pump"

/obj/item/gun/projectile/shotgun/doublebarrel
	desc = "A classic, external hammer double barrel shotgun. This one has Sif-blue furniture. Chambered in 12 gauge."
	sawn_off = FALSE
	var/shotgun_variant = "N"
	manual_chamber = FALSE
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "dshotgunN"
	icon_expected_height = 32
	icon_expected_width = 64
	var/is_picked_up = FALSE

/obj/item/gun/projectile/shotgun/doublebarrel/process_accuracy(obj/projectile, mob/living/user, atom/target, var/burst, var/held_twohanded)
	. = ..()
	var/obj/item/projectile/bullet/P = projectile
	if(!istype(P))
		return
	if(sawn_off)
		P.submunition_spread_max = 100 //More spread when sawn off

/obj/item/gun/projectile/shotgun/doublebarrel/attackby(var/obj/item/A as obj, mob/user as mob)
	if(istype(A, /obj/item/surgical/circular_saw) || istype(A, /obj/item/melee/energy) || istype(A, /obj/item/pickaxe/plasmacutter))
		if(sawn_off) //Don't do anything if we were already sawed off.
			return
		to_chat(user, span_notice("You begin to shorten the barrel of \the [src]."))
		if(loaded.len)
			var/burstsetting = burst
			burst = 2
			user.visible_message(span_danger("The shotgun goes off!"), span_danger("The shotgun goes off in your face!"))
			Fire_userless(user)
			burst = burstsetting
			return
		if(do_after(user, 30))	//SHIT IS STEALTHY EYYYYY
			icon_state = "sawnshotgun"
			item_state = "sawnshotgun"

			desc = "Omar's coming!"
			to_chat(user, span_warning("You shorten the barrel of \the [src]!"))
	else
		..()

/obj/item/gun/projectile/shotgun/doublebarrel/proc/saw_off()
	sawn_off = TRUE
	w_class = ITEMSIZE_NORMAL
	force = 5
	slot_flags &= ~SLOT_BACK	//you can't sling it on your back
	slot_flags |= (SLOT_BELT|SLOT_HOLSTER) //but you can wear it on your belt (poorly concealed under a trenchcoat, ideally) - or in a holster, why not.
	name = "sawn-off shotgun"
	desc += " The barrel seems to be crudely sawn in half."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "sawnshotgun[shotgun_variant]"
	icon_expected_width = 32
	update_icon()
	update_transform()

/obj/item/gun/projectile/shotgun/doublebarrel/sawn //Default sawn shotgun needs it's old icon path back
	icon = 'icons/obj/gun.dmi'

/obj/item/gun/projectile/shotgun/doublebarrel/Initialize(mapload)
	. = ..()
	update_transform()
	update_icon()

/obj/item/gun/projectile/shotgun/doublebarrel/update_transform()
	. = ..()
	if(!sawn_off)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/gun/projectile/shotgun/doublebarrel/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/shotgun/doublebarrel/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/projectile/shotgun/doublebarrel/dropped(mob/living/user)
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/gun/projectile/shotgun/doublebarrel/rosewood
	desc = "A classic, external hammer double barrel shotgun. This one has pristine rosewood furniture. Chambered in 12 gauge."
	icon_state = "dshotgunR"
	shotgun_variant = "R"

/obj/item/gun/projectile/shotgun/doublebarrel/black
	desc = "A classic, external hammer double barrel shotgun. This one has lame polymer black furniture. Chambered in 12 gauge."
	icon_state = "dShotgunB"
	shotgun_variant = "B"

/obj/item/gun/projectile/shotgun/doublebarrel/oak
	desc = "A classic, external hammer double barrel shotgun. This one has classic oak furniture. Chambered in 12 gauge."
	icon_state = "dshotgunW"
	shotgun_variant = "W"

/obj/item/gun/projectile/shotgun/doublebarrel/rosewood_weathered
	desc = "A classic, external hammer double barrel shotgun. This one has weathered rosewood furniture. Chambered in 12 gauge."
	icon_state = "dshotgunPR"
	shotgun_variant = "PR"

/obj/item/gun/projectile/shotgun/doublebarrel/rosewood_weathered
	desc = "A classic, external hammer double barrel shotgun. This one has weathered oak furniture. Chambered in 12 gauge."
	icon_state = "dshotgunPW"
	shotgun_variant = "PW"

//shotgun_vr.dm
/obj/item/gun/projectile/shotgun/pump/USDF
	is64x32 = FALSE
	icon_expected_height = 32
	icon_expected_width = 32

//shotgun_yw.dm
/obj/item/gun/projectile/revolvershotgun
	manual_chamber = FALSE
	muzzle_velocity = 470 //Temporary

//sniper.dm
/obj/item/gun/projectile/heavysniper
	manual_chamber = FALSE
	muzzle_velocity = 1132	//Istiglal IST-14.5 anti-materiel rifle

/obj/item/gun/projectile/SVD	//To be updated to use actual 7.62x54 instead of 7.62 NATO //Done!
	bolt_name = "charging handle"
	muzzle_velocity = 830	//Actual gun.
	desc = "The PCA S19 Jalgarr, also known by its translated name the 'Dragon', is mass produced with an Optical Sniper Sight so simple that even a Tajaran can use it. Too bad for you that the inscriptions are written in Siik. Uses 7.62x54mmR rounds."
	caliber = "7.62x54mmR"
	sound_ejectchamber = 'sound/weapons/ballistics/rifle_ejectchamber.ogg'
	sound_eject = 'sound/weapons/ballistics/rifle_eject.ogg'
	sound_chamber = 'sound/weapons/ballistics/rifle_chamber.ogg'
