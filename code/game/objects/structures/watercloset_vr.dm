//Flushable toilets on station levels. Flushing sends stuff directly to a trashpit landmark without stinking up the cargo office.
//Only on-station toilets are affected and only if the trashpit landmark also exists. Otherwise toilets will stay normal.

/obj/structure/toilet
	var/teleplumbed = FALSE
	var/exit_landmark
	var/exit_container
	var/refill_cooldown = 200
	var/refilling = FALSE

/obj/structure/toilet/Initialize()
	if(z in global.using_map.map_levels)
		teleplumbed = TRUE
		exit_landmark = locate(/obj/effect/landmark/teleplumb_exit)
		exit_container = locate(/obj/structure/biowaste_tank)
		if(exit_container)
			exit_landmark = exit_container //Override landmark if container is available.
		if(teleplumbed && exit_landmark)
			desc = "The BS-500, a bluespace rift-rotation-based waste disposal unit for small matter. This one seems remarkably clean."
	return ..()

/obj/structure/toilet/attack_hand(mob/living/user as mob)
	if(open && teleplumbed && exit_landmark && !refilling)
		var/list/bowl_contents = list()
		for(var/obj/item/I in loc.contents)
			if(istype(I) && !I.anchored)
				bowl_contents += I
		for(var/mob/living/L in loc.contents)
			if(L.resting || L.lying && L.size_multiplier <= 0.75 && !L.buckled)
				bowl_contents += L
		if(bowl_contents.len)
			refilling = TRUE
			user.visible_message("<span class='notice'>[user] flushes the toilet.</span>", "<span class='notice'>You flush the toilet.</span>")
			playsound(src, 'sound/vore/death7.ogg', 50, 1) //Got lazy about getting new sound files. Have a sick remix lmao.
			playsound(src, 'sound/effects/bubbles.ogg', 50, 1)
			playsound(src, 'sound/mecha/powerup.ogg', 30, 1)
			var/bowl_conga = 0
			for(var/atom/movable/F in bowl_contents)
				if(bowl_conga < 150)
					bowl_conga += 2
				spawn(3 + bowl_conga)
					F.SpinAnimation(5,3)
					spawn(15)
						if(F.loc == loc)
							F.forceMove(src)
			spawn(refill_cooldown)
				for(var/atom/movable/F in bowl_contents)
					if(F.loc == src)
						F.forceMove(exit_landmark)
				bowl_contents.Cut()
				refilling = FALSE
			return
	if(refilling)
		playsound(src, 'sound/machines/door_locked.ogg', 30, 1)
		to_chat(user, "<span class='notice'>The toilet is still refilling its tank.</span>")
	return ..()

/obj/structure/toilet/attackby(obj/item/I as obj, mob/living/user as mob)
	if(refilling) //No cistern interactions until bowl contents have been dealt with.
		return
	return ..()

/obj/structure/toilet/attack_ai(mob/user as mob)
	if(isrobot(user))
		if(user.client && user.client.eye == user)
			return attack_hand(user)
	else
		return attack_hand(user)

/obj/effect/landmark/teleplumb_exit
	name = "teleplumbing exit"

/obj/effect/landmark/teleplumb_exit/Entered(atom/movable/thing, atom/OldLoc)
	thing.forceMove(get_turf(src))

/obj/structure/biowaste_tank
	name = "Bluespace Bio-Compostor Terminal"
	icon = 'icons/obj/survival_pod_comp.dmi'
	icon_state = "pod_computer"
	desc = "It appears to be a massive sealed container attached to some heavy machinery and thick tubes containing a whole network of interdimensional pipeworks. It appears whatever vanished down the station's toilets ends up in this thing."
	anchored = TRUE
	density = TRUE
	var/muffin_mode = FALSE
	var/mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster

/obj/structure/biowaste_tank/Initialize()
	muffinmonster = new /mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster(src)
	muffinmonster.name = "Activate Muffin Monster"
	muffinmonster.voremob_loaded = TRUE
	muffinmonster.init_vore()
	return ..()

/obj/structure/biowaste_tank/AllowDrop()
	return TRUE

/obj/structure/biowaste_tank/Entered(atom/movable/thing, atom/OldLoc)
	if(istype(thing, /obj/item/reagent_containers/food))
		qdel(thing)
		return
	if(istype(thing, /obj/item/organ))
		qdel(thing)
		return
	if(istype(thing, /obj/item/storage/vore_egg))
		if(thing.contents.len)
			for(var/atom/movable/C in thing.contents)
				C.forceMove(src)
		qdel(thing)
		return
	if(muffin_mode)
		if(muffinmonster)
			thing.forceMove(muffinmonster.vore_selected)
		else
			muffin_mode = FALSE

/obj/structure/biowaste_tank/attack_hand(var/mob/user as mob)
	if(contents.len)
		var/atom/movable/choice = tgui_input_list(usr, "It appears the machine has caught some items in the lost-and-found filter system. Would you like to eject something?", "Item Retrieval Console", contents)
		if(choice)
			if(!usr.canmove || usr.stat || usr.restrained() || !in_range(loc, usr))
				return
			if(choice == muffinmonster && muffinmonster.loc == src)
				muffin_mode = !muffin_mode
				if(muffin_mode)
					muffinmonster.name = "Deactivate Muffin Monster"
					for(var/atom/movable/C in contents)
						if(C == muffinmonster)
							continue
						C.forceMove(muffinmonster.vore_selected)
				else
					muffinmonster.name = "Activate Muffin Monster"
					muffinmonster.release_vore_contents(include_absorbed = TRUE, silent = TRUE)
				return
			else
				choice.forceMove(get_turf(src))

/obj/structure/biowaste_tank/emag_act(var/remaining_charges, var/mob/user, var/emag_source)
	if(muffinmonster && muffin_mode)
		muffinmonster.name = "Muffin Monster"
		muffinmonster.forceMove(get_turf(src))
		muffinmonster = null
		muffin_mode = FALSE

/mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster
	name = "Muffin Monster"
	desc = "OH GOD IT'S LOOSE!"
	vore_default_item_mode = IM_DIGEST
