/datum/spawnpoint/stationgateway
	display_name = "Station gateway"
	msg = "has completed translation from station gateway"
	disallow_job = list(JOB_OUTSIDER)

/datum/spawnpoint/stationgateway/New()
	..()
	turfs = GLOB.latejoin_gatewaystation

/obj/effect/landmark/stationgateway
	name = "JoinLateStationGateway"

/datum/spawnpoint/plainspath
	display_name = "Sif plains"
	msg = "has checked in at the plains gate"
	restrict_job = list(JOB_OUTSIDER, JOB_ANOMALY)

/datum/spawnpoint/plainspath/New()
	..()
	turfs = GLOB.latejoin_plainspath

/obj/effect/landmark/plainspath
	name = "JoinLateSifPlains"

/datum/spawnpoint/fueldepot
	display_name = "Fuel Depot"
	msg = "woke up in the fuel depot"
	restrict_job = list(JOB_OUTSIDER)

/datum/spawnpoint/fueldepot/New()
	..()
	turfs = GLOB.latejoin_fueldepot

/obj/effect/landmark/fueldepot
	name = "JoinLateFuelDepot"

/datum/spawnpoint/tyrspawn
	display_name = "Tyr Wreckage"
	msg = "woke up in a ruined shuttle"
	restrict_job = list(JOB_OUTSIDER)

/datum/spawnpoint/tyrspawn/New()
	..()
	turfs = GLOB.latejoin_tyrvillage

/obj/effect/landmark/tyrspawn
	name = "JoinLateTyrVillage"

/datum/spawnpoint/darkspawn
	display_name = "The Dark"
	msg = "phased into the dark"
	restrict_job = list(JOB_ANOMALY)

/datum/spawnpoint/darkspawn/New()
	..()
	turfs = GLOB.latejoin_thedark

/obj/effect/landmark/darkspawn
	name = "JoinLateTheDark"
