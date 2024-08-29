// the power cell
// charge from 0 to 100%
// fits in APC to provide backup power

/obj/item/cell // CHOMPEdit - Removal of obj/item/weapon
	name = "power cell"
	desc = "A rechargable electrochemical power cell."
	icon = 'modular_chomp/icons/obj/power_cells.dmi' //CHOMP Edit using modular folders now
	icon_state = "b_st" //CHOMP Edit
	item_state = "cell"
	origin_tech = list(TECH_POWER = 1)
	force = 5.0
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	w_class = ITEMSIZE_NORMAL
	/// Are we EMP immune?
	var/emp_proof = FALSE
	var/static/cell_uid = 1		// Unique ID of this power cell. Used to reduce bunch of uglier code in nanoUI.
	var/c_uid
	var/charge = 0	// note %age conveted to actual charge in New
	var/maxcharge = 1000
	var/rigged = 0		// true if rigged to explode
	var/minor_fault = 0 //If not 100% reliable, it will build up faults.
	var/self_recharge = FALSE // If true, the cell will recharge itself.
	var/charge_amount = 25 // How much power to give, if self_recharge is true.  The number is in absolute cell charge, as it gets divided by CELLRATE later.
	var/last_use = 0 // A tracker for use in self-charging
	var/connector_type = "standard" //What connector sprite to use when in a cell charger, null if no connectors
	var/charge_delay = 0 // How long it takes for the cell to start recharging after last use
	matter = list(MAT_STEEL = 700, MAT_GLASS = 50)
	drop_sound = 'sound/items/drop/component.ogg'
	pickup_sound = 'sound/items/pickup/component.ogg'

	// Overlay stuff.
	var/standard_overlays = TRUE
	var/last_overlay_state = null // Used to optimize update_icon() calls.

/obj/item/cell/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	c_uid = cell_uid++
	charge = maxcharge
	//update_icon() //CHOMPRemove
	if(self_recharge)
		START_PROCESSING(SSobj, src)

//CHOMPAdd Start
/obj/item/cell/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	update_icon()
//CHOMPAdd End

/obj/item/cell/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	if(self_recharge)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/cell/get_cell() // CHOMPEdit - Removal of obj/item/weapon
	return src

/obj/item/cell/process() // CHOMPEdit - Removal of obj/item/weapon
	if(self_recharge)
		if(world.time >= last_use + charge_delay)
			give(charge_amount)
			// TGMC Ammo HUD - Update the HUD every time we're called to recharge.
			if(istype(loc, /obj/item/gun/energy)) // Are we in a gun currently? // CHOMPEdit - Removal of obj/item/weapon
				var/obj/item/gun/energy/gun = loc // CHOMPEdit - Removal of obj/item/weapon
				var/mob/living/user = gun.loc
				if(istype(user))
					user?.hud_used.update_ammo_hud(user, gun) // Update the HUD
	else
		return PROCESS_KILL

/obj/item/cell/drain_power(var/drain_check, var/surge, var/power = 0) // CHOMPEdit - Removal of obj/item/weapon

	if(drain_check)
		return 1

	if(charge <= 0)
		return 0

	var/cell_amt = power * CELLRATE

	return use(cell_amt) / CELLRATE

#define OVERLAY_FULL	2
#define OVERLAY_PARTIAL	1
#define OVERLAY_EMPTY	0

/obj/item/cell/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	if(!standard_overlays)
		return
	var/ratio = 0
	if(maxcharge > 0)
		ratio = clamp(round(charge / maxcharge, 0.25) * 100, 0, 100)
	var/new_state = "[icon_state]_[ratio]"
	if(new_state != last_overlay_state)
		cut_overlay(last_overlay_state)
		add_overlay(new_state)
		last_overlay_state = new_state

#undef OVERLAY_FULL
#undef OVERLAY_PARTIAL
#undef OVERLAY_EMPTY

/obj/item/cell/proc/percent()		// return % charge of cell // CHOMPEdit - Removal of obj/item/weapon
	var/charge_percent = 0
	if(maxcharge > 0)
		charge_percent = 100.0*charge/maxcharge
	return charge_percent

/obj/item/cell/proc/fully_charged() // CHOMPEdit - Removal of obj/item/weapon
	return (charge == maxcharge)

// checks if the power cell is able to provide the specified amount of charge
/obj/item/cell/proc/check_charge(var/amount) // CHOMPEdit - Removal of obj/item/weapon
	return (charge >= amount)

// Returns how much charge is missing from the cell, useful to make sure not overdraw from the grid when recharging.
/obj/item/cell/proc/amount_missing() // CHOMPEdit - Removal of obj/item/weapon
	return max(maxcharge - charge, 0)

// use power from a cell, returns the amount actually used
/obj/item/cell/proc/use(var/amount) // CHOMPEdit - Removal of obj/item/weapon
	if(rigged && amount > 0)
		explode()
		return 0
	var/used = min(charge, amount)
	charge -= used
	last_use = world.time
	update_icon()
	return used

// Checks if the specified amount can be provided. If it can, it removes the amount
// from the cell and returns 1. Otherwise does nothing and returns 0.
/obj/item/cell/proc/checked_use(var/amount) // CHOMPEdit - Removal of obj/item/weapon
	if(!check_charge(amount))
		return 0
	use(amount)
	return 1

// recharge the cell
/obj/item/cell/proc/give(var/amount) // CHOMPEdit - Removal of obj/item/weapon
	if(rigged && amount > 0)
		explode()
		return 0

	if(maxcharge < amount)	return 0
	var/amount_used = min(maxcharge-charge,amount)
	charge += amount_used
	update_icon()
	if(loc)
		loc.update_icon()
	return amount_used


/obj/item/cell/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(Adjacent(user))
		. += "It has a power rating of [maxcharge]."
		. += "The charge meter reads [round(src.percent() )]%."

/obj/item/cell/attackby(obj/item/W, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(istype(W, /obj/item/reagent_containers/syringe)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/reagent_containers/syringe/S = W // CHOMPEdit - Removal of obj/item/weapon

		to_chat(user, "You inject the solution into the power cell.")

		if(S.reagents.has_reagent("phoron", 5))

			rigged = 1

			log_admin("LOG: [user.name] ([user.ckey]) injected a power cell with phoron, rigging it to explode.")
			message_admins("LOG: [user.name] ([user.ckey]) injected a power cell with phoron, rigging it to explode.")

		S.reagents.clear_reagents()

/obj/item/cell/proc/explode() // CHOMPEdit - Removal of obj/item/weapon
	var/turf/T = get_turf(src.loc)
/*
 * 1000-cell	explosion(T, -1, 0, 1, 1)
 * 2500-cell	explosion(T, -1, 0, 1, 1)
 * 10000-cell	explosion(T, -1, 1, 3, 3)
 * 15000-cell	explosion(T, -1, 2, 4, 4)
 * */
	if (charge==0)
		return
	var/devastation_range = -1 //round(charge/11000)
	var/heavy_impact_range = round(sqrt(charge)/60)
	var/light_impact_range = round(sqrt(charge)/30)
	var/flash_range = light_impact_range
	if (light_impact_range==0)
		rigged = 0
		corrupt()
		return
	//explosion(T, 0, 1, 2, 2)

	log_admin("LOG: Rigged power cell explosion, last touched by [fingerprintslast]")
	message_admins("LOG: Rigged power cell explosion, last touched by [fingerprintslast]")

	explosion(T, devastation_range, heavy_impact_range, light_impact_range, flash_range)

	qdel(src)

/obj/item/cell/proc/corrupt() // CHOMPEdit - Removal of obj/item/weapon
	charge /= 2
	maxcharge /= 2
	if (prob(10))
		rigged = 1 //broken batterys are dangerous

/obj/item/cell/emp_act(severity) // CHOMPEdit - Removal of obj/item/weapon
	if(emp_proof)
		return
	//remove this once emp changes on dev are merged in
	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		severity *= R.cell_emp_mult

	charge -= charge / severity
	if (charge < 0)
		charge = 0

	update_icon()
	..()

/obj/item/cell/ex_act(severity) // CHOMPEdit - Removal of obj/item/weapon

	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return
			if (prob(50))
				corrupt()
		if(3.0)
			if (prob(25))
				qdel(src)
				return
			if (prob(25))
				corrupt()
	return

/obj/item/cell/proc/get_electrocute_damage() // CHOMPEdit - Removal of obj/item/weapon
	//1kW = 5
	//10kW = 24
	//100kW = 45
	//250kW = 53
	//1MW = 66
	//10MW = 88
	//100MW = 110
	//1GW = 132
	if(charge >= 1000)
		var/damage = log(1.1,charge)
		damage = damage - (log(1.1,damage)*1.5)
		return round(damage)
	else
		return 0
