/datum/trait/neutral/hardfeet
	custom_only = FALSE

/datum/trait/positive/linguist
	custom_only = FALSE

/datum/trait/positive/toxin_gut
	custom_only = FALSE

/datum/trait/positive/light_breather
	name ="Light Breather"
	desc = "You need less air for your lungs to properly work.."
	cost = 1

	custom_only = FALSE
	can_take = ORGANICS
	var_changes = list("minimum_breath_pressure" = 12)
	excludes = list(/datum/trait/negative/deep_breather)




//Nerfing the postive brute and burn resist. Also testing to see if letting it become more open.
/datum/trait/positive/minor_brute_resist
	name = "Brute Resist, Minor"
	desc = "Adds 10% resistance to brute damage sources."
	cost = 1
	var_changes = list("brute_mod" = 0.9)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/positive/brute_resist
	name = "Brute Resist"
	desc = "Adds 15% resistance to brute damage sources."
	cost = 2
	var_changes = list("brute_mod" = 0.85)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE
	custom_only = FALSE

/datum/trait/positive/brute_resist_plus // Equivalent to Brute Weakness Major, cannot be taken at the same time.
	name = "Brute Resist, Major"
	desc = "Adds 20% resistance to brute damage sources."
	cost = 3 // Exact Opposite of Brute Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.
	var_changes = list("brute_mod" = 0.8)
	excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/minor_brute_resist)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE
	custom_only = FALSE

/datum/trait/positive/minor_burn_resist
	name = "Burn Resist, Minor"
	desc = "Adds 10% resistance to burn damage sources." //CHOMP Edit
	cost = 1 //CHOMP Edit
	var_changes = list("burn_mod" = 0.9)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE
	custom_only = FALSE

/datum/trait/positive/burn_resist
	name = "Burn Resist"
	desc = "Adds 15% resistance to burn damage sources."
	cost = 2 //CHOMP Edit
	var_changes = list("burn_mod" = 0.85)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE
	custom_only = FALSE

/datum/trait/positive/burn_resist_plus // Equivalent to Burn Weakness Major, cannot be taken at the same time.
	name = "Burn Resist, Major"
	desc = "Adds 20% resistance to burn damage sources."
	cost = 3 // Exact Opposite of Burn Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.
	var_changes = list("burn_mod" = 0.8)
	excludes = list(/datum/trait/positive/burn_resist, /datum/trait/positive/minor_burn_resist)
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE
	custom_only = FALSE

/datum/trait/positive/speed_fast
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE