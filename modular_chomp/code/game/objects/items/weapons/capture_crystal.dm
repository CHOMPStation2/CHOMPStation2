/obj/item/capture_crystal/cheap
	name = "cheap capture crystal"
	desc = "A silent, unassuming crystal in what appears to be some kind of steel housing. This one seems to be cheapley made and can only handle a willing mind."
	icon = 'icons/obj/capture_crystal_vr.dmi'


//The basic capture command does most of the registration work.
/obj/item/capture_crystal/cheap/capture(mob/living/M, mob/living/U)
	if(!M.capture_crystal || M.capture_caught)
		to_chat(U, "<span class='warning'>This creature is not suitable for capture with this crystal.</span>")
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	knowyoursignals(M, U)
	if(isanimal(M) || !M.client)
		to_chat(U, "<span class='warning'>This creature is not suitable for capture.</span>")
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	owner = U
	if(!bound_mob)
		bound_mob = M
		bound_mob.capture_caught = TRUE
		persist_storable = FALSE
	desc = "A silent, unassuming crystal in what appears to be some kind of steel housing. This one seems to be cheapley made and can only handle a willing mind."


/obj/item/capture_crystal/cheap/activate(mob/living/user, target)
	if(!cooldown_check())		//Are we ready to do things yet?
		to_chat(thrower, "<span class='notice'>\The [src] clicks unsatisfyingly... It is not ready yet.</span>")
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	if(spawn_mob_type && !bound_mob)			//We don't already have a mob, but we know what kind of mob we want
		bound_mob = new spawn_mob_type(src)		//Well let's spawn it then!
		bound_mob.faction = user.faction
		spawn_mob_type = null
		capture(bound_mob, user)
	if(bound_mob)								//We have a mob! Let's finish setting up.
		user.visible_message("\The [src] clicks, and then emits a small chime.", "\The [src] grows warm in your hand, something inside is awake.")
		active = TRUE
		if(!owner)								//Do we have an owner? It's pretty unlikely that this would ever happen! But it happens, let's claim the crystal.
			owner = user
			if(isanimal(bound_mob))
				var/mob/living/simple_mob/S = bound_mob
				S.revivedby = user.name
		determine_action(user, target)
		return
	else if(isliving(target))						//So we don't have a mob, let's try to claim one! Is the target a mob?
		var/mob/living/M = target
		last_activate = world.time
		if(M.capture_caught)					//Can't capture things that were already caught.
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			to_chat(user, "<span class='notice'>\The [src] clicks unsatisfyingly... \The [M] is already under someone else's control.</span>")
			return
		else if(M.stat == DEAD)						//Is it dead? We can't influence dead things.
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			to_chat(user, "<span class='notice'>\The [src] clicks unsatisfyingly... \The [M] is not in a state to be captured.</span>")
			return
		else if(M.client)							//Is it player controlled?
			capture_player(M, user)				//We have to do things a little differently if so.
			return
		else if(!isanimal(M))						//So it's not player controlled, but it's also not a simplemob?
			to_chat(user, "<span class='warning'>This creature is not suitable for capture.</span>")
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			return
		var/mob/living/simple_mob/S = M
		if(!S.ai_holder)						//We don't really want to capture simplemobs that don't have an AI
			to_chat(user, "<span class='warning'>This creature is not suitable for capture.</span>")
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		else									//Shoot, it didn't work and now it's mad!!!
			S.ai_holder.go_wake()
			S.ai_holder.target = user
			S.ai_holder.track_target_position()
			S.ai_holder.set_stance(STANCE_FIGHT)
			user.visible_message("\The [src] bonks into \the [S], angering it!")
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			to_chat(user, "<span class='notice'>\The [src] clicks unsatisfyingly.</span>")
		update_icon()
		return
	//The target is not a mob, so let's not do anything.
	playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
	to_chat(user, "<span class='notice'>\The [src] clicks unsatisfyingly.</span>")
