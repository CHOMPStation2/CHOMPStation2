/obj/item/reagent_containers/food/snacks/grown/sif // CHOMPEdit - Removal of obj/item/weapon
	var/seeds = 0

/obj/item/reagent_containers/food/snacks/grown/sif/Initialize(mapload, planttype) // Wild Sifplants have some seeds you can extract with a knife. // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	seeds = rand(1, 2)

/obj/item/reagent_containers/food/snacks/grown/sif/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(seeds)
		to_chat(user, SPAN_NOTICE("You can see [seeds] seed\s in \the [src]. You might be able to extract them with a sharp object."))

/obj/item/reagent_containers/food/snacks/grown/sif/attackby(var/obj/item/W, var/mob/living/user) // CHOMPEdit - Removal of obj/item/weapon
	if(seed && W.sharp && seeds > 0)
		var/take_seeds = min(seeds, rand(1,2))
		seeds -= take_seeds
		to_chat(user, SPAN_NOTICE("You stick \the [W] into \the [src] and lever out [take_seeds] seed\s."))
		for(var/i = 1 to take_seeds)
			new /obj/item/seeds(get_turf(src), seed.name)
		return
	. = ..()

/obj/item/reagent_containers/food/snacks/grown/sif/sifpod // CHOMPEdit - Removal of obj/item/weapon
	plantname = "sifbulb"

/obj/item/reagent_containers/food/snacks/grown/sif/wabback // CHOMPEdit - Removal of obj/item/weapon
	plantname = "wabback"

/obj/item/reagent_containers/food/snacks/grown/sif/blackwabback // CHOMPEdit - Removal of obj/item/weapon
	plantname = "blackwabback"

/obj/item/reagent_containers/food/snacks/grown/sif/wildwabback // CHOMPEdit - Removal of obj/item/weapon
	plantname = "wildwabback"

/obj/item/reagent_containers/food/snacks/grown/sif/eyebulbs // CHOMPEdit - Removal of obj/item/weapon
	plantname = "eyebulbs"

/obj/item/reagent_containers/food/snacks/grown/sif/cavebulbs // CHOMPEdit - Removal of obj/item/weapon
	plantname = "cavebulbs"
