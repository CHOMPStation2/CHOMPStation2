// Chomp additions to character load/save logic
// /datum/category_item/player_setup_item/general/body/content cannot be overridden here easily as the proc creates a list of html data
// perhaps one could get that list here, and sort through sections to rewrite it's content...? that seems inefficent having to loop through the list.

//copy_to_mob setup proc for spawning mob from prefs
/datum/category_item/player_setup_item/general/body/copy_to_mob(var/mob/living/carbon/human/character)
	. = ..()
	if(character.species.digi_allowed)
		character.digitigrade = pref.digitigrade
	else
		character.digitigrade = 0

	//sanity check
	if(character.digitigrade == null)
		character.digitigrade = 0
		pref.digitigrade = 0 // given above code, if character.digi is null, pref.digi also has to be.

// ontopic, the proc for clicking an option in the body customisation panel
/datum/category_item/player_setup_item/general/body/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["digitigrade"])
		pref.digitigrade = !pref.digitigrade

		return TOPIC_REFRESH_UPDATE_PREVIEW
	. = ..()

// Savefile additions
// Be careful here

// This will add chomp-custom data to the body customisaiton page, below 'body color', above 'genetics settings'
/datum/category_item/player_setup_item/general/body/proc/chomp_custom_additions_body(var/mob/user, var/datum/species/mob_species)
	. += "<h2>ChompStation Settings</h2>"

	if(mob_species.digi_allowed)
		. += "<br><b>Digitigrade?:</b> <a href='?src=\ref[src];digitigrade=1'><b>[pref.digitigrade ? "Yes" : "No"]</b></a><br>"

	return .



/datum/category_item/player_setup_item/general/body/load_character(var/savefile/S)
	. = ..()
	S["digitigrade"] 	>> pref.digitigrade //CHOMPEdit


/datum/category_item/player_setup_item/general/body/save_character(var/savefile/S)
	. = ..()
	S["digitigrade"]	<< pref.digitigrade //CHOMPEdit


/datum/category_item/player_setup_item/general/body/sanitize_character(var/savefile/S)
	. = ..()
	pref.digitigrade	= sanitize_integer(pref.digitigrade, 0, 1, initial(pref.digitigrade))