/datum/mind
	var/vore_death = FALSE	// Was our last gasp a gurgle?
	var/show_in_directory
	var/directory_tag
	var/directory_erptag
	var/directory_ad
<<<<<<< HEAD
	//CHOMPEdit additions
	var/vantag_preference = VANTAG_NONE
	var/directory_gendertag
	var/directory_sexualitytag
=======
	var/vore_prey_eaten = 0
>>>>>>> 4378bb37ac... Merge pull request #14629 from Heroman3003/vore-goal

/mob/living/mind_initialize()
	. = ..()
	if (client?.prefs)
		mind.show_in_directory = client.prefs.show_in_directory
		mind.directory_tag = client.prefs.directory_tag
		mind.directory_erptag = client.prefs.directory_erptag
		mind.directory_ad = client.prefs.directory_ad
		 //CHOMPEdit additions
		mind.vantag_preference = client.prefs.vantag_preference
		mind.directory_gendertag = client.prefs.directory_gendertag
		mind.directory_sexualitytag = client.prefs.directory_sexualitytag
