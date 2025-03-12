/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit
	name = "snowsuit"
	desc = "A suit made to keep you nice and toasty on cold winter days. Or at least alive."
	icon = 'icons/obj/clothing/suits_yw.dmi'
	icon_state = "snowsuit"
	icon_override = 'icons/obj/clothing/suits_yw.dmi'
	hoodtype =	/obj/item/clothing/head/hood/winter/snowsuit
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/command
	name = "command snowsuit"
	icon_state = "snowsuit_command"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/command
	armor = list(melee = 20, bullet = 15, laser = 20, energy = 10, bomb = 15, bio = 0, rad = 0)
	allowed =  list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes,	/obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/gun/energy,	/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton, /obj/item/handcuffs,/obj/item/clothing/head/helmet)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/security
	name = "security snowsuit"
	icon_state = "snowsuit_security"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/security
	armor = list(melee = 25, bullet = 20, laser = 20, energy = 15, bomb = 20, bio = 0, rad = 0)
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/gun/energy,	/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,	/obj/item/handcuffs,/obj/item/clothing/head/helmet)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/medical
	name = "medical snowsuit"
	icon_state = "snowsuit_medical"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/medical
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes,	/obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/analyzer,/obj/item/stack/medical,	/obj/item/dnainjector,/obj/item/reagent_containers/dropper,/obj/item/reagent_containers/syringe,/obj/item/reagent_containers/hypospray,	/obj/item/healthanalyzer,/obj/item/reagent_containers/glass/bottle,/obj/item/reagent_containers/glass/beaker,	/obj/item/reagent_containers/pill,/obj/item/storage/pill_bottle)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/engineering
	name = "engineering snowsuit"
	icon_state = "snowsuit_engineering"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/engineering
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 20)
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes,	/obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/analyzer, /obj/item/flashlight,	/obj/item/multitool, /obj/item/pipe_painter, /obj/item/radio, /obj/item/t_scanner, /obj/item/tool/crowbar, /obj/item/tool/screwdriver,	/obj/item/weldingtool, /obj/item/tool/wirecutters, /obj/item/tool/wrench, /obj/item/tank/emergency/oxygen, /obj/item/clothing/mask/gas, /obj/item/taperoll/engineering)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/cargo
	name = "cargo snowsuit"
	icon_state = "snowsuit_cargo"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/cargo
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight, /obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches,	/obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/tank, /obj/item/radio, /obj/item/pickaxe, /obj/item/storage/bag/ore)

/obj/item/clothing/suit/storage/hooded/wintercoat/snowsuit/science
	name = "science snowsuit"
	icon_state = "snowsuit_science"
	hoodtype = /obj/item/clothing/head/hood/winter/snowsuit/science
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes,	/obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask, /obj/item/suit_cooling_unit, /obj/item/analyzer,/obj/item/stack/medical,	/obj/item/dnainjector,/obj/item/reagent_containers/dropper,/obj/item/reagent_containers/syringe,/obj/item/reagent_containers/hypospray,	/obj/item/healthanalyzer,/obj/item/reagent_containers/glass/bottle,/obj/item/reagent_containers/glass/beaker,	/obj/item/reagent_containers/pill,/obj/item/storage/pill_bottle)
