/mob/living/carbon/human/proc/shadekin_ability_check()
	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE

	if(stat)
		to_chat(src, span_warning("Can't use that ability in your state!"))
		return FALSE

	if((ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite)) && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, span_warning("You can't use that so soon after an emergency warp!"))
		return FALSE
	return TRUE

//toggle proc for toggling gentle/normal phasing
/mob/living/carbon/human/proc/phase_strength_toggle()
	set name = "Toggle Phase Strength"
	set desc = "Toggle strength of phase. Gentle but slower, or faster but destructive to lights."
	set category = "Abilities.Shadekin"

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE

	if(SK.phase_gentle)
		to_chat(src, span_notice("Phasing toggled to Normal. You may damage lights."))
		SK.phase_gentle = 0
	else
		to_chat(src, span_notice("Phasing toggled to Gentle. You won't damage lights, but concentrating on that incurs a short stun."))
		SK.phase_gentle = 1

/datum/power/shadekin/dark_tunneling
	name = "Dark Tunneling (100) (Once)"
	desc = "Make a passage to the dark."
	verbpath = /mob/living/carbon/human/proc/dark_tunneling
	ability_icon_state = "minion0"

/mob/living/carbon/human/proc/dark_tunneling()
	set name = "Dark Tunneling (100) (Once)"
	set desc = "Make a passage to the dark."
	set category = "Abilities.Shadekin"

	var/template_id = "dark_portal"
	var/datum/map_template/shelter/template

	var/ability_cost = 100

	if(!shadekin_ability_check())
		return FALSE

	if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, span_warning("You can't use that while phase shifted!"))
		return FALSE

	if(ability_flags & AB_DARK_TUNNEL)
		to_chat(src, span_warning("You have already made a tunnel to the Dark!"))
		return FALSE

	if(!template)
		template = SSmapping.shelter_templates[template_id]
		if(!template)
			throw EXCEPTION("Shelter template ([template_id]) not found!")
			return FALSE

	var/turf/deploy_location = get_turf(src)
	var/status = template.check_deploy(deploy_location)

	switch(status)
		//Not allowed due to /area technical reasons
		if(SHELTER_DEPLOY_BAD_AREA)
			to_chat(src, span_warning("A tunnel to the Dark will not function in this area."))

		//Anchored objects or no space
		if(SHELTER_DEPLOY_BAD_TURFS, SHELTER_DEPLOY_ANCHORED_OBJECTS)
			var/width = template.width
			var/height = template.height
			to_chat(src, span_warning("There is not enough open area for a tunnel to the Dark to form! You need to clear a [width]x[height] area!"))

	if(status != SHELTER_DEPLOY_ALLOWED)
		return FALSE

	var/turf/T = deploy_location
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.attach(T)
	smoke.set_up(10, 0, T)
	smoke.start()

	src.visible_message(span_notice("[src] begins pulling dark energies around themselves."))
	if(do_after(src, 600)) //60 seconds
		playsound(src, 'sound/effects/phasein.ogg', 100, 1)
		src.visible_message(span_notice("[src] finishes pulling dark energies around themselves, creating a portal."))

		log_and_message_admins("[key_name_admin(src)] created a tunnel to the dark at [get_area(T)]!")
		template.annihilate_plants(deploy_location)
		template.load(deploy_location, centered = TRUE)
		template.update_lighting(deploy_location)
		ability_flags |= AB_DARK_TUNNEL
		shadekin_adjust_energy(-(ability_cost - 10)) //Leaving enough energy to actually activate the portal
		return TRUE
	return FALSE

/datum/power/shadekin/dark_respite
	name = "Dark Respite (Only in Dark)"
	desc = "Focus yourself on healing any injuries sustained."
	verbpath = /mob/living/carbon/human/proc/dark_respite
	ability_icon_state = "ling_anatomic_panacea"

/mob/living/carbon/human/proc/dark_respite()
	set name = "Dark Respite (Only in Dark)"
	set desc = "Focus yourself on healing any injuries sustained."
	set category = "Abilities.Shadekin"

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE

	if(!istype(get_area(src), /area/shadekin))
		to_chat(src, span_warning("Can only trigger Dark Respite in the Dark!"))
		return FALSE

	if(stat)
		to_chat(src, span_warning("Can't use that ability in your state!"))
		return FALSE

	if(ability_flags & AB_DARK_RESPITE)
		to_chat(src, span_warning("You can't use that so soon after an emergency warp!"))
		return FALSE

	if(has_modifier_of_type(/datum/modifier/dark_respite) && !SK.manual_respite)
		to_chat(src, span_warning("You cannot manually end a Dark Respite triggered by an emergency warp!"))

	if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, span_warning("You can't use that while phase shifted!"))
		return FALSE

	if(has_modifier_of_type(/datum/modifier/dark_respite))
		to_chat(src, span_notice("You stop focusing the Dark on healing yourself."))
		SK.manual_respite = FALSE
		remove_a_modifier_of_type(/datum/modifier/dark_respite)
		return TRUE
	to_chat(src, span_notice("You start focusing the Dark on healing yourself. (Leave the dark or trigger the ability again to end this.)"))
	SK.manual_respite = TRUE
	add_modifier(/datum/modifier/dark_respite)
	return TRUE

/datum/map_template/shelter/dark_portal
	name = "Dark Portal"
	shelter_id = "dark_portal"
	description = "A portal to a section of the Dark"
	mappath = "modular_chomp/maps/submaps/shelters/dark_portal.dmm"

/datum/map_template/shelter/dark_portal/New()
	. = ..()
	blacklisted_turfs = typecacheof(list(/turf/unsimulated))
	blacklisted_areas = typecacheof(list(/area/centcom, /area/shadekin))

/obj/effect/abstract/dark_maw
	var/mob/living/owner = null
	var/obj/belly/target = null
	icon = 'modular_chomp/icons/obj/Shadekin_powers_2.dmi'
	icon_state = "dark_maw_waiting"

/obj/effect/abstract/dark_maw/Initialize(mapload, var/mob/living/user, var/trigger_now = 0)
	. = ..()

	if(!isturf(loc))
		return INITIALIZE_HINT_QDEL

	var/turf/T = loc
	if(T.get_lumcount() >= 0.5)
		visible_message(span_notice("A set of shadowy lines flickers away in the light."))
		icon_state = "dark_maw_used"
		return INITIALIZE_HINT_QDEL

	if(istype(user))
		owner = user
		target = owner.vore_selected

	var/mob/living/target_user = null
	for(var/mob/living/L in T)
		if(L != owner && !L.incorporeal_move)
			target_user = L
			break

	if(istype(target_user))
		triggered_by(target_user, 1)
		// to trigger rebuild
	else if(trigger_now)
		icon_state = "dark_maw_used"
		flick("dark_maw_tr", src)
		visible_message(span_warning("A set of crystals suddenly springs from the ground and shadowy tendrils wrap around nothing before vanishing."))
		QDEL_IN(src, 3 SECONDS)
	else
		var/mob/living/carbon/human/carbon_owner = owner
		var/mob/living/simple_mob/shadekin/sm_owner = owner
		if(istype(carbon_owner))
			var/datum/species/shadekin/SK = carbon_owner.species
			if(istype(SK))
				SK.active_dark_maws += src
		else if(istype(sm_owner))
			sm_owner.active_dark_maws += src
		flick("dark_maw", src)
		START_PROCESSING(SSobj, src)

/obj/effect/abstract/dark_maw/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(istype(owner))
		var/mob/living/carbon/human/carbon_owner = owner
		var/mob/living/simple_mob/shadekin/sm_owner = owner
		if(istype(carbon_owner))
			var/datum/species/shadekin/SK = carbon_owner.species
			if(istype(SK))
				SK.active_dark_maws -= src
		else if(istype(sm_owner))
			sm_owner.active_dark_maws -= src
	target = null
	owner = null
	return ..()

/obj/effect/abstract/dark_maw/Crossed(O)
	. = ..()
	if(!isliving(O))
		return
	if(icon_state != "dark_maw_waiting")
		return
	var/mob/living/L = O
	if(!L.incorporeal_move && (!owner || L != owner))
		triggered_by(L)

/obj/effect/abstract/dark_maw/process()
	var/turf/T = get_turf(src)
	if(!istype(T) || T.get_lumcount() >= 0.5)
		dispel()

/obj/effect/abstract/dark_maw/proc/dispel()
	if(icon_state == "dark_maw_waiting")
		visible_message(span_notice("A set of shadowy lines flickers away in the light."))
	else
		visible_message(span_notice("The crystals and shadowy tendrils dissipate with the light shone on it."))
	icon_state = "dark_maw_used"
	qdel(src)

/obj/effect/abstract/dark_maw/proc/triggered_by(var/mob/living/L, var/triggered_instantly = 0)
	STOP_PROCESSING(SSobj, src)
	icon_state = "dark_maw_used"
	flick("dark_maw_tr", src)
	L.AdjustStunned(4)
	visible_message(span_warning("A set of crystals spring out of the ground and shadowy tendrils start wrapping around [L]."))
	if(owner && !triggered_instantly)
		to_chat(owner, span_warning("A dark maw you deployed has triggered!"))
	addtimer(CALLBACK(src, PROC_REF(do_trigger), L), 1 SECOND, TIMER_DELETE_ME)

/obj/effect/abstract/dark_maw/proc/do_trigger(var/mob/living/L)
	var/will_vore = 1

	if(!owner || !(target in owner) || !L.devourable || !L.can_be_drop_prey || !owner.can_be_drop_pred || !L.phase_vore)
		will_vore = 0

	if(!src || src.gc_destroyed)
		//We got deleted probably, do nothing more
		return

	if(L.loc != get_turf(src))
		visible_message(span_notice("The shadowy tendrils fail to catch anything and dissipate."))
		qdel(src)
		return

	if(will_vore)
		visible_message(span_warning("The shadowy tendrils grab around [L] and drag them into the floor, leaving nothing behind."))
		L.forceMove(target)
		qdel(src)
		return

	var/obj/effect/energy_net/dark/net = new /obj/effect/energy_net/dark(get_turf(src))
	if(net.buckle_mob(L))
		visible_message(span_warning("The shadowy tendrils wrap around [L] and traps them in a net of dark energy."))
	else
		visible_message(span_notice("The shadowy tendrils wrap around [L] and then dissipate, leaving them in place."))
	qdel(src)

/obj/effect/energy_net/dark
	name = "dark net"
	desc = "It's a net made of dark energy."
	icon = 'modular_chomp/icons/obj/Shadekin_powers_2.dmi'
	icon_state = "dark_net"

	escape_time = 30 SECONDS

/obj/effect/energy_net/dark/user_unbuckle_mob(mob/living/buckled_mob, mob/user)
	if(istype(user,/mob/living/simple_mob/shadekin))
		visible_message(span_danger("[user] dissipates \the [src] with a touch!"))
		unbuckle_mob(buckled_mob)
		return

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		var/datum/species/shadekin/SK = H.species
		if(istype(SK))
			visible_message(span_danger("[user] dissipates \the [src] with a touch!"))
			unbuckle_mob(buckled_mob)
			return
	. = ..()

/obj/effect/energy_net/dark/process()
	. = ..()
	var/turf/T = get_turf(src)
	if(!istype(T) || T.get_lumcount() >= 0.6)
		visible_message(span_notice("The tangle of dark tendrils fades away in the light."))
		qdel(src)

/datum/power/shadekin/dark_maw
	name = "Dark Maw (20)"
	desc = "Create a trap to capture others, or steal people from phase"
	verbpath = /mob/living/carbon/human/proc/dark_maw
	ability_icon_state = "dark_maw_ic"

/mob/living/carbon/human/proc/dark_maw()
	set name = "Dark Maw (20)"
	set desc = "Create a trap to capture others, or steal people from phase"
	set category = "Abilities.Shadekin"

	var/ability_cost = 20

	if(!shadekin_ability_check())
		return FALSE

	if(shadekin_get_energy() < ability_cost)
		to_chat(src, span_warning("Not enough energy for that ability!"))
		return FALSE

	var/turf/T = get_turf(src)
	if(!istype(T))
		to_chat(src, span_warning("You don't seem to be able to set a trap here!"))
		return FALSE

	if(T.get_lumcount() >= 0.5)
		to_chat(src, span_warning("There is too much light here for your trap to last!"))
		return FALSE

	if(do_after(src, 10))
		if(ability_flags & AB_PHASE_SHIFTED)
			new /obj/effect/abstract/dark_maw(loc, src, 1)
		else
			new /obj/effect/abstract/dark_maw(loc, src)
		shadekin_adjust_energy(-ability_cost)

		return TRUE
	return FALSE

/mob/living/carbon/human/proc/clear_dark_maws()
	set name = "Dispel dark maws"
	set desc = "Dispel any active dark maws in place"
	set category = "Abilities.Shadekin"

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE

	for(var/obj/effect/abstract/dark_maw/dm in SK.active_dark_maws)
		dm.dispel()

/mob/living/carbon/human/proc/nutrition_conversion_toggle()
	set name = "Toggle Energy <-> Nutrition conversions"
	set desc = "Toggle dark energy and nutrition being converted into each other when full"
	set category = "Abilities.Shadekin"

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE

	if(SK.nutrition_energy_conversion)
		to_chat(src, span_notice("Nutrition and dark energy conversions disabled."))
		SK.nutrition_energy_conversion = 0
	else
		to_chat(src, span_notice("Nutrition and dark energy conversions enabled."))
		SK.nutrition_energy_conversion = 1

/datum/modifier/shadekin_phase
	name = "Shadekin Phasing"
	evasion = 100
