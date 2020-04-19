/datum/design/item/autolathe/devices						//Datum for object designs, used in construction	//IDs of that techs the object originated from and the minimum level requirements.
	category = "Devices"			//category item goes to

/datum/design/item/autolathe/devices/consolescreen
	name = "console screen"
	id = "console_screen"
	build_path = /obj/item/weapon/stock_parts/console_screen
	materials = list("glass" = 200)

/datum/design/item/autolathe/devices/igniter
	name = "igniter"
	id = "igniter"
	build_path = /obj/item/device/assembly/igniter
	materials = list(DEFAULT_WALL_MATERIAL = 625, "glass" = 62)

/datum/design/item/autolathe/devices/signaler
	name = "signaler"
	id = "signaler"
	build_path = /obj/item/device/assembly/signaler
	materials = list(DEFAULT_WALL_MATERIAL = 1250, "glass" = 250)

/datum/design/item/autolathe/devices/sensor_infra
	name = "infrared sensor"
	id = "infrared_sensor"
	build_path = /obj/item/device/assembly/infra
	materials = list(DEFAULT_WALL_MATERIAL = 1250, "glass" = 625)

/datum/design/item/autolathe/devices/sensor_prox
	name = "proximity sensor"
	id = "proximity_sensor"
	build_path = /obj/item/device/assembly/prox_sensor
	materials = list(DEFAULT_WALL_MATERIAL = 1000, "glass" = 250)

/datum/design/item/autolathe/devices/beartrap
	name = "mechanical trap"
	id = "beartrap"
	build_path = /obj/item/weapon/beartrap
	materials = list(DEFAULT_WALL_MATERIAL = 23437)

/datum/design/item/autolathe/devices/electropack
	name = "electropack"
	id = "electropack"
	build_path = /obj/item/device/radio/electropack
	materials = list(DEFAULT_WALL_MATERIAL = 12500, "glass" = 3125)
	hidden = 1
