/obj/item/storage/belt // CHOMPEdit - Removal of obj/item/weapon
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/inventory/belt/mob_teshari.dmi',
		SPECIES_WEREBEAST = 'icons/inventory/belt/mob_vr_werebeast.dmi')

/obj/item/storage/belt/explorer // CHOMPEdit - Removal of obj/item/weapon
	name = "explorer's belt"
	desc = "A versatile belt with several pouches. It can hold a very wide variety of items, but less items overall than a dedicated belt. Still, it's useful for any explorer who wants to be prepared for anything they might find."
	icon = 'icons/inventory/belt/item_vr.dmi'
	icon_override = 'icons/inventory/belt/mob_vr.dmi'
	icon_state = "explo_belt"
	item_state = "explorer_belt"
	storage_slots = 5	//makes it strictly inferior to any specialized belt as they have seven slots, but it's far more versatile
	max_w_class = ITEMSIZE_NORMAL	//limits the max size of thing that can be put in, so no using it to hold five laser cannons
	max_storage_space = ITEMSIZE_COST_NORMAL * 5
	can_hold = list(
		/obj/item/grenade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil,
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/shield, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine,
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/robotanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/glass/beaker, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/medical,
		/obj/item/stack/marker_beacon,
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/quickdraw/syringe_case, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperecorder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/ano_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cataloguer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/mapping_unit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/binoculars, //CHOMPADD // CHOMPEdit - Removal of obj/item/device
		/obj/item/kinetic_crusher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer // CHOMPEdit - Removal of obj/item/device
		)

/obj/item/storage/belt/explorer/pathfinder // CHOMPEdit - Removal of obj/item/weapon
	name = "pathfinder's belt"
	desc = "A deluxe belt with many pouches. It can hold a very wide variety of items, but less items overall than a dedicated belt. Still, it's useful for any explorer who wants to be prepared for anything they might find."
	icon = 'icons/inventory/belt/item_vr.dmi'
	icon_state = "pathfinder_belt"
	item_state = "pathfinder_belt"
	storage_slots = 7	//two more, bringing it on par with normal belts
	max_storage_space = ITEMSIZE_COST_NORMAL * 7

/obj/item/storage/belt/miner // CHOMPEdit - Removal of obj/item/weapon
	name = "mining belt"
	desc = "A versatile and durable looking belt with several pouches and straps. It can hold a very wide variety of items that any typical miner might need out in the deep."
	icon = 'icons/inventory/belt/item_vr.dmi'
	icon_state = "mining"
	item_state = "mining"
	storage_slots = 6
	max_w_class = ITEMSIZE_LARGE
	max_storage_space = ITEMSIZE_COST_NORMAL * 6
	can_hold = list(
		/obj/item/fulton_core,
		/obj/item/extraction_pack,
		/obj/item/resonator,
		/obj/item/stack/marker_beacon,
		/obj/item/stack/flag,
		/obj/item/modular_computer/tablet,
		/obj/item/clothing/glasses,
		/obj/item/clothing/shoes/bhop,
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/core_sampler, // CHOMPEdit - Removal of obj/item/device
		/obj/item/beacon_locator, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/measuring_tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/depth_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/ano_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/xenoarch_multi_tool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/laser_pointer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/survivalcapsule, // CHOMPEdit - Removal of obj/item/device
		/obj/item/perfect_tele/one_beacon, // CHOMPEdit - Removal of obj/item/device
		/obj/item/binoculars, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/samplebags, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/shovel, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anodevice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/excavation, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anobattery, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/hypospray/autoinjector, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/plastique/seismic/locked, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/magnetic/matfed/phoronbore, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/bag/sheetsnatcher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/kinetic_crusher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/mining_scanner // CHOMPEdit - Removal of obj/item/weapon
		)
		//Pretty much, if it's in the mining vendor, they should be able to put it on the belt.

/obj/item/storage/belt/archaeology // CHOMPEdit - Removal of obj/item/weapon
	can_hold = list(
		/obj/item/stack/marker_beacon,
		/obj/item/clothing/glasses,
		/obj/item/storage/box/samplebags, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/xenoarch_multi_tool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/core_sampler, // CHOMPEdit - Removal of obj/item/device
		/obj/item/beacon_locator, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/beacon, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/measuring_tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/depth_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/ano_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anodevice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/excavation, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anobattery, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/belt/hydro // CHOMPEdit - Removal of obj/item/weapon
	name = "hydroponics belt"
	desc = "A belt used to hold most hydroponics supplies. Suprisingly, not green."
	icon = 'icons/inventory/belt/item_vr.dmi'
	icon_override = 'icons/inventory/belt/mob_vr.dmi'
	icon_state = "plantbelt"
	item_state = "plantbelt"
	storage_slots = 5
	max_w_class = ITEMSIZE_LARGE
	max_storage_space = ITEMSIZE_COST_NORMAL * 5
	can_hold = list(
		/obj/item/analyzer/plant_analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/glass/beaker, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/shovel/spade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/minihoe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/plantbgone, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/plantspray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/floragun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/seeds
		)
