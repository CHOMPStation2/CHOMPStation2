/obj/structure/toilet/item/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/toilet/item/LateInitialize()
	if(istype(loc, /mob/living)) return
	var/obj/item/I
	for(I in loc)
		if(I.density || I.anchored || I == src) continue
		I.forceMove(src)

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

/obj/structure/biowaste_tank/Initialize(mapload)
	muffinmonster = new /mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster(src)
	muffinmonster.name = "Activate Muffin Monster"
	muffinmonster.init_vore(TRUE)
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

/mob/living/simple_mob/vore/aggressive/corrupthound/muffinmonster/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "waste hopper"
	B.desc = "With a resounding CRUNCH, your form has gotten snagged by the Muffin Monster's rotational interlocking cutters indiscriminately crunching away at anything unlucky enough to end up in its hopper, only for the insatiable machine to grind it all down into a slurry mulch fine enough to pass through the narrow sewage lines trouble-free..."
	B.digest_brute = 20
	B.special_entrance_sound = 'sound/machines/blender.ogg'
	B.recycling = TRUE
