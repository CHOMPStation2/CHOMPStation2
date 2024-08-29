/datum/gear/utility/saddlebag
	display_name = "saddle bag, horse"
	path = /obj/item/storage/backpack/saddlebag // CHOMPEdit - Removal of obj/item/weapon
	slot = slot_back
	cost = 2

/datum/gear/utility/saddlebag_common
	display_name = "saddle bag, common"
	path = /obj/item/storage/backpack/saddlebag_common // CHOMPEdit - Removal of obj/item/weapon
	slot = slot_back
	cost = 2

/datum/gear/utility/saddlebag_common/robust
	display_name = "saddle bag, robust"
	path = /obj/item/storage/backpack/saddlebag_common/robust // CHOMPEdit - Removal of obj/item/weapon
	slot = slot_back
	cost = 2

/datum/gear/utility/saddlebag_common/vest
	display_name = "taur duty vest (backpack)"
	path = /obj/item/storage/backpack/saddlebag_common/vest // CHOMPEdit - Removal of obj/item/weapon
	slot = slot_back
	cost = 1

/datum/gear/utility/dufflebag
	display_name = "dufflebag"
	path = /obj/item/storage/backpack/dufflebag // CHOMPEdit - Removal of obj/item/weapon
	slot = slot_back
	cost = 2

/datum/gear/utility/dufflebag/black
	display_name = "black dufflebag"
	path = /obj/item/storage/backpack/dufflebag/fluff // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/dufflebag/med
	display_name = "medical dufflebag"
	path = /obj/item/storage/backpack/dufflebag/med // CHOMPEdit - Removal of obj/item/weapon
	allowed_roles = list("Medical Doctor","Chief Medical Officer","Chemist","Paramedic","Geneticist","Psychiatrist","Field Medic") //CHOMP explo keep

/datum/gear/utility/dufflebag/med/emt
	display_name = "EMT dufflebag"
	path = /obj/item/storage/backpack/dufflebag/emt // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/dufflebag/sec
    display_name = "security Dufflebag"
    path = /obj/item/storage/backpack/dufflebag/sec // CHOMPEdit - Removal of obj/item/weapon
    allowed_roles = list("Head of Security","Warden","Detective","Security Officer","Blueshield Guard","Security Pilot")//YW ADDITIONS

/datum/gear/utility/dufflebag/eng
	display_name = "engineering dufflebag"
	path = /obj/item/storage/backpack/dufflebag/eng // CHOMPEdit - Removal of obj/item/weapon
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer")

/datum/gear/utility/dufflebag/sci
	display_name = "science dufflebag"
	path = /obj/item/storage/backpack/dufflebag/sci // CHOMPEdit - Removal of obj/item/weapon
	allowed_roles = list("Research Director","Scientist","Roboticist","Xenobiologist","Xenobotanist")

/datum/gear/utility/dufflebag/explorer
	display_name = "explorer dufflebag" //CHOMP explo keep
	path = /obj/item/storage/backpack/dufflebag/explorer // CHOMPEdit - Removal of obj/item/weapon
	allowed_roles = list("Pathfinder","Explorer") //CHOMP explo keep

/datum/gear/utility/dufflebag/talon
	display_name = "Talon dufflebag"
	path = /obj/item/storage/backpack/dufflebag/explorer // CHOMPEdit - Removal of obj/item/weapon

/datum/gear/utility/ID
	display_name = "contractor identification card"
	path = /obj/item/card/id/event/polymorphic/altcard // CHOMPEdit - Removal of obj/item/weapon
	cost = 1

/datum/gear/utility/bs_bracelet
	display_name = "bluespace bracelet"
	path = /obj/item/clothing/gloves/bluespace
	cost = 2

/datum/gear/utility/walkpod
	display_name = "podzu music player"
	path = /obj/item/walkpod // CHOMPEdit - Removal of obj/item/device
	cost = 2
