/*
*	Here is where any supply packs
*	related to voidsuits live.
*/


/datum/supply_pack/voidsuits
	group = "Voidsuits"

/datum/supply_pack/voidsuits/atmos
	name = "Atmospheric voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/atmos = 2,
			/obj/item/clothing/head/helmet/space/void/atmos = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2,
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/aether
	containername = "Atmospheric voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/atmos/alt
	name = "Heavy Duty Atmospheric voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/atmos/alt = 2,
			/obj/item/clothing/head/helmet/space/void/atmos/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2,
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/aether
	containername = "Heavy Duty Atmospheric voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/engineering
	name = "Engineering voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/engineering = 2,
			/obj/item/clothing/head/helmet/space/void/engineering = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/construction
	name = "Engineering Construction voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/construction = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/construction = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering Construction voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/hazmat
	name = "Engineering Hazmat voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/hazmat = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/hazmat = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering Hazmat voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/alt
	name = "Reinforced Engineering voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/alt = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Reinforced Engineering voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/medical
	name = "Medical voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/medical = 2,
			/obj/item/clothing/head/helmet/space/void/medical = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Medical voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/emt
	name = "Medical EMT voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/medical/emt = 2,
			/obj/item/clothing/head/helmet/space/void/medical/emt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Medical EMT voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/bio
	name = "Medical Biohazard voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/medical/bio = 2,
			/obj/item/clothing/head/helmet/space/void/medical/bio = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical Biohazard voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/alt
	name = "Vey-Med Autoadaptive voidsuits (humanoid)"
	contains = list(
			/obj/item/clothing/suit/space/void/medical/alt = 2,
			/obj/item/clothing/head/helmet/space/void/medical/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Vey-Med Autoadaptive voidsuit (humanoid) crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/alt/tesh
	name = "Vey-Med Autoadaptive voidsuits (teshari)"
	contains = list(
			/obj/item/clothing/suit/space/void/medical/alt/tesh = 2,
			/obj/item/clothing/head/helmet/space/void/medical/alt/tesh = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	containername = "Vey-Med Autoadaptive voidsuit (teshari) crate"

/datum/supply_pack/voidsuits/security
	name = "Security voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/security = 2,
			/obj/item/clothing/head/helmet/space/void/security = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security voidsuit crate"

/datum/supply_pack/voidsuits/security/crowd
	name = "Security Crowd Control voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/security/riot = 2,
			/obj/item/clothing/head/helmet/space/void/security/riot = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security Crowd Control voidsuit crate"
	access = access_armory

/datum/supply_pack/voidsuits/security/alt
	name = "Security EVA voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/security/alt = 2,
			/obj/item/clothing/head/helmet/space/void/security/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security EVA voidsuit crate"
	access = access_armory

/datum/supply_pack/voidsuits/supply
	name = "Mining voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/mining = 2,
			/obj/item/clothing/head/helmet/space/void/mining = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/supply/alt
	name = "Frontier Mining voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/mining/alt = 2,
			/obj/item/clothing/head/helmet/space/void/mining/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/grayson
	containername = "Frontier Mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/zaddat
	name = "Zaddat Shroud"
	contains = list(
		/obj/item/clothing/suit/space/void/zaddat = 1,
		/obj/item/clothing/mask/gas/zaddat = 1
		)
	cost = 30
	containertype = /obj/structure/closet/crate/nanotrasen
	containername = "Zaddat Shroud crate"
	access = null

//ChompEdit Start
/datum/supply_pack/voidsuits/unathi_bs_NT
	name = "NT Unathi breacher chassis"
	contains = list(/obj/item/weapon/rig/breacher)
	cost = 200  //Crap breacher suit, shouldn't be as expensive.
	containertype = /obj/structure/closet/crate/secure
	containername = "NT Unathi breacher chassis crate"
	access = access_armory

/datum/supply_pack/voidsuits/unathi_bs_Auth
	name = "Authentic Unathi breacher chassis"
	contains = list(/obj/item/weapon/rig/breacher/fancy)
	cost = 400  //Better, costs more.
	containertype = /obj/structure/closet/crate/secure
	containername = "Authentic Unathi breacher chassis crate"
	access = access_armory

/datum/supply_pack/voidsuits/voxciv
	name = "Vox Civilian Hardsuit"
	contains = list(/obj/item/weapon/rig/vox/civilian)
	cost = 80
	containertype = /obj/structure/closet/crate/oculum
	containername = "Vox Civilian Hardsuit"

/datum/supply_pack/voidsuits/voxeng
	name = "Vox Engineering Hardsuit"
	contains = list (/obj/item/weapon/rig/vox/engineering)
	cost = 150
	containertype = /obj/structure/closet/crate/oculum
	containername = "Vox Engineering Hardsuit"

/datum/supply_pack/voidsuits/voxsec
	name = "Vox Security Hardsuit"
	contains = list (/obj/item/weapon/rig/vox/security)
	cost = 90
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Vox security Rigsuit Crate"
	access = access_security
//ChompEdit End

/datum/supply_pack/voidsuits/explorer
	name = JOB_EXPLORER + " voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_EXPLORER + "voidsuit crate"
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/voidsuits/explorer_medic
	name = JOB_FIELD_MEDIC + " voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_FIELD_MEDIC + " voidsuit crate"
	access = access_medical

/datum/supply_pack/voidsuits/pilot
	name = JOB_PILOT + " voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/pilot = 1,
			/obj/item/clothing/head/helmet/space/void/pilot = 1,
			/obj/item/clothing/mask/breath = 1,
			/obj/item/clothing/shoes/magboots = 1,
			/obj/item/weapon/tank/oxygen = 1
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_PILOT + " voidsuit crate"
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
	name = "Solgov mining voidsuit crate" //CHOMP explo keep
	access = access_mining

/datum/supply_pack/voidsuits/solgov_anomaly //CHOMP explo keep
	name = "Solgov anomaly suit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/anomaly/alt,
		/obj/item/clothing/head/helmet/space/anomaly/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov anomaly suit crate" //CHOMP explo keep
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
	name = "Solgov pilot voidsuit crate" //CHOMP explo keep
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

/datum/supply_pack/voidsuits/solgov_explore //CHOMP explo keep
	name = "Solgov exploration voidsuit" //CHOMP explo keep
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
	name = "Solgov engineering voidsuit crate" //CHOMP explo keep
	access = access_engine

/datum/supply_pack/voidsuits/solgov_atmos //CHOMP explo keep
	name = "Solgov atmos voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/atmos/alt2,
		/obj/item/clothing/head/helmet/space/void/atmos/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov atmos voidsuit crate" //CHOMP explo keep
	access = access_atmospherics

/datum/supply_pack/voidsuits/solgov_captain //CHOMP explo keep
	name = "Solgov captain voidsuit" //CHOMP explo keep
	contains = list(
		/obj/item/clothing/suit/space/void/captain/alt,
		/obj/item/clothing/head/helmet/space/void/captain/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov captain voidsuit crate" //CHOMP explo keep
	access = access_captain
// CHOMPStation EDIT End

/datum/supply_pack/voidsuits/csc_breaker
	name = "Shipbreaker's Industrial Suit (inc. jetpack)"
	contains = list(
		/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
		/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
		/obj/item/weapon/tank/jetpack/breaker
	)
	cost = 100
	containertype = /obj/structure/closet/crate/coyote_salvage
	name = "CSC voidsuit crate"
