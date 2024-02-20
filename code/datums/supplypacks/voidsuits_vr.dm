/datum/supply_pack/voidsuits/explorer
<<<<<<< HEAD
	name = "Exploration voidsuits" //CHOMP explo keep
=======
	name = "Away Team voidsuits"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	containername = "Exploration voidsuit crate" //CHOMP explo keep
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/voidsuits/explorer_medic
	name = "Expedition Medic voidsuits" //CHOMP explo keep
=======
	containername = "Away Team voidsuit crate"
	access = list(access_eva, access_explorer)

/datum/supply_pack/voidsuits/explorer_medic
	name = "Away Team Medic voidsuits"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	containername = "Expedition Medic voidsuit crate" //CHOMP explo keep
	access = access_explorer //CHOMP explo keep
=======
	containername = "Away Team Medic voidsuit crate"
	access = access_medical
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)

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
<<<<<<< HEAD
// CHOMPStation EDIT Start: Change Commonwealth to Solgov.
/datum/supply_pack/voidsuits/solgov_mining
	name = "Solgov mining voidsuit"
=======
/datum/supply_pack/voidsuits/com_mining
	name = "Commonwealth mining voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/mining/alt2,
		/obj/item/clothing/head/helmet/space/void/mining/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/solgov_anomaly //CHOMP explo keep
	name = "Solgov anomaly suit" //CHOMP explo keep
=======
	name = "Commonwealth mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/com_anomaly
	name = "Commonwealth anomaly suit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/anomaly/alt,
		/obj/item/clothing/head/helmet/space/anomaly/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov anomaly suit crate"
	access = access_xenoarch

/datum/supply_pack/voidsuits/solgov_riot //CHOMP explo keep
	name = "Solgov riot voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth anomaly suit crate"
	access = access_xenoarch

/datum/supply_pack/voidsuits/com_riot
	name = "Commonwealth riot voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/security/riot/alt,
		/obj/item/clothing/head/helmet/space/void/security/riot/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov riot voidsuit crate"
	access = access_brig

/datum/supply_pack/voidsuits/solgov_pilot //CHOMP explo keep
	name = "Solgov pilot voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth riot voidsuit crate"
	access = access_brig

/datum/supply_pack/voidsuits/com_pilot
	name = "Commonwealth pilot voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/pilot/alt2,
		/obj/item/clothing/head/helmet/space/void/pilot/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov pilot voidsuit crate"
	access = access_pilot

/datum/supply_pack/voidsuits/solgov_medical //CHOMP explo keep
	name = "Solgov medical voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth pilot voidsuit crate"
	access = access_pilot

/datum/supply_pack/voidsuits/com_medical
	name = "Commonwealth medical voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/medical/alt2,
		/obj/item/clothing/head/helmet/space/void/medical/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov medical voidsuit crate"
/datum/supply_pack/voidsuits/solgov_explore

	name = "Solgov exploration voidsuit"
=======
	name = "Commonwealth medical voidsuit crate"
/datum/supply_pack/voidsuits/com_explore

	name = "Commonwealth exploration voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/alt2,
		/obj/item/clothing/head/helmet/space/void/exploration/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov exploration voidsuit crate"  //CHOMP explo keep
	access = access_explorer //CHOMP explo keep
	
/datum/supply_pack/voidsuits/solgov_engineer //CHOMP explo keep
	name = "Solgov engineering voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth exploration voidsuit crate"
	access = list(access_eva, access_explorer)

/datum/supply_pack/voidsuits/com_engineer
	name = "Commonwealth engineering voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/engineering/alt2,
		/obj/item/clothing/head/helmet/space/void/engineering/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov engineering voidsuit crate"
	access = access_engine

/datum/supply_pack/voidsuits/solgov_atmos //CHOMP explo keep
	name = "Solgov atmos voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth engineering voidsuit crate"
	access = access_engine

/datum/supply_pack/voidsuits/com_atmos
	name = "Commonwealth atmos voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/atmos/alt2,
		/obj/item/clothing/head/helmet/space/void/atmos/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov atmos voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/solgov_captain //CHOMP explo keep
	name = "Solgov captain voidsuit" //CHOMP explo keep
=======
	name = "Commonwealth atmos voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/com_captain
	name = "Commonwealth captain voidsuit"
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	contains = list(
		/obj/item/clothing/suit/space/void/captain/alt,
		/obj/item/clothing/head/helmet/space/void/captain/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
<<<<<<< HEAD
	name = "Solgov captain voidsuit crate"
	access = access_captain	
// CHOMPStation EDIT End
=======
	name = "Commonwealth captain voidsuit crate"
	access = access_captain
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)

/datum/supply_pack/voidsuits/csc_breaker
	name = "Shipbreaker's Industrial Suit (inc. jetpack)"
	contains = list(
		/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
		/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
		/obj/item/weapon/tank/jetpack/breaker
	)
	cost = 100
	containertype = /obj/structure/closet/crate/secure
	name = "Coyote Salvage Corp industrial voidsuit crate"
