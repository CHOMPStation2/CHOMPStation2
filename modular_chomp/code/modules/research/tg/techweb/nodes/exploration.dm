/datum/techweb_node/tyr_loot
	id = TECHWEB_NODE_TYRGOODS
	display_name = "Tyrian Tech"
	description = "By utilizing advanced scanning technolgy, reverse enginer tyrian tech.."
	prereq_ids = list(TECHWEB_NODE_MOD_ANOMALY_SUIT)
	design_ids = list(
		"tyr_rifle",
		"magnet_belt",
		"tyr_sabre",
		"tyr_katar",
		"tyr_hammer",
		"tyr_barrier",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	required_experiments = list(/datum/experiment/scanning/points/tyr_precursor_study)
	announce_channels = list(CHANNEL_SECURITY, CHANNEL_SCIENCE)

/datum/techweb_node/precursor_tool
	id = TECHWEB_NODE_PRECUSORTOOLS
	display_name = "Precursor Tools"
	description = "By utilizing advanced scanning technolgy, reverse enginer precursor tools."
	prereq_ids = list(TECHWEB_NODE_MOD_ANOMALY_SUIT)
	design_ids = list(
		"alienwelder",
		"alienwrench",
		"alienscrewdriver",
		"aliencrowbar",
		"alienwirecutters",
		"alienmultitool",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	required_experiments = list(/datum/experiment/scanning/points/precursor_tool_study)
	announce_channels = list(CHANNEL_ENGINEERING, CHANNEL_SCIENCE)

/datum/techweb_node/parts_omni
	required_experiments = list(/datum/experiment/scanning/points/giga_power_study)

/datum/techweb_node/cells_recharging
	required_experiments = list(/datum/experiment/scanning/points/precursor_power_study)
