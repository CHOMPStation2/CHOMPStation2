/datum/design_techweb/board/bodycam_monitor
	SET_CIRCUIT_DESIGN_NAMEDESC("security bodycamera monitor")
	id = "bodycam_monitor"
	build_path = /obj/item/circuitboard/security/telescreen/bodycamera
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_MACHINE_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/board/paradoxrift
	SET_CIRCUIT_DESIGN_NAMEDESC("paradox rift generator")
	id = "paradoxrift"
	build_path = /obj/item/circuitboard/paradoxrift
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_MACHINE_RESEARCH
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
