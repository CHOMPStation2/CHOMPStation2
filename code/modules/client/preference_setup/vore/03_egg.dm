// Define a place to save appearance in character setup
<<<<<<< HEAD
// CHOMPStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#define AUTOHISS_OFF 0
#define AUTOHISS_BASIC 1
#define AUTOHISS_FULL 2
// CHOMPStation Add End

/datum/preferences
	var/vore_egg_type = "Egg" //The egg type they have.
	var/autohiss = "Full"			// CHOMPStation Add: Whether we have Autohiss on. I'm hijacking the egg panel bc this one has a shitton of unused space.
=======
// VOREStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#define AUTOHISS_OFF 0
#define AUTOHISS_BASIC 1
#define AUTOHISS_FULL 2
// VOREStation Add End

/datum/preferences
	var/vore_egg_type = "Egg" //The egg type they have.
	var/autohiss = "Full"			// VOREStation Add: Whether we have Autohiss on. I'm hijacking the egg panel bc this one has a shitton of unused space.
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs

// Definition of the stuff for the egg type.
/datum/category_item/player_setup_item/vore/egg
	name = "Egg appearance."
	sort_order = 3

/datum/category_item/player_setup_item/vore/egg/load_character(var/savefile/S)
	S["vore_egg_type"]		>> pref.vore_egg_type
<<<<<<< HEAD
	S["autohiss"]			>> pref.autohiss // CHOMPStation Add

/datum/category_item/player_setup_item/vore/egg/save_character(var/savefile/S)
	S["vore_egg_type"]		<< pref.vore_egg_type
	S["autohiss"]			<< pref.autohiss // CHOMPStation Add
=======
	S["autohiss"]			>> pref.autohiss // VOREStation Add

/datum/category_item/player_setup_item/vore/egg/save_character(var/savefile/S)
	S["vore_egg_type"]		<< pref.vore_egg_type
	S["autohiss"]			<< pref.autohiss // VOREStation Add
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs

/datum/category_item/player_setup_item/vore/egg/sanitize_character()
	pref.vore_egg_type	 = sanitize_inlist(pref.vore_egg_type, global_vore_egg_types, initial(pref.vore_egg_type))

/datum/category_item/player_setup_item/vore/egg/copy_to_mob(var/mob/living/carbon/human/character)
	character.vore_egg_type	= pref.vore_egg_type
<<<<<<< HEAD
	// CHOMPStation Add
=======
	// VOREStation Add
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs
	if(pref.client) // Safety, just in case so we don't runtime.
		if(!pref.autohiss)
			pref.client.autohiss_mode = AUTOHISS_FULL
		else
			switch(pref.autohiss)
				if("Full")
					pref.client.autohiss_mode = AUTOHISS_FULL
				if("Basic")
					pref.client.autohiss_mode = AUTOHISS_BASIC
				if("Off")
					pref.client.autohiss_mode = AUTOHISS_OFF
<<<<<<< HEAD
	// CHOMPStation Add
=======
	// VOREStation Add
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs

/datum/category_item/player_setup_item/vore/egg/content(var/mob/user)
	. += "<br>"
	. += " Egg Type: <a href='?src=\ref[src];vore_egg_type=1'>[pref.vore_egg_type]</a><br>"
<<<<<<< HEAD
	. += "<b>Autohiss Default Setting:</b> <a href='?src=\ref[src];autohiss=1'>[pref.autohiss]</a><br>" // CHOMPStation Add
=======
	. += "<b>Autohiss Default Setting:</b> <a href='?src=\ref[src];autohiss=1'>[pref.autohiss]</a><br>" // VOREStation Add
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs

/datum/category_item/player_setup_item/vore/egg/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(!CanUseTopic(user))
		return TOPIC_NOACTION

	else if(href_list["vore_egg_type"])
		var/list/vore_egg_types = global_vore_egg_types
		var/selection = tgui_input_list(user, "Choose your character's egg type:", "Character Preference", vore_egg_types, pref.vore_egg_type)
		if(selection)
			pref.vore_egg_type = selection
			return TOPIC_REFRESH
<<<<<<< HEAD
	// CHOMPStation Add Start
=======
	// VOREStation Add Start
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs
	else if(href_list["autohiss"])
		var/list/autohiss_selection = list("Full", "Basic", "Off")
		var/selection = tgui_input_list(user, "Choose your default autohiss setting:", "Character Preference", autohiss_selection, pref.autohiss)
		if(selection)
			pref.autohiss = selection
		else if(!selection)
			pref.autohiss = "Full"
		return TOPIC_REFRESH
<<<<<<< HEAD
	// CHOMPStation Add End
	else
		return

// CHOMPStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#undef AUTOHISS_OFF
#undef AUTOHISS_BASIC
#undef AUTOHISS_FULL
// CHOMPStation Add End
=======
	// VOREStation Add End
	else
		return

// VOREStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#undef AUTOHISS_OFF
#undef AUTOHISS_BASIC
#undef AUTOHISS_FULL
// VOREStation Add End
>>>>>>> 657ee05f13... Merge pull request #14756 from Rykka-Stormheart/shep-dev-auto-lang-prefs
