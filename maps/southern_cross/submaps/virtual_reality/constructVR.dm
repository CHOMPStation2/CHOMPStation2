// -- Areas -- //

/area/vr
	name = "VR world"
	icon_state = "green"
	base_turf = /turf/simulated/floor/outdoors/dirt
	limit_mob_size = FALSE


/area/vr/outdoors
	outdoors = OUTDOORS_YES
	ambience = AMBIENCE_SIF

/area/vr/powered
	name = "Powered VR World Inside"
	icon_state = "away1"
	requires_power = 0
	power_equip = 1
	power_environ = 1
	power_light = 1

/area/vr/outdoors/powered
	name = "Powered VR World Outside"
	icon_state = "away"
	requires_power = 0
	power_equip = 1
	power_environ = 1
	power_light = 1

/area/vr/powered/bluebase
	name = "Blue Base"
	icon_state = "bluenew"

/area/vr/powered/redbase
	name = "Red Base"
	icon_state = "red"

// -- Objects -- //
/obj/effect/fake_sun/always_day
	name = "fake sun"
	desc = "Deletes itself, but first updates all the lighting on outdoor turfs to cool colors."
	possible_light_setups = list(

		list(
			"brightness" = 6.0,
			"color" = "#ABfff7"
		),
		list(
			"brightness" = 4.0,
			"color" = "#F4EA55"
		),
		list(
			"brightness" = 2.5,
			"color" = "#EE9AC6"
		),
		list(
			"brightness" = 1.0,
			"color" = "#F07AD8"
		)
	)
