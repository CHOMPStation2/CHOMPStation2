/datum/supply_pack/voidsuits/explorer
	name = "Away Team voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "Away Team voidsuit crate"
	access = list(access_eva, access_awayteam)

/datum/supply_pack/voidsuits/explorer_medic
	name = "Away Team Medic voidsuits"
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/weapon/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "Away Team Medic voidsuit crate"
	access = access_medical

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
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_anomaly
	name = "Solgov anomaly suit"
=======

/datum/supply_pack/voidsuits/com_anomaly
	name = "Commonwealth anomaly suit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/anomaly/alt,
		/obj/item/clothing/head/helmet/space/anomaly/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov anomaly suit crate"
	access = access_xenoarch
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_riot
	name = "Solgov riot voidsuit"
=======

/datum/supply_pack/voidsuits/com_riot
	name = "Commonwealth riot voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/void/security/riot/alt,
		/obj/item/clothing/head/helmet/space/void/security/riot/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov riot voidsuit crate"
	access = access_brig
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_pilot
	name = "Solgov pilot voidsuit"
=======

/datum/supply_pack/voidsuits/com_pilot
	name = "Commonwealth pilot voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/void/pilot/alt2,
		/obj/item/clothing/head/helmet/space/void/pilot/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov pilot voidsuit crate"
	access = access_pilot
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_medical
	name = "Solgov medical voidsuit"
=======

/datum/supply_pack/voidsuits/com_medical
	name = "Commonwealth medical voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
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
<<<<<<< HEAD
	name = "Solgov exploration voidsuit crate"
	access = access_explorer
	
/datum/supply_pack/voidsuits/solgov_engineer
	name = "Solgov engineering voidsuit"
=======
	name = "Commonwealth exploration voidsuit crate"
	access = list(access_eva, access_awayteam)

/datum/supply_pack/voidsuits/com_engineer
	name = "Commonwealth engineering voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/void/engineering/alt2,
		/obj/item/clothing/head/helmet/space/void/engineering/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov engineering voidsuit crate"
	access = access_engine
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_atmos
	name = "Solgov atmos voidsuit"
=======

/datum/supply_pack/voidsuits/com_atmos
	name = "Commonwealth atmos voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/void/atmos/alt2,
		/obj/item/clothing/head/helmet/space/void/atmos/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov atmos voidsuit crate"
	access = access_atmospherics
<<<<<<< HEAD
	
/datum/supply_pack/voidsuits/solgov_captain
	name = "Solgov captain voidsuit"
=======

/datum/supply_pack/voidsuits/com_captain
	name = "Commonwealth captain voidsuit"
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
	contains = list(
		/obj/item/clothing/suit/space/void/captain/alt,
		/obj/item/clothing/head/helmet/space/void/captain/alt
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov captain voidsuit crate"
	access = access_captain
<<<<<<< HEAD
	
// CHOMPStation EDIT End
=======
>>>>>>> 244095be9e... Merge pull request #14220 from Very-Soft/removeexplo
