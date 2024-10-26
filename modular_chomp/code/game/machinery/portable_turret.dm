/obj/machinery/porta_turret/rcd
	desc = "A cheap turret printed by a rapid construction device with its own power supply. Not very sturdy, but it still hurts."
	use_power = FALSE
	idle_power_usage = 0
	active_power_usage = 0
	health = 5	//extremely brittle
	maxhealth = 20
	reqpower = 0
	enabled = TRUE
	lethal = TRUE
	ailock = FALSE
	check_all = TRUE
	can_salvage = FALSE
	check_down = TRUE

/obj/machinery/porta_turret/rcd/operable()
	return !inoperable()

/obj/machinery/porta_turret/rcd/inoperable()
	return (stat & (BROKEN|EMPED))

/obj/machinery/porta_turret/rcd/process()
	if(stat & BROKEN)
		popDown()
		return

	if(!enabled)
		popDown()
		return

	var/list/targets = list()			//list of primary targets
	var/list/secondarytargets = list()	//targets that are least important

	//CHOMPEdit Begin

	for(var/mob/M in mobs_in_xray_view(world.view, src))
		assess_and_assign(M, targets, secondarytargets)
	//CHOMPEdit End

	if(!tryToShootAt(targets))
		if(!tryToShootAt(secondarytargets)) // if no valid targets, go for secondary targets
			timeout--
			if(timeout <= 0)
				spawn()
					popDown() // no valid targets, close the cover

/obj/machinery/porta_turret/rcd/update_icon()
	if(stat & BROKEN) // Turret is dead.
		icon_state = "destroyed_target_prism_[turret_type]"

	else if(raised || raising)
		// Turret is open.
		if(enabled)
			// Trying to shoot someone.
			if(lethal)
				icon_state = "[lethal_icon_color]_target_prism_[turret_type]"
			else
				icon_state = "[icon_color]_target_prism_[turret_type]"

		else
			// Disabled.
			icon_state = "grey_target_prism_[turret_type]"

	else
		// Its closed.
		icon_state = "turret_cover_[turret_type]"

/obj/machinery/porta_turret/rcd/die()
	spark_system.start()
	qdel(src)
