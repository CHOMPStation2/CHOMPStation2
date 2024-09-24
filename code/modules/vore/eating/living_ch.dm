///////////////////// Mob Living /////////////////////
/mob/living
	// var/list/vore_organs_reagents = list()	//Reagent datums in vore bellies in a mob
	// var/vore_footstep_volume = 0			//Variable volume for a mob, updated every 5 steps where a footstep hasnt occurred.
	// var/vore_footstep_chance = 0
	// var/vore_footstep_volume_cooldown = 0	//goes up each time a step isnt heard, and will proc update of list of viable bellies to determine the most filled and loudest one to base audio on.
	var/mute_entry = FALSE					//Toggleable vorgan entry logs.
	var/parasitic = FALSE					//Digestion immunity and nutrition leeching variable
	var/liquidbelly_visuals = TRUE			//Toggle for liquidbelly level visuals.
	var/churn_count = 0						//Counter for digested livings

	var/passtable_reset		// For crawling
	var/passtable_crawl_checked = FALSE

	// CHOMP vore icons refactor (Now on living)
	var/vore_icons = 0					// Bitfield for which fields we have vore icons for.
	var/vore_eyes = FALSE				// For mobs with fullness specific eye overlays.

/mob/living/proc/handle_special_unlocks()
	return

// Update fullness based on size & quantity of belly contents
/mob/proc/update_fullness(var/returning = FALSE)
	if(!returning)
		if(updating_fullness)
			return
		updating_fullness = TRUE
		spawn(2)
		updating_fullness = FALSE
		src.update_fullness(TRUE)
		return
	var/list/new_fullness = list()
	vore_fullness = 0
	for(var/belly_class in vore_icon_bellies)
		new_fullness[belly_class] = 0
	for(var/obj/belly/B as anything in vore_organs)
		if(DM_FLAG_VORESPRITE_BELLY & B.vore_sprite_flags)
			new_fullness[B.belly_sprite_to_affect] += B.GetFullnessFromBelly()
		if(istype(src, /mob/living/carbon/human) && DM_FLAG_VORESPRITE_ARTICLE & B.vore_sprite_flags)
			if(!new_fullness[B.undergarment_chosen])
				new_fullness[B.undergarment_chosen] = 1
			new_fullness[B.undergarment_chosen] += B.GetFullnessFromBelly()
			new_fullness[B.undergarment_chosen + "-ifnone"] = B.undergarment_if_none
			new_fullness[B.undergarment_chosen + "-color"] = B.undergarment_color
	for(var/belly_class in vore_icon_bellies)
		new_fullness[belly_class] /= size_multiplier //Divided by pred's size so a macro mob won't get macro belly from a regular prey.
		new_fullness[belly_class] *= belly_size_multiplier // Some mobs are small even at 100% size. Let's account for that.
		new_fullness[belly_class] = round(new_fullness[belly_class], 1) // Because intervals of 0.25 are going to make sprite artists cry.
		vore_fullness_ex[belly_class] = min(vore_capacity_ex[belly_class], new_fullness[belly_class])
		vore_fullness += new_fullness[belly_class]
	if(vore_fullness < 0)
		vore_fullness = 0
	vore_fullness = min(vore_capacity, vore_fullness)
	updating_fullness = FALSE
	return new_fullness

/* This is an ELEMENT now
/mob/living/proc/check_vorefootstep(var/m_intent, var/turf/T)
	if(vore_footstep_volume_cooldown++ >= 5) //updating the 'dominating' belly, the one that has most liquid and is loudest.
		choose_vorefootstep()
		vore_footstep_volume_cooldown = 0

	if(!vore_footstep_volume || !vore_footstep_chance)	//Checking if there is actual sound if we run the proc
		return

	if(prob(vore_footstep_chance))	//Peform the check, lets see if we trigger a sound
		handle_vorefootstep(m_intent, T)


//Proc to choose the belly that has most liquid in it and is currently dominant for audio
/mob/living/proc/choose_vorefootstep()
	vore_organs_reagents = list()
	var/highest_vol = 0

	for(var/obj/belly/B in vore_organs)
		var/total_volume = B.reagents.total_volume
		vore_organs_reagents += total_volume

		if(B.show_liquids && B.vorefootsteps_sounds && highest_vol < total_volume)
			highest_vol = total_volume

	if(highest_vol < 20)	//For now the volume will be off if less than 20 units of reagent are in vorebellies
		vore_footstep_volume = 0
		vore_footstep_chance = 0
	else					//Volume will start at least at 20 so theres more initial sound
		vore_footstep_volume = 20 + highest_vol * 4/5
		vore_footstep_chance = highest_vol/4
*/

//
// Returns examine messages for how much reagents are in bellies
//
/mob/living/proc/examine_reagent_bellies()
	if(!show_pudge()) //Some clothing or equipment can hide this. Reagent inflation is not very different in this aspect.
		return ""

	var/message = ""
	for (var/belly in vore_organs)
		var/obj/belly/B = belly

		var/fill_percentage = B.reagents.maximum_volume > 0 ? B.reagents.total_volume / B.reagents.maximum_volume : 0

		if(0 <= fill_percentage && fill_percentage <= 0.2 && B.show_fullness_messages)
			message += B.get_reagent_examine_msg1()
		if(0.2 < fill_percentage && fill_percentage <= 0.4 && B.show_fullness_messages)
			message += B.get_reagent_examine_msg2()
		if(0.4 < fill_percentage && fill_percentage <= 0.6 && B.show_fullness_messages)
			message += B.get_reagent_examine_msg3()
		if(0.6 < fill_percentage && fill_percentage <= 0.8 && B.show_fullness_messages)
			message += B.get_reagent_examine_msg4()
		if(0.8 < fill_percentage && fill_percentage <= 1 && B.show_fullness_messages)
			message += B.get_reagent_examine_msg5()

	return message

/mob/living/proc/vore_check_reagents()
	set name = "Check Belly Liquid (Vore)"
	set category = "Abilities.Vore"
	set desc = "Check the amount of liquid in your belly."

	var/obj/belly/RTB = input("Choose which vore belly to check") as null|anything in src.vore_organs
	if(!RTB)
		return FALSE

	to_chat(src, "<span class='vnotice'>[RTB] has [RTB.reagents.total_volume] units of liquid.</span>")

/mob/living/proc/vore_transfer_reagents()
	set name = "Transfer Liquid (Vore)"
	set category = "Abilities.Vore"
	set desc = "Transfer liquid from an organ to another or stomach, or into another person or container."
	set popup_menu = FALSE

	if(!checkClickCooldown() || incapacitated(INCAPACITATION_KNOCKOUT))
		return FALSE

	var/mob/living/user = usr

	var/mob/living/TG = input("Choose who to transfer from") as null| mob in view(1,user.loc)
	if(!TG)
		return FALSE
	if(TG.give_reagents == FALSE && user != TG) //User isnt forced to allow giving in prefs if they are the one doing it
		to_chat(user, "<span class='vwarning'>This person's prefs dont allow that!</span>")
		return FALSE

	var/obj/belly/RTB = input("Choose which vore belly to transfer from") as null|anything in TG.vore_organs //First they choose the belly to transfer from.
	if(!RTB)
		return FALSE

	var/transfer_amount = input("How much to transfer?") in list(5,10,25,50,100)
	if(!transfer_amount)
		return FALSE

	switch(input(user,"Choose what to transfer to","Select Target") in list("Vore belly", "Stomach", "Container", "Floor", "Cancel"))
		if("Cancel")
			return FALSE
		if("Vore belly")
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(1,user.loc)
			if(!TR)  return FALSE

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in user.vore_organs
				if(!TB)
					return FALSE
				if(!Adjacent(TR) || !Adjacent(TG))
					return //No long distance transfer
				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='vnotice'>[TB] is full!</span>")
					return FALSE

				if(TG == user)
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [lowertext(RTB.name)] into their [lowertext(TB.name)].</span>")
				else
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [lowertext(RTB.name)] into their [lowertext(TB.name)].</span>")
					add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)
				if(RTB.count_liquid_for_sprite || TB.count_liquid_for_sprite)
					update_fullness()

			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='vwarning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in TR.vore_organs
				if(!TB)
					return FALSE
				if(!Adjacent(TR) || !Adjacent(TG))
					return //No long distance transfer
				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='vnotice'>[TR]'s [lowertext(TB.name)] is full!</span>")
					return FALSE

				if(TG == user)
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [lowertext(RTB.name)] into [TR]'s [lowertext(TB.name)].</span>")
				else
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]s [lowertext(RTB.name)] into [TR]'s [lowertext(TB.name)].</span>")

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)
				add_attack_logs(user,TR,"Transfered reagents from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
				if(RTB.count_liquid_for_sprite)
					update_fullness()
				if(TB.count_liquid_for_sprite)
					TR.update_fullness()


		if("Stomach")
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(1,user.loc)
			if(!TR)  return
			if(!Adjacent(TR) || !Adjacent(TG))
				return //No long distance transfer

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				if(TG == user)
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [lowertext(RTB.name)] into their stomach.</span>")
				else
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [lowertext(RTB.name)] into their stomach.</span>")
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s Stomach")
				if(RTB.count_liquid_for_sprite)
					update_fullness()

			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='vwarning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				if(TG == user)
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [lowertext(RTB.name)] into [TR]'s stomach.</span>")
				else
					user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [lowertext(RTB.name)] into [TR]'s stomach.</span>")

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s Stomach")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
				if(RTB.count_liquid_for_sprite)
					update_fullness()

		if("Container")
			if(RTB.reagentid == "stomacid")
				return
			var/list/choices = list()
			for(var/obj/item/weapon/reagent_containers/rc in view(1,user.loc))
				choices += rc
			var/obj/item/weapon/reagent_containers/T = input(user,"Choose what to transfer to","Select Target") as null|anything in choices
			if(!T)
				return FALSE
			if(!Adjacent(T) || !Adjacent(TG))
				return //No long distance transfer

			if(TG == user)
				user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [lowertext(RTB.name)] into [T].</span>")
			else
				user.custom_emote_vr(1, "<span class='vnotice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [lowertext(RTB.name)] into [T].</span>")

			RTB.reagents.vore_trans_to_con(T, transfer_amount, 1, 0)
			add_attack_logs(user, T,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to a [T]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
			if(RTB.count_liquid_for_sprite)
				update_fullness()
		if("Floor")
			if(RTB.reagentid == "water")
				return
			var/amount_removed = RTB.reagents.remove_any(transfer_amount)
			if(RTB.count_liquid_for_sprite)
				update_fullness()
			var/puddle_amount = round(amount_removed/5)

			if(puddle_amount == 0)
				to_chat(user,"<span class='vnotice'>[RTB.reagent_name] dripples from the [lowertext(RTB.name)], not enough to form a puddle.</span> ")
				return

			if(TG == user)
				user.custom_emote_vr(1, "<span class='vnotice'>spills [RTB.reagent_name] from their [lowertext(RTB.name)] onto the floor!</span>")
			else
				user.custom_emote_vr(1, "<span class='vnotice'>spills [RTB.reagent_name] from [TG]'s [lowertext(RTB.name)] onto the floor!</span>")

			var/obj/effect/decal/cleanable/blood/reagent/puddle = null
			if (RTB.custom_reagentcolor)
				puddle = new /obj/effect/decal/cleanable/blood/reagent(RTB.reagent_name, RTB.custom_reagentcolor, RTB.reagentid, puddle_amount, user.ckey, TG.ckey)
			else
				puddle = new /obj/effect/decal/cleanable/blood/reagent(RTB.reagent_name, RTB.reagentcolor, RTB.reagentid, puddle_amount, user.ckey, TG.ckey)

			puddle.loc = TG.loc

			var/soundfile
			if(!RTB.fancy_vore)
				soundfile = classic_release_sounds[RTB.release_sound]
			else
				soundfile = fancy_release_sounds[RTB.release_sound]
			if(soundfile)
				playsound(src, soundfile, vol = 100, vary = 1, falloff = VORE_SOUND_FALLOFF, preference = /datum/preference/toggle/eating_noises)

/mob/living/proc/vore_bellyrub(var/mob/living/T in view(1,src))
	set name = "Give Bellyrubs"
	set category = "Abilities.General"
	set desc = "Provide bellyrubs to either yourself or another mob with a belly."

	if(!T)
		T = input("Choose whose belly to rub") as null| mob in view(1,src)
		if(!T)
			return FALSE
	if(!(T in view(1,src)))
		return FALSE
	if(T.vore_selected)
		var/obj/belly/B = T.vore_selected
		if(istype(B))
			if(T == src)
				custom_emote_vr(1, "rubs their [belly_rub_target ? belly_rub_target : lowertext(B.name)].")
			else
				custom_emote_vr(1, "gives some rubs over [T]'s [belly_rub_target ? belly_rub_target : lowertext(B.name)].")
			B.quick_cycle()
			return TRUE
	to_chat(src, "<span class='vwarning'>There is no suitable belly for rubs.</span>")
	return FALSE

/mob/living/proc/mute_entry()
	set name = "Mute Vorgan Entrance"
	set category = "Preferences.Vore"
	set desc = "Mute the chatlog messages when something enters a vore belly."
	mute_entry = !mute_entry
	to_chat(src, "<span class='vwarning'>Entrance logs [mute_entry ? "disabled" : "enabled"].</span>")

/mob/living/proc/restrict_trasheater()
	set name = "Restrict Trash Eater"
	set category = "Abilities.Vore"
	set desc = "Toggle Trash Eater restriction level."
	adminbus_trash = !adminbus_trash
	to_chat(src, "<span class='vwarning'>Trash Eater restriction level set to [adminbus_trash ? "everything not blacklisted" : "only whitelisted items"].</span>")

/mob/living/proc/liquidbelly_visuals()
	set name = "Toggle Liquidbelly Visuals"
	set category = "Preferences.Vore"
	set desc = "Toggle liquidbelly fullscreen visual effect."
	liquidbelly_visuals = !liquidbelly_visuals
	to_chat(src, "<span class='vwarning'>Liquidbelly overlays [liquidbelly_visuals ? "enabled" : "disabled"].</span>")

/mob/living/proc/fix_vore_effects()
	set name = "Fix Vore Effects"
	set category = "OOC.Debug"
	set desc = "Fix certain vore effects lingering after you've exited a belly."

	if(!isbelly(src.loc))
		if(alert(src, "Only use this verb if you are affected by certain vore effects outside of a belly, such as muffling or a stuck belly fullscreen.", "Clear Vore Effects", "Continue", "Nevermind") != "Continue")
			return

		absorbed = FALSE
		muffled = FALSE
		clear_fullscreen("belly")
		clear_fullscreen(ATOM_BELLY_FULLSCREEN)
		stop_sound_channel(CHANNEL_PREYLOOP)

/mob/living/verb/vore_check_nutrition()
	set name = "Check Nutrition"
	set category = "Abilities.Vore"
	set desc = "Check your current nutrition level."
	to_chat(src, "<span class='vnotice'>Current nutrition level: [nutrition].</span>")

// This proc will either return the first belly the mob is in or return null if they're not in one
/mob/living/proc/surrounding_belly()
	var/atom/curloc = src.loc
	while(curloc && !isbelly(curloc))
		if(istype(curloc, /turf)) break
		if(!curloc.loc || curloc == curloc.loc) break
		curloc = curloc.loc
	if(isbelly(curloc)) return curloc
