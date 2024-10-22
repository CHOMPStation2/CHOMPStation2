

/datum/planet/sif
	expected_z_levels = list(
		Z_LEVEL_SURFACE,
		Z_LEVEL_SURFACE_MINE,
		Z_LEVEL_SURFACE_WILD,
		//Z_LEVEL_SURFACE_SKYLANDS, //Sky islands removal due to lack of use
		//Z_LEVEL_SURFACE_VALLEY //Replaced with Tyr
	)
//Z_LEVEL_SURFACE_CASINO //CHOMPedit - KSC = So there is weather on the Casino. //Move this into /datum/planet/sif and remember to add a coma for the new entry, for when you need the casino again

/datum/planet/thor
	expected_z_levels = list(
		Z_LEVEL_JUNGLE
	)

/datum/planet/tyr
	expected_z_levels = list(
		Z_LEVEL_DEATH_VALLEY
	)

/obj/effect/step_trigger/teleporter/bridge/east_to_west/Initialize()
	teleport_x = src.x - 4
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/east_to_west/small/Initialize()
	teleport_x = src.x - 3
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/west_to_east/Initialize()
	teleport_x = src.x + 4
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/west_to_east/small/Initialize()
	teleport_x = src.x + 3
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/north_to_south/Initialize()
	teleport_x = src.x
	teleport_y = src.y - 4
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/south_to_north/Initialize()
	teleport_x = src.x
	teleport_y = src.y + 4
	teleport_z = src.z
	return ..()

 /* KSC 9/29/20 = Adding these as we now have nonencludian portals */

/obj/effect/map_effect/portal/master/side_a/plains_to_caves
	portal_id = "plains_caves-normal"

/obj/effect/map_effect/portal/master/side_b/caves_to_plains
	portal_id = "plains_caves-normal"

/obj/effect/map_effect/portal/master/side_a/plains_to_caves/river
	portal_id = "plains_caves-river"

/obj/effect/map_effect/portal/master/side_b/caves_to_plains/river
	portal_id = "plains_caves-river"


/obj/effect/map_effect/portal/master/side_a/caves_to_wilderness
	portal_id = "caves_wilderness-normal"

/obj/effect/map_effect/portal/master/side_b/wilderness_to_caves
	portal_id = "caves_wilderness-normal"

/obj/effect/map_effect/portal/master/side_a/caves_to_wilderness/river
	portal_id = "caves_wilderness-river"

/obj/effect/map_effect/portal/master/side_b/wilderness_to_caves/river
	portal_id = "caves_wilderness-river"

/obj/effect/map_effect/portal/master/side_a/wilderness_to_valley
	portal_id = "wilderness_valley"

/obj/effect/map_effect/portal/master/side_b/wilderness_to_valley
	portal_id = "wilderness_valley"
