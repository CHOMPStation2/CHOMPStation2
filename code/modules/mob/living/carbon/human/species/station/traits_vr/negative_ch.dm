/datum/trait/negative/hollow
	excludes = list(/datum/trait/positive/densebones)

/datum/trait/negative/scrawny
	name = "Scrawny"
	desc = "You have a much harder time breaking free of grabs as well as creating and holding onto grabs on other people."
	cost = -2
	var_changes = list("grab_resist_divisor_victims" = 0.5, "grab_resist_divisor_self" = 3, "grab_power_victims" = 1, "grab_power_self" = -1)

/datum/trait/negative/deep_sleeper
	name = "Deep Sleeper"
	desc = "When you fall asleep, it takes you four times as long to wake up."
	cost = -1
	var_changes = list("waking_speed" = 0.25)

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
