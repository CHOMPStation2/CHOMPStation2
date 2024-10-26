// allow teshari to always be scooped, as long as pref is enabled
/mob/living/MouseDrop(var/atom/over_object)
	// make sure src (The dragged) is human
	if(!istype(src, /mob/living/carbon/human))
		return ..()

	var/mob/living/carbon/human/DraggedH = src

	//make sure src (the dragged) is a teshari (or shaped like one)
	if(DraggedH.species.get_bodytype() == SPECIES_TESHARI)
		var/mob/living/M = over_object
		// only perform the grab if; grabber and grabbed adjacent, caller is grabbed OR grabber, and the grabbed's grab preference is true.
		if(holder_type && istype(M) && Adjacent(M) && (usr == M || usr == DraggedH) && DraggedH != M && !M.incapacitated() && DraggedH.pickup_pref && (M != usr || (M == usr && M.pickup_active)) && (DraggedH.a_intent == I_HELP && M.a_intent == I_HELP)) //VOREStation Edit
			get_scooped(M, (usr == DraggedH))
			return
	return ..()


//allow teshari permission to pass plastic flaps.
/obj/structure/plasticflaps/CanPass(atom/A, turf/T)
	var/mob/living/carbon/human/H = A
	if(istype(H))
		if(H.species.get_bodytype() == SPECIES_TESHARI)
			return 1

	return ..()
