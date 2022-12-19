//Any species commented out here must be made restricted elsewhere. They are kept here for easy reference of what we disabled.
//Note that at the time of this PR we are simply disabling everything new to discuss keeping versus scrapping later.

///datum/species/zaddat
//	spawn_flags = SPECIES_IS_RESTRICTED //Species has been enabled elsewhere.

///datum/species/crew_shadekin
//	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/human/gravworlder
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/human/spacer
	spawn_flags = SPECIES_IS_RESTRICTED

///datum/species/alraune
//	spawn_flags = SPECIES_IS_RESTRICTED //Species has been enabled, keeping this here for reference.

///datum/species/werebeast
//	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/shadekin_yw
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/shadekin
	//spawn_flags = SPECIES_IS_RESTRICTED

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

//Can use digitigrade flags
/datum/species/custom
	digi_allowed = TRUE

/datum/species/unathi
	digi_allowed = TRUE
	vore_belly_default_variant = "L"

/datum/species/tajaran
	digi_allowed = TRUE

/datum/species/hi_zoxxen
	digi_allowed = TRUE

/datum/species/sergal
	digi_allowed = TRUE

/datum/species/akula
	digi_allowed = TRUE

/datum/species/nevrean
	digi_allowed = TRUE

/datum/species/vulpkanin
	digi_allowed = TRUE

/datum/species/xenohybrid
	digi_allowed = TRUE

/datum/species/xenochimera
	digi_allowed = TRUE

