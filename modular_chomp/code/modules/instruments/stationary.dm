/obj/structure/musician/attackby(obj/item/W, mob/user)
	if(W.has_tool_quality(TOOL_WRENCH))
		playsound(src, W.usesound, 100, 1)
		if(anchored)
			user.visible_message(span_filter_notice("[user] begins unsecuring \the [src] from the floor."), span_filter_notice("You start unsecuring \the [src] from the floor."))
		else
			user.visible_message(span_filter_notice("[user] begins securing \the [src] to the floor."), span_filter_notice("You start securing \the [src] to the floor."))

		if(do_after(user, 20 * W.toolspeed, src))
			if(!src) return
			to_chat(user, span_notice("You [anchored? "un" : ""]secured \the [src]!"))
			anchored = !anchored
		return
