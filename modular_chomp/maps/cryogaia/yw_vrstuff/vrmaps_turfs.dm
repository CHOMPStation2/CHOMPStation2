/area/vrworld
	name = "VR World"
	icon = 'icons/turf/areas_yw.dmi'
	icon_state = "vr"
	requires_power = 0

/area/vrworld/alwayslit
	luminosity = 1
	dynamic_lighting = 0

/turf/unsimulated/floor/ironsand
	icon = 'icons/turf/flooring/ironsand_vr.dmi'
	icon_state = "ironsand1"

/turf/unsimulated/floor/irongrass
	icon ='icons/obj/clockwork_objects.dmi'
	icon_state = "grass"


//YW Addition - no VR for shadekins
/mob/living/carbon/human/shadekin_ability_check()
	. = ..()
	if(. && istype(get_area(src), /area/vrworld))
		to_chat(src, "<span class='danger'>The VR systems cannot comprehend this power! This is useless to you!</span>")
		. = FALSE
//YW add End
