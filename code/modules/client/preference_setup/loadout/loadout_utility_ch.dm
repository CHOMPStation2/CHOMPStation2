
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

/datum/gear/utility/protector
	display_name = "Protector Energy Gun"
	description = "The WT-98a 'Protector' is a common sidearm developed by Ward-Takahashi GMC. It features a powerful stun mode, and \
					an alert-level-locked lethal mode, only usable when the connected jurisdiction allows. It also features an integrated flashlight!"
	path = /obj/item/weapon/gun/energy/gun/protector/loadout
	cost = 5