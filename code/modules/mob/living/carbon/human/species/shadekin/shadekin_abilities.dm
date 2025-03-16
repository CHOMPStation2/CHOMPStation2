/datum/power/shadekin

/mob/living/carbon/human/is_incorporeal()
	if(ability_flags & AB_PHASE_SHIFTED) //Shadekin
		return TRUE
	return ..()

/////////////////////
///  PHASE SHIFT  ///
/////////////////////
//Visual effect for phase in/out
/obj/effect/temp_visual/shadekin
	randomdir = FALSE
	duration = 5
	icon = 'icons/mob/vore_shadekin.dmi'

/obj/effect/temp_visual/shadekin/phase_in
	icon_state = "tp_in"

/obj/effect/temp_visual/shadekin/phase_out
	icon_state = "tp_out"

/datum/power/shadekin/phase_shift
	name = "Phase Shift (100)"
	desc = "Shift yourself out of alignment with realspace to travel quickly to different areas."
	verbpath = /mob/living/carbon/human/proc/phase_shift
	ability_icon_state = "tech_passwall"

/mob/living/carbon/human/proc/phase_shift()
	set name = "Phase Shift (100)"
	set desc = "Shift yourself out of alignment with realspace to travel quickly to different areas."
	set category = "Abilities.Shadekin"
	/* //CHOMPEdit - Moved below //RS Port #658 Start
	var/area/A = get_area(src)
	if(!client?.holder && A.flag_check(AREA_BLOCK_PHASE_SHIFT))
		to_chat(src, span_warning("You can't do that here!"))
		return
	//RS Port #658 End
	*/ //CHOMPEdit End
	var/ability_cost = 100

	var/darkness = 1
	var/turf/T = get_turf(src)
	if(!T)
		to_chat(src,span_warning("You can't use that here!"))
		return FALSE
	if((get_area(src).flags & PHASE_SHIELDED))	//CHOMPEdit Start - Mapping tools to control phasing
		to_chat(src,span_warning("This area is preventing you from phasing!"))
		return FALSE
	//RS Port #658 Start
	var/area/A = get_area(src)
	if(!client?.holder && A.flag_check(AREA_BLOCK_PHASE_SHIFT))
		to_chat(src, span_warning("You can't do that here!"))
		return FALSE
	//RS Port #658 End //CHOMPEdit End

	if(ability_flags & AB_PHASE_SHIFTING)
		return FALSE

	var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
	darkness = 1-brightness //Invert

	var/watcher = 0
	//CHOMPEdit Start - Nerf to phasing
	for(var/thing in orange(7, src))
		if(istype(thing, /mob/living/carbon/human))
			var/mob/living/carbon/human/watchers = thing
			if((watchers in oviewers(7,src)) && watchers.species != SPECIES_SHADEKIN)	// And they can see us... (And aren't themselves a shadekin)
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
					watcher++	//CHOMPEdit End - The camera is watching us!


	ability_cost = CLAMP(ability_cost/(0.01+darkness*2),50, 80)//This allows for 1 watcher in full light
	if(watcher>0)
		ability_cost = ability_cost + ( 15 * watcher )
	if(!(ability_flags & AB_PHASE_SHIFTED))
		log_debug("[src] attempted to shift with [watcher] observers with a  cost of [ability_cost] in a darkness level of [darkness]") //CHOMPEdit Start - More clear phase info.
	// inform about the observers affecting phasing
	if(darkness<=0.4 && watcher>=2)
		to_chat(src, span_warning("You have a few observers in a well-lit area! This may prevent phasing. (Working cameras count towards observers)"))
	else if(watcher>=3)
		to_chat(src, span_warning("You have a large number of observers! This may prevent phasing. (Working cameras count towards observers)")) //CHOMPEdit End


	var/datum/species/shadekin/SK = species
	/* if(!istype(SK)) //CHOMPEdit Removal - Moved to shadekin_ability_check
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE
	else if(stat)
		to_chat(src, span_warning("Can't use that ability in your state!")) */ //CHOMPEdit End
	if(!shadekin_ability_check())
		return FALSE
	// Prevent bugs when spamming phase button
	else if(SK.doing_phase)
		to_chat(src, span_warning("You are already trying to phase!"))
		return FALSE

	else if(shadekin_get_energy() < ability_cost && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, span_warning("Not enough energy for that ability!"))
		return FALSE

	if(!(ability_flags & AB_PHASE_SHIFTED))
		shadekin_adjust_energy(-ability_cost)
	playsound(src, 'sound/effects/stealthoff.ogg', 75, 1)

	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,span_warning("You can't use that here!"))
		return FALSE

	SK.doing_phase = TRUE // Prevent bugs when spamming phase button
	//Shifting in
	if(ability_flags & AB_PHASE_SHIFTED)
		phase_in(T)
	//Shifting out
	else
		phase_out(T)
	SK.doing_phase = FALSE // Prevent bugs when spamming phase button


/mob/living/carbon/human/proc/phase_in(var/turf/T)
	if(ability_flags & AB_PHASE_SHIFTED)

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

		// change
		canmove = FALSE
		ability_flags &= ~AB_PHASE_SHIFTED
		ability_flags |= AB_PHASE_SHIFTING
		throwpass = FALSE
		name = get_visible_name()
		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = initial(B.escapable)

		//cut_overlays()
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		see_invisible_default = initial(see_invisible_default) //CHOMPEdit Add - Allow seeing phased entities while phased. (Port upstream)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)
		can_pull_size = initial(can_pull_size) //CHOMPEdit Start - Resetting pull ability after phasing back in (Port upstream)
		can_pull_mobs = initial(can_pull_mobs)
		hovering = initial(hovering) //CHOMPEdit End
		update_icon()

		//Cosmetics mostly
		var/obj/effect/temp_visual/shadekin/phase_in/phaseanim = new /obj/effect/temp_visual/shadekin/phase_in(src.loc)
		phaseanim.pixel_y = (src.size_multiplier - 1) * 16 // Pixel shift for the animation placement
		phaseanim.adjust_scale(src.size_multiplier, src.size_multiplier)
		phaseanim.dir = dir
		alpha = 0
		automatic_custom_emote(VISIBLE_MESSAGE,"phases in!")

		addtimer(CALLBACK(src, PROC_REF(shadekin_complete_phase_in), original_canmove), 5, TIMER_DELETE_ME)

/mob/living/carbon/human/proc/shadekin_complete_phase_in(var/original_canmove)
	var/datum/species/shadekin/SK = species //CHOMPEdit Add - Eye check. (Port upstream)
	canmove = original_canmove
	alpha = initial(alpha)
	remove_modifiers_of_type(/datum/modifier/shadekin_phase_vision)
	remove_modifiers_of_type(/datum/modifier/shadekin_phase) //CHOMPEdit Add - Shadekin probably shouldn't be hit while phasing (Port upstream)

	//Potential phase-in vore
	if(can_be_drop_pred || can_be_drop_prey) //Toggleable in vore panel //CHOMPEdit Start - Dropprey and phasevore checks. (Port upstream when possible)
		var/list/potentials = living_mobs(0)
		if(potentials.len)
			var/mob/living/target = pick(potentials)
			if(can_be_drop_pred && istype(target) && target.devourable && target.can_be_drop_prey && target.phase_vore && vore_selected && phase_vore)
				target.forceMove(vore_selected)
				to_chat(target, span_vwarning("\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!"))
				to_chat(src, span_vwarning("You phase around [target], [vore_selected.vore_verb]ing them into your [vore_selected.name]!"))
			else if(can_be_drop_prey && istype(target) && devourable && target.can_be_drop_pred && target.phase_vore && target.vore_selected && phase_vore)
				forceMove(target.vore_selected)
				to_chat(target, span_vwarning("\The [src] phases into you, [target.vore_selected.vore_verb]ing them into your [target.vore_selected.name]!"))
				to_chat(src, span_vwarning("You phase into [target], having them [target.vore_selected.vore_verb] you into their [target.vore_selected.name]!")) //CHOMPEdit End - Dropprey and phasevore checks.

	ability_flags &= ~AB_PHASE_SHIFTING

	//Affect nearby lights
	var/destroy_lights = 0

	//CHOMPEdit Start - Add back light destruction & gentle phasing (Port upstream but replace with my variable toggle for full 100% control over chance, color, etc ~Diana)
	if(SK.get_shadekin_eyecolor(src) == RED_EYES)
		destroy_lights = 80
	else if(SK.get_shadekin_eyecolor(src) == PURPLE_EYES)
		destroy_lights = 25

	// Add gentle phasing
	if(SK.phase_gentle) // gentle case: No light destruction. Flicker in 4 tile radius once.
		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 4)
				continue
			L.flicker(1)
		Stun(1)
	else //CHOMPEdit End
		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue

			if(prob(destroy_lights))
				addtimer(CALLBACK(L, TYPE_PROC_REF(/obj/machinery/light, broken)), rand(5,25), TIMER_DELETE_ME)
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

		var/list/allowed_implants = list( //CHOMPEdit Start - Implant dropping
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
		//CHOMPEdit End
		// change
		ability_flags |= AB_PHASE_SHIFTED
		ability_flags |= AB_PHASE_SHIFTING
		throwpass = TRUE
		automatic_custom_emote(VISIBLE_MESSAGE,"phases out!")
		name = get_visible_name()

		//CHOMPEdit Start - Unequipping slots when phasing in, and preventing pulling stuff while phased.
		if(l_hand)
			unEquip(l_hand)
		if(r_hand)
			unEquip(r_hand)
		if(back)
			unEquip(back)

		can_pull_size = 0
		can_pull_mobs = MOB_PULL_NONE
		hovering = TRUE
		//CHOMPEdit End
		for(var/obj/belly/B as anything in vore_organs)
			B.escapable = FALSE

		var/obj/effect/temp_visual/shadekin/phase_out/phaseanim = new /obj/effect/temp_visual/shadekin/phase_out(src.loc)
		phaseanim.pixel_y = (src.size_multiplier - 1) * 16 // Pixel shift for the animation placement
		phaseanim.adjust_scale(src.size_multiplier, src.size_multiplier)
		phaseanim.dir = dir
		alpha = 0
		add_modifier(/datum/modifier/shadekin_phase_vision)
		add_modifier(/datum/modifier/shadekin_phase) //CHOMPEdit Add - Shadekin probably shouldn't be hit while phasing
		sleep(5)
		invisibility = INVISIBILITY_SHADEKIN
		see_invisible = INVISIBILITY_SHADEKIN
		see_invisible_default = INVISIBILITY_SHADEKIN // Allow seeing phased entities while phased.
		//cut_overlays()
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE
		ability_flags &= ~AB_PHASE_SHIFTING


/datum/modifier/shadekin_phase_vision
	name = "Shadekin Phase Vision"
	vision_flags = SEE_THRU

//////////////////////////
///  REGENERATE OTHER  ///
//////////////////////////
/datum/power/shadekin/regenerate_other
	name = "Regenerate Other (50)"
	desc = "Spend energy to heal physical wounds in another creature."
	verbpath = /mob/living/carbon/human/proc/regenerate_other
	ability_icon_state = "tech_biomedaura"

/mob/living/carbon/human/proc/regenerate_other()
	set name = "Regenerate Other (50)"
	set desc = "Spend energy to heal physical wounds in another creature."
	set category = "Abilities.Shadekin"

	var/ability_cost = 50

	/* CHOMPEdit Start - general shadekin ability check
	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE
	else if(stat)
		to_chat(src, span_warning("Can't use that ability in your state!"))
		return FALSE
	//CHOMPEdit Start - Dark Respite
	else if((ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite)) && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, span_warning("You can't use that so soon after an emergency warp!"))
		return FALSE
	*/
	if(!shadekin_ability_check())
		return FALSE
		//CHOMPEdit End
	else if(shadekin_get_energy() < ability_cost)
		to_chat(src, span_warning("Not enough energy for that ability!"))
		return FALSE
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, span_warning("You can't use that while phase shifted!"))
		return FALSE

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
	playsound(src, 'sound/effects/EMPulse.ogg', 75, 1)
	shadekin_adjust_energy(-ability_cost)
	visible_message(span_notice("\The [src] gently places a hand on \the [target]..."))
	face_atom(target)
	return TRUE

/datum/modifier/shadekin/heal_boop
	name = "Shadekin Regen"
	desc = "You feel serene and well rested."
	mob_overlay_state = "green_sparkles"

	on_created_text = span_notice("Sparkles begin to appear around you, and all your ills seem to fade away.")
	on_expired_text = span_notice("The sparkles have faded, although you feel much healthier than before.")
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/shadekin/heal_boop/tick()
	if(!holder.getBruteLoss() && !holder.getFireLoss() && !holder.getToxLoss() && !holder.getOxyLoss() && !holder.getCloneLoss()) // No point existing if the spell can't heal.
		expire()
		return
	holder.adjustBruteLoss(-2)
	holder.adjustFireLoss(-2)
	holder.adjustToxLoss(-2)
	holder.adjustOxyLoss(-2)
	holder.adjustCloneLoss(-2)


//////////////////////
///  CREATE SHADE  ///
//////////////////////
/datum/power/shadekin/create_shade
	name = "Create Shade (25)"
	desc = "Create a field of darkness that follows you."
	verbpath = /mob/living/carbon/human/proc/create_shade
	ability_icon_state = "tech_dispelold"

/mob/living/carbon/human/proc/create_shade()
	set name = "Create Shade (25)"
	set desc = "Create a field of darkness that follows you."
	set category = "Abilities.Shadekin"

	var/ability_cost = 25

	/* CHOMPEdit Start - general shadekin ability check
	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, span_warning("Only a shadekin can use that!"))
		return FALSE
	else if(stat)
		to_chat(src, span_warning("Can't use that ability in your state!"))
		return FALSE
	//CHOMPEdit Start - Dark Respite
	else if((ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite)) && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, span_warning("You can't use that so soon after an emergency warp!"))
		return FALSE
	*/
	if(!shadekin_ability_check())
		return FALSE
		//CHOMPEdit End
	else if(shadekin_get_energy() < ability_cost)
		to_chat(src, span_warning("Not enough energy for that ability!"))
		return FALSE
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, span_warning("You can't use that while phase shifted!"))
		return FALSE

	playsound(src, 'sound/effects/bamf.ogg', 75, 1)

	add_modifier(/datum/modifier/shadekin/create_shade,20 SECONDS)
	shadekin_adjust_energy(-ability_cost)
	return TRUE

/datum/modifier/shadekin/create_shade
	name = "Shadekin Shadegen"
	desc = "Darkness envelops you."
	mob_overlay_state = ""

	on_created_text = span_notice("You drag part of The Dark into realspace, enveloping yourself.")
	on_expired_text = span_warning("You lose your grasp on The Dark and realspace reasserts itself.")
	stacks = MODIFIER_STACK_EXTEND
	var/mob/living/simple_mob/shadekin/my_kin

/datum/modifier/shadekin/create_shade/tick()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		expire()

/datum/modifier/shadekin/create_shade/on_applied()
	my_kin = holder
	holder.glow_toggle = TRUE
	holder.glow_range = 8
	holder.glow_intensity = -10
	holder.glow_color = "#FFFFFF"
	holder.set_light(8, -10, "#FFFFFF")

/datum/modifier/shadekin/create_shade/on_expire()
	holder.glow_toggle = initial(holder.glow_toggle)
	holder.glow_range = initial(holder.glow_range)
	holder.glow_intensity = initial(holder.glow_intensity)
	holder.glow_color = initial(holder.glow_color)
	holder.set_light(0)
	my_kin = null

// force dephase proc, to be called by other procs to dephase the shadekin. T is the target to force dephase them to.
/mob/living/carbon/human/proc/attack_dephase(var/turf/T = null, atom/dephaser)
	var/datum/species/shadekin/SK = species

	// no assigned dephase-target, just use our own
	if(!T)
		T = get_turf(src)

	// make sure it's possible to be dephased (and we're in phase)
	if(!istype(SK) || SK.doing_phase || !T.CanPass(src,T) || loc != T || !(ability_flags & AB_PHASE_SHIFTED) )
		return FALSE


	log_admin("[key_name_admin(src)] was stunned out of phase at [T.x],[T.y],[T.z] by [dephaser.name], last touched by [dephaser.fingerprintslast].")
	message_admins("[key_name_admin(src)] was stunned out of phase at [T.x],[T.y],[T.z] by [dephaser.name], last touched by [dephaser.fingerprintslast]. (<A href='byond://?_src_=holder;[HrefToken()];adminplayerobservecoodjump=1;X=[T.x];Y=[T.y];Z=[T.z]'>JMP</a>)", 1)
	// start the dephase
	phase_in(T)
	shadekin_adjust_energy(-20) // loss of energy for the interception
	// apply a little extra stun for good measure
	src.Weaken(3)
