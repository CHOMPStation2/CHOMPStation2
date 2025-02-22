/obj/item/clothing/head/helmet/space/rig/vox/ch
	icon = 'modular_chomp/icons/inventory/head/item.dmi'
	sprite_sheets = list(
		SPECIES_VOX = 'modular_chomp/icons/inventory/head/mob_vox.dmi'
		)

/obj/item/clothing/shoes/magboots/rig/vox/ch
	icon = 'modular_chomp/icons/inventory/feet/item.dmi'
	sprite_sheets = list(
		SPECIES_VOX = 'modular_chomp/icons/inventory/feet/mob_vox.dmi'
		)

/obj/item/clothing/suit/space/rig/vox/ch
	icon = 'modular_chomp/icons/inventory/suit/item.dmi'
	sprite_sheets = list(
		SPECIES_VOX = 'modular_chomp/icons/inventory/suit/mob_vox.dmi'
		)

/obj/item/clothing/gloves/gauntlets/rig/vox/ch
	icon = 'modular_chomp/icons/inventory/hands/item.dmi'
	sprite_sheets = list(
		SPECIES_VOX = 'modular_chomp/icons/inventory/hands/mob_vox.dmi'
		)

/obj/item/rig/vox/engineering
	name = "fluid alien control module"
	suit_type = "\improper industrial alien"
	icon_state = "vox_engineer_rig"
	desc = "A lightweight, alien rig dedicated for construction and engineering tasks. Not reccomended for hostile engagement."
	armor = list(melee = 25, bullet = 5, laser = 40, energy = 45, bomb = 50, bio = 100, rad = 100) //CE suit values but shuffled to a tighter focus on the job hazards
	flags = PHORONGUARD
	item_flags = THICKMATERIAL
	siemens_coefficient = 0
	offline_slowdown = 2.5
	slowdown = 0
	emp_protection = 40 //change this to 30 if too high.
	rigsuit_max_pressure = 20 * ONE_ATMOSPHERE			  // Max pressure the rig protects against when sealed
	rigsuit_min_pressure = 0							  // Min pressure the rig protects against when sealed

	req_one_access = list()
	req_access = list(access_engine)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage)
	offline_vision_restriction = 1

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/plasmacutter,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson
	)

	air_type = /obj/item/tank/nitrogen

	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

	helm_type = /obj/item/clothing/head/helmet/space/rig/vox/ch
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox/ch
	chest_type = /obj/item/clothing/suit/space/rig/vox/ch
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/vox/ch

/obj/item/rig/vox/security
	name = "sturdy alien control module"
	suit_type = "\improper sturdy alien"
	icon_state = "vox_sec_rig"
	desc = "A medium weight, alien control module. Built sturdy for security engagements."
	armor = list (melee = 60, bullet = 50, laser = 40, energy = 10, bomb = 20, bio = 100, rad = 50) //CE suit values but shuffled to a tighter focus on the job hazards
	flags = PHORONGUARD
	item_flags = THICKMATERIAL
	siemens_coefficient = 0.5
	offline_slowdown = 5
	slowdown = 0
	emp_protection = 40 //change this to 30 if too high.

	req_one_access = list()
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage)
	offline_vision_restriction = 1

	initial_modules = list(
	)

	air_type = /obj/item/tank/vox

	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

	helm_type = /obj/item/clothing/head/helmet/space/rig/vox/ch
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox/ch
	chest_type = /obj/item/clothing/suit/space/rig/vox/ch
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/vox/ch
