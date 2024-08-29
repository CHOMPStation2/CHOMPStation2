/obj/item/storage/belt // CHOMPEdit - Removal of obj/item/weapon
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/inventory/belt/item.dmi'
	icon_state = "utility"
	storage_slots = 7
	max_storage_space = ITEMSIZE_COST_NORMAL * 7 //This should ensure belts always have enough room to store whatever.
	max_w_class = ITEMSIZE_NORMAL
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	equip_sound = 'sound/items/toolbelt_equip.ogg'
	drop_sound = 'sound/items/drop/toolbelt.ogg'
	pickup_sound = 'sound/items/pickup/toolbelt.ogg'
	sprite_sheets = list(SPECIES_TESHARI = 'icons/inventory/belt/mob_teshari.dmi')

	var/show_above_suit = 0

/obj/item/storage/belt/verb/toggle_layer() // CHOMPEdit - Removal of obj/item/weapon
	set name = "Switch Belt Layer"
	set category = "Object"

	if(show_above_suit == -1)
		to_chat(usr, "<span class='notice'>\The [src] cannot be worn above your suit!</span>")
		return
	show_above_suit = !show_above_suit
	update_icon()

//Some belts have sprites to show icons
/obj/item/storage/belt/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer = 0,var/icon/clip_mask = null) // CHOMPEdit - Removal of obj/item/weapon
	var/image/standing = ..()
	if(!inhands && contents.len)
		for(var/obj/item/i in contents)
			var/i_state = i.item_state
			if(!i_state) i_state = i.icon_state
			var/image/add_icon = image(icon = INV_BELT_DEF_ICON, icon_state = i_state)
			if(istype(clip_mask)) //For taur bodies/tails clipping off parts of uniforms and suits.
				standing.filters += filter(type = "alpha", icon = clip_mask)
			standing.add_overlay(add_icon)
	return standing

/obj/item/storage/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()

/obj/item/storage/belt/utility // CHOMPEdit - Removal of obj/item/weapon
	name = "tool-belt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Can hold various tools."
	icon_state = "utility"
	can_hold = list(
		///obj/item/combitool, // CHOMPEdit - Removal of obj/item/weapon
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
		/obj/item/pipe_dispenser, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holosign_creator/combifan, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rcd, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/integrated_electronics/debugger, //Vorestation edit adding debugger to toolbelt can hold list // CHOMPEdit - Removal of obj/item/device
		/obj/item/shovel/spade, //VOREStation edit. If it can hold minihoes and hatchers, why not the gardening spade? // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/nanopaste, //VOREStation edit. Think of it as a tube of superglue. Belts hold that all the time.
		/obj/item/geiger //VOREStation edit. Engineers work with rad-slinging stuff sometimes too // CHOMPEdit - Removal of obj/item/device
		)

/obj/item/storage/belt/utility/full // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil/random_belt
	)

/obj/item/storage/belt/utility/full/multitool // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil/random_belt,
		/obj/item/multitool // CHOMPEdit - Removal of obj/item/device
	)

/obj/item/storage/belt/utility/atmostech // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer, //Vorestation edit. Gives atmos techs a few extra tools fitting their job from the start // CHOMPEdit - Removal of obj/item/device
		/obj/item/extinguisher/mini //Vorestation edit. As above, the mini's much more handy to have rather than lugging a big one around // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/belt/utility/chief // CHOMPEdit - Removal of obj/item/weapon
	name = "chief engineer's toolbelt"
	desc = "Holds tools, looks snazzy."
	icon_state = "utilitybelt_ce"
	item_state = "utility_ce"
	storage_slots = 8	//If they get better everything-else, why not the belt too?
	can_hold = list(
		/obj/item/rcd,	//They've given one from the get-go, it's hard to imagine they wouldn't be given something that can store it neater than a bag // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pipe_dispenser, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holosign_creator/combifan, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
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
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/areaeditor/blueprints,	//It's a bunch of paper that could prolly be rolled up & slipped into the belt, not to mention CE only, see the RCD's thing above
		/obj/item/wire_reader	//As above
		)

/obj/item/storage/belt/utility/chief/full // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/jawsoflife, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/experimental, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil/random_belt,
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer // CHOMPEdit - Removal of obj/item/device
	)

/obj/item/storage/belt/utility/holding // CHOMPEdit - Removal of obj/item/weapon
	name = "tool-belt of holding"
	desc = "A belt that uses localized bluespace pockets to hold more items than expected!"
	icon_state = "utility_holding"
	storage_slots = 14 //twice the amount as a normal belt
	max_storage_space = ITEMSIZE_COST_NORMAL * 14
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
		/obj/item/cell, //this is a bigger belt, might as well make it hold bigger cells too // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pipe_dispenser, //bigger belt for bigger tools // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rcd, //see above // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/quantum_pad_booster, // CHOMPEdit - Removal of obj/item/device
		/obj/item/inducer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/material/steel,
		/obj/item/stack/material/glass,
		/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pickaxe/plasmacutter // CHOMPEdit - Removal of obj/item/weapon
	)


/obj/item/storage/belt/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medical"
	can_hold = list(
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/dnainjector, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/pill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/quickdraw/syringe_case, //VOREStation Addition - Adds syringe cases, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter/zippo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/fancy/cigarettes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/medical,
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperoll,
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves,
		/obj/item/reagent_containers/hypospray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses,
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/quickdraw/syringe_case, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_casing/macrobattery // CHOMPedit: Macrobatteries for the Curabitur can fit into medbelts.
		)

/obj/item/storage/belt/medical/emt // CHOMPEdit - Removal of obj/item/weapon
	name = "EMT utility belt"
	desc = "A sturdy black webbing belt with attached pouches."
	icon_state = "ems"

/obj/item/storage/belt/medical/holding // CHOMPEdit - Removal of obj/item/weapon
	name = "medical belt of holding"
	desc = "A belt that uses localized bluespace pockets to hold more items than expected!"
	icon_state = "med_holding"
	storage_slots = 14 //twice the amount as a normal belt
	max_storage_space = ITEMSIZE_COST_NORMAL * 14

/obj/item/storage/belt/security // CHOMPEdit - Removal of obj/item/weapon
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "security"
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(
		/obj/item/grenade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/a12g,
		/obj/item/ammo_magazine,
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/donut/, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/taser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/stunrevolver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/stunrevolver/vintage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/magnetic/railgun/heater/pistol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperecorder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves,
		/obj/item/hailer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/melee, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/badge,
		/obj/item/gun/projectile/sec, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/p92x, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/taperoll,
		/obj/item/gun/projectile/colt/detective, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holowarrant, // CHOMPEdit - Removal of obj/item/device
		/obj/item/ticket_printer	//VOREStation Edit // CHOMPEdit - Removal of obj/item/device
		)

/obj/item/storage/belt/detective // CHOMPEdit - Removal of obj/item/weapon
	name = "forensic utility belt"
	desc = "A belt for holding forensics equipment."
	icon_state = "security"
	storage_slots = 7
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(
		/obj/item/taperecorder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses,
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/luminol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/sample, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/forensics/sample_kit/powder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/forensics/swab, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/uv_light, // CHOMPEdit - Removal of obj/item/device
		/obj/item/forensics/sample_kit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/autopsy_scanner, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/mass_spectrometer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/accessory/badge,
		/obj/item/reagent_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/hailer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves,
		/obj/item/taperoll,
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/donut/, // CHOMPEdit - Removal of obj/item/weapon
		///obj/item/ammo_magazine,	//Detectives don't get projectile weapons as standard here
		///obj/item/gun/projectile/colt/detective,	//Detectives don't get projectile weapons as standard here // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/stunrevolver/detective,	//In keeping with the same vein as above, they can store their special one // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holowarrant, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/food/drinks/flask, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ticket_printer	//VOREStation Edit // CHOMPEdit - Removal of obj/item/device
		)

/obj/item/storage/belt/soulstone // CHOMPEdit - Removal of obj/item/weapon
	name = "soul stone belt"
	desc = "Designed for ease of access to the shards during a fight, as to not let a single enemy spirit slip away"
	icon_state = "soulstone"
	storage_slots = 6
	can_hold = list(
		/obj/item/soulstone // CHOMPEdit - Removal of obj/item/device
		)

/obj/item/storage/belt/soulstone/full // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/soulstone = 6) // CHOMPEdit - Removal of obj/item/device

/obj/item/storage/belt/utility/alien // CHOMPEdit - Removal of obj/item/weapon
	name = "alien belt"
	desc = "A belt(?) that can hold things."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = "security"

/obj/item/storage/belt/utility/alien/full // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/tool/screwdriver/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool/alien, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil/alien
	)

/obj/item/storage/belt/medical/alien // CHOMPEdit - Removal of obj/item/weapon
	name = "alien belt"
	desc = "A belt(?) that can hold things."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = "security"
	storage_slots = 8
	can_hold = list(
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/dnainjector, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/pill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter/zippo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/fancy/cigarettes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/medical,
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperoll,
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves,
		/obj/item/reagent_containers/hypospray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses,
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/belt/medical/alien // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/surgical/scalpel/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/hemostat/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/retractor/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/circular_saw/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/FixOVein/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/bone_clamp/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/cautery/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/surgicaldrill/alien // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/belt/champion // CHOMPEdit - Removal of obj/item/weapon
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "champion"
	storage_slots = 1
	can_hold = list(
		"/obj/item/clothing/mask/luchador"
		)

/obj/item/storage/belt/security/tactical // CHOMPEdit - Removal of obj/item/weapon
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swat"
	storage_slots = 9
	max_w_class = ITEMSIZE_NORMAL
	max_storage_space = ITEMSIZE_COST_NORMAL * 7

/obj/item/storage/belt/bandolier // CHOMPEdit - Removal of obj/item/weapon
	name = "shotgun bandolier"
	desc = "Designed to hold shotgun shells. Can't really hold more than that."
	icon_state = "bandolier1"
	storage_slots = 8
	max_w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/item/ammo_casing/a12g,
		/obj/item/ammo_casing/a12g/pellet,
		/obj/item/ammo_casing/a12g/blank,
		/obj/item/ammo_casing/a12g/practice,
		/obj/item/ammo_casing/a12g/beanbag,
		/obj/item/ammo_casing/a12g/stunshell,
		/obj/item/ammo_casing/a12g/flash,
		/obj/item/ammo_casing/a12g/emp,
		/obj/item/ammo_casing/a12g/flechette
		)

/obj/item/storage/belt/security/tactical/bandolier // CHOMPEdit - Removal of obj/item/weapon
	name = "combat bandolier"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "bandolier2"

/obj/item/storage/belt/janitor // CHOMPEdit - Removal of obj/item/weapon
	name = "janitorial belt"
	desc = "A belt used to hold most janitorial supplies."
	icon_state = "janitor"
	storage_slots = 7
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(
		/obj/item/clothing/glasses,
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves,
		/obj/item/clothing/mask/surgical, //sterile mask,
		/obj/item/assembly/mousetrap, // CHOMPEdit - Removal of obj/item/device
		/obj/item/light/bulb, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/light/tube, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperoll,
		/obj/item/reagent_containers/spray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/soap, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holosign_creator, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/hud/janitor
		)

/obj/item/storage/belt/archaeology // CHOMPEdit - Removal of obj/item/weapon
	name = "excavation gear-belt"
	desc = "Can hold various excavation gear."
	icon_state = "gear"
	can_hold = list(
		/obj/item/storage/box/samplebags, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/core_sampler, // CHOMPEdit - Removal of obj/item/device
		/obj/item/beacon_locator, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/beacon, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/measuring_tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/depth_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anodevice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses,
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/excavation, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/anobattery, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ano_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pickaxe/hand, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/xenoarch_multi_tool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pickaxe/excavationdrill // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/belt/fannypack // CHOMPEdit - Removal of obj/item/weapon
	name = "leather fannypack"
	desc = "A dorky fannypack for keeping small items in."
	icon_state = "fannypack_leather"
	item_state = "fannypack_leather"
	max_w_class = ITEMSIZE_SMALL
	storage_slots = null
	max_storage_space = ITEMSIZE_COST_NORMAL * 2

/obj/item/storage/belt/fannypack/black // CHOMPEdit - Removal of obj/item/weapon
 	name = "black fannypack"
 	icon_state = "fannypack_black"
 	item_state = "fannypack_black"

/obj/item/storage/belt/fannypack/blue // CHOMPEdit - Removal of obj/item/weapon
 	name = "blue fannypack"
 	icon_state = "fannypack_blue"
 	item_state = "fannypack_blue"

/obj/item/storage/belt/fannypack/cyan // CHOMPEdit - Removal of obj/item/weapon
 	name = "cyan fannypack"
 	icon_state = "fannypack_cyan"
 	item_state = "fannypack_cyan"

/obj/item/storage/belt/fannypack/green // CHOMPEdit - Removal of obj/item/weapon
 	name = "green fannypack"
 	icon_state = "fannypack_green"
 	item_state = "fannypack_green"

/obj/item/storage/belt/fannypack/orange // CHOMPEdit - Removal of obj/item/weapon
 	name = "orange fannypack"
 	icon_state = "fannypack_orange"
 	item_state = "fannypack_orange"

/obj/item/storage/belt/fannypack/purple // CHOMPEdit - Removal of obj/item/weapon
 	name = "purple fannypack"
 	icon_state = "fannypack_purple"
 	item_state = "fannypack_purple"

/obj/item/storage/belt/fannypack/red // CHOMPEdit - Removal of obj/item/weapon
 	name = "red fannypack"
 	icon_state = "fannypack_red"
 	item_state = "fannypack_red"

/obj/item/storage/belt/fannypack/white // CHOMPEdit - Removal of obj/item/weapon
 	name = "white fannypack"
 	icon_state = "fannypack_white"
 	item_state = "fannypack_white"

/obj/item/storage/belt/fannypack/yellow // CHOMPEdit - Removal of obj/item/weapon
 	name = "yellow fannypack"
 	icon_state = "fannypack_yellow"
 	item_state = "fannypack_yellow"

/obj/item/storage/belt/ranger // CHOMPEdit - Removal of obj/item/weapon
	name = "ranger belt"
	desc = "The fancy utility-belt holding the tools, cuffs and gadgets of the Go Go ERT-Rangers. The belt buckle is not real phoron, but it is still surprisingly comfortable to wear."
	icon = 'icons/obj/clothing/ranger.dmi'
	icon_state = "ranger_belt"

/obj/item/storage/belt/dbandolier // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Donk-Soft bandolier"
	desc = "A Donk-Soft bandolier! Carry your spare darts anywhere! Ages 8 and up."
	icon_state = "dbandolier"
	storage_slots = 8
	can_hold = list(
		/obj/item/ammo_casing/afoam_dart
		)
