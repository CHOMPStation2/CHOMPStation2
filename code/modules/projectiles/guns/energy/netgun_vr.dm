//Contains the Energy Net Gun code and information/lore

/obj/item/gun/energy/netgun
	name = "energy net gun"
	desc = "A Hephaestus-designed, usually dubbed 'non-lethal capture device' energy net launcher, \
			for when you wanna capture feracious predators." //YW edit - small change to description
	catalogue_data = list(/datum/category_item/catalogue/information/organization/hephaestus) //CHOMP Edit? Probably YW actually. Replaces Virgo lore.
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "netgun"
	item_state = "gun" // Placeholder

	fire_sound = 'sound/weapons/eluger.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_MAGNET = 3)
	projectile_type = /obj/item/projectile/beam/energy_net
	charge_cost = 800
	fire_delay = 50

/obj/item/gun/energy/netgun/update_icon()
	if(power_supply == null)
		if(modifystate)
			icon_state = "[modifystate]_open"
		else
			icon_state = "[initial(icon_state)]_open"
		return
	else if(charge_meter)
		var/ratio = power_supply.charge / power_supply.maxcharge

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(power_supply.charge < charge_cost)
			ratio = 0
		else
			ratio = max(round(ratio, 0.25) * 100, 25)

		if(modifystate)
			icon_state = "[modifystate][ratio]"
		else
			icon_state = "[initial(icon_state)][ratio]"

	else if(power_supply)
		if(modifystate)
			icon_state = "[modifystate]"
		else
			icon_state = "[initial(icon_state)]"
