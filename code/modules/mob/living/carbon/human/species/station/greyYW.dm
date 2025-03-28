//Are these even USED? If not, axe them.
/datum/species/grey
	name = SPECIES_GREY_YW
	name_plural = "Gray"
	icobase = 'icons/mob/human_races/r_grey.dmi'
	deform = 'icons/mob/human_races/r_def_grey.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)

	blurb = "Greys are a species of aliens that are more weak than humans physically, but possesses\
	the ability to talk telephatically with themselves and other species, Due to this, Grey have no\
	naming scheme or language, having names only to make easier communication with other species.\
	<br>The Grey have unknown origin even to themselves, scientists believes they came from\
	another galaxy, greys have chosen mauna-b to act as their home planet due to high amount of grey\
	residing in there."

	wikilink = "https://yawn.izac.live/index.php?title=Grey"
	catalogue_data = list(/datum/category_item/catalogue/fauna/grey)

	num_alternate_languages = 3
	species_language = LANGUAGE_PSIONIC
	secondary_langs = list(LANGUAGE_PSIONIC)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
	flesh_color = "#a598ad"
	blood_color = "#A200FF"
	brute_mod = 1.25
	flash_mod = 1.15
	darksight = 5
	reagent_tag = IS_GREY

	// male_scream_sound = null //CHOMPedit
	// female_scream_sound = null //CHOMPedit

	min_age = 18
	max_age = 130


	health_hud_intensity = 1.5

	spawn_flags = SPECIES_IS_RESTRICTED //CHOMPedit: this should disable the species
	appearance_flags = HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

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

	has_limbs = list(
		BP_TORSO =	list("path" = /obj/item/organ/external/chest),
		BP_GROIN =	list("path" = /obj/item/organ/external/groin),
		BP_HEAD =	list("path" = /obj/item/organ/external/head/vr/grey),
		BP_L_ARM =	list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =	list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =	list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =	list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	inherent_verbs = list(/mob/living/carbon/human/proc/telepathy)

/datum/species/grey/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.fire_stacks < 0 && H.get_water_protection() <= 0.5)	// If over half your body is soaked, you're melting.
		H.adjustFireLoss(max(0,(3 - (3 * H.get_water_protection()))))	// Tripled because 0.5 is miniscule, and fire_stacks are capped in both directions.

/mob/living/carbon/human/grey/New(var/new_loc) //makes grey spawnable
	..(new_loc, SPECIES_GREY_YW)
