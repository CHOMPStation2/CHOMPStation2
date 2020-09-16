/obj/item/weapon/gun/energy/netgun
	name = "\"Varmint Catcher\" energy net gun"
	desc = "A Hephaestus-designed, usually dubbed 'non-lethal capture device' energy net launcher, \
			for when you wanna capture feracious predators." //YW edit - small change to description
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
