/mob/living/simple_mob/vore/otie/zorgoia //Yes im basing the goias on oties for now, sue me....please dont sue me - Jack
	name = "zorgoia"
	desc = "It's a a reptilian mammal hybrid, known for its voracious nature and love for fruits. By more popular terms its refered to as the furry slinky!"
	tt_desc = "Zorgoyuh slinkus"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	icon_state = "zorgoia"
	icon_living = "zorgoia"
	icon_dead = "zorgoia-dead"
	faction = "zorgoia"
	maxHealth = 100
	health = 100
	melee_damage_lower = 5
	melee_damage_upper = 15 //Don't break my bones bro
	see_in_dark = 5
	attacktext = list("mauled")
	friendly = list("nuzzles", "noses softly at", "noseboops", "headbumps against", "nibbles affectionately on")
	meat_amount = 5

	color = null //color is selected when spawned

	max_buckled_mobs = 0 //No Yeehaw
	can_buckle = FALSE
	buckle_movable = FALSE

	say_list_type = /datum/say_list/zorgoia
	vore_active = 1
	vore_capacity = 3 //These bois can nom a bunch!
	vore_pounce_chance = 35	//More likely to nom
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

	// CHOMPAdd: Don't think its checked, but just in case
	species_sounds = "Canine"
	pain_emote_1p = list("yelp", "whine", "bark", "growl")
	pain_emote_3p = list("yelps", "whines", "barks", "growls")

/mob/living/simple_mob/vore/otie/zorgoia/New()
	..()
	switch(rand(9))
		if(0)
			color = "#1a00ff"
		if(1)
			color = "#6c5bff"
		if(2)
			color = "#ff00fe"
		if(3)
			color = "#ff0000"
		if(4)
			color = "#00d3ff"
		if(5)
			color = "#00ff7c"
		if(6)
			color = "#00ff35"
		if(7)
			color = "#e1ff00"
		if(8)
			color = "#ff9f00"
		if(9)
			color = "#393939"

/mob/living/simple_mob/vore/otie/zorgoia/feral //gets the pet2tame feature. starts out hostile tho so get gamblin'
	name = "agressive zorgoia"
	desc = "It's a a reptilian mammal hybrid, known for its voracious nature and love for fruits. By more popular terms its refered to as the furry slinky! This one seems quite hungry and in a bad mood!"
	faction = "virgo3b"
	tame_chance = 10 // Only a 1 in 10 chance of success. It's feral. What do you expect?
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

/mob/living/simple_mob/vore/otie/zorgoia/friendly //gets the pet2tame feature and doesn't kill you right away
	name = "friendly zorgoia"
	desc = "It's a a reptilian mammal hybrid, known for its voracious nature and love for fruits. By more popular terms its refered to as the furry slinky! This one seems harmless and friendly!"
	faction = "neutral"
	tamed = 1

/datum/say_list/zorgoia
	speak = list("Prurr.", "Murrr.")
	emote_hear = list("chuffs", "murrs", "churls", "hisses", "lets out a cougar like scream", "yawns")
	emote_see = list("licks their maw", "stretches", "yawns", "noodles")
	say_maybe_target = list("weh?")
	say_got_target = list("Rurrr!", "ROAR!", "RAH!")
