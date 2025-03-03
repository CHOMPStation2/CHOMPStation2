//Hardsuits
/obj/item/rig/ch //Some blank bs
	name = DEVELOPER_WARNING_NAME
	desc = DEVELOPER_WARNING_NAME
	default_mob_icon = 'modular_chomp/icons/mob/rig_back_ch.dmi'
	chest_type = /obj/item/clothing/suit/space/rig/ch
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch

/obj/item/clothing/suit/space/rig/ch
	icon_state = "nanomachine_rig" //The name is seen by players, but rigs do some funny things like overwriting the icon_state. The unit test will screech if a rig doesn't have an icon_state, so we set one here.
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'

/obj/item/clothing/head/helmet/space/rig/ch
	icon_state = "nanomachine_rig" //The name is seen by players, but rigs do some funny things like overwriting the icon_state. The unit test will screech if a rig doesn't have an icon_state, so we set one here.

	icon = 'icons/obj/clothing/hats_ch.dmi'

/obj/item/clothing/gloves/gauntlets/rig/ch
	icon_state = "nanomachine_rig" //The name is seen by players, but rigs do some funny things like overwriting the icon_state. The unit test will screech if a rig doesn't have an icon_state, so we set one here.

	icon = 'icons/obj/clothing/gloves_ch.dmi'

/obj/item/clothing/shoes/magboots/rig/ch
	icon_state = "nanomachine_rig" //The name is seen by players, but rigs do some funny things like overwriting the icon_state. The unit test will screech if a rig doesn't have an icon_state, so we set one here.

	icon = 'icons/obj/clothing/shoes_ch.dmi'



//A second security suit. Comes with a grenade launcher that only accepts flashbangs and adds a new sprinter and flash modules.
/obj/item/rig/ch/pursuit
	name = "pursuit hardsuit control module"
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "pursuit_rig"
	suit_type = "pursuit hardsuit"
	desc = "A Security hardsuit designed for chasing down the grey tide."
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 25, bomb = 50, bio = 100, rad = 30)
	slowdown = 1
	offline_slowdown = 3
	offline_vision_restriction = 1
	siemens_coefficient= 0.7
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/pursuit

	allowed = list(
		/obj/item/gun,
		/obj/item/flashlight,
		/obj/item/tank,
		/obj/item/suit_cooling_unit,
		/obj/item/melee/baton,
		/obj/item/storage/backpack,
		)

	req_access = list(access_hos)
	req_one_access = list()

/obj/item/rig/ch/pursuit/equipped

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
//Backend stuff to make the sprites work. Copied and pasted from rig_pieces_vr.dm, but added ch to everything. Only reason for this to be touched is to add or remove species. This might just need to go in a new file named rig_pieces_ch.dm, but whatever, it's fine here. This is for our rigs, I'll just leave it here..

/obj/item/clothing/head/helmet/space/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/head.dmi',
		SPECIES_TAJARAN 		= 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_SKRELL 			= 'icons/mob/species/skrell/helmet.dmi',
		SPECIES_UNATHI 			= 'icons/mob/species/unathi/helmet.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/species/unathi/helmet.dmi',
		SPECIES_AKULA 			= 'icons/mob/species/akula/helmet.dmi',
		SPECIES_SERGAL			= 'icons/mob/species/sergal/helmet.dmi',
		SPECIES_NEVREAN			= 'icons/mob/species/sergal/helmet.dmi',
		SPECIES_VULPKANIN 		= 'icons/mob/species/vulpkanin/helmet.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/mob/species/fox/helmet.dmi',
		SPECIES_FENNEC 			= 'icons/mob/species/vulpkanin/helmet.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/species/skrell/helmet.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/helmet.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/species/skrell/helmet.dmi',
		SPECIES_VOX				= 'icons/mob/species/vox/head.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TAJARAN 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/hats_ch.dmi'
		)

/obj/item/clothing/suit/space/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/spacesuit.dmi',
		SPECIES_TAJARAN 			= 'modular_chomp/icons/mob/species/tajaran/suit_ch.dmi',
		SPECIES_SKRELL 			= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_UNATHI 			= 'modular_chomp/icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_XENOHYBRID		= 'modular_chomp/icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_AKULA 			= 'modular_chomp/icons/mob/species/akula/suit_ch.dmi',
		SPECIES_SERGAL			= 'modular_chomp/icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_NEVREAN			= 'modular_chomp/icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_VULPKANIN		= 'modular_chomp/icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'modular_chomp/icons/mob/species/fox/suit_ch.dmi',
		SPECIES_FENNEC			= 'modular_chomp/icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_PROMETHEAN		= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/suit.dmi',
		SPECIES_VASILISSAN		= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_VOX				= 'icons/mob/species/vox/suit.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TAJARAN 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/spacesuits_ch.dmi'
		)

/obj/item/clothing/gloves/gauntlets/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/hands.dmi',
		SPECIES_TAJARAN 			= 'icons/mob/hands.dmi',
		SPECIES_SKRELL 			= 'icons/mob/hands.dmi',
		SPECIES_UNATHI 			= 'icons/mob/hands.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/hands.dmi',
		SPECIES_AKULA 			= 'icons/mob/hands.dmi',
		SPECIES_SERGAL			= 'icons/mob/hands.dmi',
		SPECIES_NEVREAN			= 'icons/mob/hands.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/hands.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/mob/hands.dmi',
		SPECIES_FENNEC			= 'icons/mob/hands.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/hands.dmi',
		SPECIES_TESHARI 		= 'icons/mob/hands.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/hands.dmi',
		SPECIES_VOX				= 'icons/mob/species/vox/gloves.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TAJARAN 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_ZORREN_HIGH		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/gloves_ch.dmi'
		)

/obj/item/clothing/shoes/magboots/rig/ch
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/feet.dmi',
		SPECIES_TAJARAN 			= 'icons/mob/feet.dmi',
		SPECIES_SKRELL 			= 'icons/mob/feet.dmi',
		SPECIES_UNATHI 			= 'icons/mob/feet.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/feet.dmi',
		SPECIES_AKULA 			= 'icons/mob/feet.dmi',
		SPECIES_SERGAL			= 'icons/mob/feet.dmi',
		SPECIES_NEVREAN			= 'icons/mob/feet.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/feet.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/mob/feet.dmi',
		SPECIES_FENNEC			= 'icons/mob/feet.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/feet.dmi',
		SPECIES_TESHARI 		= 'icons/mob/feet.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/feet.dmi',
		SPECIES_VOX				= 'icons/mob/species/vox/shoes.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TAJARAN 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/shoes_ch.dmi'
		)



/*
/obj/item/clothing/head/helmet/space/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJARAN, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/gloves/gauntlets/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJARAN, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/shoes/magboots/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJARAN, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit

/obj/item/clothing/suit/space/rig/ch
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJARAN, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE, SPECIES_GREY_YW/*ywedit*/)
	flags = PHORONGUARD //YAWN Edit
*/
