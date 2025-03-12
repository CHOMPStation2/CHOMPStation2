
/turf/simulated/floor/outdoors/grass
	name = "grass"
	icon_state = "grass0"
	edge_blending_priority = 4
	initial_flooring = /decl/flooring/grass/outdoors // VOREStation Edit
	can_dig = TRUE
	/*turf_layers = list( CHOMP Removal Begin
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		)CHOMP Removal End*/
	var/grass_chance = 12

	var/animal_chance = 1

	// Weighted spawn list.
	/*var/list/animal_types = list( CHOMP Removal begin
		/mob/living/simple_mob/animal/passive/tindalos = 1
		)

	var/list/grass_types = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass
		) CHOMP Removal End */

/datum/category_item/catalogue/flora/sif_grass
	name = "Sivian Flora - Moss"
	desc = "A natural moss that has adapted to the sheer cold climate of Sif. \
	The moss came to rely partially on bioluminescent bacteria provided by the local tree populations. \
	As such, the moss often grows in large clusters in the denser forests of Sif. \
	The moss has evolved into it's distinctive blue hue thanks to it's reliance on bacteria that has a similar color."
	value = CATALOGUER_REWARD_TRIVIAL

//This controls how many trees and grass will spawn on this turf type
/turf/simulated/floor/outdoors/grass/sif
	name = "growth"
	icon_state = "grass_sif0"
	initial_flooring = /decl/flooring/grass/sif
	edge_blending_priority = 3 // CHOMPedit
	grass_chance = 5
	var/tree_chance = 0.7 //CHOMPedit


	animal_chance = 0.25 //CHOMPedit
	/* CHOMP Removal Begin
	animal_types = list(
		/mob/living/simple_mob/animal/sif/diyaab = 7,
		/mob/living/simple_mob/animal/sif/glitterfly = 2,
		/mob/living/simple_mob/animal/sif/duck = 2,
		/mob/living/simple_mob/animal/sif/shantak/retaliate = 2,
		/mob/living/simple_mob/animal/passive/gaslamp/snow = 1,
		/obj/random/mob/multiple/sifmobs = 1
		)

	grass_types = list(
		/obj/structure/flora/sif/eyes = 1,
		/obj/structure/flora/sif/tendrils = 10
		)
	CHOMP Removal End*/
	catalogue_data = list(/datum/category_item/catalogue/flora/sif_grass)
	catalogue_delay = 2 SECONDS

/turf/simulated/floor/outdoors/grass/sif/Initialize(mapload)
	if(tree_chance && prob(tree_chance) && !check_density())
		new /obj/structure/flora/tree/sif(src)
	. = ..()

/turf/simulated/floor/outdoors/grass/Initialize(mapload)
	if(grass && grass_chance && prob(grass_chance) && !check_density()) //CHOMPEdit
		var/grass_type = pickweight(GLOB.grass_grass[grass]) //CHOMPEdit
		if(grass_type) //ChompEDIT - runtime
			new grass_type(src)

	if(animals && animal_chance && prob(animal_chance) && !check_density()) //CHOMPEdit
		var/animal_type = pickweight(GLOB.grass_animals[animals]) //CHOMPEdit
		if(animal_type) //ChompEDIT - runtime
			new animal_type(src)

	. = ..()

/turf/simulated/floor/outdoors/grass/forest
	name = "thick grass"
	icon_state = "grass-dark0"
	grass_chance = 50
	//tree_chance = 20
	edge_blending_priority = 5
	initial_flooring = /decl/flooring/grass/outdoors/forest // VOREStation Edit

/turf/simulated/floor/outdoors/grass/sif/forest
	name = "thick growth"
	icon_state = "grass_sif_dark0"
	initial_flooring = /decl/flooring/grass/sif/forest
	edge_blending_priority = 5
	tree_chance = 4
	grass_chance = 1

	grass = "sifforest"

//CHOMPedit: animal spawning for sif rocks. This probably doesn't belong in grass.dm but it's where there other Sif spawns are, sue me.
/turf/simulated/floor/outdoors/rocks/sif
	var/animal_chance = 0.3 //Should spawn around... 0-7 per round? Tweak as needed.

/turf/simulated/floor/outdoors/rocks/sif/Initialize(mapload)
	if(animal_chance && prob(animal_chance) && !check_density())
		new /mob/living/simple_mob/vore/slug(src)

	. = ..()
//CHOMPedit end

/turf/simulated/floor/outdoors/grass/sif/attackby(obj/item/C, mob/user)//CHOMPedit begin, other tiles have ways to build on them, sif grass doesnt. So I put this snowflake on just sif grass
	if(istype(C, /obj/item/stack/tile/floor))
		var/obj/item/stack/tile/floor/S = C
		if (S.get_amount() < 1)
			return
		playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
		ChangeTurf(/turf/simulated/floor)
		S.use(1)
		return
	. = ..()
//CHOMPedit end
