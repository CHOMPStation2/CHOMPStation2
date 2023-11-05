/datum/trait/negative/deep_sleeper
	custom_only = FALSE

/datum/trait/negative/deep_breather
	name ="Deep Breather"
	desc = "You need more air for your lungs to properly work.."
	cost = -1

	custom_only = FALSE
	can_take = ORGANICS

	var_changes = list("minimum_breath_pressure" = 18)
	excludes = list(/datum/trait/positive/light_breather)



//Seeing how folks would feel about letting generic stat changes be more open
/datum/trait/negative/minor_brute_weak
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/brute_weak
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/brute_weak_plus
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/minor_burn_weak
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/burn_weak
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/burn_weak_plus
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/speed_slow
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/speed_slow_plus
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/weakling
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE

/datum/trait/negative/weakling_plus
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_ALWAYS_OVERRIDE