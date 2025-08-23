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

/obj/machinery/smartfridge/survival_pod/boxes
	icon = 'icons/obj/vending.dmi';
	icon_base = "smartfridge"
	icon_contents = "boxes"
	icon_state = "smartfridge"
	name = "Advanced storage"

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

/obj/effect/simple_portal/coords/old_sprite
	icon = 'icons/obj/machines/gateway.dmi'
	icon_state = "oncenter"
	density = 0

/obj/effect/simple_portal/coords/gateway_on
	icon = 'icons/obj/machines/gateway.dmi'
	icon_state = "on"

/obj/effect/simple_portal/linked/gateway
	icon = 'icons/obj/machines/gateway.dmi'
	icon_state = "oncenter"

/turf/simulated/shuttle/wall/no_join/orange
	base_state = "orange"
	icon = 'icons/turf/shuttle_orange.dmi'
	icon_state = "orange"

/turf/unsimulated/wall/concrete/turfpack/station/yellow
	color = "#ebcd7c"
	icon = 'icons/turf/wall_masks.dmi'

/obj/item/gun/energy/laser/experimental_shit
	icon = 'icons/obj/gun.dmi'
	icon_state = "pulse"
	name = "Expirmental Pulse Rifle"
	firemodes = list(list("mode_name" = "normal", "fire_delay" = 8, "projectile_type" = /obj/item/projectile/beam/midlaser, "charge_cost" = 120),list("mode_name" = "suppressive", "fire_delay" = 5, "projectile_type" = /obj/item/projectile/beam/weaklaser, "charge_cost" = 30))

/obj/item/radio/med_emergency
	frequency = 1487
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	name = "Medical Emergency Phone"

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/fluff_fan
	desc = "A large machine releasing a constant gust of air."
	icon = 'icons/obj/survival_pod.dmi'
	icon_state = "fans"
	name = "enviornmental regulation system"

/obj/machinery/computer/crew/abductor
	icon = 'icons/obj/abductor.dmi'
	icon_screen = null
	icon_state = "console-c"

/obj/machinery/cryopod/robot/borg_pod
	base_icon_state = "borg_pod_closed"
	icon = 'icons/obj/structures.dmi'
	icon_state = "borg_pod_closed"
	occupied_icon_state = "borg_pod_opened"

/mob/living/simple_mob/vore/alienanimals/startreader/cutout
	icon_living = "cutout_basic"
	icon_dead = "cutout_basic"
	icon_state = "cutout_basic"
	icon = 'icons/obj/cardboard_cutout.dmi'
	name = "stand-up figure?"
