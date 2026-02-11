// -- Datums -- //

/obj/effect/overmap/visitable/sector/alienship
	name = "Unknown Vessel"
	desc = "An unknown vessel detected by sensors."
	start_x = 12
	start_y = 12
	icon_state = "ship"
	color = "#ff00ff" //Sandy
	initial_generic_waypoints = list("alien_vessel")

/obj/effect/shuttle_landmark/premade/excursion/alienship
	name = "Unknown Ship"
	landmark_tag = "alien_vessel"

// -- Objs -- //
/obj/machinery/porta_turret/alien/ion
	name = "interior anti-boarding turret"
	desc = "A very tough looking turret made by alien hands."
	installation = /obj/item/gun/energy/ionrifle/weak
	enabled = TRUE
	lethal = TRUE
	ailock = TRUE
	check_all = TRUE
	health = 250
	maxhealth = 250

/obj/away_mission_init/alienship/door_n2s
	icon_state = "n2s"
	door_on_mode = "n2s"

/obj/away_mission_init/alienship/door_s2n
	icon_state = "s2n"
	door_on_mode = "s2n"

/obj/away_mission_init/alienship/door_e2w
	icon_state = "e2w"
	door_on_mode = "e2w"

/obj/away_mission_init/alienship/door_w2e
	icon_state = "w2e"
	door_on_mode = "w2e"

/obj/away_mission_init/alienship/start_n2s
	icon_state = "n2s"
	teleport_on_mode = "n2s"

/obj/away_mission_init/alienship/start_s2n
	icon_state = "s2n"
	teleport_on_mode = "s2n"

/obj/away_mission_init/alienship/start_e2w
	icon_state = "e2w"
	teleport_on_mode = "e2w"

/obj/away_mission_init/alienship/start_w2e
	icon_state = "w2e"
	teleport_on_mode = "w2e"

/obj/item/reagent_containers/hypospray/autoinjector/alien
	name = "alien injector(?)"
	desc = "It appears to contain some sort of liquid and has a needle for injecting."
	icon = 'alienship.dmi'
	icon_state = "alien_injector"
	item_state = "autoinjector"
	filled_reagents = list("rezadone" = 4, "corophizine" = 1)
