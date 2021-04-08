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
	chest_type = /obj/item/clothing/suit/space/rig/ch
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/pursuit

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
		
//Camera networks and light_overlay which is for your HUD icon when you turn your suit light on. This is important, ties into the helm_type var that your suit will probably need.
/obj/item/clothing/head/helmet/space/rig/ch/pursuit
	light_overlay = "hardhat_light"
	camera_networks = list(NETWORK_SECURITY)		
		
		
		
		
		
		
		
		
		
////////////////////////////////////////////////////////////////////////////////////////		
//Backend stuff to make the sprites work. Copied and pasted from rig_pieces_vr.dm, but added ch to everything. Only reason for this to be touched is to add or remove species. This might just need to go in a new file named rig_pieces_ch.dm.
/obj/item/clothing/head/helmet/space/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/head_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/species/tajaran/helmet_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/species/akula/helmet_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/species/sergal/helmet_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/mob/species/fox/helmet_ch.dmi',
		SPECIES_FENNEC 			= 'icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/head_ch.dmi'
		)



/obj/item/clothing/suit/space/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/suit_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/species/tajaran/suit_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/species/akula/suit_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/mob/species/fox/suit_ch.dmi',
		SPECIES_FENNEC			= 'icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/suit_ch.dmi'
		)

/*
/obj/item/clothing/head/helmet/space/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/gloves/gauntlets/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/shoes/magboots/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/suit/space/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit
*/
