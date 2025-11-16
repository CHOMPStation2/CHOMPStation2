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

/obj/item/projectile/energy/wp_shotgun
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun_blast"
	damage = 25
	range = 5
	check_armour = "bullet"
	damage_type = BRUTE

/obj/item/projectile/energy/wp_shotgun/on_hit(var/atom/movable/target, var/blocked = 0)
	if(isliving(target))
		var/mob/living/L = target
		var/throwdir = get_dir(firer,L)
		L.throw_at(get_edge_target_turf(L, throwdir), 3, 10)
		return 1

/obj/item/projectile/energy/wp_blaster
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "blaster_blast"
	damage = 35
	range = 5
	penetrating = 2
	check_armour = "laser"

/obj/item/projectile/beam/precursor_tyr
	name = "laser"
	icon_state = "laser"
	damage = 8
	armor_penetration = 30
	penetrating = 2
	damage_type = BURN
	check_armour = "laser"
	range = 5
	eyeblur = 0 //no no no no no
	hitscan = 1
	hud_state = "laser"
	hud_state_empty = "battery_empty"

/obj/item/projectile/bullet/tyrshotburst
	use_submunitions = 1
	range = 0
	embed_chance = 0
	spread_submunition_damage = FALSE
	submunition_spread_max = 150
	submunition_spread_min = 60
	submunitions = list(/obj/item/projectile/beam/precursor_tyr = 5)

/obj/item/gun/energy/energyballchain
	name = "tyrian energy club"
	desc = "A strange alien weapon from tyr."
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "violence"
	item_state = "violence"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 625 //Uses all it's charge in a single shot.
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/energy/spikeenergy_ball

	force = 45 //functions as a melee weapon too! Ain't great, but still works.

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0
	one_handed_penalty = 50

/obj/item/gun/energy/curse_tyrshotgun
	name = "tyrian enforcer firearm"
	desc = "A strange alien weapon from tyr."
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 625 //Four shots
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/energy/wp_shotgun

	recoil_mode = 0
	charge_meter = 1

	firemodes = list(
		list(mode_name="explosive", projectile_type=/obj/item/projectile/energy/wp_shotgun, charge_cost = 625),
		list(mode_name="spray", projectile_type=/obj/item/projectile/bullet/tyrshotburst, charge_cost = 625),
		)

	move_delay = 0
	one_handed_penalty = 50

/obj/item/gun/energy/curse_blaster
	name = "tyrian infantry firearm"
	desc = "A strange alien weapon from tyr."
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "solider_blaster"
	item_state = "solider_blaster"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 250
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/energy/wp_blaster

	recoil_mode = 0
	charge_meter = 1

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

/obj/item/projectile/energy/eclipse/tyrjavelin //Five hits ought to end you
	name = "energy javelin"
	icon_state = "javelin"
	damage_type = SEARING
	check_armour = "melee"
	damage = 23
	armor_penetration = 30
	speed = 10
	color = "#FF6600"
	modifier_type_to_apply = /datum/modifier/deep_wounds //reduced healing
	modifier_duration = 1 MINUTE

/obj/item/projectile/energy/eclipse/tyrjavelin/speed
	speed = 7

/obj/item/projectile/energy/eclipse/tyrjavelin/super_slow
	speed = 15
	damage = 30

/obj/item/projectile/bullet/astral_blade
	name = "bluespace slash"
	icon_state = "astral_sea_blade"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	damage = 30 //21 with intended armor
	armor_penetration = 20
	damage_type = BRUTE
	check_armour = "melee"
	embed_chance = 0
	speed = 15
	penetrating = 5
	crawl_destroy = TRUE

/obj/item/projectile/bullet/astral_blade/short
	speed = 0.3
	range = 4

/obj/item/projectile/bullet/tyr_bladeburst
	use_submunitions = 1
	range = 0
	embed_chance = 0
	spread_submunition_damage = FALSE
	submunition_spread_max = 200
	submunition_spread_min = 120
	submunitions = list(/obj/item/projectile/bullet/astral_blade = 3)

/obj/item/projectile/energy/neurotoxin/toxic/tyr_flora
	damage = 20 //deals 10 damage with the armor I am balancing for
	agony = 0
	speed = 12
	armor_penetration = 50

/obj/item/projectile/arc/fragmentation/tyr_mortar
	icon_state = "mortar"
	fragment_amount = 10
	spread_range = 3
	fragment_types = list(
		/obj/item/projectile/energy/eclipse/tyrjavelin, /obj/item/projectile/energy/eclipse/tyrjavelin, \
		/obj/item/projectile/energy/eclipse/tyrjavelin, /obj/item/projectile/energy/eclipse/tyrjavelin/super_slow
		)
