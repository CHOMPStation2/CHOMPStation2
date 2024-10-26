/obj/item/gun/energy/laser
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "lcarbine"
	name = "NT LC-525 Laser Rifle"
	desc = "A relatively new, mass produced Nanotrasen laser carbine designed to kill with concentrated energy blasts. Just like the G40E, it has two firemodes, standard, and suppressive, which fires more efficent but weaker beams."
	icon_expected_width = 64
	var/is64x32 = TRUE
	var/is64x32_override = FALSE
	var/is_picked_up = FALSE

/obj/item/gun/energy/laser/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/energy/laser/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/energy/laser/dropped()
	. = ..()
	if(!istype(loc,/mob/living))
		is_picked_up = FALSE
	update_transform()

/obj/item/gun/energy/laser/Initialize()
	. = ..()
	if((!(type == /obj/item/gun/energy/laser)) && !is64x32_override)
		is64x32 = FALSE
		if(icon_expected_width == 64)
			icon_expected_width = 32
		if(icon == 'icons/obj/64x32guns_ch.dmi')
			icon = 'icons/obj/gun.dmi'
	if(is64x32)
		update_transform()

/obj/item/gun/energy/laser/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/gun/energy/laser/empty
	is64x32_override = TRUE

/obj/item/gun/energy/laser/mounted
	is64x32_override = TRUE

/obj/item/gun/energy/laser/practice
	is64x32_override = TRUE

/obj/item/gun/energy/laser/vepr
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
	accept_cell_type = /obj/item/cell/vepr
	cell_type = /obj/item/cell/vepr
	origin_tech = list(TECH_POWER = 4, TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ILLEGAL = 4)

/obj/item/cell/vepr
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "veprcell"
	item_state = "egg6"
	w_class = ITEMSIZE_SMALL
	maxcharge = 7200
	charge_amount = 20
	matter = list("metal" = 350, "glass" = 50)
	preserve_item = 1
	origin_tech = list(TECH_POWER = 6)

/obj/item/gun/energy/tommylaser
	name = "M-2421 'Tommy-Laser'"
	desc = "A automatic laser weapon resembling a Tommy-Gun. Designed by Cybersun Industries to be a man portable supressive fire laser weapon."
	icon_state = "etommy"
	item_state = "etommy"
	w_class = ITEMSIZE_LARGE
	slot_flags = SLOT_BACK
	charge_cost = 60 // 40 shots, lay down the firepower
	projectile_type = /obj/item/projectile/beam/weaklaser
	cell_type = /obj/item/cell/device/weapon
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 5, TECH_ILLEGAL = 3)

	firemodes = list(
		list(mode_name="single shot", burst = 1, fire_delay=4, move_delay=null, burst_accuracy = null, dispersion = null),
		list(mode_name="three shot bursts", burst=3, fire_delay=10 , move_delay=4,    burst_accuracy=list(65,65,65), dispersion=list(1,1,1)),
		list(mode_name="short bursts",	burst=5, fire_delay=10 ,move_delay=6, burst_accuracy = list(65,65,65,65,65), dispersion = list(4,4,4,4,4)),
		)

/obj/item/gun/energy/zip
	name = "Zip-Las"
	desc = "A homemade (and somehow safe) laser gun designed around shooting single powerful laser beam draining the cell entirely. Better not miss and better have spare cells."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "ziplas"
	item_state = "ziplas"
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_BACK
	charge_cost = 1500 //You got 1 shot...
	projectile_type = /obj/item/projectile/beam/heavylaser //But it hurts a lot
	cell_type = /obj/item/cell/device/weapon

/obj/item/gun/energy/vepr/plasma
	name = "WKHM 'Vepr-Prisma'"
	desc = "The Vepr-Prisma plasma rifle, in 40 Watt range. A very robust version of the Vepr lasrifle, made to fire energized bolts of plasma. The Vepr-Prisma is very uncommon, reserved mainly for W-K's internal security forces, and organizations with lots of money to spend. Lacks a burst mode, but it probably doesn't need it. This one bears the 'WKHM Adamant' arkship's production stamp."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	icon_expected_width = 64
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "vepr"
	fire_delay = 0.5
	projectile_type = /obj/item/projectile/energy/plasma/vepr
	force = 8
	w_class = ITEMSIZE_HUGE		//Probably gonna make it a rifle sooner or later //CHOMP Edit, and so I did.
	slot_flags = SLOT_BELT|SLOT_BACK //CHOMP Edit. Let's make it so that if it doesn't fit in a backpack, it doesn't fit in a holster either.
	var/is64x32_override = TRUE
	accept_cell_type = /obj/item/cell/vepr
	cell_type = /obj/item/cell/vepr
	origin_tech = list(TECH_POWER = 4, TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ILLEGAL = 4)