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

/area/vr/powered/rocks
	name = "VR World Underground"
	icon_state = "darkred"

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

/area/vr/outdoors/powered/lava
	name = "VR Lava Bridge"

/area/vr/powered/vendor
	name = "VR Vendor Room"
	icon_state = "green"

/area/vr/powered/material
	name = "VR Material Room"
	icon_state = "green"

/area/vr/powered/building1
	name = "VR Building 1"
	icon_state = "green"

/area/vr/powered/building2
	name = "VR Building 2"
	icon_state = "green"

/area/vr/powered/conspawn
	name = "VR Construct Spawn"
	icon_state = "green"

/area/vr/powered/armory
	name = "VR Armory"
	icon_state = "firingrange"

/area/vr/powered/cult
	name = "VR Cultist Base"
	icon_state = "green"

/area/vr/outdoors/powered/cult
	name = "Cultist Outside"
	ambience = AMBIENCE_UNHOLY

//City section
/area/vr/powered/bar
	name = "VR Bar"
	icon_state = "green"

/area/vr/powered/cafe
	name = "VR Ghost Cafe"
	icon_state = "green"

/area/vr/powered/gunshop
	name = "VR GunShop"
	icon_state = "green"

/area/vr/powered/vet
	name = "VR Vet"
	icon_state = "green"

/area/vr/powered/shop
	name = "VR Shop"
	icon_state = "green"

/area/vr/powered/art
	name = "VR Art Gallery"
	icon_state = "green"

/area/vr/powered/constore
	name = "VR Convenience Store"
	icon_state = "green"

/area/vr/powered/nuke
	name = "VR Violation"
	icon_state = "green"

/area/vr/powered/motel
	name = "VR Motel"
	icon_state = "green"

/area/vr/powered/dungeon
	name = "VR Dungeon"
	icon_state = "darkred"

/area/vr/powered/dungeon/indoors
	name = "VR Sewers"
	icon_state = "red"

/area/vr/powered/space
	name = "VR Space Vessel"
	icon_state = "away2"
	base_turf = /turf/space
/area/vr/powered/space/whiteship
	name = "VR Whiteship"
	icon_state = "green"

/area/vr/powered/space/sciship
	name = "VR Sci Ship"
	icon_state = "green"

/area/vr/powered/space/mechfactory
	name = "VR Mech Factory"
	icon_state = "green"

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
