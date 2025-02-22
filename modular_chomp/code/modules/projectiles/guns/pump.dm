/obj/item/gun/energy/locked/frontier/rifle
	fire_delay = 12

/obj/item/gun/energy/locked/frontier/shotgun
	name = "frontier shotgun"
	desc = "A much larger, heavier weapon than the typical frontier-type weapons. This one has a safety interlock that prevents firing while in proximity to the facility."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "oldphaser" //note to self, make a unquie more fitting sprite at some point.
	item_state = "sniper"
	item_state_slots = list(slot_r_hand_str = "lsniper", slot_l_hand_str = "lsniper")
	wielded_item_state = "lsniper-wielded"
	w_class = ITEMSIZE_LARGE
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi', slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	one_handed_penalty = 30 //A bit easier to aim then a sniper to aim but still not accurate
	phase_power = 30 //Same as sniper.
	projectile_type = /obj/item/projectile/scatter/frontierlaser
	move_delay = 0
	charge_cost = 400
	fire_delay = 8
	firemodes = list(
		list(mode_name="full", projectile_type=/obj/item/projectile/scatter/frontierlaser, charge_cost = 400),
		list(mode_name="conserve", projectile_type=/obj/item/projectile/beam/phaser/shotgun, charge_cost = 120),
	)


/obj/item/projectile/scatter/frontierlaser
	submunition_spread_max = 120
	submunition_spread_min = 60
	spread_submunition_damage = FALSE
	submunitions = list(
		/obj/item/projectile/beam/phaser/shotgun = 5
		)

/obj/item/projectile/beam/phaser/shotgun
	damage = 7
	SA_bonus_damage = 7
	range = 4
	icon_state = "phaser_heavy"
	light_range = 3
	light_power = 1
	muzzle_type = /obj/effect/projectile/muzzle/phaser/heavy
	tracer_type = /obj/effect/projectile/tracer/phaser/heavy
	impact_type = /obj/effect/projectile/impact/phaser/heavy
