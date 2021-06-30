/mob/living/carbon/alien/larva/Stat() //CHOMPedit. Oh thank god we can see how close we are to full grown now
	. = ..()
	if(. && statpanel("Status"))
		stat("Growth", "[round(amount_grown)]/[max_grown]")

/mob/living/carbon/alien/larva/confirm_evolution()

	to_chat(src, "<span class='notice'><b>You are growing into a beautiful alien! It is time to choose a caste.</b></span>")
	to_chat(src, "<span class='notice'>There are three to choose from:</span>")
	to_chat(src, "<B>Hunters</B> <span class='notice'> are strong and agile, able to hunt away from the hive and rapidly move through ventilation shafts. Hunters generate plasma slowly and have low reserves.</span>")
	to_chat(src, "<B>Sentinels</B> <span class='notice'> are tasked with protecting the hive and are deadly up close and at a range. They are not as physically imposing nor fast as the hunters.</span>")
<<<<<<< HEAD
	to_chat(src, "<B>Drones</B> <span class='notice'> are the working class, offering the largest plasma storage and generation. They are the only caste which may evolve again, turning into the dreaded Genaprawn queen.</span>") //CHOMPedit
	var/alien_caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")
	return alien_caste ? "Genaprawn [alien_caste]" : null //CHOMPedit
||||||| parent of f9e9aafd1d... Merge pull request #10756 from VOREStation/Arokha/fixes2
	to_chat(src, "<B>Drones</B> <span class='notice'> are the working class, offering the largest plasma storage and generation. They are the only caste which may evolve again, turning into the dreaded alien queen.</span>")
	var/alien_caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")
	return alien_caste ? "Xenomorph [alien_caste]" : null
=======
	to_chat(src, "<B>Drones</B> <span class='notice'> are the working class, offering the largest plasma storage and generation. They are the only caste which may evolve again, turning into the dreaded alien queen.</span>")
	var/alien_caste = tgui_alert(src, "Please choose which alien caste you shall belong to.","Alien Choice",list("Hunter","Sentinel","Drone"))
	return alien_caste ? "Xenomorph [alien_caste]" : null
>>>>>>> f9e9aafd1d... Merge pull request #10756 from VOREStation/Arokha/fixes2

/mob/living/carbon/alien/larva/show_evolution_blurb()
	return
