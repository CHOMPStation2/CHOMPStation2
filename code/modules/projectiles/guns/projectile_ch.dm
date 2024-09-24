#define BOLT_NOEVENT 0
#define BOLT_CLOSED 1
#define BOLT_OPENED 2
#define BOLT_LOCKED 4
#define BOLT_UNLOCKED 8
#define BOLT_CASING_EJECTED 16
#define BOLT_CASING_CHAMBERED 32

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////// CADYN'S BALLISTICS ////////////////////////////////////////////////////////////////////////// ORIGINAL FROM CHOMPSTATION ////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/gun/projectile
	var/manual_chamber = TRUE
	var/only_open_load = FALSE
	var/auto_loading_type = CLOSED_BOLT | LOCK_MANUAL_LOCK | LOCK_SLAPPABLE
	var/misc_loading_flags = 0
	var/bolt_name = "bolt"
	var/bolt_open = FALSE
	var/bolt_locked = FALSE
	var/bolt_release = "bolt release"
	var/muzzle_velocity = 500	// meters per second
	var/sound_ejectchamber = 'sound/weapons/ballistics/pistol_ejectchamber.ogg'
	var/sound_eject = 'sound/weapons/ballistics/pistol_eject.ogg'
	var/sound_chamber = 'sound/weapons/ballistics/pistol_chamber.ogg'

/obj/item/weapon/gun/projectile/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	if(fire_anim)
		flick(fire_anim, src)

	if(muzzle_flash)
		set_light(muzzle_flash)

	if(one_handed_penalty)
		if(!src.is_held_twohanded(user))
			switch(one_handed_penalty)
				if(1 to 15)
					if(prob(50)) //don't need to tell them every single time
						to_chat(user, "<span class='warning'>Your aim wavers slightly.</span>")
				if(16 to 30)
					to_chat(user, "<span class='warning'>Your aim wavers as you fire \the [src] with just one hand.</span>")
				if(31 to 45)
					to_chat(user, "<span class='warning'>You have trouble keeping \the [src] on target with just one hand.</span>")
				if(46 to INFINITY)
					to_chat(user, "<span class='warning'>You struggle to keep \the [src] on target with just one hand!</span>")
		else if(!user.can_wield_item(src))
			switch(one_handed_penalty)
				if(1 to 15)
					if(prob(50)) //don't need to tell them every single time
						to_chat(user, "<span class='warning'>Your aim wavers slightly.</span>")
				if(16 to 30)
					to_chat(user, "<span class='warning'>Your aim wavers as you try to hold \the [src] steady.</span>")
				if(31 to 45)
					to_chat(user, "<span class='warning'>You have trouble holding \the [src] steady.</span>")
				if(46 to INFINITY)
					to_chat(user, "<span class='warning'>You struggle to hold \the [src] steady!</span>")

	if(recoil)
		spawn()
			shake_camera(user, recoil+1, recoil)
	update_icon()

	if(chambered)
		chambered.expend()
		if(!manual_chamber) process_chambered()
	if(manual_chamber && auto_loading_type)
		bolt_toggle()

/obj/item/weapon/gun/projectile/attack_self(mob/user as mob)
	if(manual_chamber)
		if(do_after(user,4))
			bolt_handle(user)
	else if(firemodes.len > 1)
		switch_firemodes(user)
	else
		unload_ammo(user)

/obj/item/weapon/gun/projectile/proc/bolt_handle(mob/user)
	var/previous_chambered = chambered
	var/result = bolt_toggle(TRUE)
	update_icon()
	if(!result)
		to_chat(user,"<span class='notice'>Nothing happens.</span>")
	else
		var/closed = CHECK_BITFIELD(result,BOLT_CLOSED)
		var/opened = CHECK_BITFIELD(result,BOLT_OPENED)
		var/locked = CHECK_BITFIELD(result,BOLT_LOCKED)
		var/unlocked = CHECK_BITFIELD(result,BOLT_UNLOCKED)
		var/casing_ejected = CHECK_BITFIELD(result,BOLT_CASING_EJECTED)
		var/close_open_ejected = casing_ejected ? ", which causes \the [previous_chambered] to be ejected, as well as" : ","
		var/other_ejected = CHECK_BITFIELD(result,BOLT_CASING_CHAMBERED) ? " and causing \the [previous_chambered] to be ejected" : ", causing \the [previous_chambered] to be ejected"
		other_ejected = casing_ejected ? other_ejected : ""
		var/casing_chambered = CHECK_BITFIELD(result,BOLT_CASING_CHAMBERED) ? ", chambering a new round" : ""
		if(closed && opened)
			playsound(src, sound_ejectchamber, 50, 0)
			user.visible_message("<span class='notice'>[user] pulls back \the [bolt_name] before releasing it[close_open_ejected] causing it to slide forward again[casing_chambered].</span>", \
			"<span class='notice'>You pull back \the [bolt_name] before releasing it[close_open_ejected] causing it to slide forward again[casing_chambered].</span>")
			user.hud_used.update_ammo_hud(user, src)
		else if(opened)
			playsound(src, sound_eject, 50, 0)
			if(locked)
				if(CHECK_BITFIELD(auto_loading_type,LOCK_MANUAL_LOCK))
					playsound(src, sound_ejectchamber, 50, 0)
					user.visible_message("<span class='notice'>[user] pulls back \the [bolt_name] and locks it in the open position[casing_chambered][other_ejected].</span>", \
					"<span class='notice'>You pull back \the [bolt_name] and lock it in the open position[other_ejected][casing_chambered].</span>")
				else
					user.visible_message("<span class='notice'>[user] pulls back \the [bolt_name] before releasing it, causing it to lock in the open position[casing_chambered][other_ejected].</span>", \
					"<span class='notice'>You pull back \the [bolt_name] before releasing it, causing it to lock in the open position[casing_chambered][other_ejected].</span>")
			else
				user.visible_message("<span class='notice'>[user] opens \the [bolt_name][casing_chambered][other_ejected].</span>", \
				"<span class='notice'>You pull back \the [bolt_name][casing_chambered][other_ejected].</span>")
		else if(closed)
			playsound(src, sound_chamber, 50, 0)
			if(unlocked)
				if(bolt_release)
					if(user.a_intent == I_HURT && CHECK_BITFIELD(auto_loading_type,LOCK_SLAPPABLE))
						user.visible_message("<span class='notice'>[user] slaps the [bolt_release], causing \the [bolt_name] to slide forward[casing_chambered]!</span>", \
						"<span class='notice'>You slap the [bolt_release], causing \the [bolt_name] to slide forward[casing_chambered]!</span>")
					else
						user.visible_message("<span class='notice'>[user] presses the [bolt_release], causing \the [bolt_name] to slide forward[casing_chambered].</span>", \
						"<span class='notice'>You press the [bolt_release], causing \the [bolt_name] to slide forward[casing_chambered].</span>")
				else
					user.visible_message("<span class='notice'>[user] pulls \the [bolt_name] back the rest of the way, causing it to slide forward[casing_chambered].</span>", \
					"<span class='notice'>You pull \the [bolt_name] back the rest of the way, causing it to slide forward[casing_chambered].</span>")
			else
				user.visible_message("<span class='notice'>[user] closes \the [bolt_name][casing_chambered].</span>", \
				"<span class='notice'>You close \the [bolt_name][casing_chambered].</span>")
		user.hud_used.update_ammo_hud(user, src)

/obj/item/weapon/gun/projectile/proc/bolt_toggle(var/manual)
	if(!bolt_open)
		if(auto_loading_type)
			var/able_to_lock = (CHECK_BITFIELD(auto_loading_type,LOCK_OPEN_EMPTY) || (CHECK_BITFIELD(auto_loading_type,LOCK_MANUAL_LOCK) && manual))
			if(CHECK_BITFIELD(auto_loading_type,OPEN_BOLT))
				bolt_open = TRUE
				var/ejected = process_chambered()
				var/output = BOLT_OPENED
				if(ejected) output |= BOLT_CASING_EJECTED
				return output
			else if(loaded.len || (ammo_magazine && ammo_magazine.stored_ammo.len) || !able_to_lock)
				var/ejected = process_chambered()
				var/chambering = chamber_bullet()
				var/output = BOLT_OPENED | BOLT_CLOSED
				if(ejected) output |= BOLT_CASING_EJECTED
				if(chambering) output |= BOLT_CASING_CHAMBERED
				return output
			else
				if(!manual)
					visible_message(src,"<span class='notice'>The [src] fires its last round, causing the [bolt_name] to lock.</span>")
				bolt_open = TRUE
				bolt_locked = TRUE
				var/ejected = process_chambered()
				var/output = BOLT_OPENED | BOLT_LOCKED
				if(ejected) output |= BOLT_CASING_EJECTED
				return output
		else
			bolt_open = TRUE
			var/ejected = process_chambered()

			var/output = BOLT_OPENED
			if(ejected) output |= BOLT_CASING_EJECTED
			//if(chambering) output |= BOLT_CASING_CHAMBERED
			return output
	else
		if(auto_loading_type)
			if(CHECK_BITFIELD(auto_loading_type,OPEN_BOLT))
				if(loaded.len || (ammo_magazine && ammo_magazine.stored_ammo.len))
					if(!manual)
						var/ejected = process_chambered()
						var/output = BOLT_CLOSED | BOLT_OPENED
						if(ejected) output |= BOLT_CASING_EJECTED
						return output
					else
						return BOLT_NOEVENT
				else
					bolt_open = FALSE
					return BOLT_CLOSED
			else if(bolt_locked)
				var/chambering = FALSE
				if(!chambered)
					chambering = chamber_bullet()
				bolt_locked = FALSE
				bolt_open = FALSE
				var/output = BOLT_CLOSED | BOLT_UNLOCKED
				if(chambering) output |= BOLT_CASING_CHAMBERED
				return output
			else
				bolt_open = FALSE
				return BOLT_CLOSED
		else
			bolt_open = FALSE
			var/output = BOLT_CLOSED
			var/chambering = chamber_bullet()
			if(chambering) output |= BOLT_CASING_CHAMBERED
			return output


/obj/item/weapon/gun/projectile/process_chambered()
	if (!chambered) return 0

	// Aurora forensics port, gunpowder residue.
	if(chambered.leaves_residue)
		var/mob/living/carbon/human/H = loc
		if(istype(H))
			if(!H.gloves)
				H.gunshot_residue = chambered.caliber
			else
				var/obj/item/clothing/G = H.gloves
				G.gunshot_residue = chambered.caliber

	switch(handle_casings)
		if(EJECT_CASINGS) //eject casing onto ground.
			if(chambered.caseless)
				qdel(chambered)
				chambered = null
				return 0
			else
				chambered.loc = get_turf(src)
				playsound(src, "casing", 50, 1)
				chambered = null
				return 1
		if(CYCLE_CASINGS) //cycle the casing back to the end.
			if(ammo_magazine)
				ammo_magazine.stored_ammo += chambered
			else
				loaded += chambered
			chambered = null
			return 0

	if(handle_casings != HOLD_CASINGS)
		chambered = null
	return 0

/obj/item/weapon/gun/projectile/consume_next_projectile()
	if(!manual_chamber)
		//get the next casing
		if(loaded.len)
			chambered = loaded[1] //load next casing.
			if(handle_casings != HOLD_CASINGS)
				loaded -= chambered
		else if(ammo_magazine && ammo_magazine.stored_ammo.len)
			chambered = ammo_magazine.stored_ammo[ammo_magazine.stored_ammo.len]
			if(handle_casings != HOLD_CASINGS)
				ammo_magazine.stored_ammo -= chambered
	if(manual_chamber && auto_loading_type && CHECK_BITFIELD(auto_loading_type,OPEN_BOLT) && bolt_open)
		chamber_bullet()

	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/proc/chamber_bullet()
	if(chambered)
		return 0
	var/obj/item/ammo_casing/to_chamber
	if(loaded.len)
		to_chamber = loaded[1] //load next casing.
		if(handle_casings != HOLD_CASINGS)
			loaded -= to_chamber
	else if(ammo_magazine && ammo_magazine.stored_ammo.len)
		to_chamber = ammo_magazine.stored_ammo[ammo_magazine.stored_ammo.len]
		if(handle_casings != HOLD_CASINGS)
			ammo_magazine.stored_ammo -= to_chamber
	chambered = to_chamber
	if(to_chamber)
		return 1
	else
		return 0

/obj/item/weapon/gun/projectile/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/AM = A
		if(!(load_method & AM.mag_type) || caliber != AM.caliber || allowed_magazines && !is_type_in_list(A, allowed_magazines))
			to_chat(user, "<span class='warning'>[AM] won't load into [src]!</span>")
			return
		var/loading_method = AM.mag_type & load_method
		if(loading_method == (MAGAZINE & SPEEDLOADER)) loading_method = MAGAZINE //Default to magazine if both are valid
		switch(loading_method)
			if(MAGAZINE)
				if(ammo_magazine)
					to_chat(user, "<span class='warning'>[src] already has a magazine loaded.</span>") //already a magazine here
					return
				if(manual_chamber && CHECK_BITFIELD(auto_loading_type,OPEN_BOLT) && bolt_open)
					to_chat(user, "<span class='warning'>This is an open bolt gun. Make sure you close the bolt before inserting a new magazine.</span>")
					return
				user.remove_from_mob(AM)
				AM.loc = src
				ammo_magazine = AM
				user.visible_message("[user] inserts [AM] into [src].", "<span class='notice'>You insert [AM] into [src].</span>")
				if(manual_chamber && CHECK_BITFIELD(auto_loading_type,CHAMBER_ON_RELOAD) && bolt_open && !chambered)
					chamber_bullet()
					bolt_toggle()
				playsound(src, 'sound/weapons/flipblade.ogg', 50, 1)
				user.hud_used.update_ammo_hud(user, src)
			if(SPEEDLOADER)
				if(only_open_load && !bolt_open)
					to_chat(user, "<span_class='warning'>[src] must have its bolt open to be loaded!</span>")
					return
				if(loaded.len >= max_shells)
					to_chat(user, "<span class='warning'>[src] is full!</span>")
					return
				var/count = 0
				for(var/obj/item/ammo_casing/C in AM.stored_ammo)
					if(loaded.len >= max_shells)
						break
					if(C.caliber == caliber)
						C.loc = src
						loaded += C
						AM.stored_ammo -= C //should probably go inside an ammo_magazine proc, but I guess less proc calls this way...
						count++
				if(count)
					user.visible_message("[user] reloads [src].", "<span class='notice'>You load [count] round\s into [src].</span>")
					playsound(src, 'sound/weapons/empty.ogg', 50, 1)
					user.hud_used.update_ammo_hud(user, src)
		AM.update_icon()
	else if(istype(A, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = A
		if(caliber != C.caliber)
			return
		if(!(load_method & SINGLE_CASING) || (misc_loading_flags & INTERNAL_MAG_SEPARATE)) //INTERNAL_MAG_SEPARATE is pretty much exclusively for the SPAS-12
			if(manual_chamber)
				if(!CHECK_BITFIELD(auto_loading_type,OPEN_BOLT))
					if(!chambered)
						if(bolt_open)
							if(do_after(user,5))
								user.visible_message("<span class='notice'>[user] slides \the [C] into the [src]'s chamber.</span>","<span class='notice'>You slide \the [C] into the [src]'s chamber.</span>")
								chambered = C
								user.hud_used.update_ammo_hud(user, src)
							else
								return
						else if(!(CHECK_BITFIELD(auto_loading_type,LOCK_OPEN_EMPTY) || (CHECK_BITFIELD(auto_loading_type,LOCK_MANUAL_LOCK))))
							if(do_after(user,15))
								user.visible_message("<span class='notice'>[user] holds open \the [src]'s [bolt_name] and slides [C] into the chamber before letting the bolt close again.</span>","<span class='notice'>You slide \the [C] into the [src]'s chamber.</span>")

								chambered = C
								user.hud_used.update_ammo_hud(user, src)
							else
								return
						else
							to_chat(user,"<span class='warning'>Open the bolt first before chambering a round!</span>")
							return
					else
						to_chat(user,"<span class='warning'>Eject the current chambered round before trying to chamber a new one!</span>")
						return
				else
					to_chat(user,"<span class='warning'>You can't manually chamber rounds with an open bolt gun!</span>")
					return
				user.remove_from_mob(C)
				C.loc = src
				update_icon()
				return
			else
				return
		if(only_open_load && !bolt_open)
			to_chat(user, "<span_class='warning'>[src] must have its bolt open to be loaded!</span>")
			return
		if(loaded.len >= max_shells)
			to_chat(user, "<span class='warning'>[src] is full.</span>")
			return

		user.remove_from_mob(C)
		C.loc = src
		loaded.Insert(1, C) //add to the head of the list
		user.visible_message("[user] inserts \a [C] into [src].", "<span class='notice'>You insert \a [C] into [src].</span>")
		playsound(src, 'sound/weapons/empty.ogg', 50, 1)
		user.hud_used.update_ammo_hud(user, src)

	else if(istype(A, /obj/item/weapon/storage))
		var/obj/item/weapon/storage/storage = A
		if(!(load_method & SINGLE_CASING))
			return //incompatible

		to_chat(user, "<span class='notice'>You start loading \the [src].</span>")
		sleep(1 SECOND)
		for(var/obj/item/ammo_casing/ammo in storage.contents)
			if(caliber != ammo.caliber)
				continue

			load_ammo(ammo, user)
			user.hud_used.update_ammo_hud(user, src)

			if(loaded.len >= max_shells)
				to_chat(user, "<span class='warning'>[src] is full.</span>")
				break
			sleep(1 SECOND)

	update_icon()

/obj/item/weapon/gun/projectile/afterattack(atom/A, mob/living/user, adjacent, params)
	afteratt(A,user,adjacent,params)
	if(auto_eject && ammo_magazine && ammo_magazine.stored_ammo && !ammo_magazine.stored_ammo.len && !(manual_chamber && chambered && chambered.BB != null))
		ammo_magazine.loc = get_turf(src.loc)
		user.visible_message(
			"[ammo_magazine] falls out and clatters on the floor!",
			"<span class='notice'>[ammo_magazine] falls out and clatters on the floor!</span>"
			)
		if(auto_eject_sound)
			playsound(src, auto_eject_sound, 40, 1)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon()

/obj/item/weapon/gun/projectile/proc/afteratt(atom/A, mob/living/user, adjacent, params)
	if(adjacent) return //A is adjacent, is the user, or is on the user's person

	if(!user.aiming)
		user.aiming = new(user)

	if(user && user.client && user.aiming && user.aiming.active && user.aiming.aiming_at != A)
		PreFire(A,user,params) //They're using the new gun system, locate what they're aiming at.
		return

	if(user && user.a_intent == I_HELP && user.read_preference(/datum/preference/toggle/safefiring)) //regardless of what happens, refuse to shoot if help intent is on
		to_chat(user, "<span class='warning'>You refrain from firing your [src] as your intent is set to help.</span>")
		return

	else
		Fire(A, user, params) //Otherwise, fire normally.
		return

/obj/item/weapon/gun/projectile/special_check(var/mob/user)
	if(..())
		if(manual_chamber)
			if(CHECK_BITFIELD(auto_loading_type,OPEN_BOLT) && !bolt_open)
				to_chat(user,"<span class='warning'>This is an open bolt gun! You need to open the bolt before firing it!</span>")
				return 0
			else if(CHECK_BITFIELD(auto_loading_type,CLOSED_BOLT) && bolt_open)
				to_chat(user,"<span class='warning'>This is a closed bolt gun! You need to close the bolt before firing it!</span>")
				return 0
			else if((!auto_loading_type) && bolt_open)
				to_chat(user,"<span class='warning'>This is a manual action gun, the bolt or chamber must be closed before firing it!</span>")
				return 0
			else
				return 1
		else
			return 1

/obj/item/weapon/gun/projectile/unload_ammo(mob/user, var/allow_dump=1)
	if(manual_chamber && only_open_load && !bolt_open)
		to_chat(user,"<span class='warning'>You must open the bolt to load or unload this gun!</span>")
	else
		return ..()

/obj/item/weapon/gun/projectile/handle_click_empty(mob/user)
	if (user)
		user.visible_message("*click click*", "<span class='danger'>*click*</span>")
	else
		src.visible_message("*click click*")
	playsound(src, 'sound/weapons/empty.ogg', 100, 1)
	if(!manual_chamber)
		process_chambered()

/obj/item/weapon/gun/projectile/New(loc, var/starts_loaded = 1)
	..()
	if(manual_chamber)
		verbs |= /obj/item/weapon/gun/projectile/verb/change_firemode
	update_icon()

/obj/item/weapon/gun/projectile/verb/change_firemode()
	set name = "Switch firemode"
	set category = "Object"
	set src in view(1)

	switch_firemodes(usr)

/obj/item/weapon/gun/projectile/process_accuracy(obj/projectile, mob/living/user, atom/target, var/burst, var/held_twohanded)
	. = ..()
	var/obj/item/projectile/bullet/P = projectile
	if(!istype(P))
		return
	P.velocity = muzzle_velocity

//Special ammo handling bullshit

/obj/item/weapon/gun/projectile/pirate/process_accuracy(obj/projectile, mob/living/user, atom/target, var/burst, var/held_twohanded)
	. = ..()
	var/obj/item/projectile/bullet/P = projectile
	if(!istype(P))
		return
	P.sub_velocity(P.velocity * 0.3)	//Yeah, a gun that supposedly shoots any bullet is gonna be pretty shit.

/obj/item/weapon/gun/projectile/revolver/lemat/process_accuracy(obj/projectile, mob/living/user, atom/target, var/burst, var/held_twohanded)
	. = ..()
	var/obj/item/projectile/bullet/P = projectile
	P.velocity = initial(P.velocity)
	if(!istype(P))
		return
	P.sub_velocity(P.velocity - 35)

#undef BOLT_NOEVENT
#undef BOLT_CLOSED
#undef BOLT_OPENED
#undef BOLT_LOCKED
#undef BOLT_UNLOCKED
#undef BOLT_CASING_EJECTED
#undef BOLT_CASING_CHAMBERED
