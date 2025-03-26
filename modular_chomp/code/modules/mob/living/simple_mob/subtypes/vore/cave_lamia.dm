/mob/living/simple_mob/vore/lamia/albino/cave
	name = "albino cave lamia"
	desc = "Combination snake-human. This one looks ravenous!"
	melee_damage_lower = 5
	melee_damage_upper = 5
	vore_upper_transfer_chance = 75 // Since these lamias are on the hunt, you're getting pushed into the tail tum for fussing.
	vore_tail_transfer_chance = 10 // And the albino ones are EXTRA greedy!
	ai_holder_type = /datum/ai_holder/simple_mob/vore/stalker // Good enough for now.

/mob/living/simple_mob/vore/lamia/copper/cave
	name = "cave lamia"
	desc = "Combination snake-human. This one looks hungry!"
	melee_damage_lower = 5
	melee_damage_upper = 5
	vore_upper_transfer_chance = 75
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
