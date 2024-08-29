//I don't know how to add more material currently so uhhh, that will be for late, did have some halffinished un commented code but that seemed to be causing issues?
/mob/living/simple_mob/vore/bigdragon
	meat_type = /obj/item/reagent_containers/food/snacks/dragonmeat // CHOMPEdit - Removal of obj/item/weapon

/mob/living/simple_mob/vore/aggressive/dragon/virgo3b //phoron dragon
	meat_type = /obj/item/reagent_containers/food/snacks/phorondragonmeat // CHOMPEdit - Removal of obj/item/weapon

/mob/living/simple_mob/vore/aggressive/deathclaw
	meat_type = /obj/item/reagent_containers/food/snacks/deathclawmeat // CHOMPEdit - Removal of obj/item/weapon

/mob/living/simple_mob/metroid
	meat_amount = 6
	meat_type = /obj/item/reagent_containers/food/snacks/metroidmeat // CHOMPEdit - Removal of obj/item/weapon

/mob/living/simple_mob/metroid/can_butcher(var/mob/user, var/obj/item/I)	// Override for special butchering checks.
	. = ..()

	if(. && (!is_sharp(I) || !has_edge(I)))
		return FALSE
