/datum/species/proc/copy_species_sounds(var/datum/species/S, var/species_sounds, var/custom_base)
	switch(species_sounds)
		if("Canine")
			S.male_scream_sound = canine_scream_sounds
			S.female_scream_sound = canine_scream_sounds
			S.male_gasp_sound = canine_gasp_sounds
			S.female_gasp_sound = canine_gasp_sounds
			S.male_pain_sound = canine_pain_sounds
			S.female_pain_sound = canine_pain_sounds
			S.male_death_sound = canine_death_sounds
			S.female_death_sound = canine_death_sounds
		if("Feline")
			S.male_scream_sound = feline_scream_sounds
			S.female_scream_sound = feline_scream_sounds
			S.male_gasp_sound = feline_gasp_sounds
			S.female_gasp_sound = feline_gasp_sounds
			S.male_pain_sound = feline_pain_sounds
			S.female_pain_sound = feline_pain_sounds
			S.male_death_sound = feline_death_sounds
			S.female_death_sound = feline_death_sounds
		if("Cervine")
			S.male_scream_sound = cervine_scream_sounds
			S.female_scream_sound = cervine_scream_sounds
			S.male_gasp_sound = null
			S.female_gasp_sound = null
			S.male_pain_sound = null
			S.female_pain_sound = null
			S.male_death_sound = cervine_death_sounds
			S.female_death_sound = cervine_death_sounds
		if("Generic/Human")
			S.male_scream_sound = male_generic_scream_sounds
			S.female_scream_sound = female_generic_scream_sounds
			S.male_gasp_sound = male_generic_gasp_sounds
			S.female_gasp_sound = female_generic_gasp_sounds
			S.male_pain_sound = male_generic_pain_sounds
			S.female_pain_sound = female_generic_pain_sounds
			S.male_death_sound = male_generic_death_sounds
			S.female_death_sound = female_generic_death_sounds
		if("Unset") // If our users haven't set anything, pick the sounds based off our custom base - Vulp gets canine, etc etc.
			var/datum/species/os = GLOB.all_species[custom_base]
			S.male_scream_sound = os.male_scream_sound
			S.female_scream_sound = os.female_scream_sound
			S.male_gasp_sound = os.male_gasp_sound
			S.female_gasp_sound = os.female_gasp_sound
			S.male_pain_sound = os.male_pain_sound
			S.female_pain_sound = os.female_pain_sound
			S.male_death_sound = os.male_death_sound
			S.female_death_sound = os.female_death_sound
