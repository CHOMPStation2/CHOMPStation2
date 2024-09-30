//Misc weapons
/datum/design/item/gun/launcher/confetti_cannon
	desc = "Stuff it with paper and shoot! You'll be a hit at every party."
	id = "confetti_cannon"
	req_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 3000)
	build_path = /obj/item/gun/launcher/confetti_cannon
	sort_string = "MAAVD"
	department = LATHE_ALL | LATHE_SERVICE

/datum/design/item/energy/metamorphosisray
	name = "metamorphosis ray"
	id = "metamorphosisray"
	req_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 3, TECH_POWER = 4, TECH_BIO = 5, TECH_BLUESPACE = 4, TECH_ILLEGAL = 5)
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 2000, MAT_URANIUM = 500, MAT_PHORON = 1500)
	build_path = /obj/item/gun/energy/mouseray/metamorphosis
	sort_string = "MAAVE"

//Phase weapon with lock safeties.
/datum/design/item/phase/phase_pistol
	id = "phasepistol"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 500)
	build_path = /obj/item/gun/energy/locked/phasegun/pistol
	sort_string = "MACAA"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/phase_carbine
	id = "phasecarbine"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 500)
	build_path = /obj/item/gun/energy/locked/phasegun
	sort_string = "MACAB"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/phase_rifle
	id = "phaserifle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 500, MAT_SILVER = 500)
	build_path = /obj/item/gun/energy/locked/phasegun/rifle
	sort_string = "MACAC"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/phase_cannon
	id = "phasecannon"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4, TECH_POWER = 4)
	materials = list(MAT_STEEL = 10000, MAT_GLASS = 2000, MAT_SILVER = 2000, MAT_DIAMOND = 750)
	build_path = /obj/item/gun/energy/locked/phasegun/cannon
	sort_string = "MACAD"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/frontier_holdout
	id = "holdout frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 100, MAT_PHORON = 1000)
	build_path = /obj/item/gun/energy/locked/frontier/holdout
	sort_string = "MACAE"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/frontier_phaser
	id = "frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 150, MAT_PHORON = 2000)
	build_path = /obj/item/gun/energy/locked/frontier
	sort_string = "MACAF"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/frontier_carbine
	id = "carbine frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 8, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 6500, MAT_GLASS = 900, MAT_DURASTEEL = 150, MAT_VERDANTIUM = 200, MAT_PHORON = 4000)
	build_path = /obj/item/gun/energy/locked/frontier/carbine
	sort_string = "MACAG"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/frontier_rifle
	id = "marksman rifle frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 8000, MAT_GLASS = 900, MAT_DURASTEEL = 200, MAT_VERDANTIUM = 250, MAT_PHORON = 2000)
	build_path = /obj/item/gun/energy/locked/frontier/rifle
	sort_string = "MACAH"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/phase/frontier_handbow
	id = "handbow frontier phaser"
	req_tech = list(TECH_COMBAT = 4, TECH_POWER = 7, TECH_MATERIAL = 6, TECH_PHORON = 6)
	materials = list(MAT_STEEL = 5000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 150, MAT_PHORON = 1000)
	build_path = /obj/item/gun/energy/locked/frontier/handbow
	sort_string = "MACAI"
	department = LATHE_ALL | LATHE_SECURITY

//Leathals And any new CHOMP weapons.
/datum/design/item/gun/projectile/caseless/prototype
	id = "caselessrifle"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5, TECH_PHORON = 5)
	materials = list(MAT_STEEL = 7000, MAT_TITANIUM = 4000)
	build_path = /obj/item/gun/projectile/caseless/prototype
	sort_string = "MACBA"
	department = LATHE_ALL | LATHE_SECURITY

/datum/design/item/energy/lasercannon
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	id = "lasercannon"
	req_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 6, TECH_POWER = 5)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 1000, MAT_DIAMOND = 2000, MAT_TITANIUM = 4000, MAT_LEAD = 4000, MAT_URANIUM = 5000)
	build_path = /obj/item/gun/energy/lasercannon
	sort_string = "MAAAD"
	department = LATHE_ALL | LATHE_SECURITY

//Wierd weapon time
/datum/design/item/energy/cyrogun
	desc = "An improperly researched and poorly built weapon, specialized in utlizing frost offensively.."
	id = "cryogun"
	req_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 8, TECH_POWER = 7, TECH_PRECURSOR = 4, TECH_ILLEGAL = 8)
	materials = list(MAT_GLASS = 3000, MAT_MORPHIUM = 4000, MAT_DURASTEEL = 6000, MAT_LEAD = 6000, MAT_METALHYDROGEN = 3000)
	build_path = /obj/item/gun/energy/freezegun
	sort_string = "MAAAD"
	department = LATHE_ALL | LATHE_SECURITY
