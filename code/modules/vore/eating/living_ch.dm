///////////////////// Mob Living /////////////////////
/mob/living
	var/list/vore_organs_reagents = list()	//Reagent datums in vore bellies in a mob
	var/receive_reagents = FALSE			//Pref for people to avoid others transfering reagents into them.
	var/give_reagents = FALSE				//Pref for people to avoid others taking reagents from them.
	var/vore_footstep_volume = 0			//Variable volume for a mob, updated every 5 steps where a footstep hasnt occurred.
	var/vore_footstep_chance = 0
	var/vore_footstep_volume_cooldown = 0	//goes up each time a step isnt heard, and will proc update of list of viable bellies to determine the most filled and loudest one to base audio on.

	var/parasitic = FALSE //Digestion immunity and nutrition leeching variable


mob/living/proc/check_vorefootstep(var/m_intent, var/turf/T)
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

		if(B.vorefootsteps_sounds == TRUE && highest_vol < total_volume)
			highest_vol = total_volume

	if(highest_vol < 20)	//For now the volume will be off if less than 20 units of reagent are in vorebellies
		vore_footstep_volume = 0
		vore_footstep_chance = 0
	else					//Volume will start at least at 20 so theres more initial sound
		vore_footstep_volume = 20 + highest_vol * 4/5
		vore_footstep_chance = highest_vol/4


//
// Returns examine messages for how much reagents are in bellies
//
/mob/living/proc/examine_reagent_bellies()
	if(!show_pudge()) //Some clothing or equipment can hide this. Reagent inflation is not very different in this aspect.
		return ""

	var/message = ""
	for (var/belly in vore_organs)
		var/obj/belly/B = belly

		if(0 <= B.reagents.total_volume && B.reagents.total_volume <= 20 && B.liquid_fullness1_messages)
			message += B.get_reagent_examine_msg1()
		if(20 < B.reagents.total_volume && B.reagents.total_volume <= 40 && B.liquid_fullness2_messages)
			message += B.get_reagent_examine_msg2()
		if(40 < B.reagents.total_volume && B.reagents.total_volume <= 60 && B.liquid_fullness3_messages)
			message += B.get_reagent_examine_msg3()
		if(60 < B.reagents.total_volume && B.reagents.total_volume <= 80 && B.liquid_fullness4_messages)
			message += B.get_reagent_examine_msg4()
		if(80 < B.reagents.total_volume && B.reagents.total_volume <= 100 && B.liquid_fullness5_messages)
			message += B.get_reagent_examine_msg5()

	return message

/mob/living/proc/vore_check_reagents()
	set name = "Check Belly Liquid (Vore)"
	set category = "Abilities"
	set desc = "Check the amount of liquid in your belly."

	var/obj/belly/RTB = input("Choose which vore belly to check") as null|anything in src.vore_organs
	if(!RTB)
		return FALSE

	to_chat(src, "<span class='notice'>[RTB] has [RTB.reagents.total_volume] units of liquid.</span>")

/mob/living/proc/vore_transfer_reagents()
	set name = "Transfer Liquid (Vore)"
	set category = "Abilities"
	set desc = "Transfer liquid from an organ to another or stomach, or into another person or container."
	set popup_menu = FALSE

	if(!checkClickCooldown() || incapacitated(INCAPACITATION_ALL))
		return FALSE

	var/mob/living/user = usr

	var/mob/living/TG = input("Choose who to transfer from") as null| mob in view(user.loc,1)
	if(!TG)
		return FALSE
	if(TG.give_reagents == FALSE && user != TG) //User isnt forced to allow giving in prefs if they are the one doing it
		to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
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
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(user.loc,1)
			if(!TR)  return FALSE

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in user.vore_organs
				if(!TB)
					return FALSE
				if(!Adjacent(TR) || !Adjacent(TG))
					return //No long distance transfer
				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='notice'>[TB] is full!</span>")
					return FALSE

				if(TG == user)
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [RTB] into their [TB].</span>")
				else
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [RTB] into their [TB].</span>")
					add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)

			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in TR.vore_organs
				if(!TB)
					return FALSE
				if(!Adjacent(TR) || !Adjacent(TG))
					return //No long distance transfer
				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='notice'>[TR]'s [TB] is full!</span>")
					return FALSE

				if(TG == user)
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [RTB] into [TR]'s [TB].</span>")
				else
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]s [RTB] into [TR]'s [TB].</span>")

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)
				add_attack_logs(user,TR,"Transfered reagents from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks


		if("Stomach")
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(user.loc,1)
			if(!TR)  return
			if(!Adjacent(TR) || !Adjacent(TG))
				return //No long distance transfer

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				if(TG == user)
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [RTB] into their stomach.</span>")
				else
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [RTB] into their stomach.</span>")
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s Stomach")

			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				if(TG == user)
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [RTB] into [TR]'s stomach.</span>")
				else
					user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [RTB] into [TR]'s stomach.</span>")

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s Stomach")	//Bonus for staff so they can see if people have abused transfer and done pref breaks

		if("Container")
			var/list/choices = list()
			for(var/obj/item/weapon/reagent_containers/rc in view(user.loc,1))
				choices += rc
			var/obj/item/weapon/reagent_containers/T = input(user,"Choose what to transfer to","Select Target") as null|anything in choices
			if(!T)
			 return FALSE
			if(!Adjacent(T) || !Adjacent(TG))
				return //No long distance transfer

			if(TG == user)
				user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from their [RTB] into [T].</span>")
			else
				user.custom_emote_vr(1, "<span class='notice'>[RTB.reagent_transfer_verb] [RTB.reagent_name] from [TG]'s [RTB] into [T].</span>")

			RTB.reagents.vore_trans_to_con(T, transfer_amount, 1, 0)
			add_attack_logs(user, T,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to a [T]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
		if("Floor")
			if(RTB.reagentid == "water")
				return
			var/amount_removed = RTB.reagents.remove_any(transfer_amount)
			var/puddle_amount = round(amount_removed/5)

			if(puddle_amount == 0)
				to_chat(user,"<span class='notice'>[RTB.reagent_name] dripples from the [RTB], not enough to form a puddle.</span> ")
				return

			if(TG == user)
				user.custom_emote_vr(1, "<span class='notice'>spills [RTB.reagent_name] from their [RTB] onto the floor!</span>")
			else
				user.custom_emote_vr(1, "<span class='notice'>spills [RTB.reagent_name] from [TG]'s [RTB] onto the floor!</span>")

			var/obj/effect/decal/cleanable/blood/reagent/puddle = new /obj/effect/decal/cleanable/blood/reagent(RTB.reagent_name, RTB.reagentcolor, RTB.reagentid, puddle_amount, user.ckey, TG.ckey)
			puddle.loc = TG.loc

			var/soundfile
			if(!RTB.fancy_vore)
				soundfile = classic_release_sounds[RTB.release_sound]
			else
				soundfile = fancy_release_sounds[RTB.release_sound]
			if(soundfile)
				playsound(src, soundfile, vol = 100, vary = 1, falloff = VORE_SOUND_FALLOFF, preference = /datum/client_preference/eating_noises)
