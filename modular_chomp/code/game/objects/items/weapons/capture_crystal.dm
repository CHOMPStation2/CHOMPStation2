/obj/item/capture_crystal
	var/spawn_mob_name = "A mob"
	var/obj/belly/in_gut = null

/* No longer need the vorefx additions as these will be handled for all indirect viewers now, including those in capture crystals
// Signals detect important procs from the host belly. Necessary to update visuals and sound loop for the player inside.
/obj/item/capture_crystal/enter_belly(obj/belly/B)
	if(isbelly(B)) // Sanity
		in_gut = B
		RegisterSignal(in_gut, COMSIG_PARENT_QDELETING, PROC_REF(gut_was_deleted), TRUE)
		RegisterSignal(in_gut, COMSIG_BELLY_UPDATE_VORE_FX, PROC_REF(capture_crystal_vfx), TRUE)
		RegisterSignal(in_gut, COMSIG_BELLY_UPDATE_PREY_LOOP, PROC_REF(capture_crystal_prey_loop), TRUE)

		var/juice = in_gut.reagents.total_volume
		if(!juice)
			juice = 0
		capture_crystal_vfx(null, TRUE, juice)
		capture_crystal_prey_loop()
		for(var/mob/living/contained in src.contents) // For reasons I don't understand, using bound_mob here sets bound_mob to null.
			var/formatted_desc
			formatted_desc = replacetext(in_gut.desc, "%belly", lowertext(in_gut.name)) //replace with this belly's name
			formatted_desc = replacetext(formatted_desc, "%pred", in_gut.owner) //replace with this belly's owner
			formatted_desc = replacetext(formatted_desc, "%prey", contained) //replace with whatever mob entered into this belly
			to_chat(contained, span_boldnotice("[formatted_desc]"))

/obj/item/capture_crystal/exit_belly()
	for(var/mob/living/contained in src.contents)
		contained.clear_fullscreen(ATOM_BELLY_FULLSCREEN) // Clear fullscreens.
		contained.stop_sound_channel(CHANNEL_PREYLOOP) // Clear sound loop.
		contained.next_preyloop = world.time

	if(isbelly(in_gut)) // Sanity
		UnregisterSignal(in_gut, COMSIG_PARENT_QDELETING)
		UnregisterSignal(in_gut, COMSIG_BELLY_UPDATE_VORE_FX)
		UnregisterSignal(in_gut, COMSIG_BELLY_UPDATE_PREY_LOOP)
		in_gut = null

// Inelegant copy-pasta since I can't steal the proc from bellies.
/obj/item/capture_crystal/proc/capture_crystal_vfx(var/update, var/severity = 0)
	if(isbelly(in_gut))
		for(var/mob/living/contained in src.contents) // I guess this works if multi-catch crystals ever become a thing.
			if(!contained.client)
				return
			if(!contained.show_vore_fx)
				contained.clear_fullscreen(ATOM_BELLY_FULLSCREEN)
				return
			if(update)
				contained.clear_fullscreen(ATOM_BELLY_FULLSCREEN)
			if(in_gut.belly_fullscreen)
				if(in_gut.colorization_enabled)
					var/obj/screen/fullscreen/F = contained.overlay_fullscreen(ATOM_BELLY_FULLSCREEN, /obj/screen/fullscreen/belly, severity) //CHOMPEdit Start: preserving save data
					F.icon = file("modular_chomp/icons/mob/vore_fullscreens/[in_gut.belly_fullscreen].dmi")
					F.cut_overlays()
					var/image/I = image(F.icon, in_gut.belly_fullscreen) //Would be cool if I could just include color and alpha in the image define so we don't have to copy paste
					I.color = in_gut.belly_fullscreen_color
					I.alpha = in_gut.belly_fullscreen_alpha
					F.add_overlay(I)
					I = image(F.icon, in_gut.belly_fullscreen+"-2")
					I.color = in_gut.belly_fullscreen_color2
					I.alpha = in_gut.belly_fullscreen_alpha
					F.add_overlay(I)
					I = image(F.icon, in_gut.belly_fullscreen+"-3")
					I.color = in_gut.belly_fullscreen_color3
					I.alpha = in_gut.belly_fullscreen_alpha
					F.add_overlay(I)
					I = image(F.icon, in_gut.belly_fullscreen+"-4")
					I.color = in_gut.belly_fullscreen_color4
					I.alpha = in_gut.belly_fullscreen_alpha
					F.add_overlay(I)
					if(contained.liquidbelly_visuals && in_gut.reagents.total_volume)
						if(in_gut.digest_mode == DM_HOLD && in_gut.item_digest_mode == IM_HOLD)
							I = image('modular_chomp/icons/mob/vore_fullscreens/bubbles.dmi', "calm")
						else
							I = image('modular_chomp/icons/mob/vore_fullscreens/bubbles.dmi', "bubbles")
						I.color = in_gut.reagentcolor
						I.alpha = max(150, min(in_gut.custom_max_volume, 255)) - (255 - in_gut.belly_fullscreen_alpha)
						I.pixel_y = -450 + (450 / in_gut.custom_max_volume * in_gut.reagents.total_volume)
						F.add_overlay(I)
					F.update_for_view(contained.client.view)
				else
					var/obj/screen/fullscreen/F = contained.overlay_fullscreen(ATOM_BELLY_FULLSCREEN, /obj/screen/fullscreen/belly/fixed, severity) //preserving save data
					F.icon = file("modular_chomp/icons/mob/vore_fullscreens/[in_gut.belly_fullscreen].dmi")
					F.cut_overlays()
					F.add_overlay(image(F.icon, in_gut.belly_fullscreen))
					F.add_overlay(image(F.icon, in_gut.belly_fullscreen+"-2"))
					F.add_overlay(image(F.icon, in_gut.belly_fullscreen+"-3"))
					F.add_overlay(image(F.icon, in_gut.belly_fullscreen+"-4"))
					if(contained.liquidbelly_visuals && in_gut.reagents.total_volume)
						var/image/I
						if(in_gut.digest_mode == DM_HOLD && in_gut.item_digest_mode == IM_HOLD)
							I = image('modular_chomp/icons/mob/vore_fullscreens/bubbles.dmi', "calm")
						else
							I = image('modular_chomp/icons/mob/vore_fullscreens/bubbles.dmi', "bubbles")
						I.color = in_gut.reagentcolor
						I.alpha = max(150, min(in_gut.custom_max_volume, 255)) - (255 - in_gut.belly_fullscreen_alpha)
						I.pixel_y = -450 + (450 / in_gut.custom_max_volume * in_gut.reagents.total_volume)
						F.add_overlay(I)
					F.update_for_view(contained.client.view)
			else
				contained.clear_fullscreen(ATOM_BELLY_FULLSCREEN)

			/* // Disabled (and untested) for now, left to make it easier if we want to enable this later.
			if(in_gut.disable_hud)
				if(contained?.hud_used?.hud_shown)
					to_chat(contained, span_notice("((Your pred has disabled huds in their belly. Turn off vore FX and hit F12 to get it back; or relax, and enjoy the serenity.))"))
					contained.toggle_hud_vis(TRUE) */

// Inelegant copy-pasta since I can't steal the proc from bellies.
/obj/item/capture_crystal/proc/capture_crystal_prey_loop()
	if(isbelly(in_gut))
		for(var/mob/living/contained in src.contents) // Skip empty crystals.
			//We don't bother executing any other code if the prey doesn't want to hear the noises.
			if(!contained.is_preference_enabled(/datum/client_preference/digestion_noises))
				contained.stop_sound_channel(CHANNEL_PREYLOOP) // sanity just in case, because byond is whack and you can't trust it
				continue

			// We don't want the sounds to overlap, but we do want them to steadily replay.
			// We also don't want the sounds to play if the pred hasn't marked this belly as fleshy, or doesn't
			// have the right sounds to play.
			if(in_gut.is_wet && in_gut.wet_loop && (world.time > contained.next_preyloop))
				contained.stop_sound_channel(CHANNEL_PREYLOOP)
				var/sound/preyloop = sound('sound/vore/sunesound/prey/loop.ogg')
				contained.playsound_local(get_turf(src), preyloop, 80, 0, channel = CHANNEL_PREYLOOP)
				contained.next_preyloop = (world.time + (52 SECONDS))

//Cleanup signals if we're in a gut and it gets deleted.
/obj/item/capture_crystal/proc/gut_was_deleted()
	UnregisterSignal(in_gut, COMSIG_PARENT_QDELETING)
	UnregisterSignal(in_gut, COMSIG_BELLY_UPDATE_VORE_FX)
	UnregisterSignal(in_gut, COMSIG_BELLY_UPDATE_PREY_LOOP)
	in_gut = null
*/

/obj/item/capture_crystal/loadout
	active = TRUE

/obj/item/capture_crystal/loadout/attack(mob/living/M, mob/living/user)
	if(!bound_mob && M != user)
		to_chat(user, span_notice("\The [src] emits an unpleasant tone..."))
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	. = ..()

/obj/item/capture_crystal/loadout/attack_self(mob/living/user)
	if(!bound_mob)
		to_chat(user, span_notice("\The [src] emits an unpleasant tone... It is not ready yet."))
		playsound(src, 'sound/effects/capture-crystal-problem.ogg', 75, 1, -1)
		return
	. = ..()

/obj/item/capture_crystal/loadout/capture_chance()
	return 0

/obj/item/capture_crystal/cheap
	name = "cheap capture crystal"
	desc = "A silent, unassuming crystal in what appears to be some kind of steel housing. This one seems to be cheaply made and can only handle a willing mind."
	icon = 'icons/obj/capture_crystal_vr.dmi'


//The basic capture command does most of the registration work.
/obj/item/capture_crystal/cheap/capture(mob/living/M, mob/living/U)
	if(!M.capture_crystal || M.capture_caught)
		to_chat(U, span_warning("This creature is not suitable for capture with this crystal."))
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	knowyoursignals(M, U)
	if(isanimal(M) || !M.client)
		to_chat(U, span_warning("This creature is not suitable for capture."))
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	owner = U
	if(!bound_mob)
		bound_mob = M
		bound_mob.capture_caught = TRUE
		persist_storable = FALSE
	desc = "A silent, unassuming crystal in what appears to be some kind of steel housing. This one seems to be cheaply made and can only handle a willing mind."


/obj/item/capture_crystal/cheap/activate(mob/living/user, target)
	if(!cooldown_check())		//Are we ready to do things yet?
		to_chat(thrower, span_notice("\The [src] clicks unsatisfyingly... It is not ready yet."))
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
			to_chat(user, span_notice("\The [src] clicks unsatisfyingly... \The [M] is already under someone else's control."))
			return
		else if(M.stat == DEAD)						//Is it dead? We can't influence dead things.
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			to_chat(user, span_notice("\The [src] clicks unsatisfyingly... \The [M] is not in a state to be captured."))
			return
		else if(M.client)							//Is it player controlled?
			capture_player(M, user)				//We have to do things a little differently if so.
			return
		else if(!isanimal(M))						//So it's not player controlled, but it's also not a simplemob?
			to_chat(user, span_warning("This creature is not suitable for capture."))
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			return
		var/mob/living/simple_mob/S = M
		if(!S.ai_holder)						//We don't really want to capture simplemobs that don't have an AI
			to_chat(user, span_warning("This creature is not suitable for capture."))
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		else									//Shoot, it didn't work and now it's mad!!!
			S.ai_holder.go_wake()
			S.ai_holder.give_target(user, urgent = TRUE)
			user.visible_message("\The [src] bonks into \the [S], angering it!")
			playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
			to_chat(user, span_notice("\The [src] clicks unsatisfyingly."))
		update_icon()
		return
	//The target is not a mob, so let's not do anything.
	playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
	to_chat(user, span_notice("\The [src] clicks unsatisfyingly."))
