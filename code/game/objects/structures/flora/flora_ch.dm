/* CHOMPStation-specific flora for usage with custom stations, away missions, etc.
 *
 * Contains:
 *		Jungle Flor
 *		TBD
 *
 * Files sourced from tiles_types_vr.dm
 */
 
 
///////////////////////Torris Flora///////////////////////

/turf/unsimulated/denseflora //Jungle Walls WIP
	name = "impassable growth"
	desc = "A thick bunch of trees, shrubs, and other flora that is too dense to cut through."
	icon = 'icons/turf/walls_torris.dmi'
	icon_state = "denseflora"
	density = 1

/obj/structure/flora/torris
	icon = 'icons/obj/flora/torrisflora.dmi'

/obj/structure/flora/torris/stones
	name = "rocks"
	desc = "A bunch of dusty rocks."
	icon_state = "junglestones"

/obj/structure/flora/torris/stones/Initialize()
	icon_state = "[initial(icon_state)][rand(1,3)]"
	. = ..()

/obj/structure/flora/torris/tallgrass
	name = "tall grass"
	desc = "A patch of taller grass."
	icon_state = "tallgrass"

/obj/structure/flora/torris/tallgrass/Initialize()
	icon_state = "[initial(icon_state)][rand(1,10)]"
	. = ..()

/datum/category_item/catalogue/flora/torris/nyrian
	name = "Torris Flora - Nyrian Bloom"
	desc = "*error* _datanotfound: please try again." //WIP
	value = CATALOGUER_REWARD_EASY

/obj/structure/flora/torris/nyrian
	name = "pink flower"
	desc = "An odd looking flower bloom that has a slight haze of pollen surrounding it. It smells very strange."
	icon_state = "Nyrian_Bloom"
	catalogue_data = list(/datum/category_item/catalogue/flora/torris/nyrian)

/obj/structure/flora/torris/nyrian/Initialize()
	icon_state = "[initial(icon_state)][rand(1,2)]"
	. = ..()

/datum/category_item/catalogue/flora/torris/rafflesia
	name = "Torris Flora - Rafflesia"
	desc = "*error* _datanotfound: please try again." //WIP
	value = CATALOGUER_REWARD_EASY

/obj/structure/flora/torris/rafflesia
	name = "strange flower"
	desc = "A huge bright red flower that has an absolutely horrid smell when you draw near."
	icon_state = "Rafflesia"
	catalogue_data = list(/datum/category_item/catalogue/flora/torris/rafflesia)
	
/datum/category_item/catalogue/flora/torris/twilight
	name = "Torris Flora - Twilight Cress"
	desc = "*error* _datanotfound: please try again." //WIP
	value = CATALOGUER_REWARD_EASY

/obj/structure/flora/torris/twilight
	name = "fluorescent stalks"
	desc = "Some short, fluorescent stalks that seem to sparkle gently in the light - as if they're reflective."
	icon_state = "Twilight_Cress"
	catalogue_data = list(/datum/category_item/catalogue/flora/torris/twilight)

/obj/structure/flora/torris/twilight/Initialize()
	icon_state = "[initial(icon_state)][rand(1,3)]"
	. = ..()

/datum/category_item/catalogue/flora/torris/deadnettle
	name = "Torris Flora - Sour Deadnettle"
	desc = "*error* _datanotfound: please try again." //WIP
	value = CATALOGUER_REWARD_EASY

/obj/structure/flora/torris/deadnettle
	name = "mishaped stalks"
	desc = "Some tall stalks that seem to attract a lot of bees and other bugs."
	icon_state = "Sour_Deadnettle"
	catalogue_data = list(/datum/category_item/catalogue/flora/torris/deadnettle)

/obj/structure/flora/torris/deadnettle/Initialize()
	icon_state = "[initial(icon_state)][rand(1,2)]"
	. = ..()