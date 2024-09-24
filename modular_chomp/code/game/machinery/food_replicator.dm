/obj/machinery/food_replicator
	name = "Food Replicator"
	icon = 'modular_chomp/icons/obj/machines/food_replicator.dmi'
	icon_state = "food_replicator"

	anchored = TRUE
	density = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 20
	active_power_usage = 200

	var/print_delay = 150
	var/print_cost

	var/efficiency = 1.35
	var/speed = 1

	var/obj/item/weapon/reagent_containers/container = null
	var/printing = FALSE
	var/list/products = list()

/obj/item/weapon/circuitboard/food_replicator
	name = T_BOARD("food replicator")
	build_path = /obj/machinery/food_replicator
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_ENGINEERING = 2, TECH_BIO = 2)
	req_components = list(
		/obj/item/weapon/stock_parts/capacitor = 3,
		/obj/item/weapon/stock_parts/matter_bin = 2,
		/obj/item/weapon/stock_parts/manipulator = 1,
		/obj/item/weapon/stock_parts/motor = 1,
		/obj/item/stack/cable_coil = 5,
	)

/obj/machinery/food_replicator/Initialize()
	. = ..()

	default_apply_parts()
	RefreshParts()

/obj/machinery/food_replicator/dismantle()
	var/turf/T = get_turf(src)
	if(T)
		if(container)
			container.forceMove(T)
			container = null
	QDEL_NULL_LIST(products)
	return ..()

/obj/machinery/food_replicator/attack_hand(mob/user as mob)
	add_fingerprint(user)
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
		var/choice = tgui_input_list(user, "What would you like to print?", "Print a dish", products)

		if(!choice || printing || (stat & (BROKEN|NOPOWER)))
			return

		var/product_path = products[choice]
		var/obj/item/weapon/reagent_containers/foodItem = new product_path

		var/total = clamp(foodItem.reagents.get_free_space()-foodItem.reagents.total_volume, 1, 300)

		if(!container)
			to_chat(user, SPAN_WARNING("There is no container!"))
			return

		if(container && container.reagents)
			if(!container.reagents.has_reagent("nutriment", (total*efficiency)))
				playsound(src, "sound/machines/buzz-sigh.ogg", 25, 0)
				to_chat(user, SPAN_WARNING("Not enough nutriment available!"))
				return

			container.reagents.remove_reagent("nutriment", (total*efficiency))

			update_use_power(USE_POWER_ACTIVE)
			printing = TRUE
			update_icon()

			if(product_path)
				foodItem = new product_path(src)

				if(istype(foodItem, /obj/item/weapon/reagent_containers/food/snacks/donkpocket))
					var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/donkp = foodItem
					donkp.heat()

				if(foodItem.reagents.has_reagent("supermatter"))
					self_destruct()

			visible_message(SPAN_NOTICE("\The [src] begins to shape a nutriment slurry."))

			sleep(print_delay/speed)

			ping()
			update_use_power(USE_POWER_IDLE)
			printing = FALSE
			update_icon()

			if(!src || (stat & (BROKEN|NOPOWER)))
				return

			if(foodItem)
				foodItem.forceMove(get_turf(src))

	else
		to_chat(user, SPAN_WARNING("There is no food to replicate!"))


/obj/machinery/food_replicator/attackby(obj/item/O, mob/user)
	if(default_deconstruction_screwdriver(user, O))
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_unfasten_wrench(user, O))
		return
	if(default_part_replacement(user, O))
		return
	if(istype(O, /obj/item/weapon/reagent_containers/food))
		balloon_alert(user, "Scanning...")
		if(!do_after(user, 10))
			return
		foodcheck(O)
		return
	if(istype(O, /obj/item/weapon/reagent_containers/glass))
		if(!isnull(container))
			to_chat(user, SPAN_WARNING("There is already a reagent container inserted!"))
			return

		user.drop_item()
		O.loc = src
		container = O
		balloon_alert(user, "Placed \the [O] in \the [src]")
		return

	return ..()

/obj/machinery/food_replicator/proc/foodcheck(var/obj/item/weapon/reagent_containers/food)
	var/mob/living/mob = locate(/mob/living) in food
	if(mob)
		playsound(src, "sound/machines/buzz-two.ogg", 25, 0)
		return

	var/food_name = food.name
	var/path = food.type

	if(!products[food_name])
		products[food_name] = path
		playsound(src, "sound/machines/ping.ogg", 25, 0)
	else
		playsound(src, "sound/machines/buzz-sigh.ogg", 25, 0)

	return

/obj/machinery/food_replicator/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(stat & BROKEN)
		icon_state = "destroyed"
	if(panel_open)
		add_overlay("panel_open")
	if(stat & NOPOWER|EMPED)
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
    var/cap_rating = 0
    var/man_rating = 0

    for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
        cap_rating += C.rating
    for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
        man_rating += M.rating

    efficiency = (man_rating > 0) ? 6 / man_rating : 3
    speed = cap_rating / 2


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

/obj/machinery/food_replicator/proc/self_destruct()
	visible_message(SPAN_WARNING("Whirrs and spouts, starting to heat up!"))
	playsound(src, pick('sound/effects/Glassbr1.ogg', 'sound/effects/Glassbr2.ogg', 'sound/effects/Glassbr3.ogg'), 50, 1)

	message_admins("[src] attempted to create an EX donk pocket at [x], [y], [z], last touched by [fingerprintslast]")
	log_game("[src] attempted to create an EX donk pocket at [x], [y], [z], last touched by [fingerprintslast]. (<A HREF='?_src_=holder;[HrefToken()];adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)", 1)

	sleep(6 SECONDS) // GET OUT, GET OUT
	stat = BROKEN
	update_icon()
	explosion(src, 0, 0, 2)
	return
