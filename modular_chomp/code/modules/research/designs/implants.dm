/datum/design/item/organ/internal/augment/AssembleDesignName()
	..()
	name = "Biotech implant device prototype ([item_name])"

/datum/design/item/organ/internal/augment/armmounted/laserarm
	desc = "A large implant that fits into a subject's arm. It deploys a laser-emitting array by some painful means."
	id = "laserarm_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_URANIUM = 2000)
	build_path = /obj/item/organ/internal/augment/armmounted
	sort_string = "JVACC"

/datum/design/item/organ/internal/augment/armmounted/dartbow
	desc = "A small implant that fits into a subject's arm. It deploys a dart launching mechanism through the flesh through unknown means."
	id = "dart_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_ILLEGAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_URANIUM = 2000, MAT_PHORON = 1000)
	build_path = /obj/item/organ/internal/augment/armmounted/dartbow
	sort_string = "JVACD"

/datum/design/item/organ/internal/augment/armmounted/hand
	desc = "An augment that fits neatly into the hand, useful for determining the usefulness of an object for research."
	id = "research_implant"
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000)
	build_path = /obj/item/organ/internal/augment/armmounted/hand
	sort_string = "JVACE"

/datum/design/item/organ/internal/augment/armmounted/hand/blade
	desc = "A small implant that fits neatly into the hand. It deploys a small, but dangerous blade."
	id = "claw_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_PLASTEEL = 4000)
	build_path = /obj/item/organ/internal/augment/armmounted/hand/blade
	sort_string = "JVACF"

/datum/design/item/organ/internal/augment/armmounted/hand/sword
	desc = "An augment that fits neatly into the hand, It deploys a powerful energy blade."
	id = "esword_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_ILLEGAL = 5)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_PLASTEEL = 4000, MAT_METALHYDROGEN = 500)
	build_path = /obj/item/organ/internal/augment/armmounted/hand/sword
	sort_string = "JVACG"

/datum/design/item/organ/internal/augment/armmounted/shoulder/blade
	desc = "A large implant that fits into a subject's arm. It deploys a large metal blade by some painful means."
	id = "sword_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_MATERIAL = 3)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_PLASTEEL = 6000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/blade
	sort_string = "JVACH"

/datum/design/item/organ/internal/augment/armmounted/shoulder/multiple
	desc = "A large implant that fits into a subject's arm. It deploys an array of tools by some painful means."
	id = "tool_implant"
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/multiple
	sort_string = "JVACI"

/datum/design/item/organ/internal/augment/armmounted/shoulder/multiple/medical
	desc = "A large implant that fits into a subject's arm. It deploys an array of tools by some painful means."
	id = "surgical_implant"
	req_tech = list(TECH_BIO = 6, TECH_MATERIAL = 4)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_SILVER = 1000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/multiple/medical
	sort_string = "JVACJ"

/datum/design/item/organ/internal/augment/armmounted/shoulder/surge
	desc = "A large implant that fits into a subject's arm. It looks kind of like a skeleton."
	id = "stim_implant"
	req_tech = list(TECH_COMBAT = 3, TECH_BIO = 7, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_URANIUM = 1000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/surge
	sort_string = "JVACK"

/datum/design/item/organ/internal/augment/armmounted/taser
	desc = "A large implant that fits into a subject's arm. It deploys a taser-emitting array by some painful means."
	id = "taser_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 5, TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000)
	build_path = /obj/item/organ/internal/augment/armmounted/taser
	sort_string = "JVACL"

/datum/design/item/organ/internal/augment/bioaugment/thermalshades
	desc = "A miniscule implant that houses a pair of thermolensed sunglasses. Don't ask how they deploy, you don't want to know."
	id = "thermal_implant"
	req_tech = list(TECH_COMBAT = 5, TECH_BIO = 7, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)
	materials = list(MAT_STEEL = 2000, MAT_GLASS = 2000, MAT_URANIUM = 2000, MAT_PLASTEEL = 1000)
	build_path = /obj/item/organ/internal/augment/bioaugment/thermalshades
	sort_string = "JVACM"
