/* Syndicate modules */

/obj/item/robot_module/robot/syndicate
	name = "illegal robot module"
	hide_on_manifest = TRUE
	languages = list(
					LANGUAGE_SOL_COMMON = 1,
					LANGUAGE_TRADEBAND = 1,
					LANGUAGE_UNATHI = 0,
					LANGUAGE_SIIK	= 0,
					LANGUAGE_AKHANI = 0,
					LANGUAGE_SKRELLIAN = 0,
					LANGUAGE_ROOTLOCAL = 0,
					LANGUAGE_GUTTER = 1,
					LANGUAGE_SCHECHI = 0,
					LANGUAGE_EAL	 = 1,
					LANGUAGE_SIGN	 = 0,
					LANGUAGE_TERMINUS = 1,
					LANGUAGE_ZADDAT = 0
					)
	var/id

// All syndie modules get these, and the base borg items (flash, crowbar, etc).
/obj/item/robot_module/robot/syndicate/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	src.modules += new /obj/item/pinpointer/shuttle/merc(src)
	src.modules += new /obj/item/melee/robotic/blade/syndicate(src)
	src.modules += new /obj/item/multitool/ai_detector/cyborg(src)

	var/datum/matter_synth/cloth = new /datum/matter_synth/cloth(40000)
	synths += cloth

	var/jetpack = new/obj/item/tank/jetpack/carbondioxide(src)
	src.modules += jetpack
	robot.internals = jetpack

	var/obj/id = robot.idcard
	id.forceMove(src)
	src.modules += id

/obj/item/robot_module/robot/syndicate/Destroy()
	src.modules -= id
	id = null
	return ..()

// Gets a big shield and a gun that shoots really fast to scare the opposing force.
/obj/item/robot_module/robot/syndicate/protector
	name = "protector robot module"
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/bellycapupgrade)

/obj/item/robot_module/robot/syndicate/protector/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	src.modules += new /obj/item/shield_projector/rectangle/weak(src)
	src.modules += new /obj/item/gun/energy/robotic/laser/dakkalaser(src)
	src.modules += new /obj/item/handcuffs/cyborg(src)
	src.modules += new /obj/item/melee/robotic/baton(src)

	src.modules += new /obj/item/dogborg/sleeper/K9/syndie(src)
	src.modules += new /obj/item/dogborg/pounce(src)
	src.modules += new /obj/item/robotic_multibelt/materials(src)

// 95% engi-borg and 15% roboticist.
/obj/item/robot_module/robot/syndicate/mechanist
	name = "mechanist robot module"

/obj/item/robot_module/robot/syndicate/mechanist/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	// General engineering/hacking.
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/weldingtool/electric/mounted/cyborg(src)
	src.modules += new /obj/item/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/tool/wrench/cyborg(src)
	src.modules += new /obj/item/tool/wirecutters/cyborg(src)
	src.modules += new /obj/item/multitool/ai_detector(src)
	src.modules += new /obj/item/pickaxe/plasmacutter(src)
	src.modules += new /obj/item/rcd/electric/mounted/borg/lesser(src) // Can't eat rwalls to prevent AI core cheese.
	src.modules += new /obj/item/melee/robotic/blade/ionic(src)

	// FBP repair.
	src.modules += new /obj/item/robotanalyzer(src)
	src.modules += new /obj/item/shockpaddles/robot/jumper(src)
	src.modules += new /obj/item/gripper/no_use/organ/robotics(src)

	// Hacking other things.
	src.modules += new /obj/item/card/robot/syndi(src)
	src.modules += new /obj/item/card/emag/borg(src)

	// Materials.
	var/datum/matter_synth/nanite = new /datum/matter_synth/nanite(10000)
	synths += nanite
	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += wire
	var/datum/matter_synth/metal = new /datum/matter_synth/metal(40000)
	synths += metal
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(40000)
	synths += glass

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(nanite)
	src.modules += N

	var/obj/item/dogborg/sleeper/compactor/syndie/MD = new /obj/item/dogborg/sleeper/compactor/syndie(src)
	MD.metal = metal
	MD.glass = glass
	src.modules += MD

	src.modules += new /obj/item/dogborg/pounce(src)

	src.modules += new /obj/item/robotic_multibelt/materials(src)



// Mediborg optimized for on-the-field healing, but can also do surgery if needed.
/obj/item/robot_module/robot/syndicate/combat_medic
	name = "combat medic robot module"
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/bellycapupgrade)

/obj/item/robot_module/robot/syndicate/combat_medic/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	src.modules += new /obj/item/healthanalyzer/phasic(src)
	src.modules += new /obj/item/reagent_containers/borghypo/merc(src)

	// Surgery things.
	src.modules += new /obj/item/autopsy_scanner(src)
	src.modules += new /obj/item/robotic_multibelt/medical(src)
	src.modules += new /obj/item/robotic_multibelt/medical(src)
	src.modules += new /obj/item/gripper/medical(src)
	src.modules += new /obj/item/robotic_multibelt/materials(src)

	// General healing.
	src.modules += new /obj/item/shockpaddles/robot/combat(src)
	src.modules += new /obj/item/reagent_containers/dropper(src) // Allows borg to fix necrosis apparently
	src.modules += new /obj/item/reagent_containers/syringe(src)
	src.modules += new /obj/item/roller_holder(src)

	// Materials.
	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(15000)
	synths += medicine

	var/obj/item/stack/medical/advanced/ointment/O = new /obj/item/stack/medical/advanced/ointment(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
	O.uses_charge = 1
	O.charge_costs = list(1000)
	O.synths = list(medicine)
	B.uses_charge = 1
	B.charge_costs = list(1000)
	B.synths = list(medicine)
	S.uses_charge = 1
	S.charge_costs = list(1000)
	S.synths = list(medicine)
	src.modules += O
	src.modules += B
	src.modules += S

	src.modules += new /obj/item/dogborg/sleeper/syndie(src)
	src.modules += new /obj/item/dogborg/pounce(src)

/obj/item/robot_module/robot/syndicate/combat_medic/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)

	var/obj/item/reagent_containers/syringe/S = locate() in src.modules
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()
	..()

/obj/item/robot_module/robot/syndicate/ninja
	name = "ninja robot module"
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/bellycapupgrade)

/obj/item/robot_module/robot/syndicate/ninja/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	src.modules += new /obj/item/dogborg/sleeper/K9/syndie(src)
	src.modules += new /obj/item/dogborg/pounce(src)
	src.modules += new /obj/item/gripper/syndicate(src)
	src.modules += new /obj/item/robotic_multibelt/syndicate(src)
	src.modules += new /obj/item/robotic_multibelt/syndicate(src)
	src.modules += new /obj/item/melee/robotic/blade/ninja(src)
	src.modules += new /obj/item/borg/cloak(src)
	//Removes the default sblade
	var/obj/item/melee/robotic/blade/syndicate/sblade = locate() in src.modules
	if(sblade)
		src.modules -= sblade
		qdel(sblade)
