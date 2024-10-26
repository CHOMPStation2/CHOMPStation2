/hook/startup/proc/robot_modules_yw()
	robot_modules["XenoMaid"] = /obj/item/robot_module/xenomaid
	robot_modules["Blade"] = /obj/item/robot_module/blade
	robot_modules["Surgeryhound"] = /obj/item/robot_module/surgeryhound
	return 1

/obj/item/robot_module/xenomaid
	name = "Xenomorph Maid module"
	channels = "Service"
	sprites = list(
					"Xenomorph Maid" = "xenomaid"
					)
	can_be_pushed = 0

/obj/item/robot_module/xenomaid/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/flash(src)
	src.modules += new /obj/item/soap/nanotrasen(src)
	src.modules += new /obj/item/storage/bag/trash(src)
	src.modules += new /obj/item/mop(src)
	src.modules += new /obj/item/lightreplacer(src)
	src.emag = new /obj/item/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("lube", 250)
	src.emag.name = "Lube spray"
	R.icon 		 = 'icons/mob/robots_yw.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	..()



/obj/item/robot_module/blade
	name = "Blade robot module"
	sprites = list(
					"Blade" = "blade",
					)
	channels = list("Supply" = 1)
	networks = list(NETWORK_MINE)
	can_be_pushed = 0

/obj/item/robot_module/blade/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/dogborg/jaws/big(src) //In case there's some kind of hostile mob.
	src.modules += new /obj/item/dogborg/boop_module(src) //Boop people on the nose.
	src.modules += new /obj/item/dogborg/tongue(src) //This is so they can clean up bloody evidence after it's examined, and so they can lick crew.
	src.modules += new /obj/item/dogborg/sleeper/K9(src) //Eat criminals. Bring them to the brig.
	src.modules += new /obj/item/dogborg/pounce(src) //CHOMPEdit - Switch to the more balanced pounce module
	src.modules += new /obj/item/borg/sight/material(src)
	src.modules += new /obj/item/tool/wrench(src)
	src.modules += new /obj/item/tool/screwdriver(src)
	src.modules += new /obj/item/storage/bag/ore(src)
	src.modules += new /obj/item/pickaxe/borgdrill(src)
	src.modules += new /obj/item/storage/bag/sheetsnatcher/borg(src)
	src.modules += new /obj/item/gripper/miner(src)
	src.modules += new /obj/item/mining_scanner(src)
	src.modules += new /obj/item/tool/crowbar(src)
	src.emag = new /obj/item/pickaxe/plasmacutter(src)
	src.emag 	 = new /obj/item/gun/energy/laser/mounted(src) //Emag. Not a big problem.
	R.icon 		 = 'icons/mob/widerobot_yw.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	..()


/obj/item/robot_module/surgeryhound
	name = "SurgeryHound module"
	channels = list("medical" = 1)
	networks = list (NETWORK_MEDICAL)
	subsystems = list(/mob/living/silicon/proc/subsystem_crew_monitor) //Crew monitor anywhere!
	can_be_pushed = 0
	sprites = list(
					"Medical Hound" = "medihound",
					"Dark Medical Hound (Static)" = "medihounddark"
					)

/obj/item/robot_module/surgeryhound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/dogborg/jaws/small(src) //In case a patient is being attacked by carp.
	src.modules += new /obj/item/dogborg/boop_module(src) //Boop the crew.
	src.modules += new /obj/item/dogborg/tongue(src) //Clean up bloody items by licking them, and eat rubbish for
	src.modules += new /obj/item/dogborg/sleeper(src) //So they can nom people and heal them
	src.modules += new /obj/item/borg/sight/hud/med(src)
	src.modules += new /obj/item/healthanalyzer(src)
	src.modules += new /obj/item/reagent_containers/borghypo/surgeon(src)
	src.modules += new /obj/item/surgical/scalpel(src)
	src.modules += new /obj/item/surgical/hemostat(src)
	src.modules += new /obj/item/surgical/retractor(src)
	src.modules += new /obj/item/surgical/cautery(src)
	src.modules += new /obj/item/surgical/bonegel(src)
	src.modules += new /obj/item/surgical/FixOVein(src)
	src.modules += new /obj/item/surgical/bonesetter(src)
	src.modules += new /obj/item/surgical/circular_saw(src)
	src.modules += new /obj/item/surgical/surgicaldrill(src)
	src.modules += new /obj/item/gripper/no_use/organ(src)
	src.modules += new /obj/item/gripper/medical(src)
	src.modules += new /obj/item/shockpaddles/robot(src)
	src.modules += new /obj/item/reagent_containers/dropper(src) // Allows surgeon borg to fix necrosis
	src.modules += new /obj/item/sleevemate(src)
	src.modules += new /obj/item/surgical/bioregen(src) //chompstation addition in case this borg is ever added
	src.emag = new /obj/item/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("pacid", 250)
	src.emag.name = "Polyacid spray"

	src.modules += new /obj/item/dogborg/pounce(src) //CHOMPEdit - Switch to the more balanced pounce module.
	//R.icon_state = "medihound"
	R.pixel_x 	 = -16
	R.old_x  	 = -16
	..()

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(10000)
	synths += medicine

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(medicine)
	B.uses_charge = 1
	B.charge_costs = list(1000)
	B.synths = list(medicine)
	src.modules += N
	src.modules += B
	R.icon = 'icons/mob/widerobot_vr.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'

/obj/item/robot_module/medical/robot/surgeon/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	if(src.emag)
		var/obj/item/reagent_containers/spray/PS = src.emag
		PS.reagents.add_reagent("pacid", 2 * amount)
	..()
