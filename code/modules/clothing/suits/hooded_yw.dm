/obj/item/clothing/suit/storage/hooded/snowsuit
	name = "snowsuit"
	desc = "A suit made to keep you nice and toasty on cold winter days. Or at least alive."
	icon = 'icons/obj/clothing/suits_yw.dmi'
	icon_state = "snowsuit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER
	item_state_slots = list(slot_r_hand_str = "coatwinter", slot_l_hand_str = "coatwinter")
	hoodtype =	/obj/item/clothing/head/hood/snowsuit
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask)

/obj/item/clothing/suit/storage/hooded/snowsuit/command
	name = "command snowsuit"
	icon_state = "snowsuit_command"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/command
	armor = list(melee = 20, bullet = 15, laser = 20, energy = 10, bomb = 15, bio = 0, rad = 0)
	allowed =  list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes,	/obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/weapon/gun/energy,	/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton, /obj/item/weapon/handcuffs,/obj/item/clothing/head/helmet)

/obj/item/clothing/suit/storage/hooded/snowsuit/security
	name = "security snowsuit"
	icon_state = "snowsuit_security"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/security
	armor = list(melee = 25, bullet = 20, laser = 20, energy = 15, bomb = 20, bio = 0, rad = 0)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/weapon/gun/energy,	/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,	/obj/item/weapon/handcuffs,/obj/item/clothing/head/helmet)

/obj/item/clothing/suit/storage/hooded/snowsuit/medical
	name = "medical snowsuit"
	icon_state = "snowsuit_medical"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/medical
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes,	/obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/device/analyzer,/obj/item/stack/medical,	/obj/item/weapon/dnainjector,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,	/obj/item/device/healthanalyzer,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,	/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle)

/obj/item/clothing/suit/storage/hooded/snowsuit/engineering
	name = "engineering snowsuit"
	icon_state = "snowsuit_engineering"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/engineering
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 20)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes,	/obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/device/analyzer, /obj/item/device/flashlight,	/obj/item/device/multitool, /obj/item/device/pipe_painter, /obj/item/device/radio, /obj/item/device/t_scanner, /obj/item/weapon/tool/crowbar, /obj/item/weapon/tool/screwdriver,	/obj/item/weapon/weldingtool, /obj/item/weapon/tool/wirecutters, /obj/item/weapon/tool/wrench, /obj/item/weapon/tank/emergency/oxygen, /obj/item/clothing/mask/gas, /obj/item/taperoll/engineering)

/obj/item/clothing/suit/storage/hooded/snowsuit/cargo
	name = "cargo snowsuit"
	icon_state = "snowsuit_cargo"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/cargo
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches,	/obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/weapon/tank, /obj/item/device/radio, /obj/item/weapon/pickaxe, /obj/item/weapon/storage/bag/ore)

/obj/item/clothing/suit/storage/hooded/snowsuit/science
	name = "science snowsuit"
	icon_state = "snowsuit_science"
	hoodtype = /obj/item/clothing/head/hood/snowsuit/science
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes,	/obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/suit_cooling_unit, /obj/item/device/analyzer,/obj/item/stack/medical,	/obj/item/weapon/dnainjector,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,	/obj/item/device/healthanalyzer,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,	/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle)