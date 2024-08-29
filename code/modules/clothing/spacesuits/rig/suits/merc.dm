/obj/item/clothing/head/helmet/space/rig/merc
	light_overlay = "helmet_light_dual_green"
	camera_networks = list(NETWORK_MERCENARY)

/obj/item/rig/merc // CHOMPEdit - Removal of obj/item/weapon
	name = "crimson hardsuit control module"
	desc = "A blood-red hardsuit featuring some fairly illegal technology."
	icon_state = "merc_rig"
	suit_type = "crimson hardsuit"
	armor = list(melee = 80, bullet = 65, laser = 50, energy = 15, bomb = 80, bio = 100, rad = 60)
	slowdown = 0.5
	offline_slowdown = 1.5
	offline_vision_restriction = 1
	siemens_coefficient = 0.3
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/eva
	helm_type = /obj/item/clothing/head/helmet/space/rig/merc
	allowed = list(
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/energy/sword, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage // CHOMPEdit - Removal of obj/item/weapon
		)

	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/fabricator/energy_net
		)

//Has most of the modules removed
/obj/item/rig/merc/empty // CHOMPEdit - Removal of obj/item/weapon
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite, //might as well
		)