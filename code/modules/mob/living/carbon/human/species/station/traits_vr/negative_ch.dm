/datum/trait/slipperydirt
	name = "Dirt Vulnerability"
	desc = "Even the tiniest particles of dirt give you uneasy footing, even through several layers of footwear."
	cost = -5
	var_changes = list("dirtslip" = TRUE)

/datum/trait/lonely
	name = "Minor loneliness vulnerability"
	desc = "You're very prone to loneliness! Being alone for extended periods of time causes adverse effects. Most mobs will cure this loneliness as long as they aren't hostile."
	var/warning_cap = 400
	var/only_people = FALSE
	var/hallucination_cap = 25
	var/escalation_speed = 0.8
	cost = -2
	special_env = TRUE
	excludes = list(/datum/trait/lonely/major)

/datum/trait/lonely/major
	name = "Major loneliness vulnerability"
	desc = "You're extremely prone to loneliness! Being alone for extended periods of time causes adverse effects. Most mobs won't be enough to cure this loneliness, you need other social beings."
	warning_cap = 300
	hallucination_cap = 50
	escalation_speed = 1.3
	only_people = TRUE
	cost = -5
	special_env = TRUE
	excludes = list(/datum/trait/lonely)

/datum/trait/lonely/proc/check_mob_company(var/mob/living/carbon/human/H,var/mob/living/M)
	if(only_people && !istype(M, /mob/living/carbon) && !istype(M, /mob/living/silicon/robot))
		return 0
	if(M == H || M.stat == DEAD || M.invisibility > H.see_invisible)
		return 0
	if(only_people && !M.ckey)
		return 0
	if(M.faction == "neutral" || M.faction == H.faction)
		if(H.loneliness_stage > 0)
			H.loneliness_stage -= 4
			if(H.loneliness_stage < 0)
				H.loneliness_stage = 0
			if(world.time >= H.next_loneliness_time)
				to_chat(H, "The nearby company calms you down...")
				H.next_loneliness_time = world.time+500
		return 1
	else
		if(M.vore_organs)
			for(var/obj/belly/B in M.vore_organs)
				for(var/mob/living/content in B.contents)
					if(istype(content))
						check_mob_company(H,content)
	return 0

/datum/trait/lonely/handle_environment_special(var/mob/living/carbon/human/H)
	spawn(0)
		// If they're dead or unconcious they're a bit beyond this kind of thing.
		if(H.stat)
			return
		// No point processing if we're already stressing the hell out.
		if(H.hallucination >= hallucination_cap && H.loneliness_stage >= warning_cap)
			return
		// Vored? Not gonna get frightened.
		if(isbelly(H.loc))
			if(H.loneliness_stage > 0)
				H.loneliness_stage -= 4
			return
		if(istype(H.loc, /obj/item/weapon/holder))
			if(H.loneliness_stage > 0)
				H.loneliness_stage -= 4
			return
		// Check for company.
		for(var/mob/living/M in viewers(H))
			if(check_mob_company(H,M))
				return
		if(H.vore_organs)
			for(var/obj/belly/B in H.vore_organs)
				for(var/mob/living/content in B.contents)
					if(istype(content))
						if(check_mob_company(H,content))
							return
		for(var/obj/item/weapon/holder/micro/M in range(1, H))
			if(H.loneliness_stage > 0)
				H.loneliness_stage -= 4
				if(H.loneliness_stage < 0)
					H.loneliness_stage = 0
				if(world.time >= H.next_loneliness_time)
					to_chat(H, "[M] calms you down...")
					H.next_loneliness_time = world.time+500
		for(var/obj/effect/overlay/aiholo/A in range(5, H))
			if(H.loneliness_stage > 0)
				H.loneliness_stage -= 4
				if(H.loneliness_stage < 0)
					H.loneliness_stage = 0
				if(world.time >= H.next_loneliness_time)
					to_chat(H, "[A] calms you down...")
					H.next_loneliness_time = world.time+500
		
		// No company? Suffer :(
		if(H.loneliness_stage < warning_cap)
			H.loneliness_stage = min(warning_cap,H.loneliness_stage+escalation_speed)
		handle_loneliness(H)
		if(H.loneliness_stage >= warning_cap && H.hallucination < hallucination_cap)
			H.hallucination = min(hallucination_cap,H.hallucination+2.5*escalation_speed)

/datum/trait/lonely/proc/handle_loneliness(var/mob/living/carbon/human/H)
	var/ms = ""
	if(H.loneliness_stage == escalation_speed)
		ms = "Well.. No one is around you anymore..."
	if(H.loneliness_stage >= 50)
		ms = "You begin to feel alone..."
	if(H.loneliness_stage >= 250)
		ms = "[pick("You don't think you can last much longer without some visible company!", "You should go find someone!")]"
		if(H.stuttering < hallucination_cap)
			H.stuttering += 5
	if(H.loneliness_stage >= warning_cap)
		ms = "<span class='danger'><b>[pick("Where are the others?", "Please, there has to be someone nearby!", "I don't want to be alone!")]</b></span>"
	if(world.time < H.next_loneliness_time)
		return
	if(ms != "")
		to_chat(H, ms)
	H.next_loneliness_time = world.time+500