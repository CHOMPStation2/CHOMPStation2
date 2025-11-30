/datum/techweb_node/tyr_loot
	id = TECHWEB_NODE_TYRGOODS
	display_name = "Tyrian Tech"
	description = "By utilizing advanced scanning technolgy, reverse enginer tyrian tech.."
	prereq_ids = list(TECHWEB_NODE_MOD_ANOMALY_SUIT)
	design_ids = list(
		"tyr_rifle",
		"magnet_belt",
		"tyr_sabre",
		"tyr_barrier",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	required_experiments = list(/datum/experiment/scanning/points/tyr_precursor_study)
	announce_channels = list(CHANNEL_SECURITY, CHANNEL_SCIENCE)
