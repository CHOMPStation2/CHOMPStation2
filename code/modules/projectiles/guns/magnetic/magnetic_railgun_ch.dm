/obj/item/gun/magnetic/railgun
	name = "WKHM 'Strzyga' railgun"
	desc = "A devastatingly powerful, and very expensive railgun built for long range engagements, and anti vehicle applications. Possibly one of the most powerful handheld weapons to date. Capable of punching a hole clean through a durasteel wall. The last thing the enemy will never see. 'DO NOT TOUCH THE RAILS' is stickered on the receiver. Chambers 16.5x122mm slugs. "
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "railgun-e"
	icon_expected_width = 64
	var/is64x32 = TRUE
	var/is64x32_override = FALSE
	var/is_picked_up = FALSE

/obj/item/gun/magnetic/railgun/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/magnetic/railgun/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/gun/magnetic/railgun/dropped(mob/living/user)
	. = ..()
	is_picked_up = FALSE
	update_transform()

/obj/item/gun/magnetic/railgun/Initialize(mapload)
	. = ..()
	if((!(type == /obj/item/gun/magnetic/railgun)) && !is64x32_override)
		is64x32 = FALSE
		if(icon_expected_width == 64)
			icon_expected_width = 32
		if(icon == 'icons/obj/64x32guns_ch.dmi')
			icon = 'icons/obj/railgun.dmi'
	if(is64x32)
		update_transform()

/obj/item/gun/magnetic/railgun/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)
