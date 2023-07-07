/mob/living/silicon/robot/platform/explorer
	req_access = list(access_explorer)

/mob/living/silicon/robot/platform/cargo
	req_access = list(access_cargo_bot)

/obj/item/weapon/card/id/platform/Initialize()
	. = ..()
	access |= access_explorer
	access |= access_pilot

/obj/structure/dark_portal/hub
	destination_station_areas = list(/area/hallway/primary/firstdeck/elevator)
	destination_wilderness_areas = list(/area/surface/outside/path/plains)

/datum/map_template/shelter/dark_portal/New()
	. = ..()
	blacklisted_areas = typecacheof(list(/area/centcom, /area/shadekin, /area/vr))

/mob/living/carbon/human/shadekin_ability_check()
	. = ..()
	if(. && istype(get_area(src), /area/vr))
		to_chat(src, "<span class='danger'>The VR systems cannot comprehend this power! This is useless to you!</span>")
		. = FALSE


/obj/item/weapon/disposable_teleporter/attack_self(mob/user as mob)//Prevents people from using technomancer gear to escape to station from the VR pods.
	if(istype(get_area(user), /area/vr))
		to_chat(user, "<span class='danger'>\The [src] does not appear to work in VR! This is useless to you!</span>")
		return
	. = ..()
