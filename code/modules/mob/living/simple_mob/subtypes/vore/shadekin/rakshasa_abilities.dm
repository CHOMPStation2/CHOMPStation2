/mob/living/simple_mob/shadekin/Initialize(mapload)
	var/list/ability_types = subtypesof(/obj/effect/shadekin_ability)
	if(name == "Rakshasa")
		ability_types += subtypesof(/obj/effect/rakshasa_ability)
	shadekin_abilities = list()
	for(var/type in ability_types)
		shadekin_abilities += new type(src)

	update_icon()

	return ..()


/obj/effect/rakshasa_ability
	name = ""
	desc = ""
	icon = 'icons/mob/screen_spells.dmi'
	var/ability_name = "FIX ME"
	var/cost = 50
	var/mob/living/simple_mob/shadekin/my_kin
	var/shift_mode = NOT_WHILE_SHIFTED
	var/ab_sound

/obj/effect/rakshasa_ability/Initialize(mapload)
	. = ..()
	my_kin = loc
	if(!istype(my_kin))
		return INITIALIZE_HINT_QDEL
	loc = null

/obj/effect/rakshasa_ability/Destroy()
	my_kin = null
	return ..()

/obj/effect/rakshasa_ability/proc/atom_button_text()
	var/shift_denial

	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Physical Only"
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Shifted Only"

	if(shift_denial)
		name = shift_denial
	else
		name = my_kin.energy >= cost ? "Activate" : "No Energy"
	return src

/obj/effect/rakshasa_ability/Click(var/location, var/control, var/params)
	if(my_kin.stat) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(my_kin,span_notice("<b>[name]</b> (Cost: [cost]%) - [desc]"))
	else
		do_ability(my_kin)

/obj/effect/rakshasa_ability/proc/do_ability()
	if(my_kin.stat)
		to_chat(my_kin,span_warning("Can't use that ability in your state!"))
		return FALSE
	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,span_warning("Can't use that ability while phase shifted!"))
		return FALSE
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,span_warning("Can only use that ability while phase shifted!"))
		return FALSE
	else if(my_kin.energy < cost)
		to_chat(my_kin,span_warning("Not enough energy for that ability!"))
		return FALSE

	my_kin.energy -= cost
	if(ab_sound)
		playsound(src,ab_sound,75,1)

	return TRUE




/obj/effect/rakshasa_ability/phase_shift2
	ability_name = "Goo Shift"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift2/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.rakshasa_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		playsound(my_kin.loc, 'sound/rakshasa/Emerge0.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/phase_shift3
	ability_name = "Goo Shift No Emerge"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift3/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.rakshasa_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/phase_shift4
	ability_name = "Stealth Shift"
	desc = "Stealthy. No light effects, no goo."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift4/do_ability()
	if(!..())
		return
	my_kin.stealth_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
	else
		cost = initial(cost)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/drip_oil
	ability_name = "Goo Drip"
	desc = "Drip some goo."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/drip_oil/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
	var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/laugh
	ability_name = "Laugh"
	desc = "Laugh."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/laugh/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/Laugh.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/no
	ability_name = "Say No"
	desc = "Say no!"
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/no/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/No.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/emergesound
	ability_name = "Heavy Breathing"
	desc = "Heavy Breathing."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/emergesound/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/Breath1.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/trapsound
	ability_name = "Raspy Breathing"
	desc = "Raspy Breathing."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/trapsound/do_ability()
	if(!..())
		return
	var/goo_sounds = list (
			'sound/rakshasa/Breath2.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/dripsound
	ability_name = "Goop Drip Sound"
	desc = "Do the drip sound without actually dripping."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/dripsound/do_ability()
	if(!..())
		return
	var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg',
			'sound/rakshasa/Corrosion1.ogg',
			'sound/rakshasa/Corrosion2.ogg',
			'sound/rakshasa/Corrosion3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)

/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/trap
	ability_name = "Lay Trap"
	desc = "Lay a trap that will notify you when someone steps in it."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/trap/do_ability()
	if(!..())
		return
	var/goo_sounds = list (
			'sound/rakshasa/Corrosion1.ogg',
			'sound/rakshasa/Corrosion2.ogg',
			'sound/rakshasa/Corrosion3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
	new /obj/structure/gootrap (my_kin.loc)

/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/flicker
	ability_name = "Flicker Lights"
	desc = "Flicker the lights."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/flicker/do_ability()
	if(!..())
		return
	my_kin.rakshasa_flicker()


////////////////////////////////////////////////////////////////
//PROCS
//PHASE SHIFTING
////////////////////////////////////////////////////////////////
//Rakshasa's phase shifts are now more stealthy. No announcement on them phasing in or out. Also, an extra phaseshift with no lights flickering. For flavor. There's probably a better way of doing this, butt fuck it.
/mob/living/simple_mob/shadekin/proc/rakshasa_shift()
	var/turf/T = get_turf(src)
	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,span_warning("You can't use that here!"))
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
		name = real_name
		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = initial(B.escapable)

		overlays.Cut()
		alpha = initial(alpha)
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)

		//Cosmetics mostly
		flick("tp_in",src)
		sleep(5) //The duration of the TP animation
		canmove = original_canmove

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && target.devourable && target.can_be_drop_prey && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,span_warning("\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!"))

		// Do this after the potential vore, so we get the belly
		update_icon()

		//Affect nearby lights
		for(var/obj/machinery/light/L in GLOB.machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue
			L.flicker(10)

//Shifting out
	else
		ability_flags |= AB_PHASE_SHIFTED
		real_name = name
		name = "Something"

		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = FALSE

		overlays.Cut()
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


////////////////////////////////////////////////////////////////
/mob/living/simple_mob/shadekin/proc/stealth_shift()
	var/turf/T = get_turf(src)
	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,span_warning("You can't use that here!"))
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
		name = real_name
		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = initial(B.escapable)

		overlays.Cut()
		alpha = initial(alpha)
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)

		//Cosmetics mostly
		flick("tp_in",src)
		sleep(5) //The duration of the TP animation
		canmove = original_canmove

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && target.devourable && target.can_be_drop_prey && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,span_warning("\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!"))

		// Do this after the potential vore, so we get the belly
		update_icon()

//Shifting out
	else
		ability_flags |= AB_PHASE_SHIFTED
		real_name = name
		name = "Something"

		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = FALSE

		overlays.Cut()
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


//LIGHT FLICKERING
////////////////////////////////////////////////////////////////
//A flicker proc. Because apparently putting this straight into the ability button doesn't work.
/mob/living/simple_mob/shadekin/proc/rakshasa_flicker()
	for(var/obj/machinery/light/L in GLOB.machines)
		if(L.z != z || get_dist(src,L) > 10)
			continue
		L.flicker(10)
