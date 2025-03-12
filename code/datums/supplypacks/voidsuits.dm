/*
*	Here is where any supply packs
*	related to voidsuits live.
*/


/datum/supply_pack/voidsuits
	group = "Voidsuits"

/datum/supply_pack/voidsuits/atmos
	name = "Atmospheric voidsuits"
	desc = "A pair of standard Atmospherics voidsuits. Requires Atmospherics access."
	contains = list(
			/obj/item/clothing/suit/space/void/atmos = 2,
			/obj/item/clothing/head/helmet/space/void/atmos = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2,
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/aether
	containername = "Atmospheric voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/atmos/alt
	name = "Heavy Duty Atmospheric voidsuits"
	desc = "A pair of heavy duty Atmospherics voidsuits. Requires Atmospherics access."
	contains = list(
			/obj/item/clothing/suit/space/void/atmos/alt = 2,
			/obj/item/clothing/head/helmet/space/void/atmos/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2,
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/aether
	containername = "Heavy Duty Atmospheric voidsuit crate"
	access = access_atmospherics

/datum/supply_pack/voidsuits/engineering
	name = "Engineering voidsuits"
	desc = "A pair of standard Engineering voidsuits. Requires Engineering access."
	contains = list(
			/obj/item/clothing/suit/space/void/engineering = 2,
			/obj/item/clothing/head/helmet/space/void/engineering = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/construction
	name = "Engineering Construction voidsuits"
	desc = "A pair of Engineering construction voidsuits. Requires Engineering access."
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/construction = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/construction = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering Construction voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/hazmat
	name = "Engineering Hazmat voidsuits"
	desc = "A pair of Engineering hazmat voidsuits. Requires Engineering access."
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/hazmat = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/hazmat = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Engineering Hazmat voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/engineering/alt
	name = "Reinforced Engineering voidsuits"
	desc = "A pair of reinforced Engineering voidsuits. Requires Engineering access."
	contains = list(
			/obj/item/clothing/suit/space/void/engineering/alt = 2,
			/obj/item/clothing/head/helmet/space/void/engineering/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Reinforced Engineering voidsuit crate"
	access = access_engine_equip

/datum/supply_pack/voidsuits/medical
	name = "Medical voidsuits"
	desc = "A pair of standard Medical voidsuits. Requires Medical access."
	contains = list(
			/obj/item/clothing/suit/space/void/medical = 2,
			/obj/item/clothing/head/helmet/space/void/medical = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Medical voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/emt
	name = "Medical EMT voidsuits"
	desc = "A pair of Medical Emergency Response voidsuits. Requires Medical access."
	contains = list(
			/obj/item/clothing/suit/space/void/medical/emt = 2,
			/obj/item/clothing/head/helmet/space/void/medical/emt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Medical EMT voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/bio
	name = "Medical Biohazard voidsuits"
	desc = "A pair of Medical Biohazard Response voidsuits. Requires Medical access."
	contains = list(
			/obj/item/clothing/suit/space/void/medical/bio = 2,
			/obj/item/clothing/head/helmet/space/void/medical/bio = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical Biohazard voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/alt
	name = "Vey-Med Autoadaptive Lightweight voidsuits"
	desc = "A pair of advanced Vey-Med Auto-adaptive Medical voidsuits. Autofits most humanoids without need for cycling. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/suit/space/void/medical/veymed = 2,
			/obj/item/clothing/head/helmet/space/void/medical/veymed = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Vey-Med Autoadaptive Lightweight voidsuit crate"
	access = access_medical_equip

/datum/supply_pack/voidsuits/medical/alt/static
	name = "Vey-Med Nonadaptive Lightweight voidsuits"
	desc = "A pair of advanced Vey-Med Adaptive Medical voidsuits. The autoadaptive feature has been removed to reduce costs. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/suit/space/void/medical/veymed_static = 2,
			/obj/item/clothing/head/helmet/space/void/medical/veymed_static = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 50
	containername = "Vey-Med Nonadaptive Lightweight voidsuit crate"

/datum/supply_pack/voidsuits/security
	name = "Security voidsuits"
	desc = "A pair of standard Security voidsuits."
	contains = list(
			/obj/item/clothing/suit/space/void/security = 2,
			/obj/item/clothing/head/helmet/space/void/security = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security voidsuit crate"
	access = access_armory

/datum/supply_pack/voidsuits/security/crowd
	name = "Security Crowd Control voidsuits"
	desc = "A pair of Security Crowd Control voidsuits. Requires Armory access."
	contains = list(
			/obj/item/clothing/suit/space/void/security/riot = 2,
			/obj/item/clothing/head/helmet/space/void/security/riot = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security Crowd Control voidsuit crate"
	access = access_armory

/datum/supply_pack/voidsuits/security/alt
	name = "Security EVA voidsuits"
	desc = "A pair of Security EVA voidsuits. Requires Armory access."
	contains = list(
			/obj/item/clothing/suit/space/void/security/alt = 2,
			/obj/item/clothing/head/helmet/space/void/security/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Security EVA voidsuit crate"
	access = access_armory

/datum/supply_pack/voidsuits/supply
	name = "Mining voidsuits"
	desc = "A pair of standard Mining voidsuits. Requires Mining access."
	contains = list(
			/obj/item/clothing/suit/space/void/mining = 2,
			/obj/item/clothing/head/helmet/space/void/mining = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/supply/alt
	name = "Frontier Mining voidsuits"
	desc = "A pair of Frontier Mining voidsuits. Requires Mining access."
	contains = list(
			/obj/item/clothing/suit/space/void/mining/alt = 2,
			/obj/item/clothing/head/helmet/space/void/mining/alt = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/grayson
	containername = "Frontier Mining voidsuit crate"
	access = access_mining

/datum/supply_pack/voidsuits/zaddat
	name = "Zaddat Shroud"
	desc = "A standard zaddat shroud - a special kind of hazardous encounter suit, used by the zaddat species."
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
	contains = list(/obj/item/rig/breacher)
	cost = 200  //Crap breacher suit, shouldn't be as expensive.
	containertype = /obj/structure/closet/crate/secure
	containername = "NT Unathi breacher chassis crate"
	access = access_armory

/datum/supply_pack/voidsuits/unathi_bs_Auth
	name = "Authentic Unathi breacher chassis"
	contains = list(/obj/item/rig/breacher/fancy)
	cost = 400  //Better, costs more.
	containertype = /obj/structure/closet/crate/secure
	containername = "Authentic Unathi breacher chassis crate"
	access = access_armory

/datum/supply_pack/voidsuits/voxeng
	name = "Vox Engineering Hardsuit"
	contains = list (/obj/item/rig/vox/engineering)
	cost = 150
	containertype = /obj/structure/closet/crate/oculum
	containername = "Vox Engineering Hardsuit"

/datum/supply_pack/voidsuits/voxsec
	name = "Vox Security Hardsuit"
	contains = list (/obj/item/rig/vox/security)
	cost = 90
	containertype = /obj/structure/closet/crate/secure/heph
	containername = "Vox security Rigsuit Crate"
	access = access_security
//ChompEdit End

/datum/supply_pack/voidsuits/explorer
	name = JOB_EXPLORER + " voidsuits"
	desc = "A pair of standard Exploration voidsuits. Requires EVA and Exploration access."
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_EXPLORER + "voidsuit crate"
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/voidsuits/explorer_medic
	name = JOB_FIELD_MEDIC + " voidsuits"
	desc = "A pair of standard Field Medic voidsuits. Requires Medical access."
	contains = list(
			/obj/item/clothing/suit/space/void/exploration = 2,
			/obj/item/clothing/head/helmet/space/void/exploration = 2,
			/obj/item/clothing/mask/breath = 2,
			/obj/item/clothing/shoes/magboots = 2,
			/obj/item/tank/oxygen = 2
			)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_FIELD_MEDIC + " voidsuit crate"
	access = access_medical

/datum/supply_pack/voidsuits/pilot
	name = JOB_PILOT + " voidsuits"
	desc = "A pair of standard Pilot's voidsuits. Requires Pilot's access."
	contains = list(
			/obj/item/clothing/suit/space/void/pilot = 1,
			/obj/item/clothing/head/helmet/space/void/pilot = 1,
			/obj/item/clothing/mask/breath = 1,
			/obj/item/clothing/shoes/magboots = 1,
			/obj/item/tank/oxygen = 1
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = JOB_PILOT + " voidsuit crate"
	access = access_pilot

// Surplus!
// CHOMPStation EDIT Start: Change Commonwealth to Solgov.
/datum/supply_pack/voidsuits/solgov_mining
	name = "Solgov mining voidsuit"
	desc = "A standard Solgov of Sol-Procyon Mining voidsuit. Requires Mining access."
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
	desc = "A standard Solgov of Sol-Procyon Anomalous Materials Handling voidsuit. Requires Xenoarchaeology access."
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
	desc = "A standard Solgov of Sol-Procyon Riot Control voidsuit. Requires Armory access."
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
	desc = "A standard Solgov of Sol-Procyon Pilot's voidsuit. Requires Pilot's access."
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
	desc = "A standard Solgov of Sol-Procyon Medical voidsuit. Requires Medical access."
	contains = list(
		/obj/item/clothing/suit/space/void/medical/alt2,
		/obj/item/clothing/head/helmet/space/void/medical/alt2
	)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	name = "Solgov medical voidsuit crate"

/datum/supply_pack/voidsuits/solgov_explore //CHOMP explo keep
	name = "Solgov exploration voidsuit" //CHOMP explo keep
	desc = "A standard Solgov of Sol-Procyon Exploration voidsuit. Requires EVA and Exploration access."
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
	desc = "A standard Solgov of Sol-Procyon Engineering voidsuit. Requires Engineering access."
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
	desc = "A standard Solgov of Sol-Procyon Atmospherics voidsuit. Requires Atmospherics access."
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
	desc = "A standard Solgov of Sol-Procyon Captain's voidsuit. Requires Captain's access."
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
	desc = "A Coyote Salvage Corporation Shipbreaker's voidsuit. Includes h-fuel jetpack."
	contains = list(
		/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
		/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
		/obj/item/tank/jetpack/breaker
	)
	cost = 100
	containertype = /obj/structure/closet/crate/coyote_salvage
	name = "CSC voidsuit crate"
