// Kind of like a combination of all the teleporter stuff all in one package.
// And without the power requirements or accuracy loss,
//   though it requires a shadekin to open the minion portals.

// Also yes this needs to be outside of modular chomp because there are variables that have to be map overriden.
/obj/structure/dark_portal
	name = "Dark portal"
	icon = 'modular_chomp/icons/obj/shadekin_portal.dmi'
	density = TRUE
	anchored = TRUE
	var/locked = null
	var/locked_name = ""
	var/one_time_use = FALSE
	var/precision = 1

/obj/structure/dark_portal/proc/close_portal()
	return

/obj/structure/dark_portal/proc/is_shadekin(mob/shade_maybe)
	if(istype(shade_maybe, /mob/living/simple_mob/shadekin))
		return TRUE
	else if(istype(shade_maybe, /mob/living/carbon/human))
		var/mob/living/carbon/human/carbonkin_maybe = shade_maybe
		if(carbonkin_maybe.get_species() == SPECIES_SHADEKIN)
			return TRUE
	return FALSE

/obj/structure/dark_portal/proc/get_ability_flags(mob/shade_maybe)
	if(istype(shade_maybe, /mob/living/simple_mob/shadekin))
		var/mob/living/simple_mob/shadekin/shadekin = shade_maybe
		return shadekin.ability_flags
	else if(istype(shade_maybe, /mob/living/carbon/human))
		var/mob/living/carbon/human/carbonkin_maybe = shade_maybe
		return carbonkin_maybe.ability_flags
	return 0

/obj/structure/dark_portal/proc/get_shadekin_energy(mob/shade_maybe)
	if(istype(shade_maybe, /mob/living/simple_mob/shadekin))
		var/mob/living/simple_mob/shadekin/shadekin = shade_maybe
		return shadekin.energy
	else if(istype(shade_maybe, /mob/living/carbon/human))
		var/mob/living/carbon/human/carbonkin_maybe = shade_maybe
		return carbonkin_maybe.shadekin_get_energy()
	return 0

/obj/structure/dark_portal/proc/adjust_shadekin_energy(mob/shade_maybe, amount)
	if(istype(shade_maybe, /mob/living/simple_mob/shadekin))
		var/mob/living/simple_mob/shadekin/shadekin = shade_maybe
		shadekin.energy += amount
		return
	else if(istype(shade_maybe, /mob/living/carbon/human))
		var/mob/living/carbon/human/carbonkin_maybe = shade_maybe
		return carbonkin_maybe.shadekin_adjust_energy(amount)
	return 0

/obj/structure/dark_portal/proc/teleport(atom/movable/M as mob|obj)
	if(!locked)
		return
	if(is_shadekin(M))
		if(get_ability_flags(M) & AB_DARK_RESPITE)
			to_chat(M, span_warning("You can't go through this portal so soon after an emergency warp!"))
			var/mob/living/user = M
			user.Stun(10)
			return

	do_teleport(M, locked, precision, local = FALSE, bohsafe = TRUE)

	if(one_time_use)
		one_time_use = 0
		close_portal()
	return

// These things are always on. By default they always teleport you to themselves.
/obj/structure/dark_portal/hub
	icon_state = "hub_portal"
	desc = "A large portal. Touching it without going through may alter the destination."
	var/list/destination_station_areas // Override this in map files!
	var/list/destination_wilderness_areas // Override this in map files!

GLOBAL_LIST_BOILERPLATE(all_darkportal_hubs, /obj/structure/dark_portal/hub)

/obj/structure/dark_portal/hub/Initialize(mapload)
	. = ..()
	locked = src
	locked_name = src.name

/obj/structure/dark_portal/hub/Initialize(mapload)
	. = ..()
	set_light(2, 3, "#ffffff")

/obj/structure/dark_portal/hub/close_portal()
	locked = src
	locked_name = src.name
	precision = 1

/obj/structure/dark_portal/hub/attack_hand(mob/user)
	if(is_shadekin(user))
		if(get_ability_flags(user) & AB_DARK_RESPITE)
			to_chat(user, span_warning("You can't use this so soon after an emergency warp!"))
			return
		if(get_ability_flags(user) & AB_PHASE_SHIFTED)
			to_chat(user, span_warning("You can't use this while phase shifted!"))
			return
		if(locked != src)
			var/confirm = tgui_alert(user, "This portal is currently open to [locked_name]. Change the portal destination?", "Change Portal Destination", list("Yes", "Cancel"))
			if(!confirm || confirm == "Cancel")
				return
		var/list/L = list()
		for(var/obj/structure/dark_portal/hub/H in GLOB.all_darkportal_hubs)
			if(H == src)
				L["This Portal"] = H
			else
				L[H.name] = H
		for(var/obj/structure/dark_portal/minion/M in GLOB.all_darkportal_minions)
			var/tmpname = "Dark Portal ([get_area(M)])"
			L[tmpname] = M
		var/desc = tgui_input_list(user, "Please select a hub portal to connect to.", "Portal Menu", L)
		if(!desc)
			return
		locked = L[desc]
		locked_name = desc
		return
	else if(locked_name == "somewhere on the station" || locked_name == "somewhere in the wilderness")
		to_chat(user, span_warning("The portal distorts for a moment, before returning to how it was, seemingly already determined where to send you."))
		return
	else if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.job && H.job != JOB_OUTSIDER && LAZYLEN(destination_station_areas))
			var/list/floors = list()
			var/area/picked_area = pick(destination_station_areas)
			for(var/turf/simulated/floor/floor in get_area_turfs(picked_area))
				floors.Add(floor)
			if(!LAZYLEN(floors))
				log_and_message_admins("[src]: There were no floors to teleport to in [picked_area]!")
				to_chat(user, span_warning("The portal distorts for a moment, seemingly unable to determine where to send you."))
				close_portal()
				destination_station_areas.Remove(picked_area)
				return
			locked = pick(floors)
			locked_name = "somewhere on the station"
			one_time_use = TRUE
			precision = 0
			to_chat(user, span_notice("The portal distorts for a moment, resolving itself soon after. You feel like it will lead you to the station now."))
			return
	if(!LAZYLEN(destination_wilderness_areas))
		to_chat(user, span_warning("The portal distorts for a moment, seemingly unable to determine where to send you."))
		close_portal()
		return
	var/list/floors = list()
	var/area/picked_area = pick(destination_wilderness_areas)
	for(var/turf/simulated/floor/floor in get_area_turfs(picked_area))
		floors.Add(floor)
	if(!LAZYLEN(floors))
		log_and_message_admins("[src]: There were no floors to teleport to in [picked_area]!")
		to_chat(user, span_warning("The portal distorts for a moment, seemingly unable to determine where to send you."))
		close_portal()
		destination_wilderness_areas.Remove(picked_area)
		return
	locked = pick(floors)
	locked_name = "somewhere in the wilderness"
	one_time_use = TRUE
	precision = 0
	to_chat(user, span_notice("The portal distorts for a moment, resolving itself soon after. You feel like it will lead you to somewhere in the wilderness now."))
	return

/obj/structure/dark_portal/hub/Bumped(M as mob|obj)
	spawn()
		teleport(M)
	return

// These things have an off state. A shadekin has to boop them to turn it on
/obj/structure/dark_portal/minion
	icon_state = "minion0"

GLOBAL_LIST_BOILERPLATE(all_darkportal_minions, /obj/structure/dark_portal/minion)

/obj/structure/dark_portal/minion/close_portal()
	locked = null
	locked_name = ""
	precision = 1
	icon_state = "minion0"

/obj/structure/dark_portal/minion/attack_hand(mob/user)
	if(is_shadekin(user))
		if(get_ability_flags(user) & AB_DARK_RESPITE)
			to_chat(user, span_warning("You can't use this so soon after an emergency warp!"))
			return FALSE
		if(get_ability_flags(user) & AB_PHASE_SHIFTED)
			to_chat(user, span_warning("You can't use this while phase shifted!"))
			return FALSE
		if(icon_state == "minion1")
			var/confirm = tgui_alert(user, "This portal is currently open to [locked_name]. Close this portal to the dark?", "Close Portal", list("Yes", "Cancel"))
			if(!confirm || confirm == "Cancel")
				return
			if(confirm == "Yes")
				close_portal()
				return
		if(get_shadekin_energy(user) < 10)
			to_chat(user, span_warning("Not enough energy to open up the portal! (10 required)"))
			return
		if(!LAZYLEN(GLOB.all_darkportal_hubs))
			to_chat(user, span_warning("No hub portals exist!"))
			return
		if(LAZYLEN(GLOB.all_darkportal_hubs) == 1)
			adjust_shadekin_energy(user, -10)
			var/obj/structure/dark_portal/target = GLOB.all_darkportal_hubs[1]
			locked = target
			locked_name = target.name
			icon_state = "minion1"
			spawn(3000)
				if(locked == target)
					close_portal()
			return
		var/list/L = list()
		for(var/obj/structure/dark_portal/hub/H in GLOB.all_darkportal_hubs)
			L[H.name] = H
		var/desc = tgui_input_list(user, "Please select a hub portal to connect to.", "Portal Menu", L)
		if(!desc)
			return
		locked = L[desc]
		locked_name = desc
		icon_state = "minion1"
		spawn(3000)
			if(locked == L[desc])
				close_portal()
	else if(!istype(user, /mob/living))
		return
	else if(icon_state == "minion0")
		to_chat(user, span_notice("You touch the portal... nothing happens."))
	else
		to_chat(user, span_notice("You touch the portal, your hand able to pass through without harm."))

/obj/structure/dark_portal/minion/Bumped(M as mob|obj)
	spawn()
		if(icon_state == "minion1")
			teleport(M)
	return
