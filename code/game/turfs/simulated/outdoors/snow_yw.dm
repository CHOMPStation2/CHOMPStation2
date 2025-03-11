/turf/simulated/floor/plating/snow/plating
	name = "frozen plating"
	icon_state = "snowyplating"
	icon = 'icons/turf/snow_new.dmi'
/turf/simulated/floor/snow
	name = "heavy snow"
	icon_state = "snow"
/turf/simulated/floor/snow/snow2
	name = "snow"
	icon_state = "snownew"

/turf/simulated/floor/snow/gravsnow
	name = "Gravel"
	icon_state = "gravsnow"


//Used in cataloguing flora for Borealis.
/*
/datum/category_item/catalogue/flora/
	name = "Borealis Flora - snow"
	desc = "A natural moss that has adapted to the sheer cold climate of Sif. \
	The moss came to rely partially on bioluminescent bacteria provided by the local tree populations. \
	As such, the moss often grows in large clusters in the denser forests of Sif. \
	The moss has evolved into it's distinctive blue hue thanks to it's reliance on bacteria that has a similar color."
	value = CATALOGUER_REWARD_TRIVIAL

/turf/simulated/floor/outdoors/grass/sif
	name = "growth"
	icon_state = "grass_sif"
	edge_blending_priority = 4
	grass_chance = 5
	var/tree_chance = 2

	grass_types = list(
		/obj/structure/flora/sif/eyes = 1,
		/obj/structure/flora/sif/tendrils = 10
		)

	catalogue_data = list(/datum/category_item/catalogue/flora/sif_grass)
	catalogue_delay = 2 SECONDS

/turf/simulated/floor/outdoors/grass/sif/Initialize(mapload)
	if(tree_chance && prob(tree_chance) && !check_density())
		new /obj/structure/flora/tree/sif(src)
	. = ..()

/turf/simulated/floor/outdoors/grass/Initialize(mapload)
	if(prob(50))
		icon_state = "[initial(icon_state)]2"
		//edge_blending_priority++

	if(grass_chance && prob(grass_chance) && !check_density())
		var/grass_type = pickweight(grass_types)
		new grass_type(src)
	. = ..()
*/
