/mob/living/silicon/robot
	var/sleeper_resting = FALSE //Enable resting belly sprites for dogborgs that have the sprites
	var/datum/matter_synth/water_res = null //Enable water for lick clean
	//Multibelly support. We do not want to apply it to any module not supporting it in it's sprites
	var/list/vore_light_states = list() //Robot exclusive
	vore_capacity_ex = list()
	vore_fullness_ex = list()
	vore_icon_bellies = list()

/mob/living/silicon/robot/verb/purge_nutrition()
	set name = "Purge Nutrition"
	set category = "Abilities.Vore"
	set desc = "Allows you to clear out most of your nutrition if needed."

	if (stat != CONSCIOUS || nutrition <= 1000)
		return
	nutrition = 1000
	to_chat(src, span_warning("You have purged most of the nutrition lingering in your systems."))
	return TRUE

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

/mob/living/silicon/robot/proc/update_multibelly()
	vore_icon_bellies = list() //Clear any belly options that may not exist now
	vore_capacity_ex = list()
	vore_fullness_ex = list()
	if(sprite_datum.belly_capacity_list.len)
		for(var/belly in sprite_datum.belly_capacity_list) //vore icons list only contains a list of names with no associated data
			vore_capacity_ex[belly] = sprite_datum.belly_capacity_list[belly] //I dont know why but this wasnt working when I just
			vore_fullness_ex[belly] = 0 //set the lists equal to the old lists
			vore_icon_bellies += belly
		for(var/belly in sprite_datum.belly_light_list)
			vore_light_states[belly] = 0
	else if(sprite_datum.has_vore_belly_sprites)
		vore_capacity_ex = list("sleeper" = 1)
		vore_fullness_ex = list("sleeper" = 0)
		vore_icon_bellies = list("sleeper")
		if(sprite_datum.has_sleeper_light_indicator)
			vore_light_states = list("sleeepr" = 0)
			sprite_datum.belly_light_list = list("sleeper")
	update_fullness() //Set how full the newly defined bellies are, if they're already full

/mob/living/silicon/robot/proc/reset_belly_lights(var/b_class)
	if(sprite_datum.belly_light_list.len && sprite_datum.belly_light_list.Find(b_class))
		vore_light_states[b_class] = 0

/mob/living/silicon/robot/proc/update_belly_lights(var/b_class)
	if(sprite_datum.belly_light_list.len && sprite_datum.belly_light_list.Find(b_class))
		vore_light_states[b_class] = 2
		for (var/belly in vore_organs)
			var/obj/belly/B = belly
			if(b_class == "sleeper" && (B.silicon_belly_overlay_preference == "Vorebelly" || B.silicon_belly_overlay_preference == "Both") || b_class != "sleeper")
				if(B.digest_mode != DM_DIGEST || B.belly_sprite_to_affect != b_class || !B.contents.len)
					continue
				for(var/contents in B.contents)
					if(istype(contents, /mob/living))
						vore_light_states[b_class] = 1
						return

/mob/living/silicon/robot/module_reset()
	..()
	// We only use the chomp system when the sprite supports it. Else we go through the fallback
	vore_capacity_ex = list()
	vore_fullness_ex = list()
	vore_light_states = list()


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
