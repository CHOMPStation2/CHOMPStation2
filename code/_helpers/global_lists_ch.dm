
//Reagent Vore belly Sounds
var/global/list/vore_reagent_sounds = list(
		'sound/vore/walkslosh1.ogg',
		'sound/vore/walkslosh2.ogg',
		'sound/vore/walkslosh3.ogg',
		'sound/vore/walkslosh4.ogg',
		'sound/vore/walkslosh5.ogg',
		'sound/vore/walkslosh6.ogg',
		'sound/vore/walkslosh7.ogg',
		'sound/vore/walkslosh8.ogg',
		'sound/vore/walkslosh9.ogg',
		'sound/vore/walkslosh10.ogg',
		"None" = null)

/var/global/list/existing_metroids = list() //Global variable for tracking metroids for the event announcement. Needs to go here for load order.

//stuff that only synths can eat
var/global/list/edible_tech = list(/obj/item/weapon/cell,
				/obj/item/weapon/circuitboard,
				/obj/item/integrated_circuit,
				/obj/item/broken_device,
				/obj/item/brokenbug,
				)
