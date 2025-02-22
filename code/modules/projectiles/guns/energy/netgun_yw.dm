
/obj/item/gun/energy/hunter
	name = "Hybrid 'Hunter' net gun"
	desc = "A Hephaestus-designed hybrid of a taser and the energy net gun, usually dubbed 'Hunter' stunner and energy net launcher, \
			for when you want criminals to stop acting like they're on a 20th century British comedy sketch show."
	catalogue_data = list(/datum/category_item/catalogue/information/organization/hephaestus)
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "hunter"
	item_state = "gun" // Placeholder
	mode_name = "stun"
	projectile_type = /obj/item/projectile/beam/stun/blue
	charge_cost = 320
	fire_delay = 10


	fire_sound = 'sound/weapons/Taser.ogg'
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 6, TECH_MAGNET = 4)

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/blue, fire_sound='sound/weapons/Taser.ogg', charge_cost=320, fire_delay=10),
		list(mode_name="capture", projectile_type=/obj/item/projectile/beam/energy_net, fire_sound = 'sound/weapons/eluger.ogg', charge_cost=1200, fire_delay=50)
	)

/obj/item/gun/energy/hunter/update_icon()
	overlays.Cut()

	if(power_supply)
		var/ratio = power_supply.charge / power_supply.maxcharge

		if(power_supply.charge < charge_cost)
			ratio = 0
		else
			ratio = max(round(ratio, 0.25) * 100, 25)

		overlays += "[initial(icon_state)]_cell"
		overlays += "[initial(icon_state)]_[ratio]"
		overlays += "[initial(icon_state)]_[mode_name]"
