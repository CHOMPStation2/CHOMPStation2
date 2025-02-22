/turf/simulated/floor/outdoors/grass/smokestar
	name = "strange moss"
	icon = 'modular_chomp/icons/turf/falseplanets.dmi'
	icon_state = "moss"
	can_dig = TRUE
/*unsure how needed this variable will need to be changed
	turf_layers = list(
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		)
*/
	grass_chance = 15

	animal_chance = 0.1

	animals = "smokestar"

	grass = "smokestar"


/obj/structure/flora/opalflowers
	name = "opal flower"
	icon = 'modular_chomp/icons/obj/strangeflora.dmi'
	icon_state = "opal"

	destroy_on_harvest = TRUE
	harvest_tool = /obj/item/material/knife
	randomize_harvest_count = TRUE
	harvest_loot = list(/obj/item/stack/material/void_opal = 1)

/obj/structure/flora/weepinggrass
	name = "strange grass"
	icon = 'modular_chomp/icons/obj/strangeflora.dmi'
	icon_state = "weep"

	destroy_on_harvest = TRUE
	harvest_tool = /obj/item/material/knife
	randomize_harvest_count = TRUE
	harvest_loot = list(/obj/item/stack/material/fiber = 1)
