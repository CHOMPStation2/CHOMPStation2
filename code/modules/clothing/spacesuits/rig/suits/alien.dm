/*
 *	UNATHI
 */

//ChompEdit begins

/obj/item/rig/breacher // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper NT breacher chassis control module"
	desc = "A cheap NT knock-off of an Unathi battle-rig. Uses softer, but lighter, armour plating, producing a still-useful suit"
	suit_type = "\improper NT breacher"
	icon_state = "breacher_rig_cheap"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 70, bio = 100, rad = 50)
	emp_protection = -20
	slowdown = 3  //This is too much, reducing from 6 to 3.  May edit again in the future.
	offline_slowdown = 5
	vision_restriction = 0  //This is dumb as hell and should be 0 if we want the suit to be even vaguely useful.
	offline_vision_restriction = 2 //This actually serves as a good weakness for them, making them vulnerable to Ion weapons.
	siemens_coefficient = 0.75
	allowed = list(
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage // CHOMPEdit - Removal of obj/item/weapon
		)
	chest_type = /obj/item/clothing/suit/space/rig/breacher
	helm_type = /obj/item/clothing/head/helmet/space/rig/breacher
	boot_type = /obj/item/clothing/shoes/magboots/rig/breacher

/obj/item/rig/breacher/fancy // CHOMPEdit - Removal of obj/item/weapon
	name = "breacher chassis control module"
	desc = "An authentic Unathi breacher chassis. Huge, bulky and absurdly heavy. It must be like wearing a tank."
	suit_type = "breacher chassis"
	icon_state = "breacher_rig"
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 80) //Takes TEN TIMES as much damage to stop someone in a breacher. In exchange, it's slow.
	vision_restriction = 0
	siemens_coefficient = 0.2
	slowdown = 6
	offline_slowdown = 10

/obj/item/clothing/head/helmet/space/rig/breacher
	species_restricted = list(SPECIES_UNATHI)
	force = 5

/obj/item/clothing/suit/space/rig/breacher
	species_restricted = list(SPECIES_UNATHI)

/obj/item/clothing/shoes/magboots/rig/breacher
	species_restricted = list(SPECIES_UNATHI)

//ChompEdit Ends

/*
 *	VOX
 */

/obj/item/rig/vox	//Just to get the flags set up // CHOMPEdit - Removal of obj/item/weapon
	name = "alien control module"
	desc = "This metal box writhes and squirms as if it were alive..."
	suit_type = "alien"
	icon_state = "vox_rig"
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 15, bomb = 30, bio = 100, rad = 50)
	flags = PHORONGUARD
	item_flags = THICKMATERIAL
	siemens_coefficient = 0.2
	offline_slowdown = 2.5
	allowed = list(
		/obj/item/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage // CHOMPEdit - Removal of obj/item/weapon
		)

	air_type = /obj/item/tank/vox // CHOMPEdit - Removal of obj/item/weapon

	helm_type = /obj/item/clothing/head/helmet/space/rig/vox
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox
	chest_type = /obj/item/clothing/suit/space/rig/vox
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/vox

/obj/item/clothing/head/helmet/space/rig/vox
	species_restricted = list(SPECIES_VOX)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/shoes/magboots/rig/vox
	name = "talons"
	species_restricted = list(SPECIES_VOX)
	sprite_sheets = list(
		SPECIES_VOX = 'icons/inventory/feet/mob_vox.dmi'
		)

/obj/item/clothing/suit/space/rig/vox
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/gloves/gauntlets/rig/vox
	siemens_coefficient = 0
	species_restricted = list(SPECIES_VOX)
	sprite_sheets = list(
		SPECIES_VOX = 'icons/inventory/hands/mob_vox.dmi'
		)

/obj/item/rig/vox/carapace // CHOMPEdit - Removal of obj/item/weapon
	name = "dense alien control module"
	suit_type = "dense alien"
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 15, bomb = 30, bio = 100, rad = 50)
	emp_protection = 40 //change this to 30 if too high.

	req_access = list(access_syndicate)

	cell_type =  /obj/item/cell/hyper // CHOMPEdit - Removal of obj/item/weapon

	initial_modules = list(
		/obj/item/rig_module/mounted/energy_blade,
		/obj/item/rig_module/sprinter,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/vision,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/self_destruct
		)

/obj/item/rig/vox/stealth // CHOMPEdit - Removal of obj/item/weapon
	name = "sinister alien control module"
	suit_type = "sinister alien"
	icon_state = "voxstealth_rig"
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 15, bomb = 30, bio = 100, rad = 50)
	emp_protection = 40 //change this to 30 if too high.

	req_access = list(access_syndicate)

	cell_type =  /obj/item/cell/hyper // CHOMPEdit - Removal of obj/item/weapon

	initial_modules = list(
		/obj/item/rig_module/stealth_field,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/vision,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/self_destruct
		)

/obj/item/rig/vox/civilian // CHOMPEdit - Removal of obj/item/weapon
	name = "matte alien control module"
	suit_type = "sinister alien"
	icon_state = "voxstealth_rig"
	desc = "A light alien rig for repairs and maintenance to the outside of habitats and vessels."
	armor = list(melee = 30, bullet = 10, laser = 20, energy = 25, bomb = 20, bio = 100, rad = 100) //Standard Engineering Suit Values

	req_access = list()
	req_one_access = list()
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage) //CHOMP Edit // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	offline_vision_restriction = 1

	initial_modules = list(
		)
