//Camera networks and light_overlay which is for your HUD icon when you turn your suit light on. This is important, ties into the helm_type var that your suit will probably need.
/obj/item/clothing/head/helmet/space/rig/pursuit
	light_overlay = "hardhat_light"
	camera_networks = list(NETWORK_SECURITY)




//Hardsuits
//A second security suit. Comes with a grenade launcher that only accepts flashbangs and adds a new sprinter and flash modules.
/obj/item/weapon/rig/pursuit
	name = "pursuit hardsuit control module"
	suit_type = "pursuit hardsuit"
	desc = "A Security hardsuit designed for chasing down the grey tide."
	icon_state = "pursuit_rig"
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 25, bomb = 50, bio = 100, rad = 30)
	slowdown = 1
	offline_slowdown = 3
	offline_vision_restriction = 1
	siemens_coefficient= 0.7

	helm_type = /obj/item/clothing/head/helmet/space/rig/pursuit

	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/device/flashlight,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/storage/backpack,
		)

	req_access = list(access_hos)
	req_one_access = list()


/obj/item/weapon/rig/pursuit/equipped

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/sprinter/pursuit,
		/obj/item/rig_module/grenade_launcher/nerfed,
		/obj/item/rig_module/mounted/taser
		)