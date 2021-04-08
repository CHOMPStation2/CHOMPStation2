//Misc weapons
/datum/design/item/weapon/gun/launcher/confetti_cannon
	desc = "Stuff it with paper and shoot! You'll be a hit at every party."
	id = "confetti_cannon"
	req_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 3000)
	build_path = /obj/item/weapon/gun/launcher/confetti_cannon
	sort_string = "MAAVD"

//Phase weapon with lock safeties.
/datum/design/item/weapon/phase/phase_pistol
	id = "phasepistol"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 4000, MAT_COPPER = 30)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/pistol
	sort_string = "MACAA"

/datum/design/item/weapon/phase/phase_carbine
	id = "phasecarbine"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 6000, "glass" = 1500, MAT_COPPER = 40)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun
	sort_string = "MACAB"

/datum/design/item/weapon/phase/phase_rifle
	id = "phaserifle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 7000, "glass" = 2000, "silver" = 500)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/rifle
	sort_string = "MACAC"

/datum/design/item/weapon/phase/phase_cannon
	id = "phasecannon"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4, TECH_POWER = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 2000, "silver" = 1000, "diamond" = 750)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/cannon
	sort_string = "MACAD"