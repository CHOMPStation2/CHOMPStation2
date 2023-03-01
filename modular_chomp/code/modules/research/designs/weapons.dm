//Misc weapons
/datum/design/item/weapon/gun/launcher/confetti_cannon
	desc = "Stuff it with paper and shoot! You'll be a hit at every party."
	id = "confetti_cannon"
	req_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000)
	build_path = /obj/item/weapon/gun/launcher/confetti_cannon
	sort_string = "MAAVD"

//Phase weapon with lock safeties.
/datum/design/item/weapon/phase/phase_pistol
	id = "phasepistol"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 500)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/pistol
	sort_string = "MACAA"

/datum/design/item/weapon/phase/phase_carbine
	id = "phasecarbine"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 500)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun
	sort_string = "MACAB"

/datum/design/item/weapon/phase/phase_rifle
	id = "phaserifle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 500, MAT_SILVER = 500)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/rifle
	sort_string = "MACAC"

/datum/design/item/weapon/phase/phase_cannon
	id = "phasecannon"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4, TECH_POWER = 4)
	materials = list(MAT_STEEL = 10000, MAT_GLASS = 2000, MAT_SILVER = 2000, MAT_DIAMOND = 750)
	build_path = /obj/item/weapon/gun/energy/locked/phasegun/cannon
	sort_string = "MACAD"

/datum/design/item/weapon/phase/frontier_holdout
	id = "holdout frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_METALHYDROGEN = 150, MAT_VERDANTIUM = 100, MAT_PHORON = 1000)
	build_path = /obj/item/weapon/gun/energy/locked/frontier/holdout
	sort_string = "MACAE"

/datum/design/item/weapon/phase/frontier_phaser
	id = "frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_METALHYDROGEN = 200, MAT_VERDANTIUM = 150, MAT_PHORON = 2000)
	build_path = /obj/item/weapon/gun/energy/locked/frontier
	sort_string = "MACAF"

/datum/design/item/weapon/phase/frontier_carbine
	id = "carbine frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 8, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 6500, MAT_GLASS = 900, MAT_DURASTEEL = 150, MAT_METALHYDROGEN = 250, MAT_VERDANTIUM = 200, MAT_PHORON = 4000)
	build_path = /obj/item/weapon/gun/energy/locked/frontier/carbine
	sort_string = "MACAG"

/datum/design/item/weapon/phase/frontier_rifle
	id = "marksman rifle frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 8000, MAT_GLASS = 900, MAT_DURASTEEL = 200, MAT_METALHYDROGEN = 300, MAT_VERDANTIUM = 250, MAT_PHORON = 2000)
	build_path = /obj/item/weapon/gun/energy/locked/frontier/rifle
	sort_string = "MACAH"

/datum/design/item/weapon/phase/frontier_handbow
	id = "handbow frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 5000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_METALHYDROGEN = 200, MAT_VERDANTIUM = 150, MAT_PHORON = 1000)
	build_path = /obj/item/weapon/gun/energy/locked/frontier/handbow
	sort_string = "MACAI"

//Leathals And any new CHOMP weapons.
/datum/design/item/weapon/gun/projectile/caseless/prototype
	id = "caselessrifle"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5, TECH_PHORON = 5)
	materials = list(MAT_STEEL = 7000, MAT_TITANIUM = 4000)
	build_path = /obj/item/weapon/gun/projectile/caseless/prototype
	sort_string = "MACBA"

