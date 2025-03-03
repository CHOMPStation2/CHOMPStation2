// The sprites in this file were completely missing for all the actual clothes. They are NOT in the icon file they should be.
// The only sprite is the actual rig module in rig_modules_ch.dmi. The others don't have any boots/chest/hands/helm sprites.
// If the sprites are properly found somewhere, please add them to their appropraite files and reenable this file.
/obj/item/rig/ch/crystal
	name = "crystal control module"
	desc = "An oddly lightweight rigsuit from a strange crystaline creature."
	suit_type = "crystal hardsuit"
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "crystal_rig"
	armor = list(melee = 50, bullet = 50, laser = 30, energy = 30, bomb = 0, bio = 100, rad = 100)

	emp_protection = 50
	rigsuit_max_pressure = 12 * ONE_ATMOSPHERE
	rigsuit_min_pressure = 0

	chest_type = /obj/item/clothing/suit/space/rig/ch/crystal
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/crystal
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch/crystal
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch/crystal

/obj/item/clothing/suit/space/rig/ch/crystal //to do, try and make this be able to heal you
	name = "chassis"
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'
	icon_state = "crystal_rig"
	desc = "A heft chestplate, humming with energy."

/obj/item/clothing/head/helmet/space/rig/ch/crystal
	name = "helmet"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_state = "crystal_rig"
	desc = "A protective dome for your head."

/obj/item/clothing/gloves/gauntlets/rig/ch/crystal
	name = "hardlight gloves"
	icon = 'icons/obj/clothing/gloves_ch.dmi'
	icon_state = "crystal_rig"
	desc = "Gloves created with alien tech"
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/ch/crystal
	name = "hardlight boots"
	icon = 'icons/obj/clothing/shoes_ch.dmi'
	icon_state = "crystal_rig"
	desc = "A pair of grabby boots"
	slowdown = -1
