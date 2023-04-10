
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

/datum/gear/utility/capture_crystal_crew
	display_name = "Capture Crystal (crew)"
	description = "A capture crystal already containing someone! (Item TF will need to be enabled for someone to join into this crystal)"
	path = /obj/item/capture_crystal/loadout
	cost = 2

/datum/gear/utility/capture_crystal_simplemob
	display_name = "Capture Crystal (pet)"
	description = "A capture crystal already containing a pet! (Item TF will need to be enabled for someone to join into this crystal)"
	path = /obj/item/capture_crystal/loadout
	cost = 2

/datum/gear/utility/capture_crystal_simplemob/New()
	..()
	var/list/mob_types = list(
		"mouse" = /mob/living/simple_mob/animal/passive/mouse,
		"rat" = /mob/living/simple_mob/animal/passive/mouse/rat,
		"dust jumper" = /mob/living/simple_mob/vore/alienanimals/dustjumper,
		"woof" = /mob/living/simple_mob/vore/woof,
		"corgi" = /mob/living/simple_mob/animal/passive/dog/corgi,
		"cat" = /mob/living/simple_mob/animal/passive/cat,
		"chicken" = /mob/living/simple_mob/animal/passive/chicken,
		"cow" = /mob/living/simple_mob/animal/passive/cow,
		"lizard" = /mob/living/simple_mob/animal/passive/lizard,
		"rabbit" = /mob/living/simple_mob/vore/rabbit,
		"fox" = /mob/living/simple_mob/animal/passive/fox,
		"fennec" = /mob/living/simple_mob/vore/fennec,
		"cute fennec" = /mob/living/simple_mob/animal/passive/fennec,
		"fennix" = /mob/living/simple_mob/vore/fennix,
		"red panda" = /mob/living/simple_mob/vore/redpanda,
		"opossum" = /mob/living/simple_mob/animal/passive/opossum,
		"horse" = /mob/living/simple_mob/vore/horse,
		"goose" = /mob/living/simple_mob/animal/space/goose,
		"sheep" = /mob/living/simple_mob/vore/sheep
	)
	gear_tweaks += new/datum/gear_tweak/simplemob_picker(mob_types)
