/datum/supply_pack/security/secpsg
	name = "Security Belt PSGs"
	contains = list(
			/obj/item/personal_shield_generator/belt/security/loaded,
			/obj/item/personal_shield_generator/belt/security/loaded
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Personal Shield Generators crate"

/datum/supply_pack/security/secstrongpsg
	name = "Security Reinforced Backpack PSG"
	contains = list(
			/obj/item/personal_shield_generator/security/strong/loaded
			)
	cost = 200
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Reinforced PSG crate"

/datum/supply_pack/security/secstrongpsg
	name = "Security PSG-P"
	contains = list(
			/obj/item/personal_shield_generator/belt/parry
			)
	cost = 250
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "PSG-P crate"

/datum/supply_pack/security/rednetgun
	name = "Experimental Capture Gun"
	num_contained = 4
	contains = list(
			/obj/item/gun/energy/rednetgun
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Expirmental Capture crate"