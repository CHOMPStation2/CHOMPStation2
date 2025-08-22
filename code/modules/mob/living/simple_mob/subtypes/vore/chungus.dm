/datum/category_item/catalogue/fauna/chungus
	name = "Creature - Chungus"
	desc = "A massive chungus."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/vore/aggressive/chungus
	name = "Big Chungus"
	desc = "There is a chungus among us."
	tt_desc = "biggamus chungamus"

	icon_state = "chungus"
	icon_living = "chungus"
	icon_dead = "chungus-dead"
	icon_rest = "chungus_rest"
<<<<<<< HEAD
	faction = "mouse"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
=======
	faction = FACTION_MOUSE
	icon = 'icons/mob/vore64x32.dmi'
>>>>>>> 6f1d6c524d (Simple mob port [IDB IGNORE] (#18236))

	maxHealth = 200
	health = 200

	melee_damage_lower = 8
	melee_damage_upper = 16
	grab_resist = 100
	see_in_dark = 8
	movement_shake_radius = 7

	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("ravaged")
	friendly = list("nuzzles", "licks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	vore_active = TRUE
	vore_capacity = 1
	vore_pounce_chance = 45
	vore_icons = SA_ICON_LIVING | SA_ICON_REST


	say_list_type = /datum/say_list/chungus
	ai_holder_type = /datum/ai_holder/simple_mob/melee
<<<<<<< HEAD
	can_be_drop_prey = FALSE //CHOMP Add
=======
	can_be_drop_prey = FALSE
>>>>>>> 6f1d6c524d (Simple mob port [IDB IGNORE] (#18236))

/mob/living/simple_mob/vore/aggressive/chungus/death()
	var/death = list('sound/effects/mob_effects/m_scream_1.ogg','sound/effects/mob_effects/m_scream_2.ogg','sound/effects/mob_effects/m_scream_3.ogg','sound/effects/mob_effects/m_scream_4.ogg')
	playsound(src, death, 50, 1)
	..()


/datum/say_list/chungus
	speak = list("Eenhhhhhhh...","What's up, doc?","Wabbit season?")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")
	say_maybe_target = list("Wabbit season?")
	say_got_target = list("DUCK SEASON!")
