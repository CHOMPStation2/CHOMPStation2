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

/datum/species/dwarf
	name = SPECIES_DWARF
	name_plural = "Dwarves"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government maintains control of its far-flung people, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."
	num_alternate_languages = 3
	species_language = LANGUAGE_DWARF
	secondary_langs = list(LANGUAGE_SOL_COMMON, LANGUAGE_DWARF)
	name_language = LANGUAGE_DWARF
	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)

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

	inherent_verbs = list(
		/mob/living/carbon/human/proc/tie_hair)

//Dwarf Name stuff
/proc/dwarf_name() //hello caller: my name is urist mcuristurister
	return "[pick(GLOB.dwarf_first)] [pick(GLOB.dwarf_last)]"

/datum/species/dwarf/random_name(gender,unique,lastname)
	return dwarf_name() //hello, ill return the value from dwarf_name proc to you when called.

//Dwarf Speech handling - Basically a filter/forces them to say things. The IC helper
/datum/species/dwarf/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if() // No accent if they speak their language
		message = " [message]" //Credits to goonstation for the strings list.
		var/list/dwarf_words = strings("dwarf_replacement.json", "dwarf") //thanks to regex too.
		for(var/word in splittext(message," "))
			var/value = dwarf_words[word] //Thus they will always be in character.
			if(!value)
				continue
			if(islist(value)) //Whether they like it or not.
				value = pick(value) //This could be drastically reduced if needed though.
			message = replacetextEx(message, " [uppertext(word)]", " [uppertext(value)]")
			message = replacetextEx(message, " [capitalize(word)]", " [capitalize(value)]")
			message = replacetextEx(message, " [word]", " [value]") //Also its scottish.

	if(prob(3))
		message += " By Armok!"
	speech_args[SPEECH_MESSAGE] = trim(message)


