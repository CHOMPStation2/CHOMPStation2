
/datum/species/vulpkanin
	name = SPECIES_IRYDIAN
	name_plural = "Irydian"
	selects_bodytype =
	blurb = "" //TBD
	icobase = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = 'icons/mob/human_races/r_vulpkanin.dmi'
//	path = /mob/living/carbon/human/vulpkanin
//	default_language = "Sol Common"
	secondary_langs = list(LANGUAGE_IRYDIAN)
	name_language = LANGUAGE_IRYDIAN
	species_language = LANGUAGE_IRYDIAN
	primitive_form = "Wolpin"
	tail = "vulptail"
	tail_animation = 'icons/mob/species/vulpkanin/tail.dmi' // probably need more than just one of each, but w/e
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8
//	gluttonous = 1
	num_alternate_languages = 3
	color_mult = 1
	inherent_verbs = list(/mob/living/carbon/human/proc/lick_wounds,
		/mob/living/carbon/human/proc/tie_hair)

	male_scream_sound = null //CHOMPedit
	female_scream_sound = null //CHOMPedit

//CHOMPStation Removal
//	wikilink="https://wiki.vore-station.net/Backstory#Vulpkanin"

	catalogue_data = list(/datum/category_item/catalogue/fauna/vulpkanin)

	//Furry fox-like animals shouldn't start freezing at 5 degrees celsius.
	//Minor cold is resisted, but not severe frost.
	cold_discomfort_level = 263 //Not as good at surviving the frost as tajara, but still better than humans.

	cold_level_1 = 243 //Default 260, other values remain at default. Starts taking damage at -30 celsius. Default tier 2 is -70 and tier 3 is -150


	breath_cold_level_1 = 220 // Default 240, lower is better.

	//While foxes can survive in deserts, that's handled by zorren. It's a good contrast that our vulp find heat a little uncomfortable.

	heat_discomfort_level = 295 //Just above standard 20 C to avoid heat message spam, same as Taj

	heat_level_1 = 345 //Default 360
	heat_level_2 = 390 //Default 400
	heat_level_3 = 900 //Default 1000

	breath_heat_level_1 = 370	//Default 380 - Higher is better
	breath_heat_level_2 = 445	//Default 450
	breath_heat_level_3 = 1125	//Default 1250

	primitive_form = "Wolpin"

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_WHITELIST_SELECTABLE
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	genders = list(MALE, FEMALE, PLURAL, NEUTER)

	flesh_color = "#966464"
	base_color = "#B43214"

	min_age = 18
	max_age = 110

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
