/datum/design/item/drillparts/drillairfilters/advanced
	desc = "Cleans up air at an 'okay' level."
	id = "adv_arfl"
	req_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 500)
	build_path = /obj/item/drillparts/drillairfilters/advanced
	sort_string = "FCAAB"

/datum/design/item/drillparts/drillairfilters/refined
	desc = "Cleans and suck up air quick and fast."
	id = "ref_arfl"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 500, "uranium" = 25)
	build_path = /obj/item/drillparts/drillairfilters/refined
	sort_string = "FCAAC"



/datum/design/item/drillparts/drillbit/advanced
	desc = "A pointy drill end to dig stuff up."
	id = "adv_drillb"
	req_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 500)
	build_path = /obj/item/drillparts/drillbit/advanced
	sort_string = "FCAAD"

/datum/design/item/drillpartsdrillbit/refined
	desc = "A sharp drill end to dig lots of stuff up."
	id = "ref_drillb"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 500, MAT_SILVER = 25)
	build_path = /obj/item/drillparts/drillbit/refined
	sort_string = "FCAAE"



/datum/design/item/drillparts/drillengine/advanced
	desc = "A small, reliable engine to work with hand held drills."
	id = "adv_engine"
	req_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 500)
	build_path = /obj/item/drillparts/drillengine/advanced
	sort_string = "FCAAF"

/datum/design/item/drillparts/drillengine/refined
	desc = "A small, really reliable engine to work with hand held drills."
	id = "ref_engine"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 500,"gold" = 25)
	build_path = /obj/item/drillparts/drillengine/refined
	sort_string = "FCAAG"

/datum/design/item/weapon/pick/heavydutydrill/light
	desc = "A lighter fuel powered drill.."
	id = "lght_drill"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 3000,"plastic" = 2000)
	build_path = /obj/item/weapon/pickaxe/heavydutydrill/light
	sort_string = "FCAAH"