/datum/techweb_node/basic_arms
	id = TECHWEB_NODE_BASIC_ARMS
	starting_node = TRUE
	display_name = "Basic Arms"
	description = "Ballistics can be unpredictable in space."
	design_ids = list(
		"dartgun_r",
		"dartgun_mag_s",
		"dartgun_ammo_s",
		"dartgun_mag_m",
		"dartgun_ammo_m",
		// "toy_armblade",
		// "toygun",
		// "c38_rubber",
		// "c38_rubber_mag",
		// "c38_sec",
		// "c38_mag",
		// "capbox",
		// "foam_dart",
		// "sec_beanbag_slug",
		// "sec_dart",
		// "sec_Islug",
		// "sec_rshot",
	)

/datum/techweb_node/sec_equip
	id = TECHWEB_NODE_SEC_EQUIP
	display_name = "Security Equipment"
	description = "All the essentials to subdue a mime."
	prereq_ids = list(TECHWEB_NODE_BASIC_ARMS)
	design_ids = list(
		"seccamera",
		"sec_data",
		"prisonmanage",
		"pointdefense",
		"pointdefense_control",
		// "mining",
		// "rdcamera",
		// "security_photobooth",
		// "photobooth",
		// "scanner_gate",
		// "pepperspray",
		// "dragnet_beacon",
		// "inspector",
		// "evidencebag",
		// "zipties",
		// "seclite",
		// "electropack",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/riot_supression
	id = TECHWEB_NODE_RIOT_SUPRESSION
	display_name = "Riot Supression"
	description = "When you are on the opposing side of a revolutionary movement."
	prereq_ids = list(TECHWEB_NODE_SEC_EQUIP)
	design_ids = list(
		"netgun",
		"sizenetgun",
		"sickshot",
		"pummeler",
		"protector",
		"fuelrod_gun",
		"chargesword",
		"chargeaxe",
		"riflescope",
		"motion_tracker",
		"hunt_trap",
		"recon_skimmer",
		// "clown_firing_pin",
		// "pin_testing",
		// "pin_loyalty",
		// "tele_shield",
		// "ballistic_shield",
		// "handcuffs_s",
		// "bola_energy",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/explosives
	id = TECHWEB_NODE_EXPLOSIVES
	display_name = "Explosives"
	description = "For once, intentional explosions."
	prereq_ids = list(TECHWEB_NODE_RIOT_SUPRESSION)
	design_ids = list(
		"large_Grenade",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	// required_experiments = list(/datum/experiment/ordnance/explosive/lowyieldbomb)
	announce_channels = list(CHANNEL_SECURITY, CHANNEL_MEDICAL)

/datum/techweb_node/exotic_ammo
	id = TECHWEB_NODE_EXOTIC_AMMO
	display_name = "Exotic Ammunition"
	description = "Specialized bullets designed to ignite, freeze, and inflict various other effects on targets, expanding combat capabilities."
	prereq_ids = list(TECHWEB_NODE_EXPLOSIVES)
	design_ids = list(
		"smg",
		"ammo_9mm",
		"magnetic_ammo",
		"stunshell",
		"empshell",
		"ptrshell",
		"monkey_gun",
		// "c38_hotshot",
		// "c38_hotshot_mag",
		// "c38_iceblox",
		// "c38_iceblox_mag",
		// "c38_trac",
		// "c38_trac_mag",
		// "c38_true_strike",
		// "c38_true_strike_mag",
		// "techshotshell",
		// "flechetteshell",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)
	// discount_experiments = list(/datum/experiment/ordnance/explosive/highyieldbomb = TECHWEB_TIER_4_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/electric_weapons
	id = TECHWEB_NODE_ELECTRIC_WEAPONS
	display_name = "Electric Weaponry"
	description = "Energy-based weaponry designed for both lethal and non-lethal applications."
	prereq_ids = list(TECHWEB_NODE_RIOT_SUPRESSION)
	design_ids = list(
		"stunrevolver",
		"temp_gun",
		"vinstunrevolver",
		// "ioncarbine",
		// "lasershell",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/beam_weapons
	id = TECHWEB_NODE_BEAM_WEAPONS
	display_name = "Advanced Beam Weaponry"
	description = "So advanced, even engineers are baffled by its operational principles."
	prereq_ids = list(TECHWEB_NODE_ELECTRIC_WEAPONS)
	design_ids = list(
		"nuclear_gun",
		"ppistol",
		"lasercannon",
		"decloner",
		"advparticle",
		"pressureinterlock",
		"particlecannon",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/gun_nsfw
	id = TECHWEB_NODE_NSFW
	display_name = "'NSFW' Gun"
	description = "Experimental N.S.F.W. Revolver."
	prereq_ids = list(TECHWEB_NODE_EXOTIC_AMMO)
	design_ids = list(
		"nsfw_prototype",
		"nsfw_mag_prototype",
		"nsfw_cell_stun",
		"nsfw_cell_lethal",
		"nsfw_cell_net",
		"nsfw_cell_ion",
		"nsfw_cell_shotstun",
		"nsfw_cell_xray",
		// "nsfw_cell_stripper", // CHOMPRemove
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/phase_weapons //CHOMPEdit Start - Adds Phase Weaponry
	id = TECHWEB_NODE_PHASE_WEAPONS
	display_name = "Advanced phase Weaponry"
	description = "Advanced weaponry that uses phase technology, allowing weaponry that deals minor damage to higher-functioning entities while dealing more to lower-functioning entities" //I dunno how to explain 'if you shoot a mob it does more damage but if you shoot a player it does less' in IC terms.
	prereq_ids = list(TECHWEB_NODE_ELECTRIC_WEAPONS)
	design_ids = list(
		"phasepistol",
		"phasecarbine",
		"phaserifle",
		"phasecannon",
		"holdout_frontier_phaser",
		"frontier_phaser",
		"carbine_frontier_phaser",
		"marksman_rifle_frontier_phaser",
		"handbow_frontier_phaser",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS) //They mostly work on mobs.
	announce_channels = list(CHANNEL_SECURITY) //CHOMPEdit End - Adds Phase Weaponry

/datum/techweb_node/cryogun //CHOMPEdit Start
	id = TECHWEB_NODE_CRYOGUN
	display_name = "Cryogenic Gun"
	description = "Specialized gun that allows for cooling down a target."
	prereq_ids = list(TECHWEB_NODE_EXPLOSIVES)
	design_ids = list(
		"cryogun",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS) //It's actually laughably weak.
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/caseless_rifle
	id = TECHWEB_NODE_CASELESS_RIFLE
	display_name = "Caseless rifle"
	description = "A Specialized gun that allows for covert operations, leaving no shells behind."
	prereq_ids = list(TECHWEB_NODE_EXOTIC_AMMO)
	design_ids = list(
		"caselessrifle",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	announce_channels = list(CHANNEL_SECURITY)

/datum/techweb_node/metamorphosis_ray
	id = TECHWEB_NODE_METAMORPHOSIS_RAY
	display_name = "Metamorposis Ray"
	description = "A Specialized weapon that allows transforming the target into various simple creatures."
	prereq_ids = list(TECHWEB_NODE_EXOTIC_AMMO)
	design_ids = list(
		"metamorphosisray",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	announce_channels = list(CHANNEL_SECURITY) //CHOMPEdit End
