#define ASSIGNMENT_ANY "Any"
#define ASSIGNMENT_AI "AI"
#define ASSIGNMENT_CYBORG "Cyborg"
#define ASSIGNMENT_ENGINEER "Engineer"
#define ASSIGNMENT_GARDENER "Gardener"
#define ASSIGNMENT_JANITOR "Janitor"
#define ASSIGNMENT_MEDICAL "Medical"
#define ASSIGNMENT_SCIENTIST "Scientist"
#define ASSIGNMENT_SECURITY "Security"
#define ASSIGNMENT_HOS "Head of Security"
#define ASSIGNMENT_WARDEN "Warden"

//
// VOREStation overrides to the default event manager configuration.
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

	//CHOMPStation Edit Start TFF 24/12/19 - sync list of disabled events with Chompers Git
/datum/event_container/mundane/New()
	available_events = list(
		// Severity level, event name, even type, base weight, role weights, one shot, min weight, max weight. Last two only used if set and non-zero
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing",			/datum/event/nothing,			200),
		// Bluescreens APCs, but they still work
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "APC Damage",		/datum/event/apc_damage,		20, 	list(ASSIGNMENT_ENGINEER = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Brand Intelligence",/datum/event/brand_intelligence,20, 	list(ASSIGNMENT_JANITOR = 25),	1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Camera Damage",		/datum/event/camera_damage,		20, 	list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_AI = 40)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Canister Leak",		/datum/event/canister_leak,		10, 	list(ASSIGNMENT_ENGINEER = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Economic News",		/datum/event/economic_event,	300),
//		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Electrified Door",	/datum/event/electrified_door,	-5, 	list(ASSIGNMENT_MEDICAL = 5, ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_AI = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lost Carp",			/datum/event/carp_migration, 	0, 		list(ASSIGNMENT_SECURITY = 40), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Lotto",		/datum/event/money_lotto, 		0, 		list(ASSIGNMENT_ANY = 1), 1, 5, 15),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Shipping Error",	/datum/event/shipping_error	, 	30, 	list(ASSIGNMENT_ANY = 2), 0),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Supply Demand",		/datum/event/supply_demand,		-15,	list(ASSIGNMENT_ANY = 1, ASSIGNMENT_ENGINEER = 5, ASSIGNMENT_MEDICAL = 5), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Trivial News",		/datum/event/trivial_news, 		400),
		// Spawns mice, or lizards.
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Vermin Infestation",/datum/event/infestation, 		100,	list(ASSIGNMENT_JANITOR = 100), 1),
		//Split spiderlings off from the vermin infestation event into its own thing, triggered only by security.
//		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Spiderling Infestation",/datum/event/spiderling_infestation, 	-30,	list(ASSIGNMENT_SECURITY = 25), 1),
		// Rot only weakens walls, not destroy them
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Wallrot",			/datum/event/wallrot, 			30,		list(ASSIGNMENT_ENGINEER = 30, ASSIGNMENT_GARDENER = 50), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Window Damage",		/datum/event/window_break,		10, 	list(ASSIGNMENT_ENGINEER = 20)),
//		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Viral Infection",	/datum/event/viral_infection, 	-25,	list(ASSIGNMENT_MEDICAL = 5), 1),
	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Ian Storm",			/datum/event/ianstorm,	 		1,		list(), 1),
		//Moved this to disabled for now, at least until meteors get a 10 minute delay. Might not happen as progress on Chomp Station Bayport continues.
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Meteor Shower",		/datum/event/meteor_wave,		-20,		list(ASSIGNMENT_ENGINEER = 50), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Hacker",		/datum/event/money_hacker, 		0, 		list(ASSIGNMENT_ANY = 4), 1, 10, 25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "PDA Spam",			/datum/event/pda_spam, 			0, 		list(ASSIGNMENT_ANY = 4), 1, 25, 50),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Space Dust",		/datum/event/dust,	 			50, 	list(ASSIGNMENT_ENGINEER = 20), 1, 0, 50),
	))
	//CHOMPStation Edit End

	//CHOMPStation Edit Start TFF 24/12/19 - sync list of disabled events with Chompers Git
/datum/event_container/moderate/New()
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Nothing",					/datum/event/nothing,					800),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Appendicitis", 			/datum/event/spontaneous_appendicitis, 	-10,		list(ASSIGNMENT_MEDICAL = 30), 1),
		// Leaks gas into an unoccupied room.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Atmos Leak",				/datum/event/atmos_leak, 				60,	list(ASSIGNMENT_ENGINEER = 25), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Camera Damage",			/datum/event/camera_damage,				20, 	list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_AI = 40)),
		// Just disables comms for a short while.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Communication Blackout",	/datum/event/communications_blackout,	50,	list(ASSIGNMENT_AI = 150, ASSIGNMENT_SECURITY = 120), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Carp School",				/datum/event/carp_migration,			-20, 	list(ASSIGNMENT_ENGINEER = 10, ASSIGNMENT_SECURITY = 30, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 5), 1),
		// Just blows out a few lights
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Electrical Storm",			/datum/event/electrical_storm, 			60,	list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_JANITOR = 150), 1),
		// This one is just too fun.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Gravity Failure",			/datum/event/gravity,	 				65,		list(ASSIGNMENT_ENGINEER = 10), 1),
		// Temporary power failure, but mitigatead by subgrids
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Grid Check",				/datum/event/grid_check, 				40,		list(ASSIGNMENT_SCIENTIST = 10, ASSIGNMENT_ENGINEER = 25), 1),
		//Evil grubs that drain station power slightly
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Grub Infestation",			/datum/event/grub_infestation,			-20,	list(ASSIGNMENT_SECURITY = 40, ASSIGNMENT_ENGINEER = 40), 1),
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Escaped Slimes",			/datum/event/escaped_slimes, 			-40,	list(ASSIGNMENT_SCIENTIST = 30, ASSIGNMENT_SECURITY = 20)),
		// Pure RP fun, no mechanical effects.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Ion Storm",				/datum/event/ionstorm, 					-50,	list(ASSIGNMENT_AI = 200, ASSIGNMENT_CYBORG = 100, ASSIGNMENT_ENGINEER = 15, ASSIGNMENT_SCIENTIST = 5), 0),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Meteor Shower",			/datum/event/meteor_wave,				-50,	list(ASSIGNMENT_ENGINEER = 45), 1),
		//New CHOMPStation event. Mice grow into rats.
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Mutants",					/datum/event/mutants,					20,		list(ASSIGNMENT_ANY = 15, ASSIGNMENT_SECURITY = 50), 1),
		// Opens doors in brig.  So just RP fun
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Prison Break",				/datum/event/prison_break,				-10,	list(ASSIGNMENT_SECURITY = 30, ASSIGNMENT_ENGINEER = 20), 1),
		// Not bad (dorms are shielded) but inconvenient
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Radiation Storm",			/datum/event/radiation_storm, 			0,		list(ASSIGNMENT_MEDICAL = 35), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Rogue Drones",				/datum/event/rogue_drone, 				-30,	list(ASSIGNMENT_SECURITY = 25, ASSIGNMENT_HOS = 35, ASSIGNMENT_WARDEN = 35)),
		// Radiation, but only in space.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Solar Storm",				/datum/event/solar_storm, 				5,		list(ASSIGNMENT_ENGINEER = 40, ASSIGNMENT_SECURITY = 30), 1),
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Viral Infection",			/datum/event/viral_infection,			-60,	list(ASSIGNMENT_MEDICAL = 50), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Virology Breach",			/datum/event/prison_break/virology,		-10,	list(ASSIGNMENT_MEDICAL = 30, ASSIGNMENT_ENGINEER = 20), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, 	"Wallrot",					/datum/event/wallrot, 					0,		list(ASSIGNMENT_ENGINEER = 30, ASSIGNMENT_GARDENER = 50), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Wormholes",				/datum/event/wormholes,	 				20,		list(ASSIGNMENT_ANY = 5))
		//CHOMPStation Removal TFF 3/12/19 - Moved to Major
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Xenobiology Breach",		/datum/event/prison_break/xenobiology,	-10,	list(ASSIGNMENT_SCIENCE = 30, ASSIGNMENT_ENGINEER = 20), 1),

	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Carp School_NoRequirements",	/datum/event/carp_migration,		100, 	list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_SECURITY = 30), 1),
//		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Escaped Slimes_NoRequirements",	/datum/event/escaped_slimes, 	30,		list(ASSIGNMENT_SCIENTIST = 40, ASSIGNMENT_SECURITY = 30)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Meteor Shower_NoRequirements",	/datum/event/meteor_wave,			30,		list(ASSIGNMENT_ENGINEER = 20), 0),
		//Moved spider infestation to disabled for now due to CHOMP random event rebalancing.
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spider Infestation",		/datum/event/spider_infestation, 		-20,	list(ASSIGNMENT_SECURITY = 30, ASSIGNMENT_HOS = 20, ASSIGNMENT_WARDEN = 20), 0),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spider Infestation_NoRequirements",	/datum/event/spider_infestation, 	100,	list(ASSIGNMENT_SECURITY = 40), 0),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Supply Demand",			/datum/event/supply_demand,				0,		list(ASSIGNMENT_ANY = 5, ASSIGNMENT_SCIENCE = 15, ASSIGNMENT_GARDENER = 10, ASSIGNMENT_ENGINEER = 10, ASSIGNMENT_MEDICAL = 15), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Random Antagonist",		/datum/event/random_antag,		 		3,	list(ASSIGNMENT_SECURITY = 1), 1, 0, 5),
	))
	//CHOMPStation Edit End

	//CHOMPStation Edit Start TFF 24/12/19 - sync list of disabled events with Chompers Git
/datum/event_container/major/New()
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Nothing",				/datum/event/nothing,			900),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Atmos Leak",			/datum/event/atmos_leak, 		5,		list(ASSIGNMENT_ENGINEER = 35), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Blob",				/datum/event/blob, 				-100,	list(ASSIGNMENT_SECURITY = 40, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 10, ASSIGNMENT_ENGINEER = 5), 1),
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Boss",				/datum/event/boss, 				-110,	list(ASSIGNMENT_SECURITY = 50, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Carp Migration",		/datum/event/carp_migration,	-110,	list(ASSIGNMENT_SECURITY = 50, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Containment Breach",	/datum/event/prison_break/station,0,	list(ASSIGNMENT_ANY = 5),		0),
		// TFF: Virgo event commented out. Technically meant for Tether maps, not Polaris.
		// new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meteor Strike",	/datum/event/meteor_strike,		10,		list(ASSIGNMENT_ENGINEER = 15), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meteor Wave",			/datum/event/meteor_wave,		-110,		list(ASSIGNMENT_ENGINEER = 50),	1),
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Metroid Infestation",	/datum/event/metroid_infestation, -75,	list(ASSIGNMENT_SECURITY = 35, ASSIGNMENT_SCIENCE = 20, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 10), 0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Space Vines",			/datum/event/spacevine, 		20,		list(ASSIGNMENT_ENGINEER = 15), 1),
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Viral Infection",		/datum/event/viral_infection,	-50,	list(ASSIGNMENT_MEDICAL = 25), 	1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Xenobiology Breach",	/datum/event/prison_break/xenobiology,	-10,	list(ASSIGNMENT_SCIENCE = 30, ASSIGNMENT_ENGINEER = 20), 1)
	)
	add_disabled_events(list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Blob_NoRequirements",	/datum/event/blob, 	10,		list(ASSIGNMENT_SECURITY = 10, ASSIGNMENT_ENGINEER = 30), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Carp Migration_NoRequirements",	/datum/event/carp_migration,	10,	list(ASSIGNMENT_SECURITY = 10), 1),
//Commenting this one out. This is easily abused and spawns too many slimes at once. Might bring back later.
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Escaped Slimes",		/datum/event/escaped_slimes, 	-50,	list(ASSIGNMENT_SCIENTIST = 30, ASSIGNMENT_SECURITY = 30), 1),
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Escaped Slimes_NoRequirements",	/datum/event/escaped_slimes, 	30,		list(ASSIGNMENT_SCIENTIST = 10, ASSIGNMENT_SECURITY = 5)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Meteor Wave_NoRequirements",		/datum/event/meteor_wave,		30,	list(ASSIGNMENT_ENGINEER = 30),	1),
//Moved to disabled because this was getting redundant with the amount of spiders occurring.
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Spider Infestation",	/datum/event/spider_infestation, -45,	list(ASSIGNMENT_SECURITY = 30, ASSIGNMENT_HOS = 10, ASSIGNMENT_WARDEN = 10), 0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Spider Infestation_NoRequirements",	/datum/event/spider_infestation, 	30,	list(ASSIGNMENT_SECURITY = 10), 0),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Supply Demand",		/datum/event/supply_demand,		0,	list(ASSIGNMENT_ANY = 5, ASSIGNMENT_SCIENCE = 15, ASSIGNMENT_GARDENER = 10, ASSIGNMENT_ENGINEER = 10, ASSIGNMENT_MEDICAL = 15), 1),
//		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Viral Infection_NoRequirements",	/datum/event/viral_infection,	50,	list(ASSIGNMENT_MEDICAL = 50), 1),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Space Dust",			/datum/event/dust,	 			50, 	list(ASSIGNMENT_ENGINEER = 30), 0),
	))
	//CHOMPStation Edit End

#undef ASSIGNMENT_ANY
#undef ASSIGNMENT_AI
#undef ASSIGNMENT_CYBORG
#undef ASSIGNMENT_ENGINEER
#undef ASSIGNMENT_GARDENER
#undef ASSIGNMENT_JANITOR
#undef ASSIGNMENT_MEDICAL
#undef ASSIGNMENT_SCIENTIST
#undef ASSIGNMENT_SECURITY
#undef ASSIGNMENT_HOS
#undef ASSIGNMENT_WARDEN