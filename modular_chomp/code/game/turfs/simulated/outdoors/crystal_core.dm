/turf/simulated/floor/outdoors/crystal_planet
	name = "sand"
	desc = "Salty and gritty."
	icon = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	icon_edge = 'modular_chomp/icons/turf/outdoors_edge.dmi'
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15

/decl/flooring/crystal_core // Yeah don't use this one, it's a parent just for setting icon.
	name = "crystal stuff"
	desc = "If you see this, this turf is using the wrong decl."
	icon = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	icon_base = null

/turf/simulated/floor/outdoors/crystal_planet/purplesand
	name = "sand"
	desc = "Reflective and gritty."
	icon_state = "sand"
	edge_blending_priority = 2
	initial_flooring = /decl/flooring/crystal_core/purplesand

/decl/flooring/crystal_core/purplesand
	name = "crystal sand"
	desc = "Strange sand made of a reflective substance."
	icon_base = "sand"


/turf/simulated/floor/outdoors/crystal_planet/redsand
	name = "sand"
	desc = "Reflective and gritty."
	icon_state = "redsand"
	edge_blending_priority = 2
	initial_flooring = /decl/flooring/crystal_core/redsand

/decl/flooring/crystal_core/redsand
	name = "crystal sand"
	desc = "Strange sand made of a reflective substance."
	icon_base = "redsand"


/turf/simulated/floor/outdoors/crystal_planet/darksand
	name = "sand"
	desc = "Reflective and gritty."
	icon_state = "darksand"
	edge_blending_priority = 2
	initial_flooring = /decl/flooring/crystal_core/darksand

/decl/flooring/crystal_core/darksand
	name = "crystal sand"
	desc = "Strange sand made of a reflective substance."
	icon_base = "darksand"

/turf/simulated/mineral/purplecrystal
	name = "crystal rock"
	icon = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	sand_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	rock_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'

	icon_state = "crystallayerP"
	rock_side_icon_state = "crystallayerP_side"
	sand_icon_state = "sand" // to be replaced
	rock_icon_state = "crystallayerP"

	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15


/turf/simulated/mineral/redcrystal
	name = "crystal rock"
	icon = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	sand_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	rock_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'

	icon_state = "crystallayerR"
	rock_side_icon_state = "crystallayerR_side"
	sand_icon_state = "redsand"
	rock_icon_state = "crystallayerR"

	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15

/turf/simulated/mineral/darkcrystal
	name = "crystal rock"
	icon = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	sand_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'
	rock_icon_path = 'modular_chomp/icons/turf/crystal_tiles.dmi'

	icon_state = "crystallayerD"
	rock_side_icon_state = "crystallayerD_side"
	sand_icon_state = "darksand"
	rock_icon_state = "crystallayerD"

	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15


/turf/simulated/floor/water/warm
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15

/turf/simulated/floor/water/deep/warm
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15


/turf/simulated/floor/outdoors/grass/warm
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15

	animal_chance = 1

	animal_types = list(
		/mob/living/simple_mob/animal/passive/tindalos = 25,
		/mob/living/simple_mob/animal/passive/bird/azure_tit =25,
		/mob/living/simple_mob/animal/passive/bird/goldcrest = 25,
		/mob/living/simple_mob/animal/passive/bird/ringneck_dove = 25,
		/mob/living/simple_mob/animal/passive/lizard = 25,
		/mob/living/simple_mob/animal/crystalcore/mosquito/red = 1,
		/mob/living/simple_mob/animal/crystalcore/mosquito/blue = 1,
		/mob/living/simple_mob/animal/crystalcore/mosquito/yellow = 1,
		/mob/living/simple_mob/animal/crystalcore/mosquito/orange = 1,
		/mob/living/simple_mob/animal/crystalcore/mosquito/purple = 1,
		/mob/living/simple_mob/animal/crystalcore/mosquito/green = 1
		)

	grass_types = list(
		/obj/structure/flora/ausbushes/sparsegrass = 20,
		/obj/structure/flora/ausbushes/fullgrass = 20,
		/obj/structure/mob_spawner/scanner/mosquito = 5,
		/obj/structure/flora/ausbushes/leafybush = 20,
		/obj/structure/flora/ausbushes/ywflowers = 20,
		/obj/structure/flora/ausbushes/brflowers = 20,
		/obj/structure/flora/ausbushes/ppflowers = 20,
		/obj/structure/flora/pumpkin = 5,
		/obj/structure/flora/tree/palm = 20
		)

/turf/simulated/floor/beach/sand/warm
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15

/turf/simulated/floor/lava/warm
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = 303.15