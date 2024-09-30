#ifndef GAUSSIAN_RANDOM
#define GAUSSIAN_RANDOM(vars...)	((-2*log(rand()))**0.5 * cos(6.28318530718*rand()))
#endif

/datum/trait/negative/hollow
	excludes = list(/datum/trait/positive/densebones)

/datum/trait/negative/slipperydirt
	name = "Dirt Vulnerability"
	desc = "Even the tiniest particles of dirt give you uneasy footing, even through several layers of footwear."
	cost = -5
	var_changes = list("dirtslip" = TRUE)
	excludes = list(/datum/trait/positive/absorbent)

/datum/trait/negative/less_blood
	name = "Low Blood Volume"
	desc = "You have 33.3% less blood volume compared to most species, making you more prone to blood loss issues."
	cost = -3
	var_changes = list("blood_volume" = 375)
	excludes = list(/datum/trait/negative/less_blood_extreme,/datum/trait/positive/more_blood,/datum/trait/positive/more_blood_extreme)
	can_take = ORGANICS

/datum/trait/negative/less_blood_extreme
	name = "Low Blood Volume, Extreme"
	desc = "You have 60% less blood volume compared to most species, making you much more prone to blood loss issues."
	cost = -5
	var_changes = list("blood_volume" = 224)
	excludes = list(/datum/trait/negative/less_blood,/datum/trait/positive/more_blood,/datum/trait/positive/more_blood_extreme)
	can_take = ORGANICS

/datum/trait/negative/scrawny
	name = "Scrawny"
	desc = "You have a much harder time breaking free of grabs as well as creating and holding onto grabs on other people."
	cost = -2
	var_changes = list("grab_resist_divisor_victims" = 0.5, "grab_resist_divisor_self" = 3, "grab_power_victims" = 1, "grab_power_self" = -1)

/datum/trait/negative/extreme_slowdown
	name = "Slowdown, Extreme"
	desc = "You move EXTREMELY slower than baseline"
	cost = -8
	var_changes = list("slowdown" = 4.0)

/datum/trait/negative/deep_sleeper
	name = "Deep Sleeper"
	desc = "When you fall asleep, it takes you four times as long to wake up."
	cost = -1
	var_changes = list("waking_speed" = 0.25)

/datum/trait/negative/low_blood_sugar
	name = "Low Blood Sugar"
	desc = "If you let your nutrition get too low, you will start to experience adverse affects including hallucinations, unconsciousness, and weakness"
	cost = -1
	special_env = TRUE

/datum/trait/negative/low_blood_sugar/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.nutrition > 200)	//Sanity check because stupid bugs >:v
		return
	if((H.nutrition < 200) && prob(5))
		if(H.nutrition > 100)
			to_chat(H,"<span class='warning'>You start to feel noticeably weak as your stomach rumbles, begging for more food. Maybe you should eat something to keep your blood sugar up</span>")
		else if(H.nutrition > 50)
			to_chat(H,"<span class='warning'>You begin to feel rather weak, and your stomach rumbles loudly. You feel lightheaded and it's getting harder to think. You really need to eat something.</span>")
		else if(H.nutrition > 25)
			to_chat(H,"<span class='danger'>You're feeling very weak and lightheaded, and your stomach continously rumbles at you. You really need to eat something!</span>")
		else
			to_chat(H,"<span class='critical'>You're feeling extremely weak and lightheaded. You feel as though you might pass out any moment and your stomach is screaming for food by now! You should really find something to eat!</span>")
	if((H.nutrition < 100) && prob(10))
		H.Confuse(10)
	if((H.nutrition < 50) && prob(25))
		H.hallucination = max(30,H.hallucination+8)
	if((H.nutrition < 25) && prob(5))
		H.drowsyness = max(100,H.drowsyness+30)

/datum/trait/negative/blindness
	name = "Permanently blind"
	desc = "You are blind. For whatever reason, nothing is able to change this fact, not even surgery. WARNING: YOU WILL NOT BE ABLE TO SEE ANY POSTS USING THE ME VERB, ONLY SUBTLE AND DIALOGUE ARE VIEWABLE TO YOU, YOU HAVE BEEN WARNED."
	cost = -12
	special_env = TRUE
	custom_only = FALSE

/datum/trait/negative/blindness/handle_environment_special(var/mob/living/carbon/human/H)
	H.sdisabilities |= BLIND 		//no matter what you do, the blindess still comes for you

/datum/trait/negative/schizophrenia
	name = "Episodic hallucinations."
	desc = "You have a condition which causes you to spontaneously have hallucinations! Luckily for you, in the modern space age, our doctors have solutions for you, just make sure you don't forget to take your pills."
	cost = -3
	special_env = TRUE
	can_take = ORGANICS
	var/hallucination_max = 60
	var/hallucination_increase = 3
	var/episode_length_nomeds_avg = 4000
	var/episode_length_nomeds_dev = 100
	var/episode_length_meds_avg = 2000
	var/episode_length_meds_dev = 500
	var/break_length_nomeds_avg = 3000
	var/break_length_nomeds_dev = 600
	var/break_length_meds_avg = 30000
	var/break_length_meds_dev = 7000
	var/list/episode = list("in_episode" = FALSE)

/datum/trait/negative/schizophrenia/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	episode["next_episode_begin"] = world.time + 6000
	episode["next_episode_end"] = world.time + 9000

/datum/trait/negative/schizophrenia/handle_environment_special(var/mob/living/carbon/human/H)
	var/med_vol = get_med_volume(H)
	if(!episode["in_episode"])
		if(world.time > episode["next_episode_begin"])
			episode["meds_at_beginning"] = med_vol
			episode["in_episode"] = TRUE
		else if(episode["meds_at_end"] && !med_vol)	//Meds ran out
			var/new_episode_begin = world.time + (episode["next_episode_begin"] - world.time)/10
			episode["next_episode_end"] = new_episode_begin + (episode["next_episode_end"] - episode["next_episode_begin"])
			episode["next_episode_begin"] = new_episode_begin
			episode["meds_at_end"] = FALSE
		else if(!episode["meds_at_end"] && med_vol) //Meds were taken between episodes
			var/new_episode_begin = world.time + (episode["next_episode_begin"] - world.time)*10
			episode["next_episode_end"] = new_episode_begin + (episode["next_episode_end"] - episode["next_episode_begin"])
			episode["next_episode_begin"] = new_episode_begin
			episode["meds_at_end"] = TRUE
	else
		if(world.time > episode["next_episode_end"])
			episode["meds_at_end"] = med_vol
			episode["in_episode"] = FALSE
			var/break_length_dev = med_vol ? break_length_meds_dev : break_length_nomeds_dev
			var/break_length_avg = med_vol ? break_length_meds_avg : break_length_nomeds_avg
			var/episode_length_dev = med_vol ? episode_length_meds_dev : episode_length_nomeds_dev
			var/episode_length_avg = med_vol ? episode_length_meds_avg : episode_length_nomeds_avg
			episode["next_episode_begin"] = world.time + max(120,GAUSSIAN_RANDOM() * break_length_dev + break_length_avg)
			episode["next_episode_end"] = episode["next_episode_begin"] + max(120,GAUSSIAN_RANDOM() * episode_length_dev + episode_length_avg)
		else
			if(!episode["meds_at_beginning"] && med_vol)
				episode["next_episode_end"] = world.time + (episode["next_episode_end"] - world.time)/8
			H.hallucination = min(hallucination_max,H.hallucination + hallucination_increase)

/datum/trait/negative/schizophrenia/proc/get_med_volume(var/mob/living/carbon/human/H)
	var/total_vol = 0
	for(var/datum/reagent/reagent in H.bloodstr.reagent_list)
		if(istype(reagent,/datum/reagent/tercozolam))
			total_vol += reagent.volume
	for(var/datum/reagent/reagent in H.ingested.reagent_list)
		if(istype(reagent,/datum/reagent/tercozolam))
			total_vol += reagent.volume
	return total_vol
/datum/trait/negative/agoraphobia
	name = "Agoraphobia"
	desc = "You very much dislike being in crowded places. When in the company of more than two other people, you start to panic and experience adverse effects."
	cost = -3
	var/warning_cap = 400
	var/hallucination_cap = 25
	var/escalation_speed = 0.8
	special_env = TRUE
	excludes = list(/datum/trait/negative/lonely,/datum/trait/negative/lonely/major)

/datum/trait/negative/agoraphobia/handle_environment_special(var/mob/living/carbon/human/H)
	spawn(0)
		var/list/in_range = list()
		// If they're dead or unconcious they're a bit beyond this kind of thing.
		if(H.stat)
			return
		// No point processing if we're already stressing the hell out.
		if(H.hallucination >= hallucination_cap && H.loneliness_stage >= warning_cap)
			return
		in_range |= check_mob_company(H,H)	//Checks our item slots and bellies for any people.
		in_range |= belly_check(H,H.loc)	//Recursive check if we're in anyones bellies, are they in anyone's belly, etc.
		in_range |= holder_check(H,H.loc)	//Recursive check if someone's holding us, is anyone holding them, etc.

		// Check for company.
		for(var/mob/living/M in viewers(get_turf(H)))
			in_range |= check_mob_company(H,M)

		for(var/obj/effect/overlay/aiholo/A in range(5, H))
			in_range |= A

		if(in_range.len > 2)
			if(H.loneliness_stage < warning_cap)
				H.loneliness_stage = min(warning_cap,H.loneliness_stage+escalation_speed)
			handle_loneliness(H)
			if(H.loneliness_stage >= warning_cap && H.hallucination < hallucination_cap)
				H.hallucination = min(hallucination_cap,H.hallucination+2.5*escalation_speed)
		else
			H.loneliness_stage = max(H.loneliness_stage-4,0)


/datum/trait/negative/agoraphobia/proc/handle_loneliness(var/mob/living/carbon/human/H)
	if(world.time < H.next_loneliness_time)
		return //Moved this at the top so we dont waste time assigning vars we will never use
	var/ms = handle_loneliness_message(H)
	if(ms)
		to_chat(H, ms)
	H.next_loneliness_time = world.time+500
	H.fear = min((H.fear + 3), 102)

/datum/trait/negative/agoraphobia/proc/handle_loneliness_message(var/mob/living/carbon/human/H)
	var/Lonely = H.loneliness_stage
	if(Lonely == escalation_speed)
		return "You notice there's more people than you feel comfortable with around you..."
	else if(Lonely >= 50 && Lonely < 250)
		return "You start to feel anxious from the number of people around you."
	else if(Lonely >= 250 && Lonely < warning_cap)
		if(H.stuttering < hallucination_cap)
			H.stuttering += 5
		return "[pick("You don't think you can last much longer with this much company!", "You should go find some space!")]" //if we add more here make it a list for readability
	else if(Lonely >= warning_cap)
		var/list/panicmessages = list(	"Why am I still here? I have to leave and get some space!",
						"Please, just let me be alone!",
						"I need to be alone!")
		return "<span class='danger'><b>[pick(panicmessages)]</b></span>"
	return FALSE

/datum/trait/negative/agoraphobia/proc/find_held_by(var/atom/item)
	if(!item || !istype(item))
		return null
	else if(istype(item,/mob/living))
		return item
	else
		return find_held_by(item.loc)

/datum/trait/negative/agoraphobia/proc/holder_check(var/mob/living/carbon/human/H,var/obj/item/holder/H_holder)
	var/list/in_range = list()
	if(istype(H_holder))
		var/mob/living/held_by = find_held_by(H_holder)
		if(held_by)
			in_range |= check_mob_company(H,held_by,FALSE)
		in_range |= holder_check(H,held_by)
	return in_range

/datum/trait/negative/agoraphobia/proc/belly_check(var/mob/living/carbon/human/H,var/obj/belly/B)
	var/list/in_range = list()
	if(istype(B))
		in_range |= check_mob_company(H,B.owner,FALSE)
		if(isbelly(B.owner.loc))
			in_range |= belly_check(H,B.owner.loc)
	return in_range

/datum/trait/negative/agoraphobia/proc/check_mob_company(var/mob/living/carbon/human/H,var/mob/living/M,var/invis_matters = TRUE)
	var/list/in_range = list()
	if(!istype(M))
		return in_range
	var/social_check = !istype(M, /mob/living/carbon) && !istype(M, /mob/living/silicon/robot)
	var/ckey_check = !M.ckey
	var/overall_checks = M == H || M.stat == DEAD || social_check || ckey_check
	if(invis_matters && M.invisibility > H.see_invisible)
		return in_range
	if(!overall_checks)
		in_range |= M
	if(M.vore_organs)
		for(var/obj/belly/B in M.vore_organs)
			for(var/mob/living/content in B.contents)
				if(istype(content))
					in_range |= check_mob_company(H,content)
	in_range |= check_contents(M,H)
	return in_range

/datum/trait/negative/agoraphobia/proc/check_contents(var/atom/item,var/mob/living/carbon/human/H,var/max_layer = 3,var/current_layer = 1)
	var/list/in_range = list()
	if(!item || !istype(item) || current_layer > max_layer)
		return in_range
	for(var/datum/content in item.contents)
		if(istype(content,/obj/item/holder))
			var/obj/item/holder/contentholder = content
			in_range |= check_mob_company(H,contentholder.held_mob)
		else
			in_range |= check_contents(content,H,max_layer,current_layer+1)
	return in_range

/datum/trait/negative/lonely
	name = "Minor loneliness vulnerability"
	desc = "You're very prone to loneliness! Being alone for extended periods of time causes adverse effects. Most mobs will cure this loneliness as long as they aren't hostile."
	cost = -1
	var/warning_cap = 400
	var/only_people = FALSE
	var/hallucination_cap = 25
	var/escalation_speed = 0.8
	special_env = TRUE
	excludes = list(/datum/trait/negative/lonely/major,/datum/trait/negative/agoraphobia)

/datum/trait/negative/lonely/major
	name = "Major loneliness vulnerability"
	desc = "You're extremely prone to loneliness! Being alone for extended periods of time causes adverse effects. Most mobs won't be enough to cure this loneliness, you need other social beings."
	cost = -3
	warning_cap = 300
	hallucination_cap = 50
	escalation_speed = 1.3
	only_people = TRUE
	special_env = TRUE
	excludes = list(/datum/trait/negative/lonely,/datum/trait/negative/agoraphobia)

/datum/trait/negative/lonely/proc/sub_loneliness(var/mob/living/carbon/human/H,var/amount = 4)
	H.loneliness_stage = max(H.loneliness_stage - 4, 0)
	if(world.time >= H.next_loneliness_time && H.loneliness_stage > 0)
		to_chat(H, "The nearby company calms you down...")
		H.next_loneliness_time = world.time+500

/datum/trait/negative/lonely/proc/check_mob_company(var/mob/living/carbon/human/H,var/mob/living/M)
	if(!istype(M))
		return 0
	var/social_check = only_people && !istype(M, /mob/living/carbon) && !istype(M, /mob/living/silicon/robot)
	var/self_invisible_check = M == H || M.invisibility > H.see_invisible
	var/ckey_check = only_people && !M.ckey
	var/overall_checks = M.stat == DEAD || social_check || ckey_check
	if(self_invisible_check)
		return 0
	if((M.faction == "neutral" || M.faction == H.faction) && !overall_checks)
		sub_loneliness(H)
		return 1
	else
		if(M.vore_organs)
			for(var/obj/belly/B in M.vore_organs)
				for(var/mob/living/content in B.contents)
					if(istype(content))
						check_mob_company(H,content)
	return 0

/datum/trait/negative/lonely/proc/check_contents(var/atom/item,var/mob/living/carbon/human/H,var/max_layer = 3,var/current_layer = 1)
	if(!item || !istype(item) || current_layer > max_layer)
		return 0
	for(var/datum/content in item.contents)
		if(istype(content,/obj/item/holder))
			var/obj/item/holder/contentholder = content
			if(check_mob_company(H,contentholder.held_mob))
				return 1
		else
			if(check_contents(content,H,max_layer,current_layer+1))
				return 1
	return 0

/datum/trait/negative/lonely/handle_environment_special(var/mob/living/carbon/human/H)
	spawn(0)
		// If they're dead or unconcious they're a bit beyond this kind of thing.
		if(H.stat)
			return
		// No point processing if we're already stressing the hell out.
		if(H.hallucination >= hallucination_cap && H.loneliness_stage >= warning_cap)
			return
		// Vored? Not gonna get frightened.
		if(isbelly(H.loc))
			sub_loneliness(H)
			return
		if(istype(H.loc, /obj/item/holder))
			sub_loneliness(H)
			return
		// Check for company.
		if(check_contents(H,H)) //Check our item slots and storage for any micros.
			sub_loneliness(H)
			return
		for(var/mob/living/M in viewers(get_turf(H)))
			if(check_mob_company(H,M))
				return
		//Check to see if there's anyone in our belly
		if(H.vore_organs)
			for(var/obj/belly/B in H.vore_organs)
				for(var/mob/living/content in B.contents)
					if(istype(content))
						if(check_mob_company(H,content))
							return
		for(var/obj/item/holder/micro/M in range(1, H))
			sub_loneliness(H)
		for(var/obj/effect/overlay/aiholo/A in range(5, H))
			sub_loneliness(H)

		// No company? Suffer :(
		if(H.loneliness_stage < warning_cap)
			H.loneliness_stage = min(warning_cap,H.loneliness_stage+escalation_speed)
		handle_loneliness(H)
		if(H.loneliness_stage >= warning_cap && H.hallucination < hallucination_cap)
			H.hallucination = min(hallucination_cap,H.hallucination+2.5*escalation_speed)

/datum/trait/negative/lonely/proc/handle_loneliness(var/mob/living/carbon/human/H)
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
	H.fear = min((H.fear + 3), 102)

/datum/trait/negative/endurance_glass // Glass Cannon
	name = "Glass Endurance"
	desc = "Your body is very fragile. Reduces your maximum hitpoints to 25. Beware sneezes. You require only 50 damage in total to die, compared to 200 normally. You will go into crit after losing 25 HP, compared to crit at 100 HP."
	cost = -12 // Similar to Very Low Endurance, this straight up will require you NEVER getting in a fight. This is extremely crippling. I salute the madlad that takes this.
	var_changes = list("total_health" = 25)

/datum/trait/negative/endurance_glass/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.setMaxHealth(S.total_health)

/datum/trait/negative/reduced_biocompat_minor
	name = "Reduced Biocompatibility, Minor"
	desc = "For whatever reason, you're one of the unlucky few who don't get as much benefit from modern-day chemicals. Remember to note this down in your medical records! Chems are only 80% as effective on you!"
	cost = -2
	var_changes = list("chem_strength_heal" = 0.8)
	can_take = ORGANICS

/datum/trait/negative/reduced_biocompat
	name = "Reduced Biocompatibility"
	desc = "For whatever reason, you're one of the unlucky few who don't get as much benefit from modern-day chemicals. Remember to note this down in your medical records! Chems are only 60% as effective on you!"
	cost = -4
	var_changes = list("chem_strength_heal" = 0.6)
	can_take = ORGANICS

/datum/trait/negative/reduced_biocompat_extreme
	name = "Reduced Biocompatibility, Major"
	desc = "For whatever reason, you're one of the unlucky few who don't get as much benefit from modern-day chemicals. Remember to note this down in your medical records! Chems are only 30% as effective on you!"
	cost = -8
	var_changes = list("chem_strength_heal" = 0.3)
	can_take = ORGANICS

// Rykkanote: Relocated these here as we're no longer a YW downstream.
/datum/trait/negative/light_sensitivity
	name = "Photosensitivity"
	desc = "You have trouble dealing with sudden flashes of light, taking some time for you to recover. The effects of flashes from cameras and security equipment leaves you stunned for some time. 50% increased stun duration from flashes."
	cost = -1
	var_changes = list("flash_mod" = 1.5)

/datum/trait/negative/light_sensitivity_plus
	name = "Photosensitivity, Major"
	desc = "You have trouble dealing with sudden flashes of light, taking quite a long time for you to be able to recover. The effects of flashes from cameras and security equipment leave you stunned for some time. 100% (2x) stun duration from flashes."
	cost = -2
	var_changes = list("flash_mod" = 2.0)


/datum/trait/negative/haemophilia_plus
	name = "Haemophilia, Major"
	desc = "Some say that when it rains, it pours.  Unfortunately, this is also true for yourself if you get cut. You bleed much faster than average, at 3x the normal rate." // CHOMPEdit: More Trait Feedback for players.
	cost = -3
	can_take = ORGANICS

/datum/trait/negative/haemophilia_plus/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/haemophilia)

/datum/trait/negative/pain_intolerance_basic
	name = "Pain Intolerance"
	desc = "You are frail and sensitive to pain. You experience 25% more pain from all sources."
	cost = -2
	var_changes = list("pain_mod" = 1.2) // CHOMPEdit: Makes this exact opposite of Pain Tolerance Basic.

/datum/trait/negative/pain_intolerance_advanced
	name = "Pain Intolerance, Major"
	desc = "You are highly sensitive to all sources of pain, and experience 50% more pain."
	cost = -3
	var_changes = list("pain_mod" = 1.5) //this makes you extremely vulnerable to most sources of pain, a stunbaton bop or shotgun beanbag will do around 90 agony, almost enough to drop you in one hit. CHOMPEdit: This really should cost more if it's this bad.


/datum/trait/negative/sensitive_biochem
	name = "Sensitive Biochemistry"
	desc = "Your biochemistry is a little delicate, rendering you more susceptible to both deadly toxins and the more subtle ones. You'll probably want to list this in your medical records, and perhaps in your exploitable info as well. Toxin damages and knockout drugs are 25% stronger on you."
	cost = -1
	var_changes = list("chem_strength_tox" = 1.25)
