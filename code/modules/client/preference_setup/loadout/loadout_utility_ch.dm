
/datum/gear/utility/news_ch
	display_name = "starcaster"
	path = /obj/item/starcaster_news
	cost = 0

/datum/gear/utility/implant/egg
	display_name = "Egg implant"
	path = /obj/item/implant/reagent_generator/egg
	cost = 0

/datum/gear/utility/implant/egg/New()
	..()
	var/list/implants = list()
	for(var/implant in typesof(/obj/item/implant/reagent_generator/egg))
		var/obj/item/implant/reagent_generator/egg/implant_type = implant
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

/datum/gear/utility/accordion
	display_name = "Accordion"
	description = "It's the intrusment called an accordion"
	path = /obj/item/instrument/accordion
	cost = 3

/datum/gear/utility/banjo
	display_name = "Banjo"
	description = "It's the intrusment called a banjo"
	path = /obj/item/instrument/banjo
	cost = 3

/datum/gear/utility/eguitar
	display_name = "Electrical Guitar"
	description = "It's the intrusment called a electrical guitar"
	path = /obj/item/instrument/eguitar
	cost = 3

/datum/gear/utility/glockenspiel
	display_name = "Glockenspei"
	description = "It's the intrusment called a glockenspiel"
	path = /obj/item/instrument/glockenspiel
	cost = 3

/datum/gear/utility/guitar
	display_name = "Guitar"
	description = "A normal guitar"
	path = /obj/item/instrument/guitar
	cost = 3

/datum/gear/utility/harmonica
	display_name = "Harmonica"
	description = "Serenade folks with this lovely harmonica"
	path = /obj/item/instrument/harmonica
	cost = 3

/datum/gear/utility/keytar
	display_name = "Portable Keyboard"
	description = "Portable keyboard, whatever that is"
	path = /obj/item/instrument/keytar
	cost = 3

/datum/gear/utility/musicalmoth
	display_name = "Musical Moth"
	description = "A musical compaion, fun for the whole crew"
	path = /obj/item/instrument/musicalmoth
	cost = 4

/datum/gear/utility/recorder
	display_name = "Recorder"
	description = "Another lovely intrument to serenade the crew"
	path = /obj/item/instrument/recorder
	cost = 3

/datum/gear/utility/saxophone
	display_name = "Saxophone"
	description = "Another lovely intrument to serenade the crew"
	path = /obj/item/instrument/saxophone
	cost = 3

/datum/gear/utility/trombone
	display_name = "Trombone"
	description = "A trombone"
	path = /obj/item/instrument/trombone
	cost = 3

/datum/gear/utility/trumpet
	display_name = "Trumpet"
	description = "Another fancy instrument called a trumpet"
	path = /obj/item/instrument/trumpet
	cost = 3

/datum/gear/utility/violin
	display_name = "Space Violin"
	description = "A violin with a dash of space, somehow"
	path = /obj/item/instrument/violin
	cost = 3

/datum/gear/utility/xylophone
	display_name = "Xylophone"
	description = "A musical rainbow"
	path = /obj/item/instrument/xylophone
	cost = 3

/datum/gear/utility/piano_synth
	display_name = "Synthesizer"
	description = "Not a portable keyboard"
	path = /obj/item/instrument/piano_synth
	cost = 3

/datum/gear/utility/saddlebag_common/lightweight
	display_name = "saddle bag, common (Light)"
	path = /obj/item/storage/backpack/saddlebag_common/lightweight
	slot = slot_back
	cost = 2

/datum/gear/utility/saddlebag_common/robust/lightweight
	display_name = "saddle bag, robust (Light)"
	path = /obj/item/storage/backpack/saddlebag_common/robust/lightweight
	slot = slot_back
	cost = 2

/datum/gear/utility/saddlebag_common/vest/heavy
	display_name = "taur duty vest (backpack) (Heavy)"
	path = /obj/item/storage/backpack/saddlebag_common/vest/heavy
	slot = slot_back
	cost = 1
