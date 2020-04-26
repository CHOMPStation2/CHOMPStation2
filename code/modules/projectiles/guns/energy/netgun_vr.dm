/obj/item/weapon/gun/energy/netgun
	name = "energy net gun"
	desc = "A Hephaestus-designed, usually dubbed 'Hunter' or 'non-lethal capture device' stunner and energy net launcher, \
			for when you want criminals to stop acting like they're on a 20th century British comedy sketch show."
	catalogue_data = list(/datum/category_item/catalogue/information/organization/hephaestus)
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "netgun"
	item_state = "gun" // Placeholder
	charge_meter = 0

	fire_sound = 'sound/weapons/eluger.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_MAGNET = 3)
	projectile_type = /obj/item/projectile/beam/energy_net
	charge_cost = 800
	fire_delay = 50
