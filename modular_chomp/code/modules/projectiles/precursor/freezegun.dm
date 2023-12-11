/obj/item/weapon/gun/energy/freezegun
	name = "Pulse Froster Prototype"
	desc = "A strange gun pulsing with energy, it's touch chilling you to the core."
	icon = 'modular_chomp/icons/obj/guns/precursor/frostgun.dmi'
	icon_state = "cryogun"
	item_state = "cryogun"
	wielded_item_state = "cryogun-wielded"
	matter = list(MAT_DURASTEEL = 1000, MAT_MORPHIUM = 500)
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)


	charge_cost = 120 //How much energy is needed to fire.

	accept_cell_type = /obj/item/weapon/cell/device
	cell_type = /obj/item/weapon/cell/device/weapon
	projectile_type = /obj/item/projectile/energy/frostsphere

	charge_meter = 1

	reload_time = 10

	firemodes = list(
		list(mode_name="normal", fire_delay=5, projectile_type=/obj/item/projectile/energy/frostsphere, charge_cost = 120),
		list(mode_name="shotgun", fire_delay=15, projectile_type=/obj/item/projectile/bullet/frostshotgun, charge_cost = 480),
		)