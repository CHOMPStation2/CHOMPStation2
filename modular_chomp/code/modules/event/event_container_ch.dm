
//
// VOREStation overrides to the default event manager configuration. //YW EDIT: WHY THE FUCK IS THIS NOT MENTIONED IN THE REGULAR FILE, AAAGGGHAA!
//
// This file lets us configure which events we want in the rotation without conflicts with upstream.
// It works because the actual event containers don't define New(), allowing us to use New() to replace
// the lists of available events.  If they ever do define New() this will need to be changed.
//
// Specifically the change is to move events we don't want down into the disabled_events list
//

// Adds a list of pre-disabled events to the available events list.
// This keeps them in the rotation, but disabled, so they can be enabled with a click if desired that round.
/datum/event_container/proc/add_disabled_events(var/list/disabled_events)
	for(var/datum/event_meta/EM in disabled_events)
		EM.enabled = 0
		available_events += EM


/datum/event_container/mundane/New()
	available_events = list(
		// Severity level, event name, even type, base weight, role weights, one shot, min weight, max weight. Last two only used if set and non-zero
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing",				/datum/event/nothing,						400),
		// Bluescreens APCs, but they still work
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "APC Damage",			/datum/event/apc_damage,					20, 	list(DEPARTMENT_ENGINEERING = 20), min_jobs = list(DEPARTMENT_ENGINEERING = 1)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Aurora Caelus",			/datum/event/aurora_caelus,					2,		list(), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Brand Intelligence",	/datum/event/brand_intelligence,			20, 	list(JOB_JANITOR = 25),	1, min_jobs = list(DEPARTMENT_ENGINEERING = 1)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Canister Leak",			/datum/event/canister_leak,					10, 	list(DEPARTMENT_ENGINEERING = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Economic News",			/datum/event/economic_event,				300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Electrified Door",		/datum/event/electrified_door,				-5, 	list(DEPARTMENT_MEDICAL = 5, DEPARTMENT_ENGINEERING = 20, JOB_AI = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lone Spacefish",		/datum/event/spacefish_migration, 			0,	list(DEPARTMENT_SECURITY = 15), 1, min_jobs = list(DEPARTMENT_SECURITY = 3)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Hacker",			/datum/event/money_hacker, 					0, 		list(DEPARTMENT_ANY = 4), 1, 10, 25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Lotto",			/datum/event/money_lotto, 					0, 		list(DEPARTMENT_ANY = 1), 1, 5, 15),
		//new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mundane News", 		/datum/event/mundane_news, 					300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Shipping Error",		/datum/event/shipping_error	, 				30, 	list(DEPARTMENT_ANY = 2), 0),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Space Dust",			/datum/event/dust,	 						0, 		list(DEPARTMENT_ENGINEERING = 20), 0, 0, 50),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Trivial News",			/datum/event/trivial_news, 					400),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lore News",				/datum/event/lore_news, 					400),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Supply Demand",			/datum/event/supply_demand,					0,		list(DEPARTMENT_ANY = 5, DEPARTMENT_RESEARCH = 15, JOB_BOTANIST = 10, DEPARTMENT_ENGINEERING = 10, DEPARTMENT_MEDICAL = 15), 1, min_jobs = list(DEPARTMENT_CARGO = 1)),
		// Spawns mice, lizards, or dud spiderlings
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Vermin Infestation",	/datum/event/infestation, 					100,	list(DEPARTMENT_ANY = 5, JOB_JANITOR = 100), 1),
		// Rot only weakens walls, not destroy them
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Wallrot",				/datum/event/wallrot, 						0,		list(DEPARTMENT_ENGINEERING = 30, JOB_BOTANIST = 50), 1),
	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lost Carp",				/datum/event/carp_migration, 				0, 		list(DEPARTMENT_SECURITY = 40), 1, min_jobs = list(DEPARTMENT_SECURITY = 1)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Ian Storm",				/datum/event/ianstorm,	 					1,		list(), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Supply Demand",			/datum/event/supply_demand,					0,		list(DEPARTMENT_ANY = 5, DEPARTMENT_RESEARCH = 15, JOB_BOTANIST = 10, DEPARTMENT_ENGINEERING = 10, DEPARTMENT_MEDICAL = 15), 1, min_jobs = list(DEPARTMENT_CARGO = 1)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "PDA Spam",				/datum/event/pda_spam, 						0, 		list(DEPARTMENT_ANY = 4), 1, 25, 50),
//		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lost Spiders",			/datum/event/spider_migration, 				0, 		list(DEPARTMENT_SECURITY = 10), 1), //YW EDIT //CHOMPStation Edit: Moved to disabled and commented. This just spawns spiders on carp spawns.
	))


/datum/event_container/moderate/New()
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Nothing",					/datum/event/nothing,					1600),
		// Leaks gas into an unoccupied room.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Appendicitis", 			/datum/event/spontaneous_appendicitis, 	-30,	list(DEPARTMENT_MEDICAL = 30), 1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Atmos Leak",				/datum/event/atmos_leak, 				30,		list(DEPARTMENT_ENGINEERING = 25), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Camera Damage",				/datum/event/camera_damage,				20, 	list(DEPARTMENT_SECURITY = 5, DEPARTMENT_ENGINEERING = 20), min_jobs = list(DEPARTMENT_ENGINEERING = 1)),
		// Just disables comms for a short while.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Communication Blackout",	/datum/event/communications_blackout,	500,	list(JOB_AI = 100, DEPARTMENT_SECURITY = 50), 1),
		// Just blows out a few lights
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Drone Pod Drop",			/datum/event/drone_pod_drop,			10,		list(DEPARTMENT_RESEARCH = 40), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Electrical Storm",			/datum/event/electrical_storm, 			250,	list(DEPARTMENT_ENGINEERING = 20, JOB_JANITOR = 150), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Exotic Infestation",		/datum/event/dangerinfestation, 		-30,	list(DEPARTMENT_ENGINEERING = 20, DEPARTMENT_RESEARCH = 5, DEPARTMENT_ANY = 2)),
		//Escaped slime event itself needs to be rejiggered because of the mob refactor.
		//new /datum/event_meta(EVENT_LEVEL_MODERATE, "Escaped Slimes",			/datum/event/escaped_slimes, 			-40,	list(DEPARTMENT_RESEARCH = 30, DEPARTMENT_SECURITY = 20)),
		// This one is just too fun.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Gravity Failure",			/datum/event/gravity,	 				75,		list(DEPARTMENT_ENGINEERING = 60), 1),
		// Temporary power failure, but mitigatead by subgrids
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Grid Check",				/datum/event/grid_check, 				0,		list(DEPARTMENT_RESEARCH = 10, DEPARTMENT_ENGINEERING = 25), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Grub Infestation",			/datum/event/grub_infestation,			-20,	list(DEPARTMENT_SECURITY = 40, DEPARTMENT_ENGINEERING = 40), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Infected Room",			/datum/event/disease_outbreak/floor,	-50,	list(DEPARTMENT_MEDICAL = 25, JOB_JANITOR = 10, DEPARTMENT_ANY = 1), 	1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
		// Pure RP fun, no mechanical effects.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Ion Storm",				/datum/event/ionstorm, 					-125,	list(JOB_AI = 80, JOB_CYBORG = 50, DEPARTMENT_ENGINEERING = 15, DEPARTMENT_RESEARCH = 5), min_jobs = list(JOB_CYBORG = 3)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Jellyfish School",			/datum/event/jellyfish_migration,		5,		list(DEPARTMENT_ANY = 1, DEPARTMENT_SECURITY = 5, DEPARTMENT_MEDICAL = 3), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Maintenance Predator",		/datum/event/maintenance_predator,		75,		list(DEPARTMENT_SECURITY = 25, DEPARTMENT_RESEARCH = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Maintenance Lurker",		/datum/event/maintenance_lurker,		100,	list(DEPARTMENT_ANY = 5), 0),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Meaty Ore Shower",			/datum/event/meteor_wave/meatyores,		-50,	list(DEPARTMENT_ENGINEERING = 45), 1, min_jobs = list(DEPARTMENT_ENGINEERING = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Meteor Shower",			/datum/event/meteor_wave,				-50,	list(DEPARTMENT_ENGINEERING = 45), 1, min_jobs = list(DEPARTMENT_ENGINEERING = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Morph Spawn",				/datum/event/morph_spawn,				75,		list(DEPARTMENT_ANY = 5), 0),
		//New CHOMPStation event. Mice and lizards grow into rats and lizardmen respectively.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Mutants",					/datum/event/mutants,					20,		list(DEPARTMENT_ANY = 15, DEPARTMENT_SECURITY = 25), 1),
		// Opens doors in brig.  So just RP fun
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Prison Break",				/datum/event/prison_break,				-10,	list(DEPARTMENT_SECURITY = 30, DEPARTMENT_ENGINEERING = 20), 1, min_jobs = list(DEPARTMENT_SECURITY = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Radiation Storm",			/datum/event/radiation_storm, 			50,		list(DEPARTMENT_MEDICAL = 50), 1), //YW EDIT, Readded
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Rogue Drones",				/datum/event/rogue_drone, 				-30,	list(DEPARTMENT_SECURITY = 25, JOB_HEAD_OF_SECURITY = 35, JOB_WARDEN = 35), min_jobs = list(DEPARTMENT_SECURITY = 2)),
		// Radiation, but only in space.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Solar Storm",				/datum/event/solar_storm, 				20,		list(DEPARTMENT_ENGINEERING = 40, DEPARTMENT_SECURITY = 20), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Space Dust",				/datum/event/dust,	 					0,		list(DEPARTMENT_ENGINEERING = 20), 1, 0, 50),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spacefish Migration",		/datum/event/spacefish_migration,		0, 		list(DEPARTMENT_SECURITY = 40, DEPARTMENT_MEDICAL = 5), 1, min_jobs = list(DEPARTMENT_SECURITY = 3)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spider Infestation",		/datum/event/spider_infestation, 		-20,	list(DEPARTMENT_SECURITY = 30, JOB_HEAD_OF_SECURITY = 20, JOB_WARDEN = 20), 0, min_jobs = list(DEPARTMENT_SECURITY = 1)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spontaneous Malignant Organ", 	/datum/event/spontaneous_malignant_organ, 	-30,	list(DEPARTMENT_MEDICAL = 30), 1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Supply Demand",			/datum/event/supply_demand,				0,		list(DEPARTMENT_ANY = 5, DEPARTMENT_RESEARCH = 15, JOB_BOTANIST = 10, DEPARTMENT_ENGINEERING = 10, DEPARTMENT_MEDICAL = 15), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Virology Breach",			/datum/event/prison_break/virology,		0,		list(DEPARTMENT_MEDICAL = 100), 1, min_jobs = list(DEPARTMENT_MEDICAL = 1)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Wormholes",				/datum/event/wormholes,	 				20,		list(DEPARTMENT_ANY = 5)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Xenobiology Breach",		/datum/event/prison_break/xenobiology,	0,		list(DEPARTMENT_RESEARCH = 100), 1, min_jobs = list(DEPARTMENT_RESEARCH = 1), min_jobs = list(DEPARTMENT_RESEARCH = 1, DEPARTMENT_SECURITY =1)),
	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Meteor Shower",			/datum/event/meteor_wave,				30,		list(DEPARTMENT_ENGINEERING = 20), min_jobs = list(DEPARTMENT_ENGINEERING = 3)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Random Antagonist",		/datum/event/random_antag,		 		2.5,	list(DEPARTMENT_SECURITY = 1), 1, 0, 5),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Carp School",				/datum/event/carp_migration,			-20, 	list(DEPARTMENT_ENGINEERING = 10, DEPARTMENT_SECURITY = 30, JOB_HEAD_OF_SECURITY = 10, JOB_WARDEN = 5), 1, min_jobs = list(DEPARTMENT_SECURITY = 2)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Supply Demand",			/datum/event/supply_demand,				0,		list(DEPARTMENT_ANY = 5, DEPARTMENT_RESEARCH = 15, JOB_BOTANIST = 10, DEPARTMENT_ENGINEERING = 10, DEPARTMENT_MEDICAL = 15), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Disease Outbreak",			/datum/event/disease_outbreak,			-30,	list(DEPARTMENT_MEDICAL = 30, DEPARTMENT_ANY = 1), 	1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Lost Spiders",				/datum/event/spider_migration,			0, 		list(DEPARTMENT_SECURITY = 30), 1), //YW EDIT //CHOMPStation Edit: Moved to disabled. This is a YW feature that spawns spiders on carp spawns.
	))


/datum/event_container/major/New()
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Nothing",						/datum/event/nothing,					900),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Atmos Leak",					/datum/event/atmos_leak, 				5,		list(DEPARTMENT_ENGINEERING = 35), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Blob",						/datum/event/blob, 						-100,	list(DEPARTMENT_SECURITY = 40, JOB_HEAD_OF_SECURITY = 10, JOB_WARDEN = 10, DEPARTMENT_ENGINEERING = 5), 1, min_jobs = list(DEPARTMENT_SECURITY = 1)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Carp Migration",				/datum/event/carp_migration,			-110,	list(DEPARTMENT_SECURITY = 50, JOB_HEAD_OF_SECURITY = 10, JOB_WARDEN = 10), 1, min_jobs = list(DEPARTMENT_SECURITY = 3)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Electrical Fire",				/datum/event/electrical_fire,	 		5,		list(DEPARTMENT_ENGINEERING = 5, JOB_CYBORG = 5), 0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Exotic Horde Infestation",	/datum/event/highdangerinfestation, 	-50,	list(DEPARTMENT_ENGINEERING = 20, DEPARTMENT_RESEARCH = 5, DEPARTMENT_ANY = 2), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Horde Infestation",			/datum/event/horde_infestation, 		-60,	list(DEPARTMENT_SECURITY = 20, JOB_HEAD_OF_SECURITY = 10, JOB_WARDEN = 10, DEPARTMENT_ANY = 3), 0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Infected Room",				/datum/event/disease_outbreak/floor,	-50,	list(DEPARTMENT_MEDICAL = 25, JOB_JANITOR = 10, DEPARTMENT_ANY = 1), 	1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Jellyfish Migration",			/datum/event/jellyfish_migration,		5,		list(DEPARTMENT_ANY = 1, DEPARTMENT_SECURITY = 5, DEPARTMENT_MEDICAL = 3), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meaty Ores Wave",				/datum/event/meteor_wave/meatyores,		-90,	list(DEPARTMENT_ENGINEERING = 50, DEPARTMENT_MEDICAL = 10, DEPARTMENT_ANY = 1),	1, min_jobs = list(DEPARTMENT_ENGINEERING = 1)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meteor Wave",					/datum/event/meteor_wave,				-90,	list(DEPARTMENT_ENGINEERING = 50, DEPARTMENT_MEDICAL = 10, DEPARTMENT_ANY = 1),	1, min_jobs = list(DEPARTMENT_ENGINEERING = 1)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Spacefish Swarm",				/datum/event/spacefish_migration,		10,		list(DEPARTMENT_SECURITY = 5, DEPARTMENT_MEDICAL = 3), 1, min_jobs = list(DEPARTMENT_SECURITY = 1)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Space Vines",					/datum/event/spacevine, 				20,		list(DEPARTMENT_ENGINEERING = 15), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Supply Demand",				/datum/event/supply_demand,				0,		list(DEPARTMENT_ANY = 5, DEPARTMENT_RESEARCH = 15, JOB_BOTANIST = 10, DEPARTMENT_ENGINEERING = 10, DEPARTMENT_MEDICAL = 15), 1, min_jobs = list(DEPARTMENT_CARGO = 1)),
	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Containment Breach",			/datum/event/prison_break/station,		0,		list(DEPARTMENT_ANY = 5),0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Disease Outbreak",			/datum/event/disease_outbreak,			-30,	list(DEPARTMENT_MEDICAL = 30, DEPARTMENT_ANY = 1), 	1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),
		//Spiders moved into horde infestation
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Spider Infestation",			/datum/event/spider_infestation, 		-60,	list(DEPARTMENT_SECURITY = 20, JOB_HEAD_OF_SECURITY = 10, JOB_WARDEN = 10, DEPARTMENT_ANY = 3), 0),
		//Metroids moved into horde infestation
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Metroid Infestation",			/datum/event/metroid_infestation,		-100,	list(DEPARTMENT_SECURITY = 30, DEPARTMENT_RESEARCH = 20, JOB_HEAD_OF_SECURITY = 15, JOB_WARDEN = 15, DEPARTMENT_ANY = 2), 1 , min_jobs = list(DEPARTMENT_SECURITY = 2, DEPARTMENT_RESEARCH = 1)),
		// new /datum/event_meta(EVENT_LEVEL_MAJOR, "Viral Infection",				/datum/event/viral_infection,			-50,	list(DEPARTMENT_MEDICAL = 25), 	1, min_jobs = list(DEPARTMENT_MEDICAL = 2)),

		//Needs Xenobio containment breach fixed
		//new /datum/event_meta(EVENT_LEVEL_MAJOR, "Xenobiology Breach",		/datum/event/prison_break/xenobiology,	-10,	list(DEPARTMENT_RESEARCH = 30, DEPARTMENT_ENGINEERING = 20), 1),
		//new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meteor Strike",				/datum/event/meteor_strike,		10,		list(DEPARTMENT_ENGINEERING = 15), 1),
	))
