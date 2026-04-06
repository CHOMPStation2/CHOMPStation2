/datum/experiment/scanning/points/tyr_precursor_study
	name = "Tyr Precursor Study"
	description = "A scientist or explorer will need to obtain data discs from Tyr!"
	required_points = 3
	required_atoms = list(
		/obj/item/prop/tyrlore/disc_one = 1,
		/obj/item/prop/tyrlore/disc_two = 1,
		/obj/item/prop/tyrlore/disc_three = 1,
		/obj/item/prop/tyrlore/disc_four = 1,
		/obj/item/prop/tyrlore/disc_five = 1,
		/obj/item/prop/tyrlore/disc_six = 1,
		/obj/item/prop/tyrlore/disc_seven = 1,
		/obj/item/prop/tyrlore/disc_eight = 1,
	)

/datum/experiment/scanning/points/giga_power_study
	name = "Extreme Power Modules Study"
	description = "Obtain a source of extremely advanced circuitry and power efficiency to unlock the ability to mimic it"
	required_points = 1
	required_atoms = list(
		/obj/item/prop/deconstructable/gigacell = 1,
	)

/datum/experiment/scanning/points/precursor_tool_study
	name = "Precursor Tool Study"
	description = "Obtain precursor tools to study them."
	required_points = 3
	required_atoms = list(
		/obj/item/tool/screwdriver/alien = 1,
		/obj/item/tool/wrench/alien = 1,
		/obj/item/weldingtool/alien = 1,
		/obj/item/tool/crowbar/alien = 1,
		/obj/item/tool/wirecutters/alien = 1,
		/obj/item/multitool/alien = 1,
	)


/datum/experiment/scanning/points/precursor_power_study
	name = "Precursor Power Study"
	description = "Obtain a self recharging weapon or cell to study it."
	required_points = 1
	required_atoms = list(
		/obj/item/cell/device/weapon/recharge/alien = 1,
		/obj/item/gun/energy/tyr_rifle = 1,
		/obj/item/gun/energy/alien = 1,
	)
