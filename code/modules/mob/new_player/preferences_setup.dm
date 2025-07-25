/datum/preferences

/datum/preferences/proc/randomise_appearance_prefs_update(randomize_flags = ALL, datum/species/current_species)
	randomise_appearance_prefs(randomize_flags, current_species)

/datum/preferences/proc/randomise_appearance_prefs_write(randomize_flags = ALL, datum/species/current_species)
	randomise_appearance_prefs(randomize_flags, current_species, TRUE)

/// Fully randomizes everything in the character.
/datum/preferences/proc/randomise_appearance_prefs(randomize_flags = ALL, datum/species/current_species, write = FALSE)
	for (var/datum/preference/preference as anything in get_preferences_in_priority_order())
		if (!preference.included_in_randomization_flags(randomize_flags))
			continue
		if (preference.is_randomizable())
			if(write)
				write_preference(preference, preference.create_random_value(src, current_species))
			else
				update_preference(preference, preference.create_random_value(src, current_species))

/* Currently not used
/// Randomizes the character according to preferences.
/datum/preferences/proc/apply_character_randomization_prefs(antag_override = FALSE)
	switch (read_preference(/datum/preference/choiced/random_body))
		if (RANDOM_ANTAG_ONLY)
			if (!antag_override)
				return

		if (RANDOM_DISABLED)
			return

	for (var/datum/preference/preference as anything in get_preferences_in_priority_order())
		if (should_randomize(preference, antag_override))
			write_preference(preference, preference.create_random_value(src))
*/



/datum/preferences/proc/randomize_hair_color(var/target = "hair")
	if(prob (75) && target == "facial") // Chance to inherit hair color
		update_preference_by_type(/datum/preference/color/human/facial_color, read_preference(/datum/preference/color/human/hair_color))
		return

	var/red
	var/green
	var/blue

	var/col = pick ("blonde", "black", "chestnut", "copper", "brown", "wheat", "old", "punk")
	switch(col)
		if("blonde")
			red = 255
			green = 255
			blue = 0
		if("black")
			red = 0
			green = 0
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 51
		if("copper")
			red = 255
			green = 153
			blue = 0
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("wheat")
			red = 255
			green = 255
			blue = 153
		if("old")
			red = rand (100, 255)
			green = red
			blue = red
		if("punk")
			red = rand (0, 255)
			green = rand (0, 255)
			blue = rand (0, 255)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	switch(target)
		if("hair")
			update_preference_by_type(/datum/preference/color/human/hair_color, rgb(red, green, blue))
		if("facial")
			update_preference_by_type(/datum/preference/color/human/facial_color, rgb(red, green, blue))

/datum/preferences/proc/randomize_eyes_color()
	var/red
	var/green
	var/blue

	var/col = pick ("black", "grey", "brown", "chestnut", "blue", "lightblue", "green", "albino")
	switch(col)
		if("black")
			red = 0
			green = 0
			blue = 0
		if("grey")
			red = rand (100, 200)
			green = red
			blue = red
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 0
		if("blue")
			red = 51
			green = 102
			blue = 204
		if("lightblue")
			red = 102
			green = 204
			blue = 255
		if("green")
			red = 0
			green = 102
			blue = 0
		if("albino")
			red = rand (200, 255)
			green = rand (0, 150)
			blue = rand (0, 150)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	update_preference_by_type(/datum/preference/color/human/eyes_color, rgb(red, green, blue))

/datum/preferences/proc/randomize_skin_color()
	var/red
	var/green
	var/blue

	var/col = pick ("black", "grey", "brown", "chestnut", "blue", "lightblue", "green", "albino")
	switch(col)
		if("black")
			red = 0
			green = 0
			blue = 0
		if("grey")
			red = rand (100, 200)
			green = red
			blue = red
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 0
		if("blue")
			red = 51
			green = 102
			blue = 204
		if("lightblue")
			red = 102
			green = 204
			blue = 255
		if("green")
			red = 0
			green = 102
			blue = 0
		if("albino")
			red = rand (200, 255)
			green = rand (0, 150)
			blue = rand (0, 150)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	update_preference_by_type(/datum/preference/color/human/skin_color, rgb(red, green, blue))

/datum/preferences/proc/dress_preview_mob(var/mob/living/carbon/human/mannequin)
	if(!mannequin.dna) // Special handling for preview icons before SSAtoms has initailized.
		mannequin.dna = new /datum/dna(null)
	copy_to(mannequin, TRUE)

	if(!equip_preview_mob)
		return

	var/datum/job/previewJob
	// Determine what job is marked as 'High' priority, and dress them up as such.
	if(job_civilian_low & ASSISTANT)
		previewJob = job_master.GetJob(JOB_ALT_VISITOR)
	else if(client && ispAI(client.mob))
		pass() //Don't do anything!
	else
		for(var/datum/job/job in job_master.occupations)
			var/job_flag
			switch(job.department_flag)
				if(CIVILIAN)
					job_flag = job_civilian_high
				if(MEDSCI)
					job_flag = job_medsci_high
				if(ENGSEC)
					job_flag = job_engsec_high
			if(job.flag == job_flag)
				previewJob = job
				break

	if((equip_preview_mob & EQUIP_PREVIEW_LOADOUT) && !(previewJob && (equip_preview_mob & EQUIP_PREVIEW_JOB) && (previewJob.type == /datum/job/ai || previewJob.type == /datum/job/cyborg)))
		var/list/equipped_slots = list()
		var/list/active_gear_list = LAZYACCESS(gear_list, "[gear_slot]")
		for(var/thing in active_gear_list)
			var/datum/gear/G = gear_datums[thing]
			if(G)
				var/permitted = 0
				if(!G.allowed_roles)
					permitted = 1
				else if(!previewJob)
					permitted = 0
				else
					for(var/job_name in G.allowed_roles)
						if(previewJob.title == job_name)
							permitted = 1

				if(G.whitelisted && (G.whitelisted != mannequin.species.name && G.whitelisted != mannequin.species.base_species))
					permitted = 0

				if(!permitted)
					continue

				if(G.slot && !(G.slot in equipped_slots))
					var/metadata = active_gear_list[G.display_name]
					if(mannequin.equip_to_slot_or_del(G.spawn_item(mannequin, metadata), G.slot))
						if(G.slot != slot_tie)
							equipped_slots += G.slot

	if((equip_preview_mob & EQUIP_PREVIEW_JOB) && previewJob)
		mannequin.job = previewJob.title
		previewJob.equip_preview(mannequin, player_alt_titles[previewJob.title])

/datum/preferences/proc/update_preview_icon()
	var/mob/living/carbon/human/dummy/mannequin/mannequin = get_mannequin(client_ckey)
	if(!mannequin.dna) // Special handling for preview icons before SSAtoms has initailized.
		mannequin.dna = new /datum/dna(null)
	mannequin.delete_inventory(TRUE)
	dress_preview_mob(mannequin)
	mannequin.update_transform()
	mannequin.toggle_tail(setting = animations_toggle)
	mannequin.toggle_wing(setting = animations_toggle)

	update_character_previews(mannequin)

/datum/preferences/proc/get_highest_job()
	var/datum/job/highJob
	// Determine what job is marked as 'High' priority, and dress them up as such.
	if(job_civilian_low & ASSISTANT)
		highJob = job_master.GetJob(JOB_ALT_ASSISTANT)
	else
		for(var/datum/job/job in job_master.occupations)
			var/job_flag
			switch(job.department_flag)
				if(CIVILIAN)
					job_flag = job_civilian_high
				if(MEDSCI)
					job_flag = job_medsci_high
				if(ENGSEC)
					job_flag = job_engsec_high
			if(job.flag == job_flag)
				highJob = job
				break

	return highJob

/datum/preferences/proc/get_valid_hairstyles(mob/user)
	var/list/valid_hairstyles = list()
	for(var/hairstyle in GLOB.hair_styles_list)
		var/datum/sprite_accessory/S = GLOB.hair_styles_list[hairstyle]
		if(!(species in S.species_allowed) && (!custom_base || !(custom_base in S.species_allowed)))
			continue
		if((!S.ckeys_allowed) || (user.ckey in S.ckeys_allowed))
			valid_hairstyles[S.name] = hairstyle


	return valid_hairstyles

/datum/preferences/proc/get_valid_facialhairstyles()
	var/list/valid_facialhairstyles = list()
	for(var/facialhairstyle in GLOB.facial_hair_styles_list)
		var/datum/sprite_accessory/S = GLOB.facial_hair_styles_list[facialhairstyle]
		if(biological_gender == MALE && S.gender == FEMALE)
			continue
		if(biological_gender == FEMALE && S.gender == MALE)
			continue
		if(!(species in S.species_allowed) && (!custom_base || !(custom_base in S.species_allowed)))
			continue

		valid_facialhairstyles[facialhairstyle] = GLOB.facial_hair_styles_list[facialhairstyle]

	return valid_facialhairstyles
