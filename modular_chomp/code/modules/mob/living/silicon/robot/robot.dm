/mob/living/silicon/robot
	var/sleeper_resting = FALSE //Enable resting belly sprites for dogborgs that have the sprites
	var/datum/matter_synth/water_res = null //Enable water for lick clean
	//Multibelly support. We do not want to apply it to any module not supporting it in it's sprites

/mob/living/silicon/robot/proc/ex_reserve_refill()
	set name = "Refill Extinguisher"
	set category = "Object"
	var/datum/matter_synth/water = water_res
	for(var/obj/item/extinguisher/E in module.modules)
		if(E.reagents.total_volume < E.max_water)
			if(water && water.energy > 0)
				var/amount = E.max_water - E.reagents.total_volume
				if(water.energy < amount)
					amount = water.energy
				water.use_charge(amount)
				E.reagents.add_reagent(REAGENT_ID_WATER, amount)
				to_chat(src, span_filter_notice("You refill the extinguisher using your water reserves."))
			else
				to_chat(src, span_filter_notice("Insufficient water reserves."))

/obj/machinery/door/airlock/BorgCtrlShiftClick(var/mob/living/silicon/robot/user)
	if(check_access(user.idcard))
		..()

/obj/machinery/door/airlock/BorgShiftClick(var/mob/living/silicon/robot/user)  // Opens and closes doors! Forwards to AI code.
	if(check_access(user.idcard))
		..()

/obj/machinery/door/airlock/BorgCtrlClick(var/mob/living/silicon/robot/user) // Bolts doors. Forwards to AI code.
	if(check_access(user.idcard))
		..()

/obj/machinery/power/apc/BorgCtrlClick(var/mob/living/silicon/robot/user) // turns off/on APCs. Forwards to AI code.
	if(allowed(user))
		..()

/obj/machinery/turretid/BorgCtrlClick(var/mob/living/silicon/robot/user) //turret control on/off. Forwards to AI code.
	if(allowed(user))
		..()

/obj/machinery/door/airlock/BorgAltClick(var/mob/living/silicon/robot/user) // Eletrifies doors. Forwards to AI code.
	if(check_access(user.idcard))
		..()

/obj/machinery/turretid/BorgAltClick(var/mob/living/silicon/robot/user) //turret lethal on/off. Forwards to AI code.
	if(allowed(user))
		..()

/obj/machinery/door/airlock/user_allowed(mob/user)
	var/mob/living/silicon/robot/R = user
	if(istype(R) && !check_access(R.idcard))
		return FALSE
	. = ..()

/obj/machinery/computer/atmoscontrol/attack_robot(var/mob/user)
	if(allowed(user))
		..()
	else if(Adjacent(user))
		attack_hand(user)

/obj/machinery/computer/robotics/attack_robot(var/mob/user)
	if(allowed(user))
		..()
	else if(Adjacent(user))
		attack_hand(user)

/obj/machinery/turretid/attack_robot(var/mob/user)
	if(allowed(user))
		..()
	else if(Adjacent(user))
		attack_hand(user)

/obj/machinery/door/airlock/attack_robot(var/mob/user)
	var/mob/living/silicon/robot/R = user
	if(!istype(R))
		return //why are you here
	if(check_access(R.idcard))
		..()
	else if(Adjacent(user))
		attack_hand(user)

/obj/machinery/porta_turret/attack_robot(var/mob/user)
	if(allowed(user))
		..()
	else if(Adjacent(user))
		attack_hand(user)

/obj/machinery/porta_turret/isLocked(mob/user)
	var/mob/living/silicon/robot/R = user
	if(!istype(R))
		return ..()
	if(!locked)
		return FALSE
	if(!check_access(R.idcard))
		return TRUE
	return FALSE
