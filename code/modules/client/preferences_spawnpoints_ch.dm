/datum/spawnpoint/stationgateway
	display_name = "Station gateway"
	msg = "has completed translation from station gateway"
	disallow_job = list("Non crew")

/datum/spawnpoint/stationgateway/New()
	..()
	turfs = latejoin_gatewaystation

/datum/spawnpoint/vore
	display_name = "Vorespawn - Prey"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/pred
	display_name = "Vorespawn - Pred"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/New()
	..()
	turfs = latejoin

/datum/spawnpoint/plainspath
	display_name = "Sif plains"
	msg = "has checked in at the plains gate"
	restrict_job = list("Non crew")

/datum/spawnpoint/plainspath/New()
	..()
	turfs = latejoin_plainspath