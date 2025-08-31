///#define ACCESSORY_SLOT_ARMOR_G  0x8000 ///too lazy to move this upstream

/obj/item/clothing/suit/armor/pcarrier/modarm
	name = "modular plate carrier"
	desc = "A lightweight, modular plate carrier vest made from armor grade UHMWPE. It can be equipped with armor plates, but provides very little protection of its own."
	armor = list(melee = 5, bullet = 5, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	item_icons = 'modular_chomp/icons/obj/modular_armor.dmi'
	item_state = "pcarrier"
	valid_accessory_slots = (\
		ACCESSORY_SLOT_INSIGNIA\
		|ACCESSORY_SLOT_ARMOR_C\
		|ACCESSORY_SLOT_ARMOR_A\
		|ACCESSORY_SLOT_ARMOR_L\
		|ACCESSORY_SLOT_ARMOR_S\
		|ACCESSORY_SLOT_ARMOR_M\
		|ACCESSORY_SLOT_OVER\
		|ACCESSORY_SLOT_ARMBAND)
	restricted_accessory_slots = (\
		ACCESSORY_SLOT_INSIGNIA\
		|ACCESSORY_SLOT_ARMOR_C\
		|ACCESSORY_SLOT_ARMOR_A\
		|ACCESSORY_SLOT_ARMOR_L\
		|ACCESSORY_SLOT_ARMOR_S\
		|ACCESSORY_SLOT_ARMOR_M\
		|ACCESSORY_SLOT_ARMBAND)
	blood_overlay_type = "armor"

/obj/item/clothing/suit/armor/pcarrier/modarm/green
	item_state = "pcarrierG"
	icon_state = "pcarrierG"

/obj/item/clothing/suit/armor/pcarrier/modarm/blue
	item_state = "pcarrierB"
	icon_state = "pcarrierB"

/obj/item/clothing/suit/armor/pcarrier/modarm/tan
	item_state = "pcarrierT"
	icon_state = "pcarrierT"

/obj/item/clothing/suit/armor/pcarrier/modarm/lightblue
	item_state = "pcarrierU"
	icon_state = "pcarrierU"

///snowflake armor plates

/obj/item/clothing/accessory/armor/armorplate/security
	name = "security armor plate"
	desc = "A plasteel-reinforced synthetic armor plate designed for Nanotrasen security forces. Attaches to a plate carrier."
	icon_state = "armor_medium"
	slowdown = 0.1
	siemens_coefficient = 0.7
	armor = list(melee = 30, bullet = 30, laser = 45, energy = 25, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/security/heavy
	name = "heavy security armor plate"
	desc = "A plastitanium-reinforced armor plate designed for Nanotrasen security forces. Attaches to a plate carrier."
	icon_state = "armor_medium"
	slowdown = 0.5
	siemens_coefficient = 0.5
	armor = list(melee = 50, bullet = 50, laser = 55, energy = 35, bomb = 30, bio = 0, rad = 15)

///armored gloves

/obj/item/clothing/gloves/handguards_modarm
	name = "reinforced gauntlets"
	desc = "These armored gauntlets will protect your hands and forearms. Meant to be used with a plate carrier."
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_state = "handguards_item"
	item_state = "handguards"
	default_worn_icon = "handguards"
	body_parts_covered = HANDS
	heat_protection = HANDS
	cold_protection = HANDS
	overgloves = 1
	punch_force = 3
	slowdown = 0.1
	w_class = ITEMSIZE_NORMAL
	armor = list(melee = 30, bullet = 30, laser = 45, energy = 25, bomb = 10, bio = 0, rad = 0)
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

///armored boots

/obj/item/clothing/shoes/footguards_modarm
	name = "reinforced boots"
	desc = "These armored boots will protect your ankles and feet."
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_state = "footguards_item"
	item_state = "footguards"
	default_worn_icon = "footguards"
	body_parts_covered = FEET
	heat_protection = FEET
	cold_protection = FEET
	armor = list(melee = 30, bullet = 30, laser = 45, energy = 25, bomb = 10, bio = 0, rad = 0)
	w_class = ITEMSIZE_NORMAL
	slowdown = 0.1
	step_volume_mod = 1.3
	overshoes = 1
	shoes_under_pants = -1
	can_hold_knife = TRUE
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'
	update_icon_define_digi = 'modular_chomp/icons/obj/modular_armor_digi.dmi' ///this doesn't work, not sure why

///snowflake leg guards

/obj/item/clothing/accessory/armor/legguards/modarm
	name = "modular leg guards"
	desc = "A pair of armored leg pads. Attaches to a plate carrier."
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_state = "legguards"
	item_state = "legguards"
	default_worn_icon = "legguards"
	gender = PLURAL
	body_parts_covered = LEGS
	heat_protection = LEGS
	cold_protection = LEGS
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_L
	update_icon_define_digi = 'modular_chomp/icons/obj/modular_armor_digi.dmi' ///this doesn't work, not sure why

/obj/item/clothing/accessory/armor/legguards/modarm/green
	icon_state = "legguardsG"
	item_state = "legguardsG"
	default_worn_icon = "legguardsG"

/obj/item/clothing/accessory/armor/legguards/modarm/blue
	icon_state = "legguardsB"
	item_state = "legguardsB"
	default_worn_icon = "legguardsB"

/obj/item/clothing/accessory/armor/legguards/modarm/tan
	icon_state = "legguardsT"
	item_state = "legguardsT"
	default_worn_icon = "legguardsT"

/obj/item/clothing/accessory/armor/legguards/modarm/lightblue
	icon_state = "legguardsU"
	item_state = "legguardsU"
	default_worn_icon = "legguardsU"

///snowflake arm guards

/obj/item/clothing/accessory/armor/armguards/modarm
	name = "modular arm guards"
	desc = "A pair of arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_state = "armguards"
	item_state = "armguards"
	default_worn_icon = "armguards"
	gender = PLURAL
	body_parts_covered = ARMS
	heat_protection = ARMS
	cold_protection = ARMS
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_A

/obj/item/clothing/accessory/armor/armguards/modarm/green
	icon_state = "armguardsG"
	item_state = "armguardsG"
	default_worn_icon = "armguardsG"

/obj/item/clothing/accessory/armor/armguards/modarm/blue
	icon_state = "armguardsB"
	item_state = "armguardsB"
	default_worn_icon = "armguardsB"

/obj/item/clothing/accessory/armor/armguards/modarm/tan
	icon_state = "armguardsT"
	item_state = "armguardsT"
	default_worn_icon = "armguardsT"

/obj/item/clothing/accessory/armor/armguards/modarm/lightblue
	icon_state = "armguardsU"
	item_state = "armguardsU"
	default_worn_icon = "armguardsU"


///snowflake groinpad (it's actually a tag because i can't code x_x)

/obj/item/clothing/accessory/armor/groinpad
	name = "modular groin pad"
	desc = "A thick kevlar pad, that protects the groin and the buttocks."
	icon_override = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon = 'modular_chomp/icons/obj/modular_armor.dmi'
	icon_state = "groinpad"
	item_state = "groinpad"
	default_worn_icon = "groinpad"
	gender = PLURAL
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_M
	///slot = ACCESSORY_SLOT_ARMOR_G ///too lazy to move this upstream

/obj/item/clothing/accessory/armor/groinpad/green
	icon_state = "groinpadG"
	item_state = "groinpadG"
	default_worn_icon = "groinpadG"

/obj/item/clothing/accessory/armor/groinpad/blue
	icon_state = "groinpadB"
	item_state = "groinpadB"
	default_worn_icon = "groinpadB"

/obj/item/clothing/accessory/armor/groinpad/tan
	icon_state = "groinpadT"
	item_state = "groinpadT"
	default_worn_icon = "groinpadT"

/obj/item/clothing/accessory/armor/groinpad/lightblue
	icon_state = "groinpadU"
	item_state = "groinpadU"
	default_worn_icon = "groinpadU"

///helmet

/obj/item/clothing/head/helmet/riot/modarm/attack_self(mob/user)
	if(icon_state == src::icon_state)
		icon_state = "modhelmup"
		item_state = "modhelmup"
		to_chat(user, span_notice("You raise the visor on the visored helmet."))
	else
		icon_state = src::icon_state
		item_state = src::item_state
		to_chat(user, span_notice("You lower the visor on the visored helmet."))
	update_clothing_icon()

/obj/item/clothing/head/helmet/riot/modarm/killa
	name = "striped visored helmet"
	desc = "It's a heavy plasteel visored helmet designed for security work, and light combat. This one has three menacing white stripes."
	icon_state = "modhelm_killa"
	item_state = "modhelm_killa"

/obj/item/clothing/head/helmet/riot/modarm/killa/attack_self(mob/user)
	if(icon_state == src::icon_state)
		icon_state = "modhelm_killaup"
		item_state = "modhelm_killaup"
		to_chat(user, span_notice("You raise the visor on the visored helmet."))
	else
		icon_state = src::icon_state
		item_state = src::item_state
		to_chat(user, span_notice("You lower the visor on the visored helmet."))
	update_clothing_icon()


///presets

/obj/item/clothing/suit/armor/pcarrier/modarm/full
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/armor/armguards/modarm, /obj/item/clothing/accessory/armor/legguards/modarm, /obj/item/clothing/accessory/armor/groinpad, /obj/item/clothing/accessory/storage/pouches/large)

/obj/item/clothing/suit/armor/pcarrier/modarm/sec
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/security, /obj/item/clothing/accessory/storage/pouches/large)

/obj/item/clothing/suit/armor/pcarrier/modarm/full/sec
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/security, /obj/item/clothing/accessory/armor/armguards/modarm, /obj/item/clothing/accessory/armor/legguards/modarm, /obj/item/clothing/accessory/armor/groinpad, /obj/item/clothing/accessory/storage/pouches/large)
