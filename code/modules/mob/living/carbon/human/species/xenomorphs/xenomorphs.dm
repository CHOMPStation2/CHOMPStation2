/proc/create_new_xenomorph(var/alien_caste,var/target)

	target = get_turf(target)
	if(!target || !alien_caste) return

	var/mob/living/carbon/human/new_alien = new(target)
	new_alien.set_species("Genaprawn [alien_caste]") //CHOMPedit
	return new_alien

/mob/living/carbon/human/xdrone/New(var/new_loc)
	h_style = "Bald"
	faction = "xeno"
	..(new_loc, SPECIES_GENA_DRONE) //CHOMPedit

/mob/living/carbon/human/xsentinel/New(var/new_loc)
	h_style = "Bald"
	faction = "xeno"
	..(new_loc, SPECIES_GENA_SENTINEL) //CHOMPedit

/mob/living/carbon/human/xhunter/New(var/new_loc)
	h_style = "Bald"
	faction = "xeno"
	..(new_loc, SPECIES_GENA_HUNTER) //CHOMPedit

/mob/living/carbon/human/xqueen/New(var/new_loc)
	h_style = "Bald"
	faction = "xeno"
<<<<<<< HEAD
	..(new_loc, SPECIES_GENA_QUEEN) //CHOMPedit

//CHOMPedit. Removed AddInfectionImages code, due to it being commented out and not used

||||||| parent of eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul
	..(new_loc, SPECIES_XENO_QUEEN)

// I feel like we should generalize/condense down all the various icon-rendering antag procs.
/*----------------------------------------
Proc: AddInfectionImages()
Des: Gives the client of the alien an image on each infected mob.
----------------------------------------*/
/*
/mob/living/carbon/human/proc/AddInfectionImages()
	if (client)
		for (var/mob/living/C in mob_list)
			if(C.status_flags & XENO_HOST)
				var/obj/item/alien_embryo/A = locate() in C
				var/I = image('icons/mob/alien.dmi', loc = C, icon_state = "infected[A.stage]")
				client.images += I
	return
*/
/*----------------------------------------
Proc: RemoveInfectionImages()
Des: Removes all infected images from the alien.
----------------------------------------*/
/*
/mob/living/carbon/human/proc/RemoveInfectionImages()
	if (client)
		for(var/image/I in client.images)
			if(dd_hasprefix_case(I.icon_state, "infected"))
				qdel(I)
	return
*/
=======
	..(new_loc, SPECIES_XENO_QUEEN)

//Removed AddInfectionImages, no longer required.
>>>>>>> eb76662be1... Merge pull request #11112 from MisterGrimm/XenomorphOverhaul
