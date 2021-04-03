/*
 proteans
*/
/obj/item/weapon/rig/protean
	name = "nanosuit control cluster"
	suit_type = "nanomachine"
	icon = 'icons/obj/rig_modules_ch.dmi'
	icon_state = "nanomachine_rig"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 90)
	siemens_coefficient= 0.5
	slowdown = 0
	offline_slowdown = 0
	seal_delay = 1
	var/mob/living/carbon/human/myprotean
	initial_modules = list(/obj/item/rig_module/power_sink)

	helm_type = /obj/item/clothing/head/helmet/space/rig/protean //These are important for sprite pointers
	boot_type = /obj/item/clothing/shoes/magboots/rig/protean
	chest_type = /obj/item/clothing/suit/space/rig/protean
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/protean
	
//I doooon't think I can get rig_back.dmi as a _ch file. That is part of /obj/item/weapon/rig/update_icon(var/update_mob_icon).

/obj/item/weapon/rig/protean/relaymove(mob/user, var/direction)
	if(user.stat || user.stunned)
		return
	forced_move(direction, user, FALSE)

/obj/item/clothing/head/helmet/space/rig/protean
	name = "mass"
	desc = "A helmet-shaped clump of nanomachines."
	siemens_coefficient= 0
	light_overlay = "should not use a light overlay"
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/gloves/gauntlets/rig/protean
	name = "mass"
	desc = "Glove-shaped clusters of nanomachines."
	siemens_coefficient= 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/shoes/magboots/rig/protean
	name = "mass"
	desc = "Boot-shaped clusters of nanomachines."
	siemens_coefficient= 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/suit/space/rig/protean
	name = "mass"
	desc = "A body-hugging mass of nanomachines."
	siemens_coefficient= 0
	can_breach = 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/device/flashlight,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/storage/backpack,
		)	//Subspace radio is in for the citadel version. IDK if we have that and I don't think we need it so I removed it from this list.

	
	

//Backend stuff to make the sprites work. Copied and pasted from rig_pieces_vr.dm, but added ch to everything. Only reason for this to be touched is to add or remove species. This might just need to go in a new file named rig_pieces_ch.dm.
/obj/item/clothing/head/helmet/space/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/head_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/species/tajaran/helmet_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/species/akula/helmet_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/species/sergal/helmet_ch.dmi',
		SPECIES_NEVREAN			= 'icons/mob/species/sergal/helmet_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/mob/species/fox/helmet_ch.dmi',
		SPECIES_FENNEC 			= 'icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/head_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_VOX			= 'icons/mob/species/vox/head_ch.dmi'
		)
		
	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VOX			= 'icons/obj/clothing/hats_ch.dmi'
		)

/obj/item/clothing/suit/space/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/spacesuit_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/species/tajaran/suit_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/species/akula/suit_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_NEVREAN			= 'icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/mob/species/fox/suit_ch.dmi',
		SPECIES_FENNEC			= 'icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/species/teshari/suit_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_VOX			= 'icons/mob/species/vox/suit_ch.dmi'
		)
		
	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VOX			= 'icons/obj/clothing/spacesuits_ch.dmi'
		)
		
/obj/item/clothing/gloves/gauntlets/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/hands_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/hands_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/hands_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/hands_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/hands_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/hands_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/hands_ch.dmi',
		SPECIES_NEVREAN			= 'icons/mob/hands_ch.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/hands_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/mob/hands_ch.dmi',
		SPECIES_FENNEC			= 'icons/mob/hands_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/hands_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/hands_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/hands_ch.dmi',
		SPECIES_VOX			= 'icons/mob/species/vox/gloves_ch.dmi'
		)
		
	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VOX			= 'icons/obj/clothing/gloves_ch.dmi'
		)
		
/obj/item/clothing/shoes/magboots/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'icons/mob/feet_ch.dmi',
		SPECIES_TAJ 			= 'icons/mob/feet_ch.dmi',
		SPECIES_SKRELL 			= 'icons/mob/feet_ch.dmi',
		SPECIES_UNATHI 			= 'icons/mob/feet_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/mob/feet_ch.dmi',
		SPECIES_AKULA 			= 'icons/mob/feet_ch.dmi',
		SPECIES_SERGAL			= 'icons/mob/feet_ch.dmi',
		SPECIES_NEVREAN			= 'icons/mob/feet_ch.dmi',
		SPECIES_VULPKANIN		= 'icons/mob/feet_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/mob/feet_ch.dmi',
		SPECIES_FENNEC			= 'icons/mob/feet_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/mob/feet_ch.dmi',
		SPECIES_TESHARI 		= 'icons/mob/feet_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/mob/feet_ch.dmi',
		SPECIES_VOX			= 'icons/mob/species/vox/shoes_ch.dmi'
		)
		
	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_ZORREN_HIGH 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VOX			= 'icons/obj/clothing/shoes_ch.dmi'
		)
