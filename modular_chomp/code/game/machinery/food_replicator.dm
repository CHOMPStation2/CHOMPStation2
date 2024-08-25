/obj/machinery/food_replicator
	name = "Food Replicator"
	icon = 'modular_chomp/icons/obj/machines/food_replicator.dmi'
	icon_state = "food_replicator"

	anchored = TRUE
	density = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 20
	active_power_usage = 200

	var/print_delay = 100
	var/print_cost = 40

	var/efficiency = 3
	var/speed = 1

	var/obj/item/weapon/reagent_containers/container = null
	var/printing = FALSE
	var/list/products = list()

/obj/item/weapon/circuitboard/food_replicator
	name = T_BOARD("food replicator")
	build_path = /obj/machinery/food_replicator
	origin_tech = list(TECH_ENGINEERING = 2, TECH_BIO = 2)
	req_components = list(
		/obj/item/weapon/stock_parts/matter_bin = 1,
		/obj/item/weapon/stock_parts/manipulator = 2,
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/weapon/reagent_containers/glass/beaker = 1
	)

/obj/machinery/food_replicator/Initialize()
	. = ..()

	container = new /obj/item/weapon/reagent_containers/glass/beaker(src)

	default_apply_parts()
	RefreshParts()

/obj/machinery/food_replicator/dismantle()
	var/turf/T = get_turf(src)
	if(T)
		if(container)
			container.forceMove(T)
			container = null
	return ..()

/obj/machinery/food_replicator/attack_hand(mob/user as mob)
	if(stat & (BROKEN|NOPOWER))
		return

	if(panel_open)
		to_chat(user, SPAN_WARNING("Close the panel first!"))
		return

	if(printing)
		to_chat(user, SPAN_WARNING("\The [src] is busy!"))
		return

	interact(user)

/obj/machinery/food_replicator/interact(mob/user)
	if(!isemptylist(products))
		var/choice = tgui_input_list(user, "What would you like to print?", "Pring a dish", products)

		if(!choice || printing || (stat & (BROKEN|NOPOWER)))
			return

		if(container.reagents.has_reagent("nutriment", (print_cost*efficiency)))
			playsound(src, "sound/machines/buzz-sigh.ogg", 25, 0)
			to_chat(user, SPAN_WARNING("Not enough nutriment available!"))
			return

		container.reagents.remove_reagent("nutriment")
		update_use_power(USE_POWER_ACTIVE)
		printing = TRUE
		update_icon()

		visible_message(SPAN_NOTICE("\The [src] begins to shape a nutriment slurry."))

		sleep(print_delay / speed)

		update_use_power(USE_POWER_IDLE)
		printing = FALSE
		update_icon()

		if(!src || (stat & (BROKEN|NOPOWER)))
			return

		new choice(get_turf(src))

	else
		to_chat(user, SPAN_WARNING("There is no food to replicate!"))


/obj/machinery/food_replicator/attackby(obj/item/O, mob/user)
	if(default_deconstruction_screwdriver(user, O))
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return
	if(istype(O, /obj/item/weapon/reagent_containers/food))
		foodcheck(O)
		return

	return ..()

/obj/machinery/food_replicator/proc/foodcheck(var/obj/item/weapon/reagent_containers/food)
	var/mob/living/mob = locate(/mob/living) in food
	if(mob)
		playsound(src, "sound/machines/buzz-two.ogg", 25, 0)
		return
	else if(products.Find(food))
		playsound(src, "sound/machines/buzz-sigh.ogg", 25, 0)
		return
	else
		playsound(src, "sound/machines/ping.ogg", 25, 0)
		products.Add(food)
		return

/obj/machinery/food_replicator/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(panel_open)
		add_overlay("panel_open")
	if(stat & NOPOWER)
		add_overlay("poweroff")
	if(printing)
		add_overlay("printing")

/obj/machinery/food_replicator/process()
	if(stat & (NOPOWER|BROKEN|EMPED))
		update_use_power(USE_POWER_OFF)
		return
	if(printing)
		update_use_power(USE_POWER_ACTIVE)
		return
	else
		use_power = USE_POWER_IDLE

/obj/machinery/food_replicator/RefreshParts()
	var/mm_rating = 0
	var/sc_rating = 0

	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		mm_rating += M.rating
	for(var/obj/item/weapon/stock_parts/scanning_module/SC in component_parts)
		sc_rating += SC.rating

	efficiency = 6 / mm_rating
	speed = sc_rating / 2

/obj/machinery/food_replicator/verb/eject_beaker()
	set name = "Eject Beaker"
	set category = "Object"
	set src in oview(1)

	if(usr.stat != 0)
		return

	add_fingerprint(usr)
	remove_beaker()
	return

/obj/machinery/food_replicator/proc/remove_beaker()
	if(container)
		container.forceMove(get_turf(src))
		container = null
		return TRUE
	return FALSE
