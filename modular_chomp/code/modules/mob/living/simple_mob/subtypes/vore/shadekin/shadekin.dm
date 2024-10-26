/mob/living/simple_mob/shadekin
	var/phase_gentle = 0

/mob/living/simple_mob/shadekin/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/shadekin/proc/phase_strength_toggle) //CHOMPEdit TGPanel


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
				spawn(rand(5,25))
					L.broken()
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
