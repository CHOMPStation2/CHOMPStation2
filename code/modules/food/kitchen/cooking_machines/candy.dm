/obj/machinery/appliance/mixer/candy
	name = "candy machine"
	desc = "Get yer candied cheese wheels here!"
	icon_state = "mixer_off"
	off_icon = "mixer_off"
	on_icon = "mixer_on"
	cook_type = "candied"
	appliancetype = CANDYMAKER
	var/datum/looping_sound/candymaker/candymaker_loop
	circuit = /obj/item/circuitboard/candymachine // CHOMPEdit - Removal of obj/item/weapon
	cooking_coeff = 1.0 // Original Value 0.6

	output_options = list(
		"Jawbreaker" = /obj/item/reagent_containers/food/snacks/variable/jawbreaker, // CHOMPEdit - Removal of obj/item/weapon
		"Candy Bar" = /obj/item/reagent_containers/food/snacks/variable/candybar, // CHOMPEdit - Removal of obj/item/weapon
		"Sucker" = /obj/item/reagent_containers/food/snacks/variable/sucker, // CHOMPEdit - Removal of obj/item/weapon
		"Jelly" = /obj/item/reagent_containers/food/snacks/variable/jelly // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/machinery/appliance/mixer/candy/Initialize()
	. = ..()

	candymaker_loop = new(list(src), FALSE)

/obj/machinery/appliance/mixer/candy/Destroy()
	. = ..()

	QDEL_NULL(candymaker_loop)

/obj/machinery/appliance/mixer/candy/update_icon()
	. = ..()

	if(!stat)
		icon_state = on_icon
		if(candymaker_loop)
			candymaker_loop.start(src)
	else
		icon_state = off_icon
		if(candymaker_loop)
			candymaker_loop.stop(src)

/obj/machinery/appliance/mixer/candy/change_product_appearance(var/obj/item/reagent_containers/food/snacks/product) // CHOMPEdit - Removal of obj/item/weapon
	food_color = get_random_colour(1)
	. = ..()


/obj/machinery/appliance/mixer/candy/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(default_deconstruction_screwdriver(user, O)) //CHOMPedit - Allows for deconstruction
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return
	..()