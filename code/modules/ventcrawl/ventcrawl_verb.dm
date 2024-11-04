/mob/living/proc/ventcrawl()
	set name = "Crawl through Vent"
	set desc = "Enter an air vent and crawl through the pipe system."
<<<<<<< HEAD
	set category = "Abilities.General" //CHOMPEdit
=======
	set category = "Abilities.General"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	var/pipe = start_ventcrawl()
	if(pipe)
		handle_ventcrawl()
