/mob/living/simple_mob/shadekin
	var/phase_gentle = 0

/mob/living/simple_mob/shadekin/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/shadekin/proc/phase_strength_toggle)

/mob/living/simple_mob/shadekin/proc/dark_tunneling()
	var/template_id = "dark_portal"
	var/datum/map_template/shelter/template

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
		ability_flags &= AB_DARK_TUNNEL
		return TRUE
	else
		return FALSE

/mob/living/simple_mob/shadekin/proc/dark_maw()
	var/turf/T = get_turf(src)
	if(!istype(T))
		to_chat(src, span_warning("You don't seem to be able to set a trap here!"))
		return FALSE
	else if(T.get_lumcount() >= 0.5)
		to_chat(src, span_warning("There is too much light here for your trap to last!"))
		return FALSE

	if(do_after(src, 10))
		if(ability_flags & AB_PHASE_SHIFTED)
			new /obj/effect/abstract/dark_maw(loc, src, 1)
		else
			new /obj/effect/abstract/dark_maw(loc, src)

		return TRUE
	else
		return FALSE

// Allow horizontal resting
/mob/living/simple_mob/shadekin/update_transform()
	update_transform_horizontal()

//custom light flicker proc
/mob/living/simple_mob/shadekin/proc/handle_phasein_flicker()
	if(phase_gentle) // gentle case: No light destruction. Flicker in 4 tile radius for 3s. Weaken for 3sec after
		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 4)
				continue
			L.flicker(3)
		src.Stun(3)
	else //normal case. Flicker in 10 tile radius for 10s. chance to destroy light based on eye type.
		var/destroy_lights = 0
		if(eye_state == RED_EYES)
			destroy_lights = 80
		if(eye_state == PURPLE_EYES)
			destroy_lights = 25

		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue

			if(prob(destroy_lights))
				addtimer(CALLBACK(L, TYPE_PROC_REF(/obj/machinery/light, broken)), rand(5,25), TIMER_DELETE_ME)
			else
				L.flicker(10)

//toggle proc for toggling gentle/normal phasing
/mob/living/simple_mob/shadekin/proc/phase_strength_toggle()
	set name = "Toggle Phase Strength"
	set desc = "Toggle strength of phase. Gentle but slower, or faster but destructive to lights."
	set category = "Abilities.Shadekin"

	if(phase_gentle)
		to_chat(src, span_notice("Phasing toggled to Normal. You may damage lights."))
		phase_gentle = 0
	else
		to_chat(src, span_notice("Phasing toggled to Gentle. You won't damage lights, but concentrating on that incurs a short stun."))
		phase_gentle = 1
