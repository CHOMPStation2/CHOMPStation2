/datum/design/item/energy/hunter
	name = "Hybrid 'Hunter' net gun"
	id = "huntergun"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 6, TECH_MAGNET = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 6000, "glass" = 3000, "silver" = 1000)
	build_path = /obj/item/gun/energy/hunter
	sort_string = "MAAVC"
	department = LATHE_ALL | LATHE_SECURITY // CHOMPAdd
