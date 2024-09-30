/mob/living/carbon/human/proc/phase_shift()
	set name = "Phase Shift (100)"
	set desc = "Shift yourself out of alignment with realspace to travel quickly to different areas."
	set category = "Abilities.Shadekin" //ChompEDIT - TGPanel

	var/ability_cost = 100

	var/darkness = 1
	var/turf/T = get_turf(src)
	if(!T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE
	if((get_area(src).flags & PHASE_SHIELDED))	//CHOMPAdd - Mapping tools to control phasing
		to_chat(src,"<span class='warning'>This area is preventing you from phasing!</span>")
		return FALSE

	if(ability_flags & AB_PHASE_SHIFTING)
		return FALSE

	var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
	darkness = 1-brightness //Invert

	var/watcher = 0
	//Chompedit start - Nerf to phasing
	for(var/thing in orange(7, src))
		if(istype(thing, /mob/living/carbon/human))
			var/mob/living/carbon/human/watchers = thing
			if(watchers in oviewers(7,src) && watchers.species != SPECIES_SHADEKIN)	// And they can see us... //CHOMPEDIT - (And aren't themselves a shadekin)
				if(!(watchers.stat) && !isbelly(watchers.loc) && !istype(watchers.loc, /obj/item/holder))	// And they are alive and not being held by someone...
					watcher++	// They are watching us!
		else if(istype(thing, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/watchers = thing
			if(watchers in oviewers(7,src))
				if(!watchers.stat && !isbelly(watchers.loc))
					watcher++	//The robot is watching us!
		else if(istype(thing, /obj/machinery/camera))
			var/obj/machinery/camera/watchers = thing
			if(watchers.can_use())
				if(src in watchers.can_see())
					watcher++	//The camera is watching us!
	//CHOMPedit end


	ability_cost = CLAMP(ability_cost/(0.01+darkness*2),50, 80)//This allows for 1 watcher in full light
	if(watcher>0)
		ability_cost = ability_cost + ( 15 * watcher )
	if(!(ability_flags & AB_PHASE_SHIFTED))
		log_debug("[src] attempted to shift with [watcher] observers with a  cost of [ability_cost] in a darkness level of [darkness]")
	//CHOMPEdit start - inform about the observers affecting phasing
	if(darkness<=0.4 && watcher>=2)
		to_chat(src, "<span class='warning'>You have a few observers in a well-lit area! This may prevent phasing. (Working cameras count towards observers)</span>")
	else if(watcher>=3)
		to_chat(src, "<span class='warning'>You have a large number of observers! This may prevent phasing. (Working cameras count towards observers)</span>")
	//CHOMPEdit end


	var/datum/species/shadekin/SK = species
	/* CHOMPEdit start - general shadekin ability check
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE
	else if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	//CHOMPEdit Start - Dark Respite
	else if((ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite)) && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, "<span class='warning'>You can't use that so soon after an emergency warp!</span>")
		return FALSE
	*/
	if(!shadekin_ability_check())
		return FALSE
		//CHOMPEdit End
	//CHOMPEdit Start - Prevent bugs when spamming phase button
	else if(SK.doing_phase)
		to_chat(src, "<span class='warning'>You are already trying to phase!</span>")
		return FALSE
	//CHOMPEdit End

	else if(shadekin_get_energy() < ability_cost && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, "<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE

	if(!(ability_flags & AB_PHASE_SHIFTED))
		shadekin_adjust_energy(-ability_cost)
	playsound(src, 'sound/effects/stealthoff.ogg', 75, 1)

	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE


	SK.doing_phase = TRUE //CHOMPEdit - Prevent bugs when spamming phase button
	//Shifting in
	if(ability_flags & AB_PHASE_SHIFTED)
		phase_in(T)
	//Shifting out
	else
		phase_out(T)
	SK.doing_phase = FALSE //CHOMPEdit - Prevent bugs when spamming phase button



/mob/living/carbon/human/proc/phase_in(var/turf/T)
	if(ability_flags & AB_PHASE_SHIFTED)
		var/datum/species/shadekin/SK = species

		// pre-change
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

		// change
		ability_flags &= ~AB_PHASE_SHIFTED
		ability_flags |= AB_PHASE_SHIFTING
		mouse_opacity = 1
		name = get_visible_name()
		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = initial(B.escapable)

		//cut_overlays()
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		see_invisible_default = initial(see_invisible_default) // CHOMPEdit - Allow seeing phased entities while phased.
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)
		//CHOMPEdit begin - resetting pull ability after phasing back in
		can_pull_size = initial(can_pull_size)
		can_pull_mobs = initial(can_pull_mobs)
		hovering = initial(hovering)
		//CHOMPEdit end
		update_icon()

		//Cosmetics mostly
		var/obj/effect/temp_visual/shadekin/phase_in/phaseanim = new /obj/effect/temp_visual/shadekin/phase_in(src.loc)
		phaseanim.pixel_y = (src.size_multiplier - 1) * 16 // Pixel shift for the animation placement
		phaseanim.adjust_scale(src.size_multiplier, src.size_multiplier)
		phaseanim.dir = dir
		alpha = 0
		custom_emote(1,"phases in!")
		sleep(5) //The duration of the TP animation
		canmove = original_canmove
		alpha = initial(alpha)
		remove_modifiers_of_type(/datum/modifier/shadekin_phase_vision)
		remove_modifiers_of_type(/datum/modifier/shadekin_phase) //CHOMPEdit - Shadekin probably shouldn't be hit while phasing

		//Potential phase-in vore
		if(can_be_drop_pred || can_be_drop_prey) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(can_be_drop_pred && istype(target) && target.devourable && target.can_be_drop_prey && target.phase_vore && vore_selected && phase_vore)
					target.forceMove(vore_selected)
					to_chat(target, "<span class='vwarning'>\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!</span>")
					to_chat(src, "<span class='vwarning'>You phase around [target], [vore_selected.vore_verb]ing them into your [vore_selected.name]!</span>")
				else if(can_be_drop_prey && istype(target) && devourable && target.can_be_drop_pred && target.phase_vore && target.vore_selected && phase_vore)
					forceMove(target.vore_selected)
					to_chat(target, "<span class='vwarning'>\The [src] phases into you, [target.vore_selected.vore_verb]ing them into your [target.vore_selected.name]!</span>")
					to_chat(src, "<span class='vwarning'>You phase into [target], having them [target.vore_selected.vore_verb] you into their [target.vore_selected.name]!</span>")

		ability_flags &= ~AB_PHASE_SHIFTING

		//Affect nearby lights
		var/destroy_lights = 0

		//CHOMPEdit start - Add back light destruction
		if(SK.get_shadekin_eyecolor(src) == RED_EYES)
			destroy_lights = 80
		else if(SK.get_shadekin_eyecolor(src) == PURPLE_EYES)
			destroy_lights = 25
		//CHOMPEdit end

		//CHOMPEdit start - Add gentle phasing
		if(SK.phase_gentle) // gentle case: No light destruction. Flicker in 4 tile radius once.
			for(var/obj/machinery/light/L in machines)
				if(L.z != z || get_dist(src,L) > 4)
					continue
				L.flicker(1)
			src.Stun(1)
		else
			//CHOMPEdit end
			for(var/obj/machinery/light/L in machines)
				if(L.z != z || get_dist(src,L) > 10)
					continue

				if(prob(destroy_lights))
					spawn(rand(5,25))
						L.broken()
				else
					L.flicker(10)

/mob/living/carbon/human/proc/phase_out(var/turf/T)
	if(!(ability_flags & AB_PHASE_SHIFTED))
		// pre-change
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

		//CHOMPAdd Start
		var/list/allowed_implants = list(
			/obj/item/implant/sizecontrol,
			/obj/item/implant/compliance,
		)
		for(var/obj/item/organ/external/organ in organs)
			for(var/obj/item/O in organ.implants)
				if(is_type_in_list(O, allowed_implants))
					continue
				if(O == nif)
					nif.unimplant(src)
				O.forceMove(drop_location())
				organ.implants -= O
		if(!has_embedded_objects())
			clear_alert("embeddedobject")
		//CHOMPAdd End

		// change
		ability_flags |= AB_PHASE_SHIFTED
		ability_flags |= AB_PHASE_SHIFTING
		mouse_opacity = 0
		custom_emote(1,"phases out!")
		name = get_visible_name()

		//CHOMPEdit begin - Unequipping slots when phasing in, and preventing pulling stuff while phased.
		if(l_hand)
			unEquip(l_hand)
		if(r_hand)
			unEquip(r_hand)
		if(back)
			unEquip(back)

		can_pull_size = 0
		can_pull_mobs = MOB_PULL_NONE
		hovering = TRUE
		//CHOMPEdit end

		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = FALSE

		var/obj/effect/temp_visual/shadekin/phase_out/phaseanim = new /obj/effect/temp_visual/shadekin/phase_out(src.loc)
		phaseanim.pixel_y = (src.size_multiplier - 1) * 16 // Pixel shift for the animation placement
		phaseanim.adjust_scale(src.size_multiplier, src.size_multiplier)
		phaseanim.dir = dir
		alpha = 0
		add_modifier(/datum/modifier/shadekin_phase_vision)
		add_modifier(/datum/modifier/shadekin_phase) //CHOMPEdit - Shadekin probably shouldn't be hit while phasing
		sleep(5)
		invisibility = INVISIBILITY_SHADEKIN
		see_invisible = INVISIBILITY_SHADEKIN
		see_invisible_default = INVISIBILITY_SHADEKIN // CHOMPEdit - Allow seeing phased entities while phased.
		//cut_overlays()
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE
		ability_flags &= ~AB_PHASE_SHIFTING

//CHOMPEdit start - force dephase proc, to be called by other procs to dephase the shadekin. T is the target to force dephase them to.
/mob/living/carbon/human/proc/attack_dephase(var/turf/T = null, atom/dephaser)
	var/datum/species/shadekin/SK = species

	// no assigned dephase-target, just use our own
	if(!T)
		T = get_turf(src)

	// make sure it's possible to be dephased (and we're in phase)
	if(!istype(SK) || SK.doing_phase || !T.CanPass(src,T) || loc != T || !(ability_flags & AB_PHASE_SHIFTED) )
		return FALSE


	log_admin("[key_name_admin(src)] was stunned out of phase at [T.x],[T.y],[T.z] by [dephaser.name], last touched by [dephaser.fingerprintslast].")
	message_admins("[key_name_admin(src)] was stunned out of phase at [T.x],[T.y],[T.z] by [dephaser.name], last touched by [dephaser.fingerprintslast]. (<A HREF='?_src_=holder;[HrefToken()];adminplayerobservecoodjump=1;X=[T.x];Y=[T.y];Z=[T.z]'>JMP</a>)", 1)
	// start the dephase
	phase_in(T)
	shadekin_adjust_energy(-20) // loss of energy for the interception
	// apply a little extra stun for good measure
	src.Weaken(3)

//CHOMPEdit start - gentle phasing for carbonkin
//toggle proc for toggling gentle/normal phasing
/mob/living/carbon/human/proc/phase_strength_toggle()
	set name = "Toggle Phase Strength"
	set desc = "Toggle strength of phase. Gentle but slower, or faster but destructive to lights."
	set category = "Abilities.Shadekin" //ChompEDIT - TGPanel

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE

	if(SK.phase_gentle)
		to_chat(src, "<span class='notice'>Phasing toggled to Normal. You may damage lights.</span>")
		SK.phase_gentle = 0
	else
		to_chat(src, "<span class='notice'>Phasing toggled to Gentle. You won't damage lights, but concentrating on that incurs a short stun.</span>")
		SK.phase_gentle = 1
//CHOMPEdit End
