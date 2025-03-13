/datum/material/plastic/generate_recipes()
	. = ..()

	recipes += list(
		new /datum/stack_recipe("Feeder", /obj/machinery/feeder, 4, time = 20, one_per_turf = 1, on_floor = 1, recycle_material = "[name]"),
	)
	recipes += new/datum/stack_recipe_list("sofas", list( \
		new /datum/stack_recipe("sofa middle", /obj/structure/bed/chair/sofa, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new /datum/stack_recipe("sofa left", /obj/structure/bed/chair/sofa/left, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new /datum/stack_recipe("sofa right", /obj/structure/bed/chair/sofa/right, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new /datum/stack_recipe("sofa corner", /obj/structure/bed/chair/sofa/corner, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
	))
