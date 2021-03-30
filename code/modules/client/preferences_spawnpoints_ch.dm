/datum/spawnpoint/stationgateway
	display_name = "Station gateway"
	msg = "has completed translation from station gateway"

/datum/spawnpoint/stationgateway/New()
	..()
	turfs = latejoin_gatewaystation

/datum/spawnpoint/vore
	display_name = "Vore Belly"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/New()
	..()
	turfs = latejoin