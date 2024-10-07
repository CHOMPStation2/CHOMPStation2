//Place for abilities that any /mob/living/simple_mob can use. Chomp-modular located file.
/mob/living/simple_mob
	// pounce proc specific
	var/pouncing = 0 // if the user has toggled 'pounce mode' on
	var/pounce_last = 0 // time of previous pounce
	var/pounce_delay = 0 // pounce delay in game ticks
	var/pounce_speed = 1 // pounce speed in idk?? 2 kinda fast tho

	// icon handling for pounce. Has to handle a possible file change
	var/icon_state_prepounce = null //icon state for 'preparing to pounce'. Null to not use any icon.

	var/icon_pounce_cache = null // cache. If pounce icons are in different files, the procs will cache the original icon filepath here for resetting
	var/icon_pounce = null // icon filepath for pouncing (Flying through air). Null if same as original icon path.
	var/icon_state_pounce = null // icon state for pouncing (Flying through air). Null to not use any icon.
	var/icon_pounce_x = 0 // icon pixelshift x
	var/icon_pounce_y = 0 // icon pixelshift y
	var/icon_pounce_x_old = null // icon pixelshift x cache to preserve original value
	var/icon_pounce_y_old = null // icon pixelshift y cache to preserve original value

	//spitting
	var/spit_delay = 20 // maximum spit fire rate
	var/spit_last = 0
	var/icon_overlay_spit = null // spit iconstate
	var/icon_overlay_spit_pounce = null // spit while pouncing

	//speen
	var/speen_last = 0
	var/speen_delay = 80 // maximum spin spam



/mob/living/simple_mob/update_icon()
	. = ..()
	//use prepounce or pounce sprites, if any
	if(pouncing && (status_flags & LEAPING)) //pouncing, flying through the air
		if(!isnull(icon_state_pounce)) // if state is set
			icon_state = icon_state_pounce
		if(!isnull(icon_pounce)) // if icon filepath is set and not equal to pounce cache
			if(icon != icon_pounce) // prevent accidently writing the pounce icon into the icon cache
				icon_pounce_cache = icon
			icon = icon_pounce

	else if(pouncing) //pre-pouncing
		if(!isnull(icon_state_prepounce)) // if state is set
			icon_state = icon_state_prepounce
		if(!isnull(icon_pounce_cache)) // if cache is set
			icon = icon_pounce_cache
			icon_pounce_cache = null
	else if(!isnull(icon_pounce_cache)) // not pouncing at all but cache is still set
		icon = icon_pounce_cache
		icon_pounce_cache = null

	//handle pounce variant pixelshifting
	// X first
	if(icon_pounce_x) // if an offset is even assigned
		if(pouncing)
			if(status_flags & LEAPING) //Flying through air - set
				if(isnull(icon_pounce_x_old)) // only set once
					icon_pounce_x_old = pixel_x
				pixel_x = icon_pounce_x
			else //Prepouncing - reset
				if(!isnull(icon_pounce_x_old)) //only act if not already cleared
					pixel_x = icon_pounce_x_old
					icon_pounce_x_old = null

		else //Not pouncing or prepouncing - reset
			if(!isnull(icon_pounce_x_old)) //only act if not already cleared
				pixel_x = icon_pounce_x_old
				icon_pounce_x_old = null
	// Then Y
	if(icon_pounce_y) // if an offset is even assigned
		if(pouncing)
			if(status_flags & LEAPING) //Flying through air - set
				if(isnull(icon_pounce_y_old)) // only set once
					icon_pounce_y_old = pixel_y
				pixel_y = icon_pounce_y
			else //Prepouncing - reset
				if(!isnull(icon_pounce_y_old)) //only act if not already cleared
					pixel_y = icon_pounce_y_old
					icon_pounce_y_old = null

		else //Not pouncing or prepouncing - reset
			if(!isnull(icon_pounce_y_old)) //only act if not already cleared
				pixel_y = icon_pounce_y_old
				icon_pounce_y_old = null

	// show spitting warning overlay, if any
	if(spitting)
		var/spiticon = null
		if(!isnull(icon_overlay_spit) && (icon_state == icon_living))
			spiticon = icon_overlay_spit
		else if(!isnull(icon_overlay_spit_pounce) && (icon_state == icon_state_prepounce))
			spiticon = icon_overlay_spit_pounce

		if(spiticon)
			var/image/I = image(icon, spiticon)
			I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
			I.plane = MOB_PLANE
			I.layer = MOB_LAYER
			add_overlay(I)

// Pouncing procs.
// Pouncing consists of a series of functions:
// > A user-toggleable enable or disable to 'pounce' or not pounce; "pouncing" toggled by a verb
// > When enabled, just click somewhere not adjacent to pounce there.
// 		> If you bump a person, stop on them and knock them over.
// 		> If you bump a solid object, stun yourself and fall over
/mob/living/simple_mob/proc/pounce_toggle()
	set name = "Toggle Pouncing"
	set desc = "Toggle pouncing. Doubleclick to pounce."
	set category = "Abilities.Mob"

	if(pouncing)
		to_chat(src, span_notice("Pouncing toggled off."))
		pouncing = 0
	else
		to_chat(src, span_notice("Pouncing toggled on! DoubleClick somewhere to pounce there."))
		pouncing = 1
	update_icon()

// This is the on-double-click action.
// We should alter them for the space of this specific proc, and then return them to what they were.
/mob/living/simple_mob/DblClickOn(atom/A, P)
	//trying/permitted to pounce
	if(pouncing)
		//able to pounce (not dead or stunned or on CD)
		if(isliving(src) && !src.weakened && (world.time > pounce_last) && !(status_flags & LEAPING))
			//can see pounce target
			if((A in view(src, world.view)))
				//make sure we're targetting a turf!
				var/turf/T = get_turf(A)
				//handle delay spam
				pounce_last = world.time + pounce_delay
				status_flags |= LEAPING

				//deal with passflag - give flags if don't have, mark for removal. Prevent removal if already has flags.
				var/foundpt = 0
				var/foundpm = 0
				if(pass_flags & PASSTABLE)
					foundpt = 1
				else
					pass_flags |= PASSTABLE
				if(pass_flags & PASSMOB)
					foundpm = 1
				else
					pass_flags |= PASSMOB

				// Do the pounce action

				//flying  = 1		//So we can thunk into things
				hovering = 1	// So we don't hurt ourselves running off cliffs
				playsound(src, "sound/weapons/punchmiss.ogg", 50, 1)

				// throw_at returns FALSE if it will not call it's callback - useful to prevent state jamming
				if(!throw_at(T, 10, pounce_speed, callback = CALLBACK(src, PROC_REF(pouncefinish), foundpt, foundpm, T)))
					if(status_flags & LEAPING)
						status_flags &= ~LEAPING
						flying = 0
						hovering = 0
						if(!foundpt)
							pass_flags &= ~PASSTABLE
						if(!foundpm)
							pass_flags &= ~PASSMOB
			else
				to_chat(src, span_warning("Pouncing blind isn't wise!"))
		else
			to_chat(src, span_warning("You can't do that right now!"))
			// some sanity incase the callback didn't fire for some reason
			if(status_flags & LEAPING)
				status_flags &= ~LEAPING
				flying = 0
				hovering = 0
			pouncing = 0
		update_icon()
	else
		. = ..()

// callback to terminate leap mode. Reset passflag if passflag = 0 (Mob doesn't already have it)
/mob/living/simple_mob/proc/pouncefinish(var/pt, var/pm, var/atom/T)
	if(status_flags & LEAPING)
		status_flags &= ~LEAPING
		flying = 0
		hovering = 0

		if(!pt)
			pass_flags &= ~PASSTABLE
		if(!pm)
			pass_flags &= ~PASSMOB

		//PASSMOB is broken so we have to perform jank
		//if we're adjacent to our target turf (but not ontop of it) and we are not blocked from moving there
		if(Adjacent(T) && get_dist(src, T) && !LinkBlocked(src, T))
			//if a mob is on our target (This should be the only reason we didn't arrive)
			for(var/mob/living/M in T)
				if(isliving(M) && M != src)
					var/mob/living/LM = M

					if(M.buckled) // make sure they fall when weakened
						M.buckled.unbuckle_mob()

					LM.Weaken(5)
					playsound(src, get_sfx("punch"), 50, 1)
					pouncing = 0
			src.Move(T)

		//did we fail to arrive at our destination?
		if(get_dist(src, T))
			pouncing = 0
			update_icon()
			src.Weaken(5)
			playsound(src, get_sfx("punch"), 50, 1)
		else
			//if we arrived, and weren't blocked, and are STILL pouncing, see if we landed on any living things that didn't block us that ISN't ourselves lmfao.
			if(pouncing)
				for(var/mob/living/M in T)
					if(isliving(M) && M != src)
						var/mob/living/LM = M
						LM.Weaken(5)
						playsound(src, get_sfx("punch"), 50, 1)
						pouncing = 0
			update_icon()


// ported from mob/living/carbon/human/species/xenomorph/alien_powers
/mob/living/simple_mob/proc/Spit(var/atom/A)
	if(isnull(spit_projectile))
		return

	if((spit_last + spit_delay) > world.time) //To prevent YATATATATATAT spitting.
		to_chat(src, span_warning("You have not yet prepared your chemical glands. You must wait before spitting again."))
		return
	else
		spit_last = world.time

	if(spitting && incapacitated(INCAPACITATION_DISABLED))
		to_chat(src, "You cannot spit in your current state.")
		spitting = 0
		update_icon()
		return
	else if(spitting)
		//visible_message(span_warning("[src] spits [spit_name] at \the [A]!"), span_alium("You spit [spit_name] at \the [A]."))
		var/obj/item/projectile/P = new spit_projectile(get_turf(src))
		P.firer = src
		P.old_style_target(A)
		P.fire()
		playsound(src, 'sound/weapons/alien_spitacid.ogg', 25, 0)

/mob/living/simple_mob/proc/neurotoxin()
	set name = "Toggle Neurotoxic Spit"
	set desc = "Readies a neurotoxic spit, which paralyzes the target for a short time if they are not wearing protective gear."
	set category = "Abilities.Mob"

	if(spitting)
		to_chat(src, span_notice("You stop preparing to spit."))
		spitting = 0
	else
		spitting = 1
		spit_projectile = /obj/item/projectile/energy/neurotoxin
		to_chat(src, span_notice("You prepare to spit neurotoxin."))
	update_icon()

/mob/living/simple_mob/proc/acidspit()
	set name = "Toggle Acid Spit"
	set desc = "Readies an acidic spit, which burns the target if they are not wearing protective gear."
	set category = "Abilities.Mob"

	if(spitting)
		to_chat(src, span_notice("You stop preparing to spit."))
		spitting = 0
	else
		spitting = 1
		spit_projectile = /obj/item/projectile/energy/acid
		to_chat(src, span_notice("You prepare to spit acid."))
	update_icon()

/mob/living/simple_mob/proc/corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrosive Acid"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Abilities.Mob"

	if(!(O in oview(1)))
		to_chat(src, span_notice("[O] is too far away."))
		return

	// OBJ CHECK
	var/cannot_melt
	if(isobj(O))
		var/obj/I = O //Gurgs : Melts pretty much any object that isn't considered unacidable = TRUE
		if(I.unacidable)
			cannot_melt = 1
	else
		if(istype(O, /turf/simulated/wall))
			var/turf/simulated/wall/W = O //Gurgs : Walls are deconstructed into girders.
			if(W.material.flags & MATERIAL_UNMELTABLE)
				cannot_melt = 1
		else if(istype(O, /turf/simulated/floor))
			var/turf/simulated/floor/F = O	//Gurgs : Floors are destroyed with ex_act(1), turning them into whatever tile it would be if empty. Z-Level Friendly, does not destroy pipes.
			if(F.flooring && (F.flooring.flags & TURF_ACID_IMMUNE))
				cannot_melt = 1
		else
			cannot_melt = 1 //Gurgs : Everything that isn't a object, simulated wall, or simulated floor is assumed to be acid immune. Includes weird things like unsimulated floors and space.

	if(cannot_melt)
		to_chat(src, span_notice("You cannot dissolve this object."))
		return

	new /obj/effect/alien/acid(get_turf(O), O)
	visible_message(span_alium(span_bold("[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!")))

	return

// spin blatantly stolen from BlackMajor's bigdragon
/mob/living/simple_mob/proc/speen(var/range = 2)
	set name = "Spin Attack"
	set desc = "Spins to strike enemies away from you."
	set category = "Abilities.Mob"

	if(world.time < speen_last)
		to_chat(src, span_warning("You cannot spin again so soon."))
		return

	speen_last = world.time + speen_delay
	var/list/thrownatoms = list()
	for(var/mob/living/victim in oview(range, src))
		thrownatoms += victim
	src.spin(12,1)
	for(var/am in thrownatoms)
		var/atom/movable/AM = am
		if(AM == src || AM.anchored)
			continue
		addtimer(CALLBACK(src, PROC_REF(speen_throw), am), 1)
	playsound(src, "sound/weapons/punchmiss.ogg", 50, 1)

/mob/living/simple_mob/proc/speen_throw(var/atom/movable/AM, var/gentle = 0, var/damage = 10)
	var/maxthrow = 7
	var/atom/throwtarget
	throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(AM, src)))

	if (!throwtarget) // default case is north if unset
		throwtarget = locate(src.x, world.maxy, src.z)

	if(isliving(AM))
		var/mob/living/M = AM
		M.Weaken(1.5)
		if(!gentle)
			M.adjustBruteLoss(damage)
		to_chat(M, span_userdanger("You're thrown back by [src]!"))
		playsound(src, get_sfx("punch"), 50, 1)
	AM.throw_at(throwtarget, maxthrow, 3, src)
