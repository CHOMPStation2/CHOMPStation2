///This file contains various objects used on maps that were illegally doing icon = 'xxx' as a mapedit.
///This is bad practice and this file exists to replace those objects with proper icon_states instead. (Thanks copilot)

/obj/machinery/smartfridge/survival_pod/scifridge
	icon = 'icons/obj/vending.dmi'
	icon_base = "fridge_sci"
	icon_contents = "chem"
	icon_state = "fridge_sci"
	name = "Advanced storage"

/obj/machinery/smartfridge/survival_pod/abductor
	desc = "A mysterious machine which can fabricate many tools for acquiring test subjects."
	dir = 4
	icon = 'icons/obj/abductor.dmi';
	icon_base = "dispenser_2way"
	icon_state = "dispenser_2way"
	name = "Implant-Co"

/obj/machinery/smartfridge/survival_pod
	desc = "A mysterious machine which can fabricate many tools for acquiring test subjects."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "dispenser"
	name = "Garmentier"
	pixel_y = 0
	req_access = list(777)

/obj/machinery/smartfridge/survival_pod/dispenser1
	desc = "A mysterious machine which can fabricate many tools for acquiring test subjects."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "dispenser"
	name = "Drug-Dispenser"
	req_access = list(777)

/obj/machinery/smartfridge/survival_pod/dispenser1/garmentier
	name = "Garmentier"

/obj/effect/simple_portal/linked/weird_dark
	icon = 'icons/turf/flooring/weird_vr.dmi'
	icon_state = "dark"
	light_on = 0
	portal_id = 6690

/obj/effect/simple_portal/coords/offcenter
	density = 0
	icon = 'icons/obj/machines/gateway_vr.dmi'
	icon_state = "offcenter"

/turf/simulated/shuttle/wall/no_join/orange
	base_state = "orange"
	icon = 'icons/turf/shuttle_orange.dmi'
	icon_state = "orange"

/turf/unsimulated/wall/concrete/turfpack/station/yellow
	color = "#ebcd7c"
	icon = 'icons/turf/wall_masks.dmi'
