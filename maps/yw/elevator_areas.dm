
// Elevator areas.
/area/service_elevator
	delay_time = 2 SECONDS
	forced_ambience = list('sound/music/elevator.ogg')

/area/service_elevator/apartments
	name = "apartments (top level)"
	lift_floor_label = "Apartments"
	lift_floor_name = "Apartments"
	lift_announce_str = "Arriving at Apartment level."
	delay_time = 5 SECONDS

/area/service_elevator/surface/level1
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Cargo, Medical, Engineering, Research, Command, Security, Bar"
	lift_announce_str = "Arriving at Surface Level."

/area/service_elevator/surface/level2
	name = "basement (level1)"
	lift_floor_label = "Basement 1"
	lift_floor_name = "Atmos, Maintenance, Civilian Departments,"
	lift_announce_str = "Arriving at Basement Level 1."

/area/service_elevator/surface/level3
	name = "basement (level2)"
	lift_floor_label = "Basement 2"
	lift_floor_name = "Mine, Toxins research"
	lift_announce_str = "Arriving at Basement Level 2."
