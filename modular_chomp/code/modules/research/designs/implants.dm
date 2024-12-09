/datum/design/item/organ/internal/augment/AssembleDesignName()
	..()
	name = "Biotech implant device prototype ([item_name])"


/datum/design/item/organ/internal/augment/armmounted/hand
	desc = "An augment that fits neatly into the hand, useful for determining the usefulness of an object for research."
	id = "research_implant"
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000)
	build_path = /obj/item/organ/internal/augment/armmounted/hand
	sort_string = "JVACE"
	department = LATHE_ALL | LATHE_SCIENCE


/datum/design/item/organ/internal/augment/armmounted/shoulder/multiple
	desc = "A large implant that fits into a subject's arm. It deploys an array of tools by some painful means."
	id = "tool_implant"
	req_tech = list(TECH_BIO = 5, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/multiple
	sort_string = "JVACI"
	department = LATHE_ALL | LATHE_SCIENCE

/datum/design/item/organ/internal/augment/armmounted/shoulder/multiple/medical
	desc = "A large implant that fits into a subject's arm. It deploys an array of tools by some painful means."
	id = "surgical_implant"
	req_tech = list(TECH_BIO = 6, TECH_MATERIAL = 4)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_SILVER = 1000)
	build_path = /obj/item/organ/internal/augment/armmounted/shoulder/multiple/medical
	sort_string = "JVACJ"
	department = LATHE_ALL | LATHE_MEDICAL
