/datum/spawnpoint/stationgateway
	display_name = "Station gateway"
	msg = "has completed translation from station gateway"
	disallow_job = list(JOB_OUTSIDER)

/datum/spawnpoint/stationgateway/New()
	..()
	turfs = GLOB.latejoin_gatewaystation

/datum/spawnpoint/vore
	display_name = "Vorespawn - Prey"
	msg = "has arrived on the station"
	allow_offmap_spawn = TRUE

/datum/spawnpoint/vore/pred
	display_name = "Vorespawn - Pred"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/itemtf
	display_name = "Item TF spawn"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/New()
	..()
	turfs = latejoin

/datum/spawnpoint/plainspath
	display_name = "Sif plains"
	msg = "has checked in at the plains gate"
	restrict_job = list(JOB_OUTSIDER, JOB_ANOMALY)

/datum/spawnpoint/plainspath/New()
	..()
	turfs = GLOB.latejoin_plainspath

/datum/spawnpoint/fueldepot
	display_name = "Fuel Depot"
	msg = "woke up in the fuel depot"
	restrict_job = list(JOB_OUTSIDER)

/datum/spawnpoint/fueldepot/New()
	..()
	turfs = GLOB.latejoin_fueldepot

/datum/spawnpoint/tyrspawn
	display_name = "Tyr Wreckage"
	msg = "woke up in a ruined shuttle"
	restrict_job = list(JOB_OUTSIDER)

/datum/spawnpoint/tyrspawn/New()
	..()
	turfs = GLOB.latejoin_tyrvillage