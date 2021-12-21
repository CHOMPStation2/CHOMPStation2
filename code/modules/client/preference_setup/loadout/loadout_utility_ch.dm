
/datum/gear/utility/news_ch
	display_name = "starcaster"
	path = /obj/item/device/starcaster_news
	cost = 0

/datum/gear/utility/implant/egg
	display_name = "Egg implant"
	path = /obj/item/weapon/implant/reagent_generator/egg
	cost = 0

/datum/gear/utility/implant/egg/New()
	..()
	var/list/implants = list()
	for(var/implant in typesof(/obj/item/weapon/implant/reagent_generator/egg))
		var/obj/item/weapon/implant/reagent_generator/egg/implant_type = implant
		implants[initial(implant_type.name)] = implant_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(implants))