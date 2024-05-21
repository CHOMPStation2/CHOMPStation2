/mob/living/simple_mob/vore/aggressive/rat/event
	maxHealth = 50
	health = 50
	vore_pounce_chance = 10

	can_be_drop_prey = FALSE

/mob/living/simple_mob/vore/aggressive/rat/labrat
	name = "giant lab rat"
	desc = "In what passes for a hierarchy among lab rats, this one is a boss."
	icon_state = "labrat"
	icon_living = "labrat"
	icon_dead = "labrat-dead"
	icon_rest = "labrat_rest"
	faction = "neutral"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'

/mob/living/simple_mob/vore/aggressive/rat/labrat/genetics
	name = "Nibbles"
	desc = "A giant rat that made it's nest in an abandoned genetics lab. This one seems fairly docile."
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate

	vore_active = 1
	vore_capacity = 1
	vore_escape_chance = 20
	swallowTime = 25
	vore_bump_chance = 100
	faction_bump_vore = 1
	vore_standing_too = TRUE
	vore_pounce_chance = 75
	vore_pounce_maxhealth = 80
	vore_bump_emote = "knocks over and attempts to engulf"

	can_be_drop_prey = FALSE
	allow_mind_transfer = FALSE
