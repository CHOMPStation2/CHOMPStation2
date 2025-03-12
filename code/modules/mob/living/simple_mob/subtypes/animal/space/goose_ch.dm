/mob/living/simple_mob/animal/space/goose/domesticated
	name = "domesticated goose"
	desc = "It's a domesticated goose. It still looks pretty angry."
	faction = "neutral" //Mess with this and the goose will eat anyones face, will eat other factions faces, appropiate considering its a hellbird - Jack

	can_be_drop_prey = TRUE //CHOMP Add

/mob/living/simple_mob/animal/space/goose/domesticated/casino
	name = "Donella"
	desc = "It's a golden goose named Donella, she is a beloved treasure of the golden goose casino, nobody knows where she comes from."
	icon_state = "golden_goose"
	icon_living = "golden_goose"
	icon_dead = "golden_goose_dead"
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'

	faction = "neutral" //Mess with this and the goose will eat anyones face, will eat other factions faces, appropiate considering its a hellbird - Jack

	maxHealth = 75
	health = 75

	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 10
