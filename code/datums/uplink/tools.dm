/********************
* Devices and Tools *
********************/
/datum/uplink_item/item/tools
	category = /datum/uplink_category/tools

/datum/uplink_item/item/tools/binoculars
	name = "Binoculars"
	item_cost = 3
	path = /obj/item/binoculars // CHOMPEdit - Removal of obj/item/device

/datum/uplink_item/item/tools/toolbox // Leaving the basic as an option since powertools are loud.
	name = "Fully Loaded Toolbox"
	item_cost = 3
	path = /obj/item/storage/toolbox/syndicate // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/powertoolbox
	name = "Fully Loaded Powertool Box"
	item_cost = 5
	path = /obj/item/storage/toolbox/syndicate/powertools // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/clerical
	name = "Morphic Clerical Kit"
	item_cost = 5
	path = /obj/item/storage/box/syndie_kit/clerical // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/encryptionkey_radio
	name = "Encrypted Radio Channel Key"
	item_cost = 10
	path = /obj/item/encryptionkey/syndicate // CHOMPEdit - Removal of obj/item/device

/datum/uplink_item/item/tools/money
	name = "Operations Funding"
	item_cost = 10
	path = /obj/item/storage/secure/briefcase/money // CHOMPEdit - Removal of obj/item/weapon
	desc = "A briefcase with 10,000 untraceable thalers for funding your sneaky activities."

/datum/uplink_item/item/tools/plastique
	name = "C-4 (Destroys walls)"
	item_cost = 10
	path = /obj/item/plastique // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/duffle
	name = "Black Duffle Bag"
	item_cost = 5
	path = /obj/item/storage/backpack/dufflebag/syndie // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/duffle/med
	name = "Black Medical Duffle Bag"
	path = /obj/item/storage/backpack/dufflebag/syndie/med // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/duffle/ammo
	name = "Black Ammunition Duffle Bag"
	path = /obj/item/storage/backpack/dufflebag/syndie/ammo // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/shield_diffuser
	name = "Handheld Shield Diffuser"
	desc = "A small device used to disrupt energy barriers, and allow passage through them."
	item_cost = 16
	path = /obj/item/shield_diffuser // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/space_suit
	name = "Space Suit"
	item_cost = 10
	path = /obj/item/storage/box/syndie_kit/space // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/encryptionkey_binary
	name = "Binary Translator Key"
	item_cost = 15
	path = /obj/item/encryptionkey/binary // CHOMPEdit - Removal of obj/item/device

/datum/uplink_item/item/tools/hacking_tool
	name = "Door Hacking Tool"
	item_cost = 15
	path = /obj/item/multitool/hacktool // CHOMPEdit - Removal of obj/item/device
	desc = "Appears and functions as a standard multitool until the mode is toggled by applying a screwdriver appropriately. \
			When in hacking mode this device will grant full access to any standard airlock within 20 to 40 seconds. \
			This device will also be able to immediately access the last 6 to 8 hacked airlocks."

/datum/uplink_item/item/tools/ai_detector
	name = "Anti-Surveillance Tool"
	item_cost = 15
	path = /obj/item/multitool/ai_detector // CHOMPEdit - Removal of obj/item/device
	desc = "This functions like a normal multitool, but includes an integrated camera network sensor that will warn the holder if they are being \
	watched, by changing color and beeping.  It is able to detect both AI visual surveillance and security camera utilization from terminals, and \
	will give different warnings by beeping and changing colors based on what it detects.  Only the holder can hear the warnings."

/datum/uplink_item/item/tools/radio_jammer
	name = "Subspace Jammer"
	item_cost = 20
	path = /obj/item/radio_jammer // CHOMPEdit - Removal of obj/item/device
	desc = "A device which is capable of disrupting subspace communications, preventing the use of headsets, PDAs, and communicators within \
	a radius of seven meters.  It runs off weapon cells, which can be replaced as needed.  One cell will last for approximately ten minutes."

/datum/uplink_item/item/tools/wall_elecrtifier
	name = "Wall Electrifier"
	item_cost = 5
	path = /obj/item/cell/spike // CHOMPEdit - Removal of obj/item/weapon
	desc = "A modified powercell which will electrify walls and reinforced floors in a 3x3 tile range around it. Always active."

/datum/uplink_item/item/tools/emag
	name = "Cryptographic Sequencer"
	item_cost = 20
	path = /obj/item/card/emag // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/graviton
	name = "Graviton Goggles"
	desc = "An obvious, if useful pair of advanced imaging goggles that allow you to see objects and turfs through walls."
	item_cost = 15
	path = /obj/item/clothing/glasses/graviton

/datum/uplink_item/item/tools/thermal
	name = "Thermal Imaging Glasses"
	item_cost = 25
	path = /obj/item/clothing/glasses/thermal/syndi

/datum/uplink_item/item/tools/packagebomb
	name = "Package Bomb (Small)"
	item_cost = 30
	path = /obj/item/storage/box/syndie_kit/demolitions // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/powersink
	name = "Powersink (DANGER!)"
	item_cost = 40
	path = /obj/item/powersink // CHOMPEdit - Removal of obj/item/device

/datum/uplink_item/item/tools/packagebomb/large
	name = "Package Bomb (Large)"
	item_cost = 60
	path = /obj/item/storage/box/syndie_kit/demolitions_heavy // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/integratedcircuitprinter
	name = "Integrated Circuit Printer (Upgraded)"
	item_cost = 10
	path = /obj/item/integrated_circuit_printer/upgraded // CHOMPEdit - Removal of obj/item/device

/*
/datum/uplink_item/item/tools/packagebomb/huge
	name = "Package Bomb (Huge)
	item_cost = 100
	path = /obj/item/storage/box/syndie_kit/demolitions_super_heavy // CHOMPEdit - Removal of obj/item/weapon
*/

/datum/uplink_item/item/tools/ai_module
	name = "Hacked AI Upload Module"
	item_cost = 60
	path = /obj/item/aiModule/syndicate // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/tools/supply_beacon
	name = "Hacked Supply Beacon (DANGER!)"
	item_cost = 60
	path = /obj/item/supply_beacon

/datum/uplink_item/item/tools/teleporter
	name = "Teleporter Circuit Board"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT * 1.5
	path = /obj/item/circuitboard/teleporter // CHOMPEdit - Removal of obj/item/weapon
	blacklisted = 1
