/datum/supply_pack/voidsuits/explorer
	name = "Exploration voidsuits" //CHOMP explo keep
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "Exploration voidsuit crate" //CHOMP explo keep
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/voidsuits/explorer_medic
	name = "Expedition Medic voidsuits" //CHOMP explo keep
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "Expedition Medic voidsuit crate" //CHOMP explo keep
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/voidsuits/pilot
	name = "Pilot voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/pilot = 1,
			/obj/item/clothing/head/helmet/space/void/pilot = 1,
			/obj/item/clothing/mask/breath = 1,
			/obj/item/clothing/shoes/magboots = 1,
			/obj/item/weapon/tank/oxygen = 1
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "Pilot voidsuit crate"
	access = access_pilot


// Surplus!
// CHOMPStation EDIT Start: Change Commonwealth to Solgov.
/datum/supply_pack/voidsuits/solgov_mining
	name = "Solgov mining voidsuit"
	contains = list(
		/obj/item/clothing/suit/space/void/mining/alt2,
		/obj/item/clothing/head/helmet/space/void/mining/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/solgov_anomaly //CHOMP explo keep
	name = "Solgov anomaly suit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/anomaly/alt,
		/obj/item/clothing/head/helmet/space/anomaly/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov anomaly suit crate"
	access = access_xenoarch

/datum/supply_pack/voidsuits/solgov_riot //CHOMP explo keep
	name = "Solgov riot voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/security/riot/alt,
		/obj/item/clothing/head/helmet/space/void/security/riot/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov riot voidsuit crate"
	access = access_brig

/datum/supply_pack/voidsuits/solgov_pilot //CHOMP explo keep
	name = "Solgov pilot voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/pilot/alt2,
		/obj/item/clothing/head/helmet/space/void/pilot/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov pilot voidsuit crate"
	access = access_pilot

/datum/supply_pack/voidsuits/solgov_medical //CHOMP explo keep
	name = "Solgov medical voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/medical/alt2,
		/obj/item/clothing/head/helmet/space/void/medical/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov medical voidsuit crate"
/datum/supply_pack/voidsuits/solgov_explore

	name = "Solgov exploration voidsuit"
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/alt2,
		/obj/item/clothing/head/helmet/space/void/exploration/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov exploration voidsuit crate"  //CHOMP explo keep
	access = access_explorer //CHOMP explo keep
	
/datum/supply_pack/voidsuits/solgov_engineer //CHOMP explo keep
	name = "Solgov engineering voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/engineering/alt2,
		/obj/item/clothing/head/helmet/space/void/engineering/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov engineering voidsuit crate"
	access = access_engine

/datum/supply_pack/voidsuits/solgov_atmos //CHOMP explo keep
	name = "Solgov atmos voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/atmos/alt2,
		/obj/item/clothing/head/helmet/space/void/atmos/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov atmos voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/solgov_captain //CHOMP explo keep
	name = "Solgov captain voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/captain/alt,
		/obj/item/clothing/head/helmet/space/void/captain/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov captain voidsuit crate"
	access = access_captain
	
// CHOMPStation EDIT End
