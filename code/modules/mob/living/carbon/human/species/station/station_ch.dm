//Any species commented out here must be made restricted elsewhere. They are kept here for easy reference of what we disabled.
//Note that at the time of this PR we are simply disabling everything new to discuss keeping versus scrapping later.

///datum/species/zaddat
//	spawn_flags = SPECIES_IS_RESTRICTED

///datum/species/crew_shadekin
//	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/human/gravworlder
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/human/spacer
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/alraune
	spawn_flags = SPECIES_IS_RESTRICTED

///datum/species/werebeast
//	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/shadekin_yw
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/shadekin
	spawn_flags = SPECIES_IS_RESTRICTED

//datum/species/protean
//	spawn_flags = SPECIES_IS_RESTRICTED

//TFF 20/1/20 - More whitelisted species listed here. Unable to force overrides to be enabled here.
/*
/datum/species/xenochimera
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_WHITELIST_SELECTABLE

/datum/species/diona
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_WHITELIST_SELECTABLE

/datum/species/vox
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_WHITELIST_SELECTABLE
*/

GLOBAL_LIST_INIT(dwarf_first,file2list('config/names/dwarf_first.txt'))
GLOBAL_LIST_INIT(dwarf_last,file2list('config/names/dwarf_last.txt'))

/datum/species/dwarf
	name = SPECIES_DWARF
	name_plural = "Dwarves"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Dwarves. They live underground most of the time and need alcohol to survive."
	num_alternate_languages = 3
	species_language = LANGUAGE_DWARF
	secondary_langs = list(LANGUAGE_SOL_COMMON, LANGUAGE_DWARF)
	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
	agility = 5 // Dwarves are not very agile

	min_age = 18
	max_age = 130

	economic_modifier = 10

	health_hud_intensity = 1.5

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	has_organ = list(
		O_HEART =		/obj/item/organ/internal/heart,
		O_LUNGS =		/obj/item/organ/internal/lungs,
		O_VOICE = 		/obj/item/organ/internal/voicebox,
		O_LIVER =		/obj/item/organ/internal/liver,
		O_KIDNEYS =		/obj/item/organ/internal/kidneys,
		O_BRAIN =		/obj/item/organ/internal/brain,
		O_APPENDIX = 	/obj/item/organ/internal/appendix,
		O_SPLEEN = 		/obj/item/organ/internal/spleen,
		O_EYES =		/obj/item/organ/internal/eyes,
		O_STOMACH =		/obj/item/organ/internal/stomach,
		O_INTESTINE =	/obj/item/organ/internal/intestine
		)

	male_scream_sound = null //CHOMPedit
	female_scream_sound = null //CHOMPedit

//Dwarf Name stuff
/datum/species/dwarf/proc/dwarf_name() //hello caller: my name is urist mcuristurister
	return "[pick(GLOB.dwarf_first)] [pick(GLOB.dwarf_last)]"

/datum/species/dwarf/get_random_name(gender)
	return dwarf_name() //hello, ill return the value from dwarf_name proc to you when called.
