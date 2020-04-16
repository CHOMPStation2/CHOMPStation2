/datum/design/item/autolathe/general						//Datum for object designs, used in construction	//IDs of that techs the object originated from and the minimum level requirements.
	category = "General"			//category item goes to

/datum/design/item/autolathe/general/bucket
	name = "bucket"
	id = "bucket"
	build_path = /obj/item/weapon/reagent_containers/glass/bucket
	materials = list(DEFAULT_WALL_MATERIAL = 250)


/datum/design/item/autolathe/general/cooler_bottle
	name = "water cooler bottle"
	id = "cooler_bottle"
	build_path = /obj/item/weapon/reagent_containers/glass/cooler_bottle
	materials = list(DEFAULT_WALL_MATERIAL = 15000)

/datum/design/item/autolathe/general/drinkingglass_square
	name = "half-pint glass"
	id = "halfpint_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/square
	materials = list("glass" = 75)

/datum/design/item/autolathe/general/drinkingglass_rocks
	name = "rocks glass"
	id = "rocks_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/rocks
	materials = list("glass" = 50)

/datum/design/item/autolathe/general/drinkingglass_shake
	name = "milkshake glass"
	id = "milkshake_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shake
	materials = list("glass" = 37)

/datum/design/item/autolathe/general/drinkingglass_cocktail
	name = "cocktail glass"
	id = "cocktail_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail
	materials = list("glass" = 37)

/datum/design/item/autolathe/general/drinkingglass_shot
	name = "shot glass"
	id = "shot_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shot
	materials = list("glass" = 75)

/datum/design/item/autolathe/general/drinkingglass_pint
	name = "pint glass"
	id = "pint_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/pint
	materials = list("glass" = 150)

/datum/design/item/autolathe/general/drinkingglass_mug
	name = "glass mug"
	id = "mug_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/mug
	materials = list("glass" = 100)

/datum/design/item/autolathe/general/drinkingglass_wine
	name = "wine glass"
	id = "wine_glass"
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/wine
	materials = list("glass" = 62)

/datum/design/item/autolathe/general/flashlight
	name = "flashlight"
	id = "flashlight"
	build_path = /obj/item/device/flashlight
	materials = list(DEFAULT_WALL_MATERIAL = 62, "glass" = 25)


/datum/design/item/autolathe/general/floor_light
	name = "floor light"
	id = "floor_light"
	build_path = /obj/machinery/floor_light
	materials = list(DEFAULT_WALL_MATERIAL = 3125, "glass" = 3437)

/datum/design/item/autolathe/general/extinguisher
	name = "fire extinguisher"
	id = "fire_extinguisher"
	build_path = /obj/item/weapon/extinguisher
	materials = list(DEFAULT_WALL_MATERIAL = 112)

/datum/design/item/autolathe/general/jar
	name = "jar"
	id = "glass_jar"
	build_path = /obj/item/glass_jar
	materials = list(DEFAULT_WALL_MATERIAL = 250)

/datum/design/item/autolathe/general/radio_headset
	name = "radio headset"
	id = "radio_headset"
	build_path = /obj/item/device/radio/headset
	materials = list(DEFAULT_WALL_MATERIAL = 93)

/datum/design/item/autolathe/general/radio_bounced
	name = "station bounced radio"
	id = "radio_bounced"
	build_path = /obj/item/device/radio/off
	materials = list(DEFAULT_WALL_MATERIAL = 93, "glass" = 31)

/datum/design/item/autolathe/general/suit_cooler
	name = "suit cooling unit"
	id = "suit_cooler"
	build_path = /obj/item/device/suit_cooling_unit
	materials = list(DEFAULT_WALL_MATERIAL = 18750, "glass" = 4375)

/datum/design/item/autolathe/general/weldermask
	name = "welding mask"
	id = "weldermask"
	build_path = /obj/item/clothing/head/welding
	materials = list(DEFAULT_WALL_MATERIAL = 3750, "glass" = 1250)

/datum/design/item/autolathe/general/metal
	name = "steel sheets"
	id = "steel_sheets"
	build_path = /obj/item/stack/material/steel
	materials = list(DEFAULT_WALL_MATERIAL = 2000)
	maxstack = 50

/datum/design/item/autolathe/general/glass
	name = "glass sheets"
	id = "glass_sheets"
	build_path = /obj/item/stack/material/glass
	materials = list("glass" = 2000)
	maxstack = 50

/datum/design/item/autolathe/general/rglass
	name = "reinforced glass sheets"
	id = "reinforcedglass_sheets"
	build_path = /obj/item/stack/material/glass/reinforced
	materials = list(DEFAULT_WALL_MATERIAL = 1000, "glass" = 2000)
	maxstack = 50

/datum/design/item/autolathe/general/rods
	name = "metal rods"
	id = "metal_rods"
	build_path = /obj/item/stack/rods
	materials = list(DEFAULT_WALL_MATERIAL = 500)
	maxstack = 60

/datum/design/item/autolathe/general/spraybottle
	name = "empty spray bottle"
	id = "spraybottle"
	build_path = /obj/item/stack/rods
	materials = list(DEFAULT_WALL_MATERIAL = 375, "glass" = 375)

/datum/design/item/autolathe/general/knife
	name = "kitchen knife"
	id = "kitchen_knife"
	build_path = /obj/item/weapon/material/knife
	materials = list(DEFAULT_WALL_MATERIAL = 375)

/datum/design/item/autolathe/general/taperecorder
	name = "tape recorder"
	id = "taperecorder"
	build_path = /obj/item/device/taperecorder
	materials = list(DEFAULT_WALL_MATERIAL = 75, "glass" = 37)

/datum/design/item/autolathe/general/light_tube
	name = "light tube"
	id = "light_tube"
	build_path = /obj/item/weapon/light/tube
	materials = list("glass" = 125)

/datum/design/item/autolathe/general/light_bulb
	name = "light bulb"
	id = "light_bulb"
	build_path = /obj/item/weapon/light/bulb
	materials = list("glass" = 125)

/datum/design/item/autolathe/general/ashtray_glass
	name = "glass ashtray"
	id = "ashtray_glass"
	build_path = /obj/item/weapon/material/ashtray/glass
	materials = list("glass" = 250)

/datum/design/item/autolathe/general/weldinggoggles
	name = "welding goggles"
	id = "weldinggoggles"
	build_path = /obj/item/clothing/glasses/welding
	materials = list(DEFAULT_WALL_MATERIAL = 1875, "glass" = 1250)

/datum/design/item/autolathe/general/maglight
	name = "maglight"
	id = "maglight"
	build_path = /obj/item/device/flashlight/maglight
	materials = list(DEFAULT_WALL_MATERIAL = 250, "glass" = 62)

/datum/design/item/autolathe/general/emergency_cell
	name = "light fixture battery"
	id = "emergency_cell"
	build_path = /obj/item/weapon/cell/emergency_light
	materials = list("glass" = 25)

/datum/design/item/autolathe/general/handcuffs
	name = "handcuffs"
	id = "handcuffs"
	build_path = /obj/item/weapon/handcuffs
	materials = list(DEFAULT_WALL_MATERIAL = 625)
	hidden = 1

/datum/design/item/autolathe/general/legcuffs
	name = "legcuffs"
	id = "legcuffs"
	build_path = /obj/item/weapon/handcuffs/legcuffs
	materials = list(DEFAULT_WALL_MATERIAL = 625)
	hidden = 1

