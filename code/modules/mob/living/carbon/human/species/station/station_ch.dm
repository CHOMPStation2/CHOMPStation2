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

//alraune.dm
/datum/species/alraune
	disallowed_traits = TRAITS_BREATH | TRAITS_SPEED | TRAITS_HARDY | TRAITS_BLOOD

//prometheans.dm
/datum/species/shapeshifter/promethean
	disallowed_traits = TRAITS_ATTACK | TRAITS_BLOOD | TRAITS_BREATH

//protean_species.dm
/datum/species/protean
	disallowed_traits = TRAITS_BREATH | TRAITS_HEALTH | TRAITS_BLOOD

//station.dm
/datum/species/diona
	disallowed_traits = TRAITS_SPEED | TRAITS_HARDY | TRAITS_ATTACK

/datum/species/unathi
	disallowed_traits = TRAITS_HEALTH | TRAITS_BLOOD | TRAITS_HARDY | TRAITS_SPEED

/datum/species/tajaran
	disallowed_traits = TRAITS_ATTACK | TRAITS_HEALTH | TRAITS_FLASHMOD

/datum/species/skrell
	disallowed_traits = TRAITS_FLASHMOD

/datum/species/zaddat
	disallowed_traits = TRAITS_HEALTH | TRAITS_FLASHMOD

//station_vr.dm
/datum/species/sergal
	disallowed_traits = TRAITS_ATTACK

/datum/species/akula
	disallowed_traits = TRAITS_ATTACK

/datum/species/nevrean
	disallowed_traits = TRAITS_ATTACK

/datum/species/hi_zoxxen
	disallowed_traits = TRAITS_ATTACK

/datum/species/vulpkanin
	disallowed_traits = TRAITS_ATTACK

/datum/species/crew_shadekin
	disallowed_traits = TRAITS_ATTACK | TRAITS_BLOOD | TRAITS_HEALTH

/datum/species/fl_zorren
	disallowed_traits = TRAITS_ATTACK

/datum/species/xenohybrid
	disallowed_traits = TRAITS_ATTACK

//station_special_vr.dm
/datum/species/xenochimera
	disallowed_traits = TRAITS_ATTACK | TRAITS_HEALTH

/datum/species/spider
	disallowed_traits = TRAITS_ATTACK | TRAITS_HEALTH

/datum/species/werebeast
	disallowed_traits = TRAITS_ATTACK | TRAITS_HEALTH | TRAITS_HARDY

//teshari.dm
/datum/species/teshari
	disallowed_traits = TRAITS_SPEED | TRAITS_HARDY | TRAITS_HEALTH | TRAITS_BLOOD

//species/outsider/ -- adding these in too for the sake of keeping all of these overrides in one place.

/datum/species/vox
	disallowed_traits = TRAITS_ATTACK | TRAITS_BREATH

//Can use digitigrade flags
/datum/species/custom
	digi_allowed = TRUE

/datum/species/unathi
	digi_allowed = TRUE

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
