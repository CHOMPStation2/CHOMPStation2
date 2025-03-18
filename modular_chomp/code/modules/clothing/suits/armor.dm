/obj/item/clothing/suit/storage/vest/officer
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/inventory/suit/mob_teshari.dmi',
		SPECIES_VOX = 'modular_chomp/icons/inventory/suit/mob_vox.dmi'
		)
/obj/item/clothing/suit/armor/pcarrier/primative
	name = "makeshift suit"
	desc = "A lightweight makeshift plate carrier vest"
	slowdown = 0.5
	icon_state = "explorer"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/vest/martian_miner/unarmored
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/viper_suit // Still WIP but functional.
	name = "viper combat suit"
	desc = "A suit of armor designed for naga-appearing creatures. Offers modest protection for its light weight."
	slowdown = 0.2
	icon = 'modular_chomp/icons/mob/viper_suit_ch.dmi'
	icon_override = 'modular_chomp/icons/mob/viper_suit_ch.dmi'
	icon_state = "viper_suit"
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 25, bio = 20, rad = 20)
	body_parts_covered = HEAD|UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
