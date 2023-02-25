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
	set category = "Shadekin"

	var/ability_cost = 100

	var/darkness = 1
	var/turf/T = get_turf(src)
	if(!T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE

	var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
	darkness = 1-brightness //Invert

	var/watcher = 0
	for(var/mob/living/carbon/human/watchers in oview(7,src ))	// If we can see them...
		if(watchers in oviewers(7,src))	// And they can see us...
			if(!(watchers.stat) && !isbelly(watchers.loc) && !istype(watchers.loc, /obj/item/weapon/holder))	// And they are alive and not being held by someone...
				watcher++	// They are watching us!

	ability_cost = CLAMP(ability_cost/(0.01+darkness*2),50, 80)//This allows for 1 watcher in full light
	if(watcher>0)
		ability_cost = ability_cost + ( 15 * watcher )
	if(!(ability_flags & AB_PHASE_SHIFTED))
		log_debug("[src] attempted to shift with [watcher] visible Carbons with a  cost of [ability_cost] in a darkness level of [darkness]")


	var/datum/species/shadekin/SK = species
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
	//CHOMPEdit End
	//CHOMPEdit Start - Prevent bugs when spamming phase button
	else if(SK.doing_phase)
		to_chat(src, "<span class='warning'>You are already trying to phase!</span>")
		return FALSE
	//CHOMPEdit End

	else if(shadekin_get_energy() < ability_cost && !(ability_flags & AB_PHASE_SHIFTED))
		to_chat(src, "<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE

	//CHOMPEdit begin - restricting areas where you can phase shift
	var/area/A = T.loc
	if(A?.limit_shadekin_phasing)
		to_chat(src, "<span class='warning'>You can't use that here!</span>")
		return FALSE
	//CHOMPEdit end

	if(!(ability_flags & AB_PHASE_SHIFTED))
		shadekin_adjust_energy(-ability_cost)
	playsound(src, 'sound/effects/stealthoff.ogg', 75, 1)

	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
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

	SK.doing_phase = TRUE //CHOMPEdit - Prevent bugs when spamming phase button
	//Shifting in
	if(ability_flags & AB_PHASE_SHIFTED)
		ability_flags &= ~AB_PHASE_SHIFTED
		mouse_opacity = 1
		name = real_name
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
		phaseanim.dir = dir
		alpha = 0
		custom_emote(1,"phases in!")
		sleep(5) //The duration of the TP animation
		canmove = original_canmove
		alpha = initial(alpha)
		remove_modifiers_of_type(/datum/modifier/shadekin_phase_vision)
		remove_modifiers_of_type(/datum/modifier/shadekin_phase) //CHOMPEdit - Shadekin probably shouldn't be hit while phasing

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && target.devourable && target.can_be_drop_prey && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,"<span class='warning'>\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!</span>")

		//Affect nearby lights
		var/destroy_lights = 0

		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue

			if(prob(destroy_lights))
				spawn(rand(5,25))
					L.broken()
			else
				L.flicker(10)
	//Shifting out
	else
		ability_flags |= AB_PHASE_SHIFTED
		mouse_opacity = 0
		custom_emote(1,"phases out!")
		name = "Something"

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
		phaseanim.dir = dir
		alpha = 0
		add_modifier(/datum/modifier/shadekin_phase_vision)
		add_modifier(/datum/modifier/shadekin_phase) //CHOMPEdit - Shadekin probably shouldn't be hit while phasing
		sleep(5)
		invisibility = INVISIBILITY_LEVEL_TWO
		see_invisible = INVISIBILITY_LEVEL_TWO
		see_invisible_default = INVISIBILITY_LEVEL_TWO // CHOMPEdit - Allow seeing phased entities while phased.
		//cut_overlays()
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE
	SK.doing_phase = FALSE //CHOMPEdit - Prevent bugs when spamming phase button

//CHOMPEdit Start - Shadekin probably shouldn't be hit while phasing
/datum/modifier/shadekin_phase
	name = "Shadekin Phasing"
	evasion = 100
//CHOMPEdit End

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
	set category = "Shadekin"

	var/ability_cost = 50

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE
	else if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	//CHOMPEdit Start - Dark Respite
	else if(ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite))
		to_chat(src, "<span class='warning'>You can't use that so soon after an emergency warp!</span>")
		return FALSE
	//CHOMPEdit End
	else if(shadekin_get_energy() < ability_cost)
		to_chat(src, "<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, "<span class='warning'>You can't use that while phase shifted!</span>")
		return FALSE

	var/list/viewed = oview(1)
	var/list/targets = list()
	for(var/mob/living/L in viewed)
		targets += L
	if(!targets.len)
		to_chat(src,"<span class='warning'>Nobody nearby to mend!</span>")
		return FALSE

	var/mob/living/target = tgui_input_list(src,"Pick someone to mend:","Mend Other", targets)
	if(!target)
		return FALSE

	target.add_modifier(/datum/modifier/shadekin/heal_boop,1 MINUTE)
	playsound(src, 'sound/effects/EMPulse.ogg', 75, 1)
	shadekin_adjust_energy(-ability_cost)
	visible_message("<span class='notice'>\The [src] gently places a hand on \the [target]...</span>")
	face_atom(target)
	return TRUE

/datum/modifier/shadekin/heal_boop
	name = "Shadekin Regen"
	desc = "You feel serene and well rested."
	mob_overlay_state = "green_sparkles"

	on_created_text = "<span class='notice'>Sparkles begin to appear around you, and all your ills seem to fade away.</span>"
	on_expired_text = "<span class='notice'>The sparkles have faded, although you feel much healthier than before.</span>"
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
	set category = "Shadekin"

	var/ability_cost = 25

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE
	else if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	//CHOMPEdit Start - Dark Respite
	else if(ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite))
		to_chat(src, "<span class='warning'>You can't use that so soon after an emergency warp!</span>")
		return FALSE
	//CHOMPEdit End
	else if(shadekin_get_energy() < ability_cost)
		to_chat(src, "<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, "<span class='warning'>You can't use that while phase shifted!</span>")
		return FALSE

	playsound(src, 'sound/effects/bamf.ogg', 75, 1)

	add_modifier(/datum/modifier/shadekin/create_shade,20 SECONDS)
	shadekin_adjust_energy(-ability_cost)
	return TRUE

/datum/modifier/shadekin/create_shade
	name = "Shadekin Shadegen"
	desc = "Darkness envelops you."
	mob_overlay_state = ""

	on_created_text = "<span class='notice'>You drag part of The Dark into realspace, enveloping yourself.</span>"
	on_expired_text = "<span class='warning'>You lose your grasp on The Dark and realspace reasserts itself.</span>"
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


//CHOMPEdit Begin - Add dark portal creation
/datum/power/shadekin/dark_tunneling
	name = "Dark Tunneling (100) (Once)"
	desc = "Make a passage to the dark."
	verbpath = /mob/living/carbon/human/proc/dark_tunneling
	ability_icon_state = "minion0"

/mob/living/carbon/human/proc/dark_tunneling()
	set name = "Dark Tunneling (100) (Once)"
	set desc = "Make a passage to the dark."
	set category = "Shadekin"

	var/template_id = "dark_portal"
	var/datum/map_template/shelter/template

	var/ability_cost = 100

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE
	else if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	else if(shadekin_get_energy() < ability_cost)
		to_chat(src, "<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE
	else if(ability_flags & AB_DARK_RESPITE || has_modifier_of_type(/datum/modifier/dark_respite))
		to_chat(src, "<span class='warning'>You can't use that so soon after an emergency warp!</span>")
		return FALSE
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, "<span class='warning'>You can't use that while phase shifted!</span>")
		return FALSE
	else if(ability_flags & AB_DARK_TUNNEL)
		to_chat(src, "<span class='warning'>You have already made a tunnel to the Dark!</span>")
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
		shadekin_adjust_energy(-(ability_cost - 10)) //Leaving enough energy to actually activate the portal
		return TRUE
	else
		return FALSE

/datum/power/shadekin/dark_respite
	name = "Dark Respite (Only in Dark)"
	desc = "Focus yourself on healing any injuries sustained."
	verbpath = /mob/living/carbon/human/proc/dark_respite
	ability_icon_state = "ling_anatomic_panacea"

/mob/living/carbon/human/proc/dark_respite()
	set name = "Dark Respite (Only in Dark)"
	set desc = "Focus yourself on healing any injuries sustained."
	set category = "Shadekin"

	var/datum/species/shadekin/SK = species
	if(!istype(SK))
		to_chat(src, "<span class='warning'>Only a shadekin can use that!</span>")
		return FALSE
	else if(!istype(get_area(src), /area/shadekin))
		to_chat(src, "<span class='warning'>Can only trigger Dark Respite in the Dark!</span>")
		return FALSE
	else if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	else if(ability_flags & AB_DARK_RESPITE)
		to_chat(src, "<span class='warning'>You can't use that so soon after an emergency warp!</span>")
		return FALSE
	else if(has_modifier_of_type(/datum/modifier/dark_respite) && !SK.manual_respite)
		to_chat(src, "<span class='warning'>You cannot manually end a Dark Respite triggered by an emergency warp!</span>")
	else if(ability_flags & AB_PHASE_SHIFTED)
		to_chat(src, "<span class='warning'>You can't use that while phase shifted!</span>")
		return FALSE

	if(has_modifier_of_type(/datum/modifier/dark_respite))
		to_chat(src, "<span class='Notice'>You stop focusing the Dark on healing yourself.</span>")
		SK.manual_respite = FALSE
		remove_a_modifier_of_type(/datum/modifier/dark_respite)
		return TRUE
	to_chat(src, "<span class='Notice'>You start focusing the Dark on healing yourself. (Leave the dark or trigger the ability again to end this.)</span>")
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
