var/datum/antagonist/ninja/ninjas

/datum/antagonist/ninja
	id = MODE_NINJA
	role_type = BE_NINJA
	role_text = "Ninja"
	role_text_plural = "Ninja"
	bantype = "ninja"
	landmark_id = "ninjastart"
	welcome_text = span_info("You are an elite mercenary assassin of the Spider Clan. You have a variety of abilities at your disposal, thanks to your nano-enhanced cyber armor.")
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_RANDSPAWN | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudninja"

	initial_spawn_req = 1
	initial_spawn_target = 1
	hard_cap = 1
	hard_cap_round = 3

	id_type = /obj/item/card/id/syndicate

/datum/antagonist/ninja/New()
	..()
	ninjas = src

/datum/antagonist/ninja/attempt_random_spawn()
	if(CONFIG_GET(flag/ninjas_allowed)) ..()

/datum/antagonist/ninja/create_objectives(var/datum/mind/ninja)

	if(!..())
		return

	var/objective_list = list(1,2,3,4)
	for(var/i=rand(2,4),i>0,i--)
		switch(pick(objective_list))
			if(1)//Kill
				var/datum/objective/assassinate/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
				objective_list -= 1 // No more than one kill objective
			if(2)//Steal
				var/datum/objective/steal/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				ninja.objectives += ninja_objective
			if(3)//Protect
				var/datum/objective/protect/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
					objective_list -= 3
			if(4)//Harm
				var/datum/objective/harm/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
					objective_list -= 4

	var/datum/objective/ninja_highlander/ninja_obj = new
	ninja_obj.owner = ninja
	ninja.objectives += ninja_obj

	var/datum/objective/survive/ninja_objective = new
	ninja_objective.owner = ninja
	ninja.objectives += ninja_objective

/datum/antagonist/ninja/greet(var/datum/mind/player)

	if(!..())
		return 0
	var/directive = generate_ninja_directive("heel")
	player.store_memory(span_bold("Directive:") + " " + span_danger("[directive]") + "<br>")
	to_chat(player, span_bold("Remember your directive:") + " [directive].")

/datum/antagonist/ninja/update_antag_mob(var/datum/mind/player)
	..()
	var/ninja_title = pick(ninja_titles)
	var/ninja_name = pick(ninja_names)
	var/mob/living/carbon/human/H = player.current
	if(istype(H))
		H.real_name = "[ninja_title] [ninja_name]"
		H.name = H.real_name
	player.name = H.name

/datum/antagonist/ninja/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	var/obj/item/radio/R = new /obj/item/radio/headset(player)
	player.equip_to_slot_or_del(R, slot_l_ear)
	player.equip_to_slot_or_del(new /obj/item/clothing/under/color/black(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/flashlight(player), slot_belt)
	create_id("Infiltrator", player)

	var/obj/item/rig/light/ninja/ninjasuit = new(get_turf(player))
	ninjasuit.seal_delay = 0
	player.put_in_hands(ninjasuit)
	player.equip_to_slot_or_del(ninjasuit,slot_back)
	if(ninjasuit)
		ninjasuit.toggle_seals(src,TRUE,TRUE)
		ninjasuit.seal_delay = initial(ninjasuit.seal_delay)

	if(istype(player.back,/obj/item/rig))
		var/obj/item/rig/rig = player.back
		if(rig.air_supply)
			player.internal = rig.air_supply

	spawn(10)
		if(player.internal)
			player.internals.icon_state = "internal1"
		else
			to_chat(player, span_danger("You forgot to turn on your internals! Quickly, toggle the valve!"))

/datum/antagonist/ninja/proc/generate_ninja_directive(side)
	var/directive = "[side=="face"?"[using_map.company_name]":"A criminal syndicate"] is your employer. "//Let them know which side they're on.
	switch(rand(1,19))
		if(1)
			directive += "The Spider Clan must not be linked to this operation. Remain hidden and covert when possible."
		if(2)
			directive += "[station_name()] is financed by an enemy of the Spider Clan. Cause as much structural damage as desired."
		if(3)
			directive += "A wealthy animal rights activist has made a request we cannot refuse. Prioritize saving animal lives whenever possible."
		if(4)
			directive += "The Spider Clan absolutely cannot be linked to this operation. Eliminate witnesses at your discretion."
		if(5)
			directive += "We are currently negotiating with [using_map.company_name] [using_map.boss_name]. Prioritize saving human lives over ending them."
		if(6)
			directive += "We are engaged in a legal dispute over [station_name()]. If a laywer is present on board, force their cooperation in the matter."
		if(7)
			directive += "A financial backer has made an offer we cannot refuse. Implicate criminal involvement in the operation."
		if(8)
			directive += "Let no one question the mercy of the Spider Clan. Ensure the safety of all non-essential personnel you encounter."
		if(9)
			directive += "A free agent has proposed a lucrative business deal. Implicate [using_map.company_name] involvement in the operation."
		if(10)
			directive += "Our reputation is on the line. Harm as few civilians and innocents as possible."
		if(11)
			directive += "Our honor is on the line. Utilize only honorable tactics when dealing with opponents."
		if(12)
			directive += "We are currently negotiating with a mercenary leader. Disguise assassinations as suicide or other natural causes."
		if(13)
			directive += "Some disgruntled [using_map.company_name] employees have been supportive of our operations. Be wary of any mistreatment by command staff."
		if(14)
			var/xenorace = pick(SPECIES_UNATHI, SPECIES_TAJARAN, SPECIES_SKRELL)
			directive += "A group of [xenorace] radicals have been loyal supporters of the Spider Clan. Favor [xenorace] crew whenever possible."
		if(15)
			directive += "The Spider Clan has recently been accused of religious insensitivity. Attempt to speak with the " + JOB_CHAPLAIN + " and prove these accusations false."
		if(16)
			directive += "The Spider Clan has been bargaining with a competing prosthetics manufacturer. Try to shine [using_map.company_name] prosthetics in a bad light."
		if(17)
			directive += "The Spider Clan has recently begun recruiting outsiders. Consider suitable candidates and assess their behavior amongst the crew."
		if(18)
			directive += "A cyborg liberation group has expressed interest in our serves. Prove the Spider Clan merciful towards law-bound synthetics."
		else
			directive += "There are no special supplemental instructions at this time."
	return directive
