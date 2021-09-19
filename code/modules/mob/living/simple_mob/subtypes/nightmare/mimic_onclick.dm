//I was hoping to avoid needing to override this, but alas, it's necessary. Might be useful if we want to change more stuff about clicking later.
//Reason this needed to be added was to allow for interacting with stuff while morphed, since our loc will not be a turf.
/mob/living/simple_mob/nightmare/mimic/ClickOn(var/atom/A, var/params)
	if(!checkClickCooldown()) // Hard check, before anything else, to avoid crashing
		return

	setClickCooldown(1)

	if(client && client.buildmode)
		build_click(src, client.buildmode, params, A)
		return

	var/list/modifiers = params2list(params)
	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A)
		return 1
	if(modifiers["shift"] && modifiers["middle"])
		ShiftMiddleClickOn(A)
		return 1
	if(modifiers["middle"])
		MiddleClickOn(A)
		return 1
	if(modifiers["shift"])
		ShiftClickOn(A)
		return 0
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		AltClickOn(A)
		return 1
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return 1

	if(stat || paralysis || stunned || weakened)
		return

	face_atom(A) // change direction to face what you clicked on

	if(istype(loc, /obj/mecha))
		if(!locate(/turf) in list(A, A.loc)) // Prevents inventory from being drilled
			return
		var/obj/mecha/M = loc
		return M.click_action(A, src, params)

	if(restrained())
		setClickCooldown(10)
		RestrainedClickOn(A)
		return 1

	if(in_throw_mode)
		if(isturf(A) || isturf(A.loc))
			throw_item(A)
			trigger_aiming(TARGET_CAN_CLICK)
			return 1
		throw_mode_off()

	var/obj/item/W = get_active_hand()

	if(W == A) // Handle attack_self
		W.attack_self(src)
		trigger_aiming(TARGET_CAN_CLICK)
		update_inv_active_hand(0)
		return 1

	//Atoms on your person
	// A is your location but is not a turf; or is on you (backpack); or is on something on you (box in backpack); sdepth is needed here because contents depth does not equate inventory storage depth.
	var/sdepth = A.storage_depth(src)
	if((!isturf(A) && A == loc) || (sdepth != -1 && sdepth <= 1))
		if(W)
			var/resolved = W.resolve_attackby(A, src, click_parameters = params)
			if(!resolved && A && W)
				W.afterattack(A, src, 1, params) // 1 indicates adjacency
		else
			if(ismob(A)) // No instant mob attacking
				setClickCooldown(get_attack_speed())
			UnarmedAttack(A, 1)

		trigger_aiming(TARGET_CAN_CLICK)
		return 1

	// VOREStation Addition Start: inbelly item interaction
	if(isbelly(loc) && (loc == A.loc))
		if(W)
			var/resolved = W.resolve_attackby(A,src)
			if(!resolved && A && W)
				W.afterattack(A, src, 1, params) // 1: clicking something Adjacent
		else
			if(ismob(A)) // No instant mob attacking
				setClickCooldown(get_attack_speed())
			UnarmedAttack(A, 1)
		return
	// VOREStation Addition End

    //Allow us to interact with stuff while morphed
	//if(!isturf(loc)) // This is going to stop you from telekinesing from inside a closet, but I don't shed many tears for that
	//	return

	//Atoms on turfs (not on your person)
	// A is a turf or is on a turf, or in something on a turf (pen in a box); but not something in something on a turf (pen in a box in a backpack)
	sdepth = A.storage_depth_turf()
	if(isturf(A) || isturf(A.loc) || (sdepth != -1 && sdepth <= 1))
		if(A.Adjacent(src) || (W && W.attack_can_reach(src, A, W.reach)) ) // see adjacent.dm
			if(W)
				// Return 1 in attackby() to prevent afterattack() effects (when safely moving items for example)
				var/resolved = W.resolve_attackby(A,src, click_parameters = params)
				if(!resolved && A && W)
					W.afterattack(A, src, 1, params) // 1: clicking something Adjacent
			else
				if(ismob(A)) // No instant mob attacking
					setClickCooldown(get_attack_speed())
				UnarmedAttack(A, 1)
			trigger_aiming(TARGET_CAN_CLICK)
			return
		else // non-adjacent click
			if(W)
				W.afterattack(A, src, 0, params) // 0: not Adjacent
			else
				RangedAttack(A, params)

			trigger_aiming(TARGET_CAN_CLICK)
	return 1