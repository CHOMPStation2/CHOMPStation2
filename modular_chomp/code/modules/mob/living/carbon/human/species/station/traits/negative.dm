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