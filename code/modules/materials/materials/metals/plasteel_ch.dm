/datum/material/plasteel/generate_recipes()
	. = ..()
//	recipes += new /datum/stack_recipe("Hammer Head", /obj/item/hammer_head, 2) //CHOMPEdit - Disabled because I had to disable code/game/objects/items/weapons/material/sledgehammer_construction_ch.dm due to lots of errors
	recipes += new /datum/stack_recipe_list("sofas", list( \
		new /datum/stack_recipe("sofa middle", /obj/structure/bed/chair/sofa, 1, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("sofa left", /obj/structure/bed/chair/sofa/left, 1, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("sofa right", /obj/structure/bed/chair/sofa/right, 1, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("sofa corner", /obj/structure/bed/chair/sofa/corner, 1, one_per_turf = 1, on_floor = 1), \
		))
