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
	damage = 60 //after remebering throwing things into walls deals bonus damage. Will that wall thwacking out damage this 5 bonus...yes. But shotgun likly wins most DPS tests anyway
	armor_penetration = 60 //damage and AP matching makes brain happy for some reason. No real logic here, just brain saying yes, this is right
	range = 7
	speed = 5
	check_armour = "melee"
	damage_type = BRUTE

/obj/item/projectile/energy/wp_shotgun
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun_blast"
	damage = 45
	range = 3
	check_armour = "laser"

/obj/item/projectile/energy/wp_shotgun/on_hit(var/atom/movable/target, var/blocked = 0)
	if(isliving(target))
		var/mob/living/L = target
		var/throwdir = get_dir(firer,L)
		L.throw_at(get_edge_target_turf(L, throwdir), 3, 10)
		return 1

//The blaster has 1 more range but lacks hitscan whilst the laser has 1 less range but has hitscan.
/obj/item/projectile/energy/wp_blaster
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "blaster_blast"
	damage = 30
	range = 5
	check_armour = "laser"

/obj/item/projectile/beam/precursor_tyr
	name = "laser"
	icon_state = "laser"
	damage = 30
	damage_type = BURN
	check_armour = "laser"
	range = 4
	eyeblur = 0 //no no no no no
	hitscan = 1
	hud_state = "laser"
	hud_state_empty = "battery_empty"

/obj/item/gun/energy/energyballchain
	name = "remade prototype weapon"
	desc = "A weapon created from strange alien junk and blueprints"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "violence"
	item_state = "violence"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 5000 //Uses all it's charge in a single shot.
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien
	projectile_type = /obj/item/projectile/energy/spikeenergy_ball

	force = 30 //functions as a melee weapon too! Ain't great, but still works.

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0
	one_handed_penalty = 50

/obj/item/gun/energy/curse_tyrshotgun
	name = "remade prototype weapon"
	desc = "A weapon created from strange alien junk and blueprints"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 1000 //Five shots
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien
	projectile_type = /obj/item/projectile/energy/wp_shotgun

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0
	one_handed_penalty = 50

/obj/item/gun/energy/curse_blaster
	name = "remade prototype weapon"
	desc = "A weapon created from strange alien junk and blueprints"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "solider_blaster"
	item_state = "solider_blaster"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 250
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien
	projectile_type = /obj/item/projectile/energy/wp_blaster

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0
	one_handed_penalty = 50

/obj/item/gun/energy/curse_lasershooter
	name = "remade prototype weapon"
	desc = "A weapon created from strange alien junk and blueprints"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "crystal_blaster"
	item_state = "crystal_blaster"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 250 //twenty shots
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien
	projectile_type = /obj/item/projectile/beam/precursor_tyr

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0
	one_handed_penalty = 50
