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
	range = 8
	speed = 5
	check_armour = "melee"
	damage_type = BRUTE

/obj/item/projectile/energy/wp_shotgun
	name = "laser blast"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "shotgun_blast"
	damage = 50
	range = 5
	check_armour = "bullet"
	damage_type = BRUTE

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
	damage = 60
	range = 5
	check_armour = "laser"

/obj/item/projectile/beam/precursor_tyr
	name = "laser"
	icon_state = "laser"
	damage = 20
	armor_penetration = 30
	penetrating = 20
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
	submunition_spread_max = 120
	submunition_spread_min = 60
	submunitions = list(/obj/item/projectile/beam/precursor_tyr = 5)

/obj/item/gun/energy/energyballchain
	name = "remade prototype weapon"
	desc = "A weapon created from strange alien junk and blueprints"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "violence"
	item_state = "violence"
	wielded_item_state = "placeholder"
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	charge_cost = 2500 //Uses all it's charge in a single shot.
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
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

	charge_cost = 500 //Five shots
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/energy/wp_shotgun

	recoil_mode = 0
	charge_meter = 1

	firemodes = list(
		list(mode_name="explosive", projectile_type=/obj/item/projectile/energy/wp_shotgun, charge_cost = 500),
		list(mode_name="spray", projectile_type=/obj/item/projectile/bullet/tyrshotburst, charge_cost = 750),
		)

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
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
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

	charge_cost = 250 //10 shots
	battery_lock = 1 //No changing

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	projectile_type = /obj/item/projectile/beam/precursor_tyr

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

/obj/item/gun/energy/weatherbombardment
	name = "prototype cannon - Weather Bombardment"
	desc = "A massive weapon torn of a precursor mech."
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "ultima"
	item_state = "ultima"
	w_class = ITEMSIZE_HUGE		// This thing is big.
	slot_flags = SLOT_BACK
	one_handed_penalty = 70

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon/recharge/alien/tyr
	battery_lock = 1
	recoil_mode = 0
	charge_meter = 1
	move_delay = 0

	firemodes = list(
		list(mode_name="lighting storm", burst=1, fire_delay=15, projectile_type=/obj/item/projectile/beam/chain_lightning, charge_cost = 500),
		list(mode_name="acid rain", burst=5, fire_delay=15, projectile_type=/obj/item/projectile/energy/neurotoxin/toxic, charge_cost = 50),
		list(mode_name="meteor shower", burst=1, fire_delay=15, projectile_type=/obj/item/projectile/arc/fragmentation/metoerstrike, charge_cost = 500),
		list(mode_name="starry night", burst=5, fire_delay=15, projectile_type=/obj/item/projectile/beam/medical_cell/omni, charge_cost = 50),
		)


/obj/item/projectile/arc/fragmentation/metoerstrike
	name = "fragmentation shot"
	icon_state = "shell"
	fragment_types = list(/obj/item/projectile/energy/spikeenergy_ball/slow)
	fragment_amount = 10 // Same as a grenade.
	spread_range = 60

/obj/item/projectile/energy/spikeenergy_ball/slow
 	speed = 15
 	range = 20
