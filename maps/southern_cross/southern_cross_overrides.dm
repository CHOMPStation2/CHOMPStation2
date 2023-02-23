/mob/living/silicon/robot/platform/explorer
	req_access = list(access_explorer)

/mob/living/silicon/robot/platform/cargo
	req_access = list(access_cargo_bot)

/obj/item/weapon/card/id/platform/Initialize()
	. = ..()
	access |= access_explorer
	access |= access_pilot

/obj/structure/dark_portal/hub
	destination_station_areas = list(/area/crew_quarters/bar)
	destination_wilderness_areas = list(/area/surface/outside/path/plains)
