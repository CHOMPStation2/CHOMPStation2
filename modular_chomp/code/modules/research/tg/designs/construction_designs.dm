/datum/design_techweb/fluor_light_bulb
	name = "fluorescent light bulb"
	id = "fluor_light_bulb"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(MAT_GLASS = 125)
	build_path = /obj/item/light/bulb/fluorescent
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE

/datum/design_techweb/fluor_light_tube
	name = "fluorescent light tube"
	id = "fluor_light_tube"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(MAT_GLASS = 125)
	build_path = /obj/item/light/tube/fluorescent
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE
