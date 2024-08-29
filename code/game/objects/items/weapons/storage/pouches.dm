#define INVENTORY_POUCH_SPACE ITEMSIZE_COST_SMALL*4 // 25% the size of a backpack for normal size

// Pouches for small storage in pocket slots
/obj/item/storage/pouch // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (medium)"
	desc = "This storage pouch can be used to provide some additional storage for quick access."
	icon = 'icons/inventory/pockets/item.dmi'
	slot_flags = SLOT_POCKET
	drop_sound = 'sound/items/drop/backpack.ogg'
	pickup_sound = 'sound/items/pickup/backpack.ogg'

	icon_state = "medium_generic"
	max_w_class = ITEMSIZE_NORMAL
	max_storage_space = INVENTORY_POUCH_SPACE
	can_hold = null
	pocketable = TRUE

	var/insert_delay = 0 SECONDS
	var/remove_delay = 0 SECONDS // CHOMPedit: Faster, QOL.

/obj/item/storage/pouch/stall_insertion(obj/item/W, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	// No delay if you have the pouch in your hands
	if(user.get_active_hand() == src || user.get_inactive_hand() == src)
		return TRUE // Skip delay

	if(insert_delay && !do_after(user, insert_delay, src, needhand = TRUE, exclusive = TASK_USER_EXCLUSIVE))
		return FALSE // Moved while there is a delay

	return TRUE //Now we're allowed to put the item in the pouch

/obj/item/storage/pouch/stall_removal(obj/item/W, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	// No delay if you have the pouch in your hands
	if(user.get_active_hand() == src || user.get_inactive_hand() == src)
		return TRUE // Skip delay

	if(remove_delay && !do_after(user, remove_delay, src, needhand = TRUE, exclusive = TASK_USER_EXCLUSIVE))
		return FALSE // Moved while there is a delay

	if(W in src)
		return TRUE // Item is still inside

	return FALSE //Item was somehow already removed

/obj/item/storage/pouch/pocket_description(mob/haver, mob/examiner) // CHOMPEdit - Removal of obj/item/weapon
	return "[src]"

/obj/item/storage/pouch/large // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (large)"
	desc = "This storage pouch can be used to provide a good amount of additional storage for quick access."
	icon_state = "large_generic"
	max_storage_space = ITEMSIZE_COST_SMALL*6
	remove_delay = 1 SECONDS // CHOMPedit: Faster.

/obj/item/storage/pouch/small // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (small)"
	desc = "This storage pouch can be used to provide a small amount of additional storage for quick access."
	icon_state = "small_generic"
	max_storage_space = ITEMSIZE_COST_SMALL*2
//	remove_delay = 1 SECOND // Chompedit: Faster.

/obj/item/storage/pouch/ammo // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (ammo)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold ammunition, cells, explosives, and grenades."
	icon_state = "ammo"
	max_storage_space = INVENTORY_POUCH_SPACE
	can_hold = list(/obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/cell/device, /obj/item/grenade, /obj/item/plastique) //Vorestation Add - make it more useful for non-sec/explo //Chompstation Edit - Adds more variety of device cells it can store // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/pouch/eng_tool // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (tools)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold tools."
	icon_state = "engineering_tool"
	max_storage_space = INVENTORY_POUCH_SPACE
	can_hold = list(
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/jawsoflife, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperoll,
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/robotanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/material/minihoe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer/plant_analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/integrated_electronics/wirer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/integrated_electronics/debugger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/shovel/spade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/nanopaste,
		/obj/item/geiger // CHOMPEdit - Removal of obj/item/device
	) //Vorestation Add - make it the same as the tool-belt why was it not like this to start with wtf

/obj/item/storage/pouch/eng_supply // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (supplies)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold engineering supplies."
	icon_state = "engineering_supply"
	max_storage_space = INVENTORY_POUCH_SPACE
	can_hold = list(
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil,
		/obj/item/taperoll,
		/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/material/steel,
		/obj/item/stack/material/glass,
		/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell // CHOMPEdit - Removal of obj/item/weapon
	) //Vorestation Add - makes it actually useful lmao, adds sheets and cells as well as light replacers and lets you take any extinguisher that fits

/obj/item/storage/pouch/eng_parts // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (parts)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold machinery components."
	icon_state = "part_pouch"
	max_storage_space = INVENTORY_POUCH_SPACE*2 //Vorestation Add - yeah lemme give up my pocket to hold FOUR CAPACITORS or have an inferior box... now you can hold eight in your pocket so its at least a box
	can_hold = list(
		/obj/item/stock_parts, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil,
		/obj/item/circuitboard // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/pouch/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (medical)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold medical supplies."
	icon_state = "medical_supply"
	max_storage_space = INVENTORY_POUCH_SPACE
	can_hold = list(
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/dnainjector, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/pill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/quickdraw/syringe_case, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/medical,
		/obj/item/reagent_containers/hypospray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/quickdraw/syringe_case, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/syringe_cartridge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/gloves/sterile,
		/obj/item/sleevemate, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bodybag,
		/obj/item/clothing/mask/surgical,
		/obj/item/soap, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/nanopaste,
		/obj/item/taperoll/medical,
		/obj/item/storage/box/freezer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/chewable/candy/lolli,
	) //Vorestation add - added a bunch of misc medical stuff
	max_storage_space = ITEMSIZE_COST_SMALL*3 //Vorestation Add - makes it slightly smaller since its a lot of stuff with pocket access
	remove_delay = 5 //Vorestation Add - .5 second delay, get the medical things faster because there is no reason to use this otherwise. still gotta stop moving to take things out.

/obj/item/storage/pouch/flares // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (flares)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can only hold flares and glowsticks."
	icon_state = "flare"
	storage_slots = 14 // CHOMPedit: Full box of flares.
	remove_delay = 0 // CHOMPedit: Quick access to light sources.
	can_hold = list(/obj/item/flashlight/flare, /obj/item/flashlight/glowstick) // CHOMPEdit - Removal of obj/item/device
/obj/item/storage/pouch/flares/full_flare // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/flashlight/flare = 14) // CHOMPedit: Full box of flares. // CHOMPEdit - Removal of obj/item/device
/obj/item/storage/pouch/flares/full_glow // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/flashlight/glowstick = 14) // CHOMPedit: Full box of glowsticks. // CHOMPEdit - Removal of obj/item/device

/obj/item/storage/pouch/flares/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(contents.len)
		add_overlay("flare_[contents.len]")
	..()

/obj/item/storage/pouch/holster // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (holster)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can hold one normal sized weapon."
	icon_state = "pistol_holster"
	storage_slots = 1
	can_hold = list(/obj/item/gun) //this covers basically everything I think so its fine // CHOMPEdit - Removal of obj/item/weapon
	remove_delay = 0
/obj/item/storage/pouch/holster/full_stunrevolver // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/gun/energy/stunrevolver) // CHOMPEdit - Removal of obj/item/weapon
/obj/item/storage/pouch/holster/full_taser // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/gun/energy/taser) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/pouch/holster/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(contents.len)
		add_overlay("pistol_layer")
	..()

/obj/item/storage/pouch/baton // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch (melee)"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Can hold one normal size melee." //Vorestation add - make it a melee pouch literally why would you hold ONE BATON
	icon_state = "baton_holster"
	storage_slots = 1
	can_hold = list(/obj/item/melee, /obj/item/material, /obj/item/tool/wrench) //should be like, every melee weapon I could think of that was normal size. Can make it more specific if needed. Also wrench because I thought it was funny. // CHOMPEdit - Removal of obj/item/weapon
	remove_delay = 0
/obj/item/storage/pouch/baton/full // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/melee/baton) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/pouch/baton/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(contents.len)
		add_overlay("baton_layer")
	..()

/obj/item/storage/pouch/holding // CHOMPEdit - Removal of obj/item/weapon
	name = "storage pouch of holding"
	desc = "This storage pouch can be used to provide some additional storage for quick access. Seems to use extradimensional storage!"
	icon_state = "holdingpouch"
	max_storage_space = INVENTORY_POUCH_SPACE*2 //VOREStation Edit: Consistency with normal bags of holding

#undef INVENTORY_POUCH_SPACE
