//Okay, so we have currently have four prototype
//A crystal, enginge, core and a hilt.
//So four weapons although the alien junk is interchangeable cause fun
//All tyr weapons are battery locked, and cannot have their cell changed but self recharge.
//Also short range
//So hilt, ball and chain wierd weapon. Has actual melee damage. Projectile is slow, recharge is slow, night no ammo, range of seven
//Basic medium size blaster. Range of 5. Core base
//Shotgun type weapon. Range of 3. Small knockback of foes, high damage. Engine
//Now the crystal weapon...laser Range of 4.
//Damages be funky to figure out good numbers for

//The energy ball and shot gun get 35 damage for being similair bits of high risk and high reward. the BnC will take a whilst to recharge/
//So if you miss, you're stuck with a middling melee weapon for a bit.
//Whilst the shot gun has more shots, but you need to get up closih.
//Chain gets AP whilst shotgun gets knockback
/obj/item/projectile/energy/spikeenergy_ball
	name = "energy ball"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "spikeenergyball"
	damage = 45 //after remebering throwing things into walls deals bonus damage. Will that wall thwacking out damage this 5 bonus...yes. But shotgun likly wins most DPS tests anyway
	armor_penetration = 60 //damage and AP matching makes brain happy for some reason. No real logic here, just brain saying yes, this is right
	range = 8
	speed = 5
	penetrating = 2
	check_armour = "melee"
	damage_type = BRUTE

/obj/item/projectile/energy/tyr_rifle
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "blaster_blast"
	damage = 35
	armor_penetration = 15
	range = 6
	penetrating = 2
	check_armour = "laser"

/obj/item/projectile/beam/precursor_tyr
	name = "laser"
	icon_state = "laser"
	damage = 9
	armor_penetration = 40
	penetrating = 2
	damage_type = BURN
	check_armour = "laser"
	range = 4
	eyeblur = 0 //no no no no no
	hitscan = 1
	hud_state = "laser"
	hud_state_empty = "battery_empty"

/obj/item/projectile/bullet/tyrshotburst
	use_submunitions = 1
	range = 0
	embed_chance = 0
	spread_submunition_damage = FALSE
	submunition_spread_max = 180
	submunition_spread_min = 80
	submunitions = list(/obj/item/projectile/beam/precursor_tyr = 7)

/obj/item/gun/energy/tyr_rifle
	name = "tyrian longarm"
	desc = "A strange alien weapon from tyr. Has a button to swap fire modes."
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 160 //15 shots sort of
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/energy/tyr_rifle

	force = 35

	recoil_mode = 0
	charge_meter = 1

	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/energy/tyr_rifle, charge_cost = 160),
		list(mode_name="area", projectile_type=/obj/item/projectile/bullet/tyrshotburst, charge_cost = 312),
		)

	move_delay = 0
	one_handed_penalty = 50

/obj/item/cell/device/weapon/recharge/alien/tyr
	name = "odd cell"
	icon = 'icons/obj/abductor.dmi'
	icon_state = "cell"
	maxcharge = 2500
	charge_amount = 250 // 10%.
	charge_delay = 50 // Every five seconds, bit faster than the default.

/obj/item/projectile/energy/spikeenergy_ball/slow
	speed = 15
	range = 20

/obj/item/projectile/energy/eclipse_boss/tyrjavelin //Five hits ought to end you
	name = "energy javelin"
	icon_state = "javelin"
	damage_type = SEARING
	check_armour = "melee"
	damage = 20 //16 with intended armor
	armor_penetration = 20
	speed = 10
	color = "#FF6600"
	modifier_type_to_apply = /datum/modifier/deep_wounds //reduced healing
	modifier_duration = 1 MINUTE

/obj/item/projectile/energy/eclipse_boss/tyrjavelin/speed
	speed = 7

/obj/item/projectile/energy/eclipse_boss/tyrjavelin/super_slow
	speed = 15
	damage = 30

/obj/item/projectile/bullet/astral_blade
	name = "bluespace slash"
	icon_state = "astral_sea_blade"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	damage = 25 //15
	damage_type = BRUTE
	check_armour = "melee"
	embed_chance = 0
	speed = 15
	penetrating = 5
	crawl_destroy = TRUE

/obj/item/projectile/bullet/astral_blade/artillery
	range = 3

/obj/item/projectile/bullet/astral_blade/artillery/secondary
	damage = 15
	speed = 0.5

/obj/item/projectile/bullet/astral_blade/short
	damage = 20
	speed = 0.3
	range = 2

/obj/item/projectile/energy/neurotoxin/toxic/tyr_flora
	damage = 20 //deals 10 damage with the armor I am balancing for
	agony = 0
	speed = 12
	armor_penetration = 50
	penetrating = 5

/obj/item/projectile/arc/fragmentation/tyr_mortar
	icon_state = "mortar"
	fragment_amount = 10
	spread_range = 3
	fragment_types = list(
		/obj/item/projectile/bullet/astral_blade/artillery, /obj/item/projectile/bullet/astral_blade/artillery, \
		/obj/item/projectile/bullet/astral_blade/artillery, /obj/item/projectile/bullet/astral_blade/artillery/secondary
		)

/obj/item/projectile/energy/agate_lighting
	damage = 15
	damage_type = ELECTROCUTE
	icon_state = "tesla_projectile"
	armor_penetration = 30
	speed = 15
	penetrating = 5
	crawl_destroy = TRUE

/obj/item/projectile/energy/agate_lighting/fast
	damage = 20
	speed = 3
