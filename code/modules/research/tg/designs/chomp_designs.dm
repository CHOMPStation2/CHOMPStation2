/datum/design_techweb/custom_circuit_assembly_drone_a
	name = "type-b electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one is armed and dangerous."
	id = "assembly-drone-a"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/arms
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_b
	name = "type-c electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one resembles a Securitron."
	id = "assembly-drone-b"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/secbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_c
	name = "type-d electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one resembles a Medibot"
	id = "assembly-drone-c"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/medbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_d
	name = "type-e electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one has a generic bot design."
	id = "assembly-drone-d"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/genbot
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/custom_circuit_assembly_drone_e
	name = "type-f electronic drone assembly"
	desc = "It's a case, for building mobile electronics with. This one has a hominoid design."
	id = "assembly-drone-e"
	materials = list(MAT_STEEL = 30000)
	build_path = /obj/item/electronic_assembly/drone/android
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_CIRCUITRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design_techweb/mechfab/combat_shield
	name = "linear combat shield"
	id = "mech_shield_droid"
	materials = list(MAT_STEEL = 8000, MAT_GOLD = 2000, MAT_SILVER = 3000, MAT_PHORON = 5000, MAT_VERDANTIUM = 2000, MAT_GLASS = 3750)  //Chompedit  Also bumped up a little
	build_path = /obj/item/mecha_parts/mecha_equipment/combat_shield
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/mechfab/omni_shield
	name = "Omni Shield"
	desc = "Integral shield projector. Can only protect the exosuit, but has no weak angles."
	id = "mech_shield_omni"
	materials = list(MAT_STEEL = 8000, MAT_GOLD = 2000, MAT_SILVER = 3000, MAT_PHORON = 5000, MAT_VERDANTIUM = 2000, MAT_GLASS = 3750)  //Chompedit  Also bumped up a little
	build_path = /obj/item/mecha_parts/mecha_equipment/omni_shield
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

// New Stuff

/datum/design_techweb/board/food_replicator
	name = "Food Replicator"
	id = "food_replicator"
	build_path = /obj/item/circuitboard/food_replicator
	category = list(
		RND_CATEGORY_MACHINE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design_techweb/mindbinder
	name = "Mind Binder"
	id = "mindbinder"
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000, MAT_URANIUM = 2000)
	build_path = /obj/item/mindbinder
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

//Misc weapons

/datum/design_techweb/metamorphosisray
	name = "metamorphosis ray"
	id = "metamorphosisray"
	build_path = /obj/item/gun/energy/mouseray/metamorphosis
	build_type = PROTOLATHE
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 2000, MAT_URANIUM = 500, MAT_PHORON = 1500)
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

//Phase weapon with lock safeties.
/datum/design_techweb/phase_pistol
	name = "Phase Pistol"
	id = "phasepistol"
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 500)
	build_path = /obj/item/gun/energy/locked/phasegun/pistol
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/phase_carbine
	name = "Phase Carbine"
	id = "phasecarbine"
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 500)
	build_path = /obj/item/gun/energy/locked/phasegun
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/phase_rifle
	name = "Phase Rifle"
	id = "phaserifle"
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 500, MAT_SILVER = 500)
	build_path = /obj/item/gun/energy/locked/phasegun/rifle
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/phase_cannon
	name = "Phase Cannon"
	id = "phasecannon"
	materials = list(MAT_STEEL = 10000, MAT_GLASS = 2000, MAT_SILVER = 2000, MAT_DIAMOND = 750)
	build_path = /obj/item/gun/energy/locked/phasegun/cannon
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/frontier_holdout
	name = "Frontier Phase Pistol"
	id = "holdout_frontier_phaser"
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 100, MAT_PHORON = 1000)
	build_path = /obj/item/gun/energy/locked/frontier/holdout
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/frontier_phaser
	name = "Frontier Phaser"
	id = "frontier_phaser"
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 150, MAT_PHORON = 2000)
	build_path = /obj/item/gun/energy/locked/frontier
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/frontier_carbine
	name = "Frontier Phase Carbine"
	id = "carbine_frontier_phaser"
	materials = list(MAT_STEEL = 6500, MAT_GLASS = 900, MAT_DURASTEEL = 150, MAT_VERDANTIUM = 200, MAT_PHORON = 4000)
	build_path = /obj/item/gun/energy/locked/frontier/carbine
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/frontier_rifle
	name = "Frontier Marksman Phase Rifle"
	id = "marksman_rifle_frontier_phaser"
	materials = list(MAT_STEEL = 8000, MAT_GLASS = 900, MAT_DURASTEEL = 200, MAT_VERDANTIUM = 250, MAT_PHORON = 2000)
	build_path = /obj/item/gun/energy/locked/frontier/rifle
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/frontier_handbow
	name = "Frontier Phase Handbow"
	id = "handbow_frontier_phaser"
	materials = list(MAT_STEEL = 5000, MAT_GLASS = 900, MAT_DURASTEEL = 100, MAT_VERDANTIUM = 150, MAT_PHORON = 1000)
	build_path = /obj/item/gun/energy/locked/frontier/handbow
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

//Leathals And any new CHOMP weapons.
/datum/design_techweb/caselessrifle_prototype
	name = "Caseless Rifle"
	id = "caselessrifle"
	materials = list(MAT_STEEL = 7000, MAT_TITANIUM = 4000)
	build_path = /obj/item/gun/projectile/caseless/prototype
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/lasercannon
	name = "Laser Cannon"
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	id = "lasercannon"
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 1000, MAT_DIAMOND = 2000, MAT_TITANIUM = 4000, MAT_LEAD = 4000, MAT_URANIUM = 5000)
	build_path = /obj/item/gun/energy/lasercannon
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/cyrogun
	name = "Cryo Gun"
	desc = "An improperly researched and poorly built weapon, specialized in utlizing frost offensively.."
	id = "cryogun"
	materials = list(MAT_GLASS = 3000, MAT_MORPHIUM = 4000, MAT_DURASTEEL = 6000, MAT_LEAD = 6000, MAT_METALHYDROGEN = 3000)
	build_path = /obj/item/gun/energy/freezegun
	build_type = PROTOLATHE
	category = list(
		RND_CATEGORY_WEAPONS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design_techweb/mechfab/modsuit/phase
	name = "hardsuit phase rifle"
	desc = "A compact phase rifle for a hardsuit."
	id = "rig_gun_phase"
	materials = list(MAT_STEEL = 2000, MAT_GLASS = 1250)
	build_path = /obj/item/rig_module/mounted/phase
	category = list(
		RND_CATEGORY_MODSUIT_MODULES
	)

/datum/design_techweb/mechfab/modsuit/defib
	name = "hardsuit defib unit"
	desc = "A rig mounted defib and jumper kit combo."
	id = "rig_defib"
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 2000)
	build_path = /obj/item/rig_module/device/defib
	category = list(
		RND_CATEGORY_MODSUIT_MODULES
	)

/datum/design_techweb/mechfab/phoron_bore
	name = "PB-23 \"Phobos\" Phoron Bore"
	id = "mech_phoron_bore"
	materials = list(MAT_PLASTEEL = 4000, MAT_PHORON = 10000, MAT_SILVER = 2000)
	build_path =/obj/item/mecha_parts/mecha_equipment/weapon/phoron_bore
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT
	)

/datum/design_techweb/mechfab/scarab
	category = list(
		RND_CATEGORY_MECHFAB_SCARAB
	)

/datum/design_techweb/mechfab/scarab/chassis
	name = "Scarab Chassis"
	id = "scarab_chassis"
	build_path = /obj/item/mecha_parts/chassis/scarab
	materials = list(MAT_STEEL = 15000)

/datum/design_techweb/mechfab/scarab/torso
	name = "Scarab Torso"
	id = "scarab_torso"
	build_path = /obj/item/mecha_parts/part/scarab_torso
	materials = list(MAT_STEEL = 30000, MAT_GLASS = 10000)

/datum/design_techweb/mechfab/scarab/head
	name = "Scarab Head"
	id = "scarab_head"
	build_path = /obj/item/mecha_parts/part/scarab_head
	materials = list(MAT_STEEL = 12500, MAT_GLASS = 5000)

/datum/design_techweb/mechfab/scarab/left_arm
	name = "Scarab Left Arm"
	id = "scarab_left_arm"
	build_path = /obj/item/mecha_parts/part/scarab_left_arm
	materials = list(MAT_STEEL = 10000)

/datum/design_techweb/mechfab/scarab/right_arm
	name = "Scarab Right Arm"
	id = "scarab_right_arm"
	build_path = /obj/item/mecha_parts/part/scarab_right_arm
	materials = list(MAT_STEEL = 10000)

/datum/design_techweb/mechfab/scarab/left_leg
	name = "Scarab Left Legs"
	id = "scarab_left_legs"
	build_path = /obj/item/mecha_parts/part/scarab_left_legs
	materials = list(MAT_STEEL = 30000)

/datum/design_techweb/mechfab/scarab/right_leg
	name = "Scarab Right Legs"
	id = "scarab_right_legs"
	build_path = /obj/item/mecha_parts/part/scarab_right_legs
	materials = list(MAT_STEEL = 30000)

/datum/design_techweb/mechfab/phazon
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON
	)

/datum/design_techweb/mechfab/phazon/chassis
	name = "Phazon Chassis"
	id = "phazon_chassis"
	build_path = /obj/item/mecha_parts/chassis/phazon
	materials = list(MAT_STEEL = 30000, MAT_DURASTEEL = 4000, MAT_PHORON = 4000, MAT_GOLD = 5000, MAT_VERDANTIUM = 4000)

/datum/design_techweb/mechfab/phazon/torso
	name = "Phazon Torso"
	id = "phazon_torso"
	build_path = /obj/item/mecha_parts/part/phazon_torso
	materials = list(MAT_STEEL = 30000, MAT_DURASTEEL = 2000, MAT_PHORON = 6000, MAT_GOLD = 6000, MAT_VERDANTIUM = 2000)

/datum/design_techweb/mechfab/phazon/head
	name = "Phazon Head"
	id = "phazon_head"
	build_path = /obj/item/mecha_parts/part/phazon_head
	materials = list(MAT_STEEL = 10000, MAT_DURASTEEL = 1000, MAT_PHORON = 4000, MAT_GOLD = 4000, MAT_VERDANTIUM = 500)

/datum/design_techweb/mechfab/phazon/left_arm
	name = "Phazon Left Arm"
	id = "phazon_left_arm"
	build_path = /obj/item/mecha_parts/part/phazon_left_arm
	materials = list(MAT_STEEL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design_techweb/mechfab/phazon/right_arm
	name = "Phazon Right Arm"
	id = "phazon_right_arm"
	build_path = /obj/item/mecha_parts/part/phazon_right_arm
	materials = list(MAT_STEEL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design_techweb/mechfab/phazon/left_leg
	name = "Phazon Left Leg"
	id = "phazon_left_leg"
	build_path = /obj/item/mecha_parts/part/phazon_left_leg
	materials = list(MAT_STEEL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design_techweb/mechfab/phazon/right_leg
	name = "Phazon Right Leg"
	id = "phazon_right_leg"
	build_path = /obj/item/mecha_parts/part/phazon_right_leg
	materials = list(MAT_STEEL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design_techweb/mechfab/modsuit/precursor
	name = "Xenotech Rig"
	desc = "A rig made of alien tech and materials."
	id = "rigmodule_precursor"
	materials = list(MAT_PLASTEEL = 12000, MAT_GOLD = 5000, MAT_GRAPHITE = 8000, MAT_OSMIUM = 3000, MAT_PLASTIC = 6000, MAT_VERDANTIUM = 7500, MAT_MORPHIUM = 20000)
	build_path = /obj/item/rig/ch/precursor
	category = list(
		RND_CATEGORY_MODSUITS
	)
