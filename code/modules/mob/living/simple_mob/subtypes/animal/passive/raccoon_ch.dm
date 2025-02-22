//raccoon
/mob/living/simple_mob/animal/passive/raccoon_ch
	name = "raccoon"
	desc = "A raccoon, also known as a trash panda."
	tt_desc = "E purgamentum raccoonus"
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "raccoon"
	item_state = "raccoon"
	icon_living = "raccoon"
	icon_dead = "raccoon_dead"
	icon_rest = "raccoon_rest"

	ai_holder_type = /datum/ai_holder/simple_mob/passive/raccoon_ch
	say_list_type = /datum/say_list/raccoon_ch

	see_in_dark = 6
	movement_cooldown = 3

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	has_hands = TRUE

	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celsius
	maxbodytemp = 323	//Above 50 Degrees Celsius

	meat_amount = 1
	meat_type = /obj/item/reagent_containers/food/snacks/meat

	vore_active = TRUE
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	center_offset = 0

	species_sounds = "Raccoon"
	pain_emote_1p = list("chitter")
	pain_emote_3p = list("chitters")

/mob/living/simple_mob/animal/passive/raccoon_ch/Initialize()
	. = ..()
	ghostjoin = 1
	ghostjoin_icon()
	active_ghost_pods |= src

/mob/living/simple_mob/animal/passive/raccoon_ch/Destroy()
	active_ghost_pods -= src
	return ..()

/datum/say_list/raccoon_ch
	speak = list("HSSSSS")
	emote_see = list("shakes their head", "shivers","grooms self", "nibbles on some trash")
	emote_hear = list("purrs")

/datum/ai_holder/simple_mob/passive/raccoon_ch
	flee_when_dying = TRUE
	dying_threshold = 0.9
	speak_chance = 1
