// "Useful" items - I'm guessing things that might be used at work?
/datum/gear/utility
	display_name = "briefcase"
	path = /obj/item/storage/briefcase // CHOMPEdit - Removal of obj/item/weapon
	sort_category = "Utility"

/datum/gear/utility/clipboard
	display_name = "clipboard"
	path = /obj/item/clipboard // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/tts_device
	display_name = "text to speech device"
	path = /obj/item/text_to_speech // CHOMPEdit - Removal of obj/item/device
	cost = 0 //Not extremely expensive, but it's useful for mute chracters. //CHOMPEDIT: 3 points is pretty high for a pure fluff piece, make it 0

/datum/gear/utility/communicator
	display_name = "communicator selection"
	path = /obj/item/communicator // CHOMPEdit - Removal of obj/item/device
	cost = 0

/datum/gear/utility/communicator/New()
	..()
	var/list/communicators = list()
	for(var/obj/item/communicator_type as anything in typesof(/obj/item/communicator) - list(/obj/item/communicator/integrated,/obj/item/communicator/commlink)) //VOREStation Edit - Remove Commlink // CHOMPEdit - Removal of obj/item/device
		communicators[initial(communicator_type.name)] = communicator_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(communicators))

/datum/gear/utility/camera
	display_name = "camera"
	path = /obj/item/camera // CHOMPEdit - Removal of obj/item/device

/datum/gear/utility/codex
	display_name = "the traveler's guide to borealis" //YW Edit
	path = /obj/item/book/codex //VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	cost = 0

/datum/gear/utility/news
	display_name = "daedalus pocket newscaster"
	path = /obj/item/book/codex/lore/news // CHOMPEdit - Removal of obj/item/weapon
	cost = 0

/* //VORESTATION REMOVAL
/datum/gear/utility/corp_regs
	display_name = "corporate regulations and legal code"
	path = /obj/item/book/codex/corp_regs // CHOMPEdit - Removal of obj/item/weapon
	cost = 0
*/

/datum/gear/utility/robutt
	display_name = "a buyer's guide to artificial bodies"
	path = /obj/item/book/codex/lore/robutt // CHOMPEdit - Removal of obj/item/weapon
	cost = 0

/datum/gear/utility/folder_blue
	display_name = "folder, blue"
	path = /obj/item/folder/blue // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/folder_grey
	display_name = "folder, grey"
	path = /obj/item/folder // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/folder_red
	display_name = "folder, red"
	path = /obj/item/folder/red // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/folder_white
	display_name = "folder, white"
	path = /obj/item/folder/white // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/folder_yellow
	display_name = "folder, yellow"
	path = /obj/item/folder/yellow // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/paicard
	display_name = "personal AI device (classic)"
	path = /obj/item/paicard // CHOMPEdit - Removal of obj/item/device

/datum/gear/utility/paicard_b
	display_name = "personal AI device (new)"
	path = /obj/item/paicard/typeb // CHOMPEdit - Removal of obj/item/device

/datum/gear/utility/securecase
	display_name = "secure briefcase"
	path =/obj/item/storage/secure/briefcase // CHOMPEdit - Removal of obj/item/weapon
	cost = 2

/datum/gear/utility/laserpointer
	display_name = "laser pointer"
	path =/obj/item/laser_pointer // CHOMPEdit - Removal of obj/item/device
	cost = 2

/datum/gear/utility/flashlight
	display_name = "flashlight"
	path = /obj/item/flashlight // CHOMPEdit - Removal of obj/item/device

/datum/gear/utility/maglight
	display_name = "flashlight, maglight"
	path = /obj/item/flashlight/maglight // CHOMPEdit - Removal of obj/item/device
	cost = 2

/datum/gear/utility/flashlight/color
	display_name = "flashlight, small (selection)"
	path = /obj/item/flashlight/color // CHOMPEdit - Removal of obj/item/device

/datum/gear/utility/flashlight/color/New()
	..()
	var/list/flashlights = list(
	"Blue Flashlight" = /obj/item/flashlight/color, // CHOMPEdit - Removal of obj/item/device
	"Red Flashlight" = /obj/item/flashlight/color/red, // CHOMPEdit - Removal of obj/item/device
	"Green Flashlight" = /obj/item/flashlight/color/green, // CHOMPEdit - Removal of obj/item/device
	"Yellow Flashlight" = /obj/item/flashlight/color/yellow, // CHOMPEdit - Removal of obj/item/device
	"Purple Flashlight" = /obj/item/flashlight/color/purple, // CHOMPEdit - Removal of obj/item/device
	"Orange Flashlight" = /obj/item/flashlight/color/orange // CHOMPEdit - Removal of obj/item/device
	)
	gear_tweaks += new/datum/gear_tweak/path(flashlights)

/datum/gear/utility/battery
	display_name = "cell, device"
	path = /obj/item/cell/device // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/pen
	display_name = "fountain pen"
	path = /obj/item/pen/fountain // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/umbrella
	display_name = "umbrella"
	path = /obj/item/melee/umbrella // CHOMPEdit - Removal of obj/item/weapon
	cost = 3

/datum/gear/utility/umbrella/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/utility/wheelchair
	display_name = "wheelchair selection"
	path = /obj/item/wheelchair
	cost = 4

/datum/gear/utility/wheelchair/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice
	var/list/wheelchairs = list(
		"wheelchair" = /obj/item/wheelchair,
		"motorized wheelchair" = /obj/item/wheelchair/motor
	)
	gear_tweaks += new/datum/gear_tweak/path(wheelchairs)

/datum/gear/utility/lantern
	display_name = "lantern"
	path = /obj/item/flashlight/lantern // CHOMPEdit - Removal of obj/item/device
	cost = 2

/****************
modular computers
****************/

/datum/gear/utility/cheaptablet
	display_name = "tablet computer: cheap"
	display_name = "tablet computer, cheap"
	path = /obj/item/modular_computer/tablet/preset/custom_loadout/cheap
	cost = 3

/datum/gear/utility/normaltablet
	display_name = "tablet computer: advanced"
	display_name = "tablet computer, advanced"
	path = /obj/item/modular_computer/tablet/preset/custom_loadout/advanced
	cost = 4

/datum/gear/utility/customtablet
	display_name = "tablet computer: custom"
	display_name = "tablet computer, custom"
	path = /obj/item/modular_computer/tablet
	cost = 4

/datum/gear/utility/customtablet/New()
	..()
	gear_tweaks += new /datum/gear_tweak/tablet()

/datum/gear/utility/cheaplaptop
	display_name = "laptop computer, cheap"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/cheap
	cost = 4

/datum/gear/utility/normallaptop
	display_name = "laptop computer, advanced"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/advanced
	cost = 5

/datum/gear/utility/customlaptop
	display_name = "laptop computer, custom"
	path = /obj/item/modular_computer/laptop/preset/
	cost = 6 //VOREStation Edit

/datum/gear/utility/customlaptop/New()
	..()
	gear_tweaks += new /datum/gear_tweak/laptop()
