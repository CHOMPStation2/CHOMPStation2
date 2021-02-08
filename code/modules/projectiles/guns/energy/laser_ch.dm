/obj/item/weapon/gun/energy/laser
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "lcarbine"
	name = "NT LC-525 Laser Rifle"
	desc = "A relatively new, mass produced Nanotrasen laser carbine designed to kill with concentrated energy blasts. Just like the G40E, it has two firemodes, standard, and suppressive, which fires more efficent but weaker beams."
	icon_expected_width = 64
	var/is64x32 = TRUE
	var/is64x32_override = FALSE
	var/is_picked_up = FALSE

/obj/item/weapon/gun/energy/laser/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/energy/laser/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/energy/laser/dropped()
	. = ..()
	if(!istype(loc,/mob/living))
		is_picked_up = FALSE
	update_transform()

/obj/item/weapon/gun/energy/laser/Initialize()
	. = ..()
	if((!(type == /obj/item/weapon/gun/energy/laser)) && !is64x32_override)
		is64x32 = FALSE
		if(icon_expected_width == 64)
			icon_expected_width = 32
		if(icon == 'icons/obj/64x32guns_ch.dmi')
			icon = 'icons/obj/gun.dmi'
	if(is64x32)
		update_transform()

/obj/item/weapon/gun/energy/laser/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/weapon/gun/energy/laser/empty
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/mounted
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/practice
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/vepr
	name = "WKHM 'Vepr'"
	desc = "The Vepr lasgun, in 40 Watt range. One of the most robust laser rifles out there, but not one that's commonly seen. This piece is WKHM's latest entry into the energy weapon market, competing with the Hephaestus Industries G40E. Uses its own proprietary energy cells. It has three settings, standard, suppressive, and burst. This one bears the 'WKHM Adamant' arkship's production stamp."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	icon_expected_width = 64
	icon_state = "vepr"
	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 240),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 60),
		list(mode_name="burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, charge_cost = 200),
		)
	force = 8
	w_class = ITEMSIZE_HUGE		//Probably gonna make it a rifle sooner or later //CHOMP Edit, and so I did.
	slot_flags = SLOT_BELT|SLOT_BACK //CHOMP Edit. Let's make it so that if it doesn't fit in a backpack, it doesn't fit in a holster either.
	is64x32_override = TRUE
	accept_cell_type = /obj/item/weapon/cell/vepr
	cell_type = /obj/item/weapon/cell/vepr
	origin_tech = list(TECH_POWER = 4, TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ILLEGAL = 4)

/obj/item/weapon/cell/vepr
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "veprcell"
	item_state = "egg6"
	w_class = ITEMSIZE_SMALL
	maxcharge = 7200
	charge_amount = 20
	matter = list("metal" = 350, "glass" = 50)
	preserve_item = 1
	overlay_half_state = "veprcell_o1"
	overlay_full_state = "veprcell_o2"
	origin_tech = list(TECH_POWER = 6)
