/obj/item/projectile/bullet
	damage = 25 //seems many bullets use this value for some reason
//Following guns are thanks to Serdy/Przyjaciel for the sprites and lore for WKHM. Naming the classes after him in honor <3

//////////////////////////////////
//								//
//			SERDY GUNS			//
//								//
//////////////////////////////////
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

/obj/item/gun/projectile/automatic/serdy/Initialize()
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

/obj/item/gun/projectile/automatic/serdy/dropped()
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/gun/projectile/automatic/serdy/update_icon()
	. = ..()
	if(load_method == MAGAZINE)
		icon_state = ammo_magazine ? "[initial(icon_state)]" : "[initial(icon_state)]-e"
	else
		icon_state = bolt_open ? "[initial(icon_state)]-e" : "[initial(icon_state)]"

/obj/item/gun/projectile/automatic/serdy/asval
	name = "AS-VAL"
	desc = "A somewhat competent remake of an ancient russian assault rifle. Commonly found in the hands of criminals, and on pan-slavic rimworlds. Integrally suppressed, chambered in 7.62mm."
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
	caliber = "7.62mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "krink"
	wielded_item_state = "krink-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "krinkov"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
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
	desc = "The tried and true, old fashioned chatterbox. Ivan's favorite. Best used while at least somewhat inebriated. Chambered in 7.62mm."
	caliber = "7.62mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "akm"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
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
	desc = "The 'Stalingrad Special'. This rickety old AKM has seen better days. Better bring some vodka, because every shot this gun manages to squeeze off without blowing up in your face is worthy of celebration. Chambered in 7.62mm"
	caliber = "7.62mm"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	item_state = "akm"
	wielded_item_state = "akm-wielded"
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm)
	icon_state = "scrapak"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
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
	desc = "The tried and true, old fashioned chatterbox. Ivan's favorite. Best used while at least somewhat inebriated. Chambered in 5.45mm."
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
	desc = "A shorter version of the classic AK-74, the AKS-74U. The same reliability of the AK platform, in a smaller package. Chambered in 5.45mm."
	icon_state = "aks74u"
	w_class = ITEMSIZE_LARGE
	one_handed_penalty = 25
	muzzle_velocity = 790

/obj/item/gun/projectile/automatic/serdy/ak74/variantun
	name = "AKS-74UN"
	desc = "A shorter version of the classic AK-74, the AKS-74UN. The same reliability of the AK platform, in a smaller package. Now with a classic triangle side folder. Chambered in 5.45mm."
	icon_state = "aks74un"
	one_handed_penalty = 35
	muzzle_velocity = 790

/obj/item/gun/projectile/automatic/serdy/ak74/variantm
	name = "AK-74M"
	desc = "A modernized AK-74, lightweight, with very nice plum furniture. Perfect for the modern ICCG soldier, or Pan-slav PMC. Chambered in 5.45mm."
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
	projectile_type = /obj/item/projectile/bullet/rifle/a762
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

//////////////////////////////////
//								//
//			MAGAZINES			//
//								//
//////////////////////////////////

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
	name = "AKM magazine (7.62mm standard)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762mag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1600)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762

/obj/item/ammo_magazine/akm/ap
	name = "AKM magazine (7.62mm armor-piercing)"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/akm/hp
	name = "AKM magazine (7.62mm hollow-point)"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a762/hp

/obj/item/ammo_magazine/akm/rubber
	name = "AKM magazine (7.62mm less-lethal)"
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "762rubbermag"
	max_ammo = 30
	mag_type = MAGAZINE
	caliber = "7.62mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	multiple_sprites = 1
	ammo_type = /obj/item/ammo_casing/a762/rubber

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

//////////////////////////////////////
//									//
//			BULLET CASINGS			//
//									//
//////////////////////////////////////



/obj/item/ammo_casing/a9x39
	desc = "A standard 9x39mm round"
	caliber = "9x39mm"
	icon_state = "rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39

/obj/item/ammo_casing/a9x39/ap
	desc = "An armor piercing 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/ap

/obj/item/ammo_casing/a9x39/rubber
	desc = "A less-lethal 9x39mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39/rubber

/obj/item/ammo_casing/a762/rubber
	desc = "A less-lethal 7.62mm round"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/rubber

/obj/item/ammo_casing/a545/rubber
	desc = "A 5.45mm less-lethal bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a545/rubber


/* Old balance stuff
//These are projectiles that do not have damage defined anywhere. Gonna follow laser weapons sorta with a extra kick, 25/35/60
/obj/item/projectile/bullet/a38 //These projectiles are used but dont exist, revolvers were super underpowered forever
	damage = 25 //.38 pretty bwoomp

/obj/item/projectile/bullet/a10mm
	damage = 20 //CR-20 do 20 lol

/obj/item/projectile/bullet/rifle/a45lc
	damage = 35 //.45 used by a one revolver

/obj/item/projectile/bullet/rifle/a762/lmg
	damage = 30

/obj/item/projectile/bullet/a57 //P90s pack a punch?
	damage = 30

/obj/item/projectile/bullet/rifle/a545
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	damage = 30
	hud_state = "rifle"

/obj/item/projectile/bullet/rifle/a545/ap
	damage = 25
	armor_penetration = 50 // At 40 or more armor, this will do more damage than standard rounds.
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a545/hp
	damage = 40
	armor_penetration = -50
	penetrating = 0
	hud_state = "hivelo_iff"

/obj/item/projectile/bullet/rifle/a545/hunter
	damage = 15
	SA_bonus_damage = 35 // 50 total on animals.
	SA_vulnerability = SA_ANIMAL
	hud_state = "rifle_heavy"

/* Combat refactor walkback, default bullets do 60 damage I think so im keeping this, were not getting the CR20 incident again lol
/obj/item/projectile/bullet/pistol
	damage = 10

/obj/item/projectile/bullet/pistol/ap
	damage = 5
	armor_penetration = 30

/obj/item/projectile/bullet/pistol/hp
	damage = 15
	armor_penetration = -50

/obj/item/projectile/bullet/pistol/medium
	damage = 15

/obj/item/projectile/bullet/pistol/medium/ap
	damage = 10
	armor_penetration = 15

/obj/item/projectile/bullet/pistol/medium/hp
	damage = 20
	armor_penetration = -50

/obj/item/projectile/bullet/pistol/strong
	damage = 30

/obj/item/projectile/bullet/pistol/rubber/strong
	damage = 10
	agony = 60

/obj/item/projectile/bullet/pistol/rubber
	damage = 5
	agony = 40
	embed_chance = 0

/obj/item/projectile/bullet/shotgun
	damage = 30
	armor_penetration = 40

/obj/item/projectile/bullet/shotgun/beanbag
	damage = 5
	agony = 60
	embed_chance = 0

/obj/item/projectile/bullet/pellet/shotgun
	damage = 6
	pellets = 6
	range_step = 1
	spread_step = 10

/obj/item/projectile/bullet/pellet/shotgun/flak
	damage = 2
	range_step = 2
	spread_step = 30
	armor_penetration = 10

/obj/item/projectile/bullet/shotgun/ion
	damage = 15


/* "Rifle" rounds */

/obj/item/projectile/bullet/rifle
	armor_penetration = 15
	penetrating = 1

/obj/item/projectile/bullet/rifle/a762
	damage = 25

/obj/item/projectile/bullet/rifle/a762/sniper
	hitscan = 1

/obj/item/projectile/bullet/rifle/a762/ap
	damage = 20
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a762/hp
	damage = 30
	armor_penetration = -50
	penetrating = 0

/obj/item/projectile/bullet/rifle/a762/hunter
	damage = 10
	SA_bonus_damage = 30

/obj/item/projectile/bullet/rifle/a545
	damage = 20

/obj/item/projectile/bullet/rifle/a545/ap
	damage = 15
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a545/hp
	damage = 30
	armor_penetration = -50
	penetrating = 0

/obj/item/projectile/bullet/rifle/a545/hunter
	damage = 5
	SA_bonus_damage = 25

/obj/item/projectile/bullet/rifle/a145
	damage = 60
	stun = 3
	weaken = 3
	penetrating = 5
	armor_penetration = 80

/obj/item/projectile/bullet/rifle/a145/highvel
	damage = 20
	stun = 3
	weaken = 3
	penetrating = 20
	armor_penetration = 90

/obj/item/projectile/bullet/rifle/a44rifle
	damage = 30

/obj/item/projectile/bullet/pellet
	damage = 10

/obj/item/projectile/bullet/pellet/fragment
	damage = 5
	muzzle_type = null

/obj/item/projectile/bullet/pellet/fragment/strong
	damage = 7
*/
*/
