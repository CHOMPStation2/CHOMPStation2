/*
 * Donut Box
 */

var/list/random_weighted_donuts = list(
	/obj/item/reagent_containers/food/snacks/donut/plain = 5, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/plain/jelly = 5, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/pink = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/pink/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/purple = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/purple/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/green = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/green/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/beige = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/beige/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/choc = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/choc/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/blue = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/blue/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/yellow = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/yellow/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/olive = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/olive/jelly = 4, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/homer = 3, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/homer/jelly = 3, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/choc_sprinkles = 3, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/choc_sprinkles/jelly = 3, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/donut/chaos = 1 // CHOMPEdit - Removal of obj/item/weapon
)

/obj/item/storage/box/donut // CHOMPEdit - Removal of obj/item/weapon
	icon = 'icons/obj/food_donuts.dmi'
	icon_state = "donutbox"
	name = "donut box"
	desc = "A box that holds tasty donuts, if you're lucky."
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 9 //CHOMPEdit
	max_storage_space = ITEMSIZE_COST_SMALL * 6
	can_hold = list(/obj/item/reagent_containers/food/snacks/donut) // CHOMPEdit - Removal of obj/item/weapon
	foldable = /obj/item/stack/material/cardboard
	//starts_with = list(/obj/item/reagent_containers/food/snacks/donut/normal = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/donut/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	if(!empty)
		for(var/i in 1 to 6)
			var/type_to_spawn = pickweight(random_weighted_donuts)
			new type_to_spawn(src)
	. = ..()
	update_icon()

/obj/item/storage/box/donut/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	var/x_offset = 0
	for(var/obj/item/reagent_containers/food/snacks/donut/D in contents) // CHOMPEdit - Removal of obj/item/weapon
		var/mutable_appearance/ma = mutable_appearance(icon = icon, icon_state = D.overlay_state)
		ma.pixel_x = x_offset
		add_overlay(ma)
		x_offset += 3

/obj/item/storage/box/donut/empty // CHOMPEdit - Removal of obj/item/weapon
	empty = TRUE

/obj/item/storage/box/wormcan // CHOMPEdit - Removal of obj/item/weapon
	icon = 'icons/obj/food.dmi'
	icon_state = "wormcan"
	name = "can of worms"
	desc = "You probably do want to open this can of worms."
	max_storage_space = ITEMSIZE_COST_TINY * 6
	can_hold = list(
		/obj/item/reagent_containers/food/snacks/wormsickly, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/worm, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/wormdeluxe // CHOMPEdit - Removal of obj/item/weapon
	)
	starts_with = list(/obj/item/reagent_containers/food/snacks/worm = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/wormcan/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	update_icon()

/obj/item/storage/box/wormcan/update_icon(var/itemremoved = 0) // CHOMPEdit - Removal of obj/item/weapon
	if (contents.len == 0)
		icon_state = "wormcan_empty"

/obj/item/storage/box/wormcan/sickly // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "wormcan_sickly"
	name = "can of sickly worms"
	desc = "You probably don't want to open this can of worms."
	max_storage_space = ITEMSIZE_COST_TINY * 6
	starts_with = list(/obj/item/reagent_containers/food/snacks/wormsickly = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/wormcan/sickly/update_icon(var/itemremoved = 0) // CHOMPEdit - Removal of obj/item/weapon
	if (contents.len == 0)
		icon_state = "wormcan_empty_sickly"

/obj/item/storage/box/wormcan/deluxe // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "wormcan_deluxe"
	name = "can of deluxe worms"
	desc = "You absolutely want to open this can of worms."
	max_storage_space = ITEMSIZE_COST_TINY * 6
	starts_with = list(/obj/item/reagent_containers/food/snacks/wormdeluxe = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/wormcan/deluxe/update_icon(var/itemremoved = 0) // CHOMPEdit - Removal of obj/item/weapon
	if (contents.len == 0)
		icon_state = "wormcan_empty_deluxe"
