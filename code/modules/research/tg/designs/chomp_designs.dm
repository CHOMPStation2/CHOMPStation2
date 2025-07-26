// CHOMPStation Edit Start
/datum/design_techweb/custom_circuit_assembly_drone_a
	name = "type-a electronic drone assembly"
	desc = "A customizable assembly optimized for autonomous devices."
	id = "assembly-drone-a"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_b
	name = "type-b electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one is armed and dangerous."
	id = "assembly-drone-b"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/arms
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_c
	name = "type-c electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one resembles a Securitron."
	id = "assembly-drone-c"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/secbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_d
	name = "type-d electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one resembles a Medibot"
	id = "assembly-drone-d"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/medbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_e
	name = "type-e electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one has a generic bot design."
	id = "assembly-drone-e"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/genbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_f
	name = "type-f electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one has a hominoid design."
	id = "assembly-drone-f"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/android
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/mechfab/combat_shield
	name = "linear combat shield"
	desc = "Linear shield projector. Deploys a large, familiar, and rectangular shield in one direction at a time."
	id = "mech_shield_droid"
	materials = list(MAT_STEEL = 8000, MAT_GOLD = 2000, MAT_SILVER = 3000, MAT_PHORON = 5000, MAT_VERDANTIUM = 2000, MAT_GLASS = 3750)  //Chompedit  Also bumped up a little
	build_path = /obj/item/mecha_parts/mecha_equipment/combat_shield

/datum/design_techweb/mechfab/omni_shield
	name = "Omni Shield"
	desc = "Integral shield projector. Can only protect the exosuit, but has no weak angles."
	id = "mech_shield_omni"
	materials = list(MAT_STEEL = 8000, MAT_GOLD = 2000, MAT_SILVER = 3000, MAT_PHORON = 5000, MAT_VERDANTIUM = 2000, MAT_GLASS = 3750)  //Chompedit  Also bumped up a little
	build_path = /obj/item/mecha_parts/mecha_equipment/omni_shield
