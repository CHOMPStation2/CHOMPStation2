// Mobs intended to be on Sif. As such, they won't die to the cold.
/mob/living/simple_mob/animal/sif
	minbodytemp = 175
	cold_resist = 0.75
	heat_resist = -0.5
	allow_mind_transfer = TRUE //CHOMPAdd

	tame_items = list(
	/obj/item/reagent_containers/food/snacks/crabmeat = 20, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/meat = 10 // CHOMPEdit - Removal of obj/item/weapon
	)

	can_be_drop_prey = FALSE //CHOMP Add
