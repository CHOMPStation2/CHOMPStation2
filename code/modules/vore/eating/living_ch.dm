///////////////////// Mob Living /////////////////////
/mob/living
	var/receive_reagents = FALSE	//Pref for people to avoid others transfering reagents into them.
	var/give_reagents = FALSE		//Pref for people to avoid others taking reagents from them.

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


/mob/living/proc/vore_transfer_reagents()
	set name = "Transfer Liquid (Vore)"
	set category = "Abilities"
	set desc = "Transfer liquid from an organ to another or stomach, or into another person or container."
	set popup_menu = FALSE

	if(!canClick() || incapacitated(INCAPACITATION_ALL))
		return FALSE

	var/mob/living/user = usr

	var/mob/living/TG = input("Choose who to transfer from") as null| mob in view(user.loc,1)
	if(!TG)
		return FALSE


	var/obj/belly/RTB = input("Choose which vore belly to transfer from") as null|anything in TG.vore_organs //First they choose the belly to transfer from.
	if(!RTB)
		return FALSE
	if(TG.give_reagents == FALSE && user != TG) //User isnt forced to allow giving in prefs if they are the one doing it
		to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
		return FALSE

	var/transfer_amount = input("How much to transfer?") in list(5,10,25,50,100)
	if(!transfer_amount)
		return FALSE

	switch(input(user,"Choose what to transfer to","Select Target") in list("Vore belly", "Stomach", "Container", "Cancel"))
		if("Cancel")
			return FALSE
		if("Vore belly")
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(user.loc,1)
			if(!TR)  return FALSE

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in user.vore_organs
				if(!TB)
					return FALSE

				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='notice'>[TB] is full!</span>")
					return FALSE

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)

				if(TG != user)
					user.visible_message("<span class='notice'>[user] fills their [TB] with [RTB.reagent_name] from [TG]'s [RTB].</span>")
					add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks
				else
					user.visible_message("<span class='notice'>[user] fills their [TB] with [RTB.reagent_name] from their [RTB].</span>")


			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				var/obj/belly/TB = input("Choose which organ to transfer to") as null|anything in TR.vore_organs
				if(!TB)
					return FALSE

				if(!TR.reagents.get_free_space())
					to_chat(user, "<span class='notice'>[TR]'s [TB] is full!</span>")
					return FALSE

				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_VORE, 1, 0, TB)

				if(TG == user)
					user.visible_message("<span class='notice'>[user] fills [TR]'s [TB] with [RTB.reagent_name] from their [RTB].</span>")
				else
					user.visible_message("<span class='notice'>[user] fills [TR]'s [TB] with [RTB.reagent_name] from [TG]'s [RTB].</span>")

				add_attack_logs(user,TR,"Transfered reagents from [TG]'s [RTB] to [TR]'s [TB]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks


		if("Stomach")
			var/mob/living/TR = input(user,"Choose who to transfer to","Select Target") as null|mob in view(user.loc,1)
			if(!TR)  return

			if(TR == user) //Proceed, we dont need to have prefs enabled for transfer within user
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				if(TG != user)
					user.visible_message("<span class='notice'>[user] fills their stomach with [RTB.reagent_name] from [TG]'s [RTB].</span>")
				else
					user.visible_message("<span class='notice'>[user] fills their stomach with [RTB.reagent_name] from their [RTB].</span>")

			else if(TR.receive_reagents == FALSE)
				to_chat(user, "<span class='warning'>This person's prefs dont allow that!</span>")
				return FALSE

			else
				RTB.reagents.vore_trans_to_mob(TR, transfer_amount, CHEM_INGEST, 1, 0, null)
				if(TG == user)
					user.visible_message("<span class='notice'>[user] fills [TR]'s stomach with [RTB.reagent_name] from their [RTB].</span>")
				else
					user.visible_message("<span class='notice'>[user] fills [TR]'s stomach with [RTB.reagent_name] from [TG]'s [RTB].</span>")

				add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to [TR]'s Stomach")	//Bonus for staff so they can see if people have abused transfer and done pref breaks

		if("Container")
			var/list/choices = list()
			for(var/obj/item/weapon/reagent_containers/rc in view(user.loc,1))
				choices += rc
			var/obj/item/weapon/reagent_containers/T = input(user,"Choose what to transfer to","Select Target") as null|anything in choices
			if(!T)
			 return FALSE
			RTB.reagents.vore_trans_to_con(T, transfer_amount, 1, 0)

			if(TG == user)
				user.visible_message("<span class='notice'>[user] fills the [T] with [RTB.reagent_name] from their [RTB].</span>")
			else
				user.visible_message("<span class='notice'>[user] fills the [T] with [RTB.reagent_name] from [TG]'s [RTB].</span>")

			add_attack_logs(user,TR,"Transfered [RTB.reagent_name] from [TG]'s [RTB] to a [T]")	//Bonus for staff so they can see if people have abused transfer and done pref breaks