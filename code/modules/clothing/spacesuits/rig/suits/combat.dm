/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/rig/combat // CHOMPEdit - Removal of obj/item/weapon
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor = list(melee = 80, bullet = 65, laser = 50, energy = 15, bomb = 80, bio = 100, rad = 60)
	slowdown = 0.5
	offline_slowdown = 1.5
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/combat
	allowed = list(
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage // CHOMPEdit - Removal of obj/item/weapon
		)


/obj/item/rig/combat/equipped // CHOMPEdit - Removal of obj/item/weapon

	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat
		)

/obj/item/rig/combat/empty // CHOMPEdit - Removal of obj/item/weapon
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite,
		)

/obj/item/rig/military // CHOMPEdit - Removal of obj/item/weapon
	name = "military hardsuit control module"
	desc = "An austere hardsuit used by paramilitary groups and real soldiers alike."
	icon_state = "military_rig"
	suit_type = "military hardsuit"
	armor = list(melee = 80, bullet = 70, laser = 55, energy = 15, bomb = 80, bio = 100, rad = 30)
	slowdown = 0.5
	offline_slowdown = 1.5
	offline_vision_restriction = 1
	allowed = list(
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/t_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/rcd, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/hypospray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/roller,
		/obj/item/suit_cooling_unit // CHOMPEdit - Removal of obj/item/device
		)

	chest_type = /obj/item/clothing/suit/space/rig/military
	helm_type = /obj/item/clothing/head/helmet/space/rig/military
	boot_type = /obj/item/clothing/shoes/magboots/rig/military
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/military

/obj/item/clothing/head/helmet/space/rig/military
	light_overlay = "helmet_light_dual_green"
	species_restricted = list(SPECIES_HUMAN,SPECIES_PROMETHEAN)

/obj/item/clothing/suit/space/rig/military
	species_restricted = list(SPECIES_HUMAN,SPECIES_PROMETHEAN)

/obj/item/clothing/shoes/magboots/rig/military
	species_restricted = list(SPECIES_HUMAN,SPECIES_PROMETHEAN)

/obj/item/clothing/gloves/gauntlets/rig/military
	species_restricted = list(SPECIES_HUMAN,SPECIES_PROMETHEAN)

/obj/item/rig/military/equipped // CHOMPEdit - Removal of obj/item/weapon
	initial_modules = list(
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat,
		)

/obj/item/rig/military/empty // CHOMPEdit - Removal of obj/item/weapon
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite,
		)
