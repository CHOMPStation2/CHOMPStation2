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