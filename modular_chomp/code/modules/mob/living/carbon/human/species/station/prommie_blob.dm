/mob/living/simple_mob/slime/promethean/character_directory_species()
	if (humanform)
		return "[humanform.custom_species ? humanform.custom_species : (humanform.species ? humanform.species.name : "Promethean Blob")]"
	return "Promethean Blob"
