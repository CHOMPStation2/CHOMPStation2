//In future consider cleaning up often used recipes by adding them to the general recipe list with material criteria

/material/plasteel/generate_recipes()
	. = ..()
	recipes += new/datum/stack_recipe("Hammer Head", /obj/item/weapon/hammer_head, 2)
	recipes += new/datum/stack_recipe_list("sofas", list( \
		new/datum/stack_recipe("sofa middle", /obj/structure/bed/chair/sofa, 1, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("sofa left", /obj/structure/bed/chair/sofa/left, 1, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("sofa right", /obj/structure/bed/chair/sofa/right, 1, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("sofa corner", /obj/structure/bed/chair/sofa/corner, 1, one_per_turf = 1, on_floor = 1), \
		))
		
/material/plastic/generate_recipes()
	. = ..()
	recipes += new/datum/stack_recipe_list("sofas", list( \
		new/datum/stack_recipe("sofa middle", /obj/structure/bed/chair/sofa, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa left", /obj/structure/bed/chair/sofa/left, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa right", /obj/structure/bed/chair/sofa/right, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa corner", /obj/structure/bed/chair/sofa/corner, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		))

/material/wood/generate_recipes() //Is a little sad we cant have lovely wooden sofa
	. = ..()
	recipes += new/datum/stack_recipe_list("sofas", list( \
		new/datum/stack_recipe("sofa middle", /obj/structure/bed/chair/sofa, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa left", /obj/structure/bed/chair/sofa/left, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa right", /obj/structure/bed/chair/sofa/right, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		new/datum/stack_recipe("sofa corner", /obj/structure/bed/chair/sofa/corner, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]"), \
		))