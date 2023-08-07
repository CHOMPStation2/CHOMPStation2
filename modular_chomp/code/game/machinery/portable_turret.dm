/obj/machinery/porta_turret/rcd
	desc = "A cheap turret printed by a rapid construction device. Not very sturdy, but it still hurts."
	use_power = FALSE
	idle_power_usage = 0
	active_power_usage = 0
	health = 20
	maxhealth = 20
	reqpower = 0

/obj/machinery/porta_turret/inoperable(var/additional_flags = 0)
	return (stat & (BROKEN|EMPED|additional_flags))