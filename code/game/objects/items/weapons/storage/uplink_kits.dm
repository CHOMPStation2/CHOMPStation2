/obj/item/storage/box/syndicate/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	switch (pickweight(list("bloodyspai" = 1, "stealth" = 1, "screwed" = 1, "guns" = 1, "murder" = 1, "freedom" = 1, "hacker" = 1, "lordsingulo" = 1, "smoothoperator" = 1)))
		if("bloodyspai")
			new /obj/item/clothing/under/chameleon(src)
			new /obj/item/clothing/mask/gas/voice(src)
			new /obj/item/card/id/syndicate(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/clothing/shoes/syndigaloshes(src)

		if("stealth")
			new /obj/item/gun/energy/crossbow(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/pen/reagent/paralysis(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/chameleon(src) // CHOMPEdit - Removal of obj/item/device

		if("screwed")
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/item/powersink(src) // CHOMPEdit - Removal of obj/item/device
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/syndicate(src)
			new /obj/item/tank/emergency/oxygen/double(src) // CHOMPEdit - Removal of obj/item/weapon

		if("guns")
			new /obj/item/gun/projectile/revolver(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/ammo_magazine/s357(src)
			new /obj/item/card/emag(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/plastique(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/plastique(src) // CHOMPEdit - Removal of obj/item/weapon

		if("murder")
			new /obj/item/melee/energy/sword(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/clothing/glasses/thermal/syndi(src)
			new /obj/item/card/emag(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/clothing/shoes/syndigaloshes(src)

		if("freedom")
			var/obj/item/implanter/O = new /obj/item/implanter(src) // CHOMPEdit - Removal of obj/item/weapon
			O.imp = new /obj/item/implant/freedom(O) // CHOMPEdit - Removal of obj/item/weapon
			var/obj/item/implanter/U = new /obj/item/implanter(src) // CHOMPEdit - Removal of obj/item/weapon
			U.imp = new /obj/item/implant/uplink(U) // CHOMPEdit - Removal of obj/item/weapon

		if("hacker")
			new /obj/item/encryptionkey/syndicate(src) // CHOMPEdit - Removal of obj/item/device
			new /obj/item/aiModule/syndicate(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/card/emag(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/encryptionkey/binary(src) // CHOMPEdit - Removal of obj/item/device

		if("lordsingulo")
			new /obj/item/radio/beacon/syndicate(src) // CHOMPEdit - Removal of obj/item/device
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/syndicate(src)
			new /obj/item/tank/emergency/oxygen/double(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/card/emag(src) // CHOMPEdit - Removal of obj/item/weapon

		if("smoothoperator")
			new /obj/item/storage/box/syndie_kit/g9mm(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/storage/bag/trash(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/soap/syndie(src) // CHOMPEdit - Removal of obj/item/weapon
			new /obj/item/bodybag(src)
			new /obj/item/clothing/under/suit_jacket(src)
			new /obj/item/clothing/shoes/laceup(src)
	. = ..()

/obj/item/storage/box/syndie_kit // CHOMPEdit - Removal of obj/item/weapon
	name = "box"
	desc = "A sleek, sturdy box"
	icon_state = "box_of_doom"

/obj/item/storage/box/syndie_kit/imp_freedom // CHOMPEdit - Removal of obj/item/weapon
	name = "boxed freedom implant (with injector)"

/obj/item/storage/box/syndie_kit/imp_freedom/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/implanter/O = new(src) // CHOMPEdit - Removal of obj/item/weapon
	O.imp = new /obj/item/implant/freedom(O) // CHOMPEdit - Removal of obj/item/weapon
	O.update()
	. = ..()

/obj/item/storage/box/syndie_kit/imp_compress // CHOMPEdit - Removal of obj/item/weapon
	name = "box (C)"
	starts_with = list(/obj/item/implanter/compressed) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_explosive // CHOMPEdit - Removal of obj/item/weapon
	name = "box (E)"
	starts_with = list(/obj/item/implanter/explosive) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_uplink // CHOMPEdit - Removal of obj/item/weapon
	name = "boxed uplink implant (with injector)"

/obj/item/storage/box/syndie_kit/imp_uplink/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/implanter/O = new(src) // CHOMPEdit - Removal of obj/item/weapon
	O.imp = new /obj/item/implant/uplink(O) // CHOMPEdit - Removal of obj/item/weapon
	O.update()
	. = ..()

/obj/item/storage/box/syndie_kit/imp_aug // CHOMPEdit - Removal of obj/item/weapon
	name = "boxed augment implant (with injector)"
	var/case_type = /obj/item/implantcase/shades // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/implanter(src) // CHOMPEdit - Removal of obj/item/weapon
	new case_type(src)
	. = ..()

/obj/item/storage/box/syndie_kit/imp_aug/taser // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/taser // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/laser // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/laser // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/dart // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/dart // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/toolkit // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/toolkit // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/medkit // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/medkit // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/surge // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/surge // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/analyzer // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/analyzer // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/sword // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/sword // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/sprinter // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/sprinter // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/armblade // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/armblade // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/imp_aug/handblade // CHOMPEdit - Removal of obj/item/weapon
	case_type = /obj/item/implantcase/handblade // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/space // CHOMPEdit - Removal of obj/item/weapon
	name = "boxed space suit and helmet"
	starts_with = list(
		/obj/item/clothing/suit/space/syndicate,
		/obj/item/clothing/head/helmet/space/syndicate,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/emergency/oxygen/double // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/chameleon // CHOMPEdit - Removal of obj/item/weapon
	name = "chameleon kit"
	desc = "Comes with all the clothes you need to impersonate most people.  Acting lessons sold separately."
	starts_with = list(
		/obj/item/storage/backpack/chameleon/full, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/chameleon // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/clerical // CHOMPEdit - Removal of obj/item/weapon
	name = "clerical kit"
	desc = "Comes with all you need to fake paperwork. Assumes you have passed basic writing lessons."
	starts_with = list(
		/obj/item/stamp/chameleon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen/chameleon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/destTagger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/packageWrap, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/hand_labeler // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/spy // CHOMPEdit - Removal of obj/item/weapon
	name = "spy kit"
	desc = "For when you want to conduct voyeurism from afar."
	starts_with = list(
		/obj/item/camerabug/spy = 6, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bug_monitor/spy // CHOMPEdit - Removal of obj/item/device
	)

/obj/item/storage/box/syndie_kit/g9mm // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Smooth operator"
	desc = "Compact 9mm with silencer kit."
	starts_with = list(
		/obj/item/gun/projectile/pistol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/silencer // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/toxin // CHOMPEdit - Removal of obj/item/weapon
	name = "toxin kit"
	desc = "An apple will not be enough to keep the doctor away after this."
	starts_with = list(
		/obj/item/reagent_containers/glass/beaker/vial/random/toxin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/cigarette // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Tricky smokes"
	desc = "Comes with the following brands of cigarettes, in this order: 2xFlash, 2xSmoke, 1xMindBreaker, 1xTricordrazine. Avoid mixing them up."

/obj/item/storage/box/syndie_kit/cigarette/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	var/obj/item/storage/fancy/cigarettes/pack // CHOMPEdit - Removal of obj/item/weapon

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	fill_cigarre_package(pack, list("aluminum" = 5, "potassium" = 5, "sulfur" = 5))
	pack.desc += " 'F' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	fill_cigarre_package(pack, list("aluminum" = 5, "potassium" = 5, "sulfur" = 5))
	pack.desc += " 'F' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	fill_cigarre_package(pack, list("potassium" = 5, "sugar" = 5, "phosphorus" = 5))
	pack.desc += " 'S' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	fill_cigarre_package(pack, list("potassium" = 5, "sugar" = 5, "phosphorus" = 5))
	pack.desc += " 'S' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	// Dylovene. Going with 1.5 rather than 1.6666666...
	fill_cigarre_package(pack, list("potassium" = 1.5, "nitrogen" = 1.5, "silicon" = 1.5))
	// Mindbreaker
	fill_cigarre_package(pack, list("silicon" = 4.5, "hydrogen" = 4.5))

	pack.desc += " 'MB' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src) // CHOMPEdit - Removal of obj/item/weapon
	pack.reagents.add_reagent("tricordrazine", 15 * pack.storage_slots)
	pack.desc += " 'T' has been scribbled on it."

	new /obj/item/flame/lighter/zippo(src) // CHOMPEdit - Removal of obj/item/weapon

	calibrate_size()

/proc/fill_cigarre_package(var/obj/item/storage/fancy/cigarettes/C, var/list/reagents) // CHOMPEdit - Removal of obj/item/weapon
	for(var/reagent in reagents)
		C.reagents.add_reagent(reagent, reagents[reagent] * C.storage_slots)

/obj/item/storage/box/syndie_kit/ewar_voice // CHOMPEdit - Removal of obj/item/weapon
	name = "Electrowarfare and Voice Synthesiser kit"
	desc = "Kit for confounding organic and synthetic entities alike."
	starts_with = list(
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/voice
	)

/obj/item/storage/secure/briefcase/money // CHOMPEdit - Removal of obj/item/weapon
	name = "suspicious briefcase"
	desc = "An ominous briefcase that has the unmistakeable smell of old, stale, cigarette smoke, and gives those who look at it a bad feeling."
	starts_with = list(/obj/item/spacecash/c1000 = 10) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/syndie_kit/combat_armor // CHOMPEdit - Removal of obj/item/weapon
	name = "combat armor kit"
	desc = "Contains a full set of combat armor."
	starts_with = list(
		/obj/item/clothing/head/helmet/combat,
		/obj/item/clothing/suit/armor/combat,
		/obj/item/clothing/gloves/arm_guard/combat,
		/obj/item/clothing/shoes/leg_guard/combat
	)

/obj/item/storage/box/syndie_kit/demolitions // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/syndie/c4explosive, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/demolitions_heavy // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/syndie/c4explosive/heavy, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/demolitions_super_heavy // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/syndie/c4explosive/heavy/super_heavy, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/voidsuit // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/clothing/suit/space/void/merc,
		/obj/item/clothing/head/helmet/space/void/merc,
		/obj/item/clothing/shoes/magboots,
		/obj/item/tank/jetpack/oxygen // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/voidsuit/fire // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/clothing/suit/space/void/merc/fire,
		/obj/item/clothing/head/helmet/space/void/merc/fire,
		/obj/item/clothing/shoes/magboots,
		/obj/item/tank/jetpack/oxygen // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/box/syndie_kit/concussion_grenade // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/grenade/concussion = 8 // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/box/syndie_kit/deadliest_game // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/beartrap/hunting = 4 // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/box/syndie_kit/viral // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/virusdish/random = 3 // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/secure/briefcase/rifle // CHOMPEdit - Removal of obj/item/weapon
	name = "secure briefcase"
	starts_with = list(
		/obj/item/sniper_rifle_part/barrel,
		/obj/item/sniper_rifle_part/stock,
		/obj/item/sniper_rifle_part/trigger_group,
		/obj/item/ammo_casing/a145 = 4
	)

/obj/item/storage/secure/briefcase/flamer // CHOMPEdit - Removal of obj/item/weapon
	name = "secure briefcase"
	starts_with = list(
		/obj/item/gun/magnetic/gasthrower, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/super, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/capacitor/adv, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tank/phoron/pressurized = 2 // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/secure/briefcase/fuelrod // CHOMPEdit - Removal of obj/item/weapon
	name = "heavy briefcase"
	desc = "A heavy, locked briefcase."
	description_fluff = "The container, upon opening, looks to have a few oddly shaped indentations in its packing."
	description_antag = "This case will likely contain a charged fuel rod gun, and a few fuel rods to go with it. It can only hold the fuel rod gun, fuel rods, batteries, a screwdriver, and stock machine parts."
	force = 12 //Anti-rad lined i.e. Lead, probably gonna hurt a bit if you get bashed with it.
	can_hold = list(/obj/item/gun/magnetic/fuelrod, /obj/item/fuel_assembly, /obj/item/cell, /obj/item/stock_parts, /obj/item/tool/screwdriver) // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(
		/obj/item/gun/magnetic/fuelrod, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/deuterium, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/deuterium, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/tritium, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/tritium, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/phoron, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon
	)
