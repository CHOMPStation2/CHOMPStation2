/*
 *	Toolboxes
 */
/obj/item/storage/toolbox // CHOMPEdit - Removal of obj/item/weapon
	name = "toolbox"
	desc = "A metal toolbox with remarkably robust construction."
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "red"
	item_state_slots = list(slot_r_hand_str = "toolbox_red", slot_l_hand_str = "toolbox_red")
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 11 //CHOMPEdit
	force = 10
	throwforce = 10
	throw_speed = 1
	throw_range = 7
	w_class = ITEMSIZE_LARGE
	max_w_class = ITEMSIZE_NORMAL
	max_storage_space = ITEMSIZE_COST_SMALL * 7 //enough to hold all starting contents
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("robusted")
	use_sound = 'sound/items/storage/toolbox.ogg'
	drop_sound = 'sound/items/drop/toolbox.ogg'
	pickup_sound = 'sound/items/pickup/toolbox.ogg'

//Emergency
/obj/item/storage/toolbox/emergency // CHOMPEdit - Removal of obj/item/weapon
	name = "emergency toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "red"
	item_state_slots = list(slot_r_hand_str = "toolbox_red", slot_l_hand_str = "toolbox_red")
	starts_with = list(
		/obj/item/tool/crowbar/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio // CHOMPEdit - Removal of obj/item/device
	)
/obj/item/storage/toolbox/emergency/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		new /obj/item/flashlight(src) // CHOMPEdit - Removal of obj/item/device
	else
		new /obj/item/flashlight/flare(src) // CHOMPEdit - Removal of obj/item/device
	. = ..()

//Mechanical
/obj/item/storage/toolbox/mechanical // CHOMPEdit - Removal of obj/item/weapon
	name = "mechanical toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "blue"
	item_state_slots = list(slot_r_hand_str = "toolbox_blue", slot_l_hand_str = "toolbox_blue")
	starts_with = list(
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tool/wirecutters // CHOMPEdit - Removal of obj/item/weapon
	)

//Electrical
/obj/item/storage/toolbox/electrical // CHOMPEdit - Removal of obj/item/weapon
	name = "electrical toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "yellow"
	item_state_slots = list(slot_r_hand_str = "toolbox_yellow", slot_l_hand_str = "toolbox_yellow")
	starts_with = list(
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/t_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil/random_belt,
		/obj/item/stack/cable_coil/random_belt
	)
/obj/item/storage/toolbox/electrical/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(prob(5))
		new /obj/item/clothing/gloves/yellow(src)
	else
		new /obj/item/stack/cable_coil/random(src,30)
	calibrate_size()

//Syndicate
/obj/item/storage/toolbox/syndicate // CHOMPEdit - Removal of obj/item/weapon
	name = "black and red toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "syndicate"
	item_state_slots = list(slot_r_hand_str = "toolbox_syndi", slot_l_hand_str = "toolbox_syndi")
	origin_tech = list(TECH_COMBAT = 1, TECH_ILLEGAL = 1)
	force = 14
	starts_with = list(
		/obj/item/clothing/gloves/yellow,
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool // CHOMPEdit - Removal of obj/item/device
	)

/obj/item/storage/toolbox/syndicate/powertools // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/clothing/gloves/yellow,
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/experimental, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/jawsoflife, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil/random_belt,
		/obj/item/analyzer // CHOMPEdit - Removal of obj/item/device
	)

//Brass
/obj/item/storage/toolbox/brass // CHOMPEdit - Removal of obj/item/weapon
	name = "brass toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "brass"
	item_state_slots = list(slot_r_hand_str = "toolbox_yellow", slot_l_hand_str = "toolbox_yellow")
	starts_with = list(
		/obj/item/tool/crowbar/brass, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/brass, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver/brass, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench/brass, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/brass // CHOMPEdit - Removal of obj/item/weapon
	)

//Hydro
/obj/item/storage/toolbox/hydro // CHOMPEdit - Removal of obj/item/weapon
	name = "hydroponic toolbox"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "green"
	item_state_slots = list(slot_r_hand_str = "toolbox_green", slot_l_hand_str = "toolbox_green")
	starts_with = list(
		/obj/item/analyzer/plant_analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/material/minihoe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/clippers/trimmers, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/plantbgone, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker // CHOMPEdit - Removal of obj/item/weapon
	)

/*
 *	Lunchboxes
 */

/obj/item/storage/toolbox/lunchbox // CHOMPEdit - Removal of obj/item/weapon
	max_storage_space = ITEMSIZE_COST_SMALL * 4 //slightly smaller than a toolbox
	name = "rainbow lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_rainbow"
	item_state_slots = list(slot_r_hand_str = "toolbox_pink", slot_l_hand_str = "toolbox_pink")
	desc = "A little lunchbox. This one is the colors of the rainbow!"
	w_class = ITEMSIZE_NORMAL
	max_w_class = ITEMSIZE_SMALL
	var/filled = FALSE
	attack_verb = list("lunched")

/obj/item/storage/toolbox/lunchbox/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	if(filled)
		var/list/lunches = lunchables_lunches()
		var/lunch = lunches[pick(lunches)]
		new lunch(src)

		var/list/snacks = lunchables_snacks()
		var/snack = snacks[pick(snacks)]
		new snack(src)

		var/list/drinks = lunchables_drinks()
		var/drink = drinks[pick(drinks)]
		new drink(src)
	. = ..()

/obj/item/storage/toolbox/lunchbox/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/heart // CHOMPEdit - Removal of obj/item/weapon
	name = "heart lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_lovelyhearts"
	item_state_slots = list(slot_r_hand_str = "toolbox_pink", slot_l_hand_str = "toolbox_pink")
	desc = "A little lunchbox. This one has cute little hearts on it!"

/obj/item/storage/toolbox/lunchbox/heart/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/cat // CHOMPEdit - Removal of obj/item/weapon
	name = "cat lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_sciencecatshow"
	item_state_slots = list(slot_r_hand_str = "toolbox_green", slot_l_hand_str = "toolbox_green")
	desc = "A little lunchbox. This one has a cute little science cat from a popular show on it!"

/obj/item/storage/toolbox/lunchbox/cat/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/nt // CHOMPEdit - Removal of obj/item/weapon
	name = "NanoTrasen brand lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_nanotrasen"
	item_state_slots = list(slot_r_hand_str = "toolbox_blue", slot_l_hand_str = "toolbox_blue")
	desc = "A little lunchbox. This one is branded with the NanoTrasen logo!"

/obj/item/storage/toolbox/lunchbox/nt/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/mars // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Mojave university lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_marsuniversity"
	item_state_slots = list(slot_r_hand_str = "toolbox_red", slot_l_hand_str = "toolbox_red")
	desc = "A little lunchbox. This one is branded with the Mojave university logo!"

/obj/item/storage/toolbox/lunchbox/mars/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/cti // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper CTI lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_cti"
	item_state_slots = list(slot_r_hand_str = "toolbox_blue", slot_l_hand_str = "toolbox_blue")
	desc = "A little lunchbox. This one is branded with the CTI logo!"

/obj/item/storage/toolbox/lunchbox/cti/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/nymph // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Diona nymph lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_dionanymph"
	item_state_slots = list(slot_r_hand_str = "toolbox_yellow", slot_l_hand_str = "toolbox_yellow")
	desc = "A little lunchbox. This one is an adorable Diona nymph on the side!"

/obj/item/storage/toolbox/lunchbox/nymph/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE

/obj/item/storage/toolbox/lunchbox/syndicate // CHOMPEdit - Removal of obj/item/weapon
	name = "black and red lunchbox"
	icon = 'icons/obj/storage.dmi'
	icon_state = "lunchbox_syndie"
	item_state_slots = list(slot_r_hand_str = "toolbox_syndi", slot_l_hand_str = "toolbox_syndi")
	desc = "A little lunchbox. This one is a sleek black and red, made of a durable steel!"

/obj/item/storage/toolbox/lunchbox/syndicate/filled // CHOMPEdit - Removal of obj/item/weapon
	filled = TRUE
