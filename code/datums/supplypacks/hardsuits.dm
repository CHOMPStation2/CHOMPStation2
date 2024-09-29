/*
*	Here is where any supply packs
*	related to hardsuits live.
*/


/datum/supply_pack/hardsuits
	group = "Hardsuits"

/datum/supply_pack/hardsuits/eva_rig
	name = "eva hardsuit (empty)"
	contains = list(
			/obj/item/rig/eva = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "eva hardsuit crate"
	access = list(access_mining,
				  access_eva,
				  access_explorer, // CHOMP explo keep
				  access_pilot)
	one_access = TRUE

/datum/supply_pack/hardsuits/mining_rig
	name = "industrial hardsuit (empty)"
	contains = list(
			/obj/item/rig/industrial = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "industrial hardsuit crate"
	access = list(access_mining,
				  access_eva)
	one_access = TRUE

/datum/supply_pack/hardsuits/medical_rig
	name = "medical hardsuit (empty)"
	contains = list(
			/obj/item/rig/medical = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "medical hardsuit crate"
	access = access_medical

/datum/supply_pack/hardsuits/security_rig
	name = "hazard hardsuit (empty)"
	contains = list(
			/obj/item/rig/hazard = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "hazard hardsuit crate"
	access = access_armory

/datum/supply_pack/hardsuits/science_rig
	name = "ami hardsuit (empty)"
	contains = list(
			/obj/item/rig/hazmat = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "ami hardsuit crate"
	access = access_rd

/datum/supply_pack/hardsuits/ce_rig
	name = "advanced hardsuit (empty)"
	contains = list(
			/obj/item/rig/ce = 1
			)
	cost = 150
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "advanced hardsuit crate"
	access = access_ce

// CHOMPStation EDIT Start: Change Commonwealth to Solgov
/datum/supply_pack/misc/solgov_medical_rig
	name = "solgov medical hardsuit (loaded)"
	contains = list(
			/obj/item/rig/baymed = 1
			)
	cost = 250
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Solgov medical hardsuit crate"
	access = access_medical

/datum/supply_pack/misc/solgov_engineering_rig
	name = "solgov engineering hardsuit (loaded)"
	contains = list(
			/obj/item/rig/bayeng = 1
			)
	cost = 250
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Solgov engineering hardsuit crate"
	access = access_engine

// CHOMPStation EDIT End

/datum/supply_pack/hardsuits/breacher_rig
	name = "unathi breacher hardsuit (empty)"
	contains = list(
			/obj/item/rig/breacher = 1
			)
	cost = 250
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "unathi breacher hardsuit crate"
	access = access_armory

/datum/supply_pack/hardsuits/zero_rig
	name = "null hardsuit (jets)"
	contains = list(
			/obj/item/rig/zero = 1
			)
	cost = 75
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "null hardsuit crate"
