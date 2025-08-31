/mob/living/silicon/robot/platform/explorer
	req_access = list(ACCESS_EXPLORER)

/mob/living/silicon/robot/platform/cargo
	req_access = list(ACCESS_CARGO_BOT)

/obj/structure/dark_portal/hub
	destination_station_areas = list(/area/hallway/primary/firstdeck/elevator)
	destination_wilderness_areas = list(/area/surface/outside/path/plains)

/datum/map_template/shelter/dark_portal/New()
	. = ..()
	GLOB.blacklisted_areas = typecacheof(list(/area/centcom, /area/shadekin, /area/vr))

/obj/item/disposable_teleporter/attack_self(mob/user as mob)//Prevents people from using technomancer gear to escape to station from the VR pods.
	if(istype(get_area(user), /area/vr))
		to_chat(user, span_danger("\The [src] does not appear to work in VR! This is useless to you!"))
		return
	. = ..()
