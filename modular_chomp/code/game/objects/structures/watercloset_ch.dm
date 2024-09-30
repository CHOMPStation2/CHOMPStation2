//Flushable toilets on station levels. Flushing sends stuff directly to a trashpit landmark without stinking up the cargo office.
//Only on-station toilets are linked to exit landmark or container if such exists. Otherwise stuff gets sent to shadow realm.

/obj/structure/toilet
	var/teleplumbed = FALSE
	var/exit_landmark
	var/exit_container
	var/refill_cooldown = 200
	var/refilling = FALSE
	var/no_destination = TRUE
	var/max_w_class = 5 //glogged
	var/total_w = 0
	var/panic_mult = 1

/obj/structure/toilet/Initialize()
	if(z in global.using_map.map_levels)
		teleplumbed = TRUE
		exit_landmark = locate(/obj/effect/landmark/teleplumb_exit)
		exit_container = locate(/obj/structure/biowaste_tank)
		if(exit_container)
			exit_landmark = exit_container //Override landmark if container is available.
		if(teleplumbed && exit_landmark)
			desc = "The BS-500, a bluespace rift-rotation-based waste disposal unit for small matter. This one seems remarkably clean."
			no_destination = FALSE
			max_w_class = 15
	return ..()

/obj/structure/toilet/attack_hand(mob/living/user as mob)
	if(open && !refilling && (no_destination || (teleplumbed && exit_landmark)))
		if(user.a_intent == I_HURT)
			panic_mult += 1
		var/list/bowl_contents = list()
		for(var/obj/item/I in loc.contents)
			if(istype(I) && !I.anchored)
				bowl_contents += I
		for(var/mob/living/L in loc.contents)
			if((L.resting || L.lying) && !L.buckled)
				bowl_contents += L
		if(bowl_contents.len)
			user.visible_message("<span class='notice'>[user] flushes the [lowertext(name)].</span>", "<span class='notice'>You flush the [lowertext(name)].</span>")
			playsound(src, 'sound/vore/death7.ogg', 50, 1) //Got lazy about getting new sound files. Have a sick remix lmao.
			playsound(src, 'sound/effects/bubbles.ogg', 50, 1)
			playsound(src, 'sound/mecha/powerup.ogg', 30, 1)
			var/bowl_conga = 0
			var/list/taken_contents = list()
			for(var/atom/movable/F in bowl_contents)
				if(bowl_conga < 150)
					bowl_conga += 2
				spawn(3 + bowl_conga)
					F.SpinAnimation(5,3)
					spawn(15)
						if(F.loc == loc)
							if(isitem(F))
								var/obj/item/I = F
								if(I.w_class >= ITEMSIZE_NORMAL)
									total_w += I.w_class
							if(isliving(F))
								var/mob/living/L = F
								total_w += L.size_multiplier * 13
							if(total_w <= max_w_class * panic_mult)
								taken_contents |= F
								F.forceMove(src)
							else
								visible_message("The [lowertext(name)] glurks and splutters, unable to guzzle more stuff down in a single flush!")
								break
			refilling = TRUE
			panic_mult = 1
			spawn(refill_cooldown)
				for(var/atom/movable/F in taken_contents)
					if(F.loc == src)
						flush(F)
				bowl_contents.Cut()
				taken_contents.Cut()
				total_w = 0
				refilling = FALSE
			return
		else
			panic_mult = 1
	if(refilling)
		playsound(src, 'sound/machines/door_locked.ogg', 30, 1)
		to_chat(user, "<span class='notice'>The [lowertext(name)] is still refilling its tank.</span>")
	return ..()

/obj/structure/toilet/attackby(obj/item/I as obj, mob/living/user as mob)
	if(refilling) //No cistern interactions until bowl contents have been dealt with.
		return
	return ..()

/obj/structure/toilet/proc/flush(atom/movable/F)
	if(no_destination)
		for(var/atom/movable/G in F.contents)
			G.forceMove(src)
			flush(G)
		qdel(F)
	else
		var/list/bs_things = list()
		var/bs_error = FALSE
		for(var/item in bluespace_item_types)
			if(istype(F, item))
				bs_error = TRUE
			else
				bs_things |= F.search_contents_for(item)
		if(bs_error || LAZYLEN(bs_things))
			bs_things.Cut()
			bs_error = rand(1, 100)
			var/list/posturfs = circlerangeturfs(exit_landmark,bs_error)
			var/destturf = safepick(posturfs)
			F.forceMove(destturf)
		else
			F.forceMove(exit_landmark)

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
	var/obj/machinery/recycling/crusher/crusher //Bluespace connection for recyclables

/obj/structure/biowaste_tank/Initialize()
	muffinmonster = new /mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster(src)
	muffinmonster.name = "Activate Muffin Monster"
	muffinmonster.voremob_loaded = TRUE
	muffinmonster.init_vore()
	crusher = locate(/obj/machinery/recycling/crusher)
	return ..()

/obj/structure/biowaste_tank/AllowDrop()
	return TRUE

/obj/structure/biowaste_tank/Entered(atom/movable/thing, atom/OldLoc)
	. = ..()
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
	if(istype(crusher) && istype(thing, /obj/item/debris_pack))
		crusher.take_item(thing)
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
	icon_state = "muffinmonster"
	icon_living = "muffinmonster"
	icon_dead = "muffinmonster-dead"
	icon_rest = "muffinmonster_rest"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	has_eye_glow = FALSE
	vore_default_item_mode = IM_DIGEST

/mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "waste hopper"
	B.desc = "With a resounding CRUNCH, your form has gotten snagged by the Muffin Monster's rotational interlocking cutters indiscriminately crunching away at anything unlucky enough to end up in its hopper, only for the insatiable machine to grind it all down into a slurry mulch fine enough to pass through the narrow sewage lines trouble-free..."
	B.digest_brute = 20
	B.special_entrance_sound = 'sound/machines/blender.ogg'
	B.recycling = TRUE

/obj/structure/toilet/item/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/toilet/item/LateInitialize()
	if(istype(loc, /mob/living)) return
	var/obj/item/I
	for(I in loc)
		if(I.density || I.anchored || I == src) continue
		I.forceMove(src)