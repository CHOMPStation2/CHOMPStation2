/datum/trait/positive/weaver
	category = 0
	cost = 0

/datum/trait/positive/linguist //THIS HOOKING INTO THE ORIGINAL LINGUIST FUCKS THINGS HARD. DURING TRAIT REWORK, DELETE THIS AND REENABLE LINGUIST/MASTER
	name = "Master Linguist"
	desc = "You are a master of languages! For whatever reason you might have, you are able to learn many more languages than others. Your language cap is 12 slots."
	cost = 2
	var_changes = list("num_alternate_languages" = 15)
	var_changes_pref = list("extra_languages" = 12)
	custom_only = FALSE

/datum/trait/positive/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark. (Half the screen)."
	cost = 1
	var_changes = list("darksight" = 4)  //CHOMP Edit
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.

/datum/trait/positive/darksight_plus
	name = "Darksight, Major"
	desc = "Allows you to see in the dark for the whole screen."
	cost = 2
	var_changes = list("darksight" = 8)
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.

/datum/trait/positive/endurance_high
	cost = 3
	excludes = list(/datum/trait/positive/endurance_very_high, /datum/trait/positive/endurance_extremely_high) // CHOMPEdit: Increased Endurance.
	// excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/minor_brute_resist, /datum/trait/positive/minor_burn_resist, /datum/trait/positive/burn_resist)
	// Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

/datum/trait/positive/burn_resist_plus
	cost = 3 // Exact Opposite of Burn Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.

/datum/trait/positive/brute_resist_plus // Equivalent to Brute Weakness Major, cannot be taken at the same time.
	cost = 3 // Exact Opposite of Brute Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.


//edits below open certain traits to custom species, based on whether a human(which is not custom) could have that trait
/datum/trait/positive/snowwalker
	custom_only = FALSE

/datum/trait/positive/throw_resistance
	custom_only = FALSE

/datum/trait/positive/lowpressureresminor
	custom_only = FALSE
	banned_species = list(SPECIES_SHADEKIN)

/datum/trait/positive/highpressureresminor
	custom_only = FALSE
	banned_species = list(SPECIES_SHADEKIN)

/datum/trait/positive/pressureres
	custom_only = FALSE
	banned_species = list(SPECIES_SHADEKIN)

/datum/trait/positive/more_blood
	custom_only = FALSE
	banned_species = list(SPECIES_TESHARI)

/datum/trait/positive/heavyweight
	custom_only = FALSE

/datum/trait/positive/grappling_expert
	custom_only = FALSE //I hate this trait, but I can't justify it being a custom only trait in my head

/datum/trait/positive/densebones
	custom_only = FALSE
	banned_species = list(SPECIES_UNATHI)

/datum/trait/positive/adrenaline_rush
	custom_only = FALSE //tbh, if I were to give humans, specifically, any one trait and restrict it from other races, it would be this one
