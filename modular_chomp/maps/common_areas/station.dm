//Station Areas
/area/construction/firstdeck
	name = "\improper Engineering Construction Area"
	icon_state = "construction"

/area/construction/firstdeck/construction1
	name = "\improper First Deck Engineering Construction Area 1"

/area/construction/firstdeck/construction2
	name = "\improper First Deck Engineering Construction Area 2"

/area/construction/firstdeck/construction3
	name = "\improper First Deck Engineering Construction Area 3"

/area/construction/firstdeck/construction4
	name = "\improper First Deck Engineering Construction Area 4"

/area/construction/firstdeck/construction5
	name = "\improper First Deck Engineering Construction Area 5"

//Exploration backup shuttle. For now this is a placeholder for future expedition content.
/area/shuttle/shuttlebackup
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttlebackup/start
	name = "\improper Expedition Backup Shuttle Docks"
	icon_state = "shuttlered"

//NT response shuttle
/area/shuttle/response_ship
	name = "\improper Response Team Ship"
	icon_state = "shuttlered"
	requires_power = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/area/shuttle/response_ship/simulated_reinforced
	base_turf = /turf/simulated/floor/reinforced
