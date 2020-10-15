//Turbolift

/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	flags = RAD_SHIELDED
	forced_ambience = list('sound/music/elevator.ogg')

/area/turbolift/start
	name = "\improper Turbolift Start"

/area/turbolift/mine
	name = "\improper underground"
	base_turf = /turf/simulated/floor/plating

/area/turbolift/basement
	name = "\improper basement"
	base_turf = /turf/simulated/open

/area/turbolift/mainfloor
	name = "\improper main level"
	base_turf = /turf/simulated/open

/area/turbolift/dorms
	name = "\improper dorms"
	base_turf = /turf/simulated/open



/area/turbolift/lumber_floor_dorms //Not implemented at this time, a sort of apartments area for custom rooms for crew.
	name = "apartments (top level)"
	lift_floor_label = "Apartments"
	lift_floor_name = "Apartments"
	lift_announce_str = "Arriving at Apartment level."
	delay_time = 5 SECONDS

/area/turbolift/lumber_floor_upper_level
	name = "surface (level 2)"
	lift_floor_label = "Surface 2"
	lift_floor_name = "Upper Level (Construction Area!)"
	lift_announce_str = "Arriving at Upper Level."

/area/turbolift/lumber_floor_main_level
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Cargo, Medical, Engineering, Research, Command, Security, Bar"
	lift_announce_str = "Arriving at Surface Level."

/area/turbolift/lumber_floor_basement
	name = "basement (sublevel 1)"
	lift_floor_label = "Sublevel 1"
	lift_floor_name = "Atmos, Maintenance, Civilian Departments,"
	lift_announce_str = "Arriving at Basement Level 1."

/area/turbolift/lumber_floor_underground_transit
	name = "basement (sublevel transit)"
	lift_floor_label = "Sublevel Transit"
	lift_floor_name = "Transit"
	lift_announce_str = "Arriving at Basement Level Transit."
	base_turf = /turf/simulated/floor
	delay_time = 7 SECONDS // to symbolize the depth of transit.

/area/turbolift/lumber_floor_underground_mine
	name = "basement (sublevel 2)"
	lift_floor_label = "Sublevel 2"
	lift_floor_name = "Mine, Toxins research"
	lift_announce_str = "Arriving at Basement Level 2."
	base_turf = /turf/simulated/floor


/area/turbolift/lumber_floor_medical
	name = "Medbay (level 1)"
	lift_floor_label = "Medbay"
	lift_floor_name = "Lobby, Surgery, Primary Treatment, Psychology"
	lift_announce_str = "Arriving at Medbay Proper."

/area/turbolift/lumber_floor_medibasement
	name = "Medbay (sublevel 1)"
	lift_floor_label = "Medical Annex"
	lift_floor_name = "Virology, Chemistry, EVA, Storage"
	lift_announce_str = "Arriving at Medical Annex."

/area/turbolift/lumber_floor_mediupper
	name = "Medbay (level 2)"
	lift_floor_label = "Medical Loft"
	lift_floor_name = "Break Room, Storage, Skybridge to Departures"
	lift_announce_str = "Arriving at Medical Loft."