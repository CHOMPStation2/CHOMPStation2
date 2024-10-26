/mob/living/simple_mob/animal/passive/dog/stray
	name = "dog"
	desc = "The most standard dog you have ever seen, it even smells like one."
	tt_desc = "Canis lupus familiaris"
	//faction = "mexico" //They are from Mexico. //Amusing but this prompts aggression from crew-aligned mobs.

	icon = 'modular_chomp/icons/turf/desert_tiles.dmi'
	icon_state = "dog"
	item_state = "dog"
	icon_living = "dog"
	icon_rest = "dog"
	icon_dead = "dog"

	health = 50
	maxHealth = 50

	mob_size = MOB_SMALL
	pass_flags = PASSTABLE
	can_pull_size = ITEMSIZE_TINY
	can_pull_mobs = MOB_PULL_NONE
	layer = MOB_LAYER
	density = 1
	movement_cooldown = 0.75 //roughly a bit faster than a person

	response_help  = "pets"
	response_disarm = "rolls aside"
	response_harm   = "stomps"

	melee_damage_lower = 5
	melee_damage_upper = 7
	attacktext = list("nips", "bumps", "scratches")

	vore_taste = "wet dog"

	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 523	//Above 80 Degrees Celcius
	heat_damage_per_tick = 3
	cold_damage_per_tick = 3

	meat_amount = 7
	holder_type = /obj/item/holder/armadillo
	ai_holder_type = /datum/ai_holder/simple_mob/armadillo

	speak_emote = list("rumbles", "chirr?", "churr")

	say_list_type = /datum/say_list/armadillo
