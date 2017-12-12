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



/area/turbolift/lumber_floor_dorms
	name = "apartments (top level)"
	lift_floor_label = "Apartments"
	lift_floor_name = "Apartments"
	lift_announce_str = "Arriving at Apartment level."
	delay_time = 5 SECONDS

/area/turbolift/lumber_floor_main_level
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Cargo, Medical, Engineering, Research, Command, Security, Bar"
	lift_announce_str = "Arriving at Surface Level."

/area/turbolift/lumber_floor_basement
	name = "basement (level1)"
	lift_floor_label = "Basement 1"
	lift_floor_name = "Atmos, Maintenance, Civilian Departments,"
	lift_announce_str = "Arriving at Basement Level 1."

/area/turbolift/lumber_floor_underground_mine
	name = "basement (level2)"
	lift_floor_label = "Basement 2"
	lift_floor_name = "Mine, Toxins research"
	lift_announce_str = "Arriving at Basement Level 2."
	base_turf = /turf/simulated/floor
