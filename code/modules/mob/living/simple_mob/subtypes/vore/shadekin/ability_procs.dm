// Phase shifting procs (and related procs)
/mob/living/simple_mob/shadekin/proc/phase_shift()
	var/turf/T = get_turf(src)
	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,span_warning("You can't use that here!"))
		return FALSE
	if((get_area(src).flags & PHASE_SHIELDED))
		to_chat(src,"<span class='warning'>This area is preventing you from phasing!</span>")
		return FALSE

	forceMove(T)
	var/original_canmove = canmove
	SetStunned(0)
	SetWeakened(0)
	if(buckled)
		buckled.unbuckle_mob()
	if(pulledby)
		pulledby.stop_pulling()
	stop_pulling()
	canmove = FALSE

	//Shifting in
	if(ability_flags & AB_PHASE_SHIFTED)
		ability_flags &= ~AB_PHASE_SHIFTED
		mouse_opacity = 1
		name = real_name
		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = initial(B.escapable)

		cut_overlays()
		alpha = initial(alpha)
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)

		//Cosmetics mostly
		flick("tp_in",src)
		custom_emote(1,"phases in!")
		sleep(5) //The duration of the TP animation
		canmove = original_canmove

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && target.devourable && target.can_be_drop_prey && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,span_vwarning("\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!"))

		// Do this after the potential vore, so we get the belly
		update_icon()

		/* CHOMPEdit, comment out and handle in custom proc
		//Affect nearby lights
		var/destroy_lights = 0
		if(eye_state == RED_EYES)
			destroy_lights = 80
		if(eye_state == PURPLE_EYES)
			destroy_lights = 25

		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue

			if(prob(destroy_lights))
				spawn(rand(5,25))
					L.broken()
			else
				L.flicker(10)
		*/
		handle_phasein_flicker() // CHOMPEdit, special handle for phase-in light flicker

	//Shifting out
	else
		ability_flags |= AB_PHASE_SHIFTED
		mouse_opacity = 0
		custom_emote(1,"phases out!")
		real_name = name
		name = "Something"

		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = FALSE

		cut_overlays()
		flick("tp_out",src)
		sleep(5)
		invisibility = INVISIBILITY_LEVEL_TWO
		see_invisible = INVISIBILITY_LEVEL_TWO
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE

/mob/living/simple_mob/shadekin/UnarmedAttack()
	if(ability_flags & AB_PHASE_SHIFTED)
		return FALSE //Nope.

	. = ..()

/mob/living/simple_mob/shadekin/can_fall()
	if(ability_flags & AB_PHASE_SHIFTED)
		return FALSE //Nope!

	return ..()

/mob/living/simple_mob/shadekin/zMove(direction)
	if(ability_flags & AB_PHASE_SHIFTED)
		var/turf/destination = (direction == UP) ? GetAbove(src) : GetBelow(src)
		if(destination)
			forceMove(destination)
		return TRUE

	return ..()

// Healing others
/mob/living/simple_mob/shadekin/proc/mend_other()
	//I hate to crunch a view() but I only want ones I can see
	var/list/viewed = oview(1)
	var/list/targets = list()
	for(var/mob/living/L in viewed)
		targets += L
	if(!targets.len)
		to_chat(src,span_warning("Nobody nearby to mend!"))
		return FALSE

	var/mob/living/target = tgui_input_list(src,"Pick someone to mend:","Mend Other", targets)
	if(!target)
		return FALSE

	target.add_modifier(/datum/modifier/shadekin/heal_boop,1 MINUTE)
	visible_message(span_notice("\The [src] gently places a hand on \the [target]..."))
	face_atom(target)
	return TRUE


//CHOMPEdit Begin - Add dark portal creation
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
			to_chat(src, "<span class='warning'>A tunnel to the Dark will not function in this area.</span>")

		//Anchored objects or no space
		if(SHELTER_DEPLOY_BAD_TURFS, SHELTER_DEPLOY_ANCHORED_OBJECTS)
			var/width = template.width
			var/height = template.height
			to_chat(src, "<span class='warning'>There is not enough open area for a tunnel to the Dark to form! You need to clear a [width]x[height] area!</span>")

	if(status != SHELTER_DEPLOY_ALLOWED)
		return FALSE

	var/turf/T = deploy_location
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.attach(T)
	smoke.set_up(10, 0, T)
	smoke.start()

	src.visible_message("<span class='notice'>[src] begins pulling dark energies around themselves.</span>")
	if(do_after(src, 600)) //60 seconds
		playsound(src, 'sound/effects/phasein.ogg', 100, 1)
		src.visible_message("<span class='notice'>[src] finishes pulling dark energies around themselves, creating a portal.</span>")

		log_and_message_admins("[key_name_admin(src)] created a tunnel to the dark at [get_area(T)]!")
		template.annihilate_plants(deploy_location)
		template.load(deploy_location, centered = TRUE)
		template.update_lighting(deploy_location)
		ability_flags &= AB_DARK_TUNNEL
		return TRUE
	else
		return FALSE
//CHOMPEdit End

//CHOMPEdit Begin - Add Dark Maw
/mob/living/simple_mob/shadekin/proc/dark_maw()
	var/turf/T = get_turf(src)
	if(!istype(T))
		to_chat(src, "<span class='warning'>You don't seem to be able to set a trap here!</span>")
		return FALSE
	else if(T.get_lumcount() >= 0.5)
		to_chat(src, "<span class='warning'>There is too much light here for your trap to last!</span>")
		return FALSE

	if(do_after(src, 10))
		if(ability_flags & AB_PHASE_SHIFTED)
			new /obj/effect/abstract/dark_maw(loc, src, 1)
		else
			new /obj/effect/abstract/dark_maw(loc, src)

		return TRUE
	else
		return FALSE
//CHOMPEdit End
