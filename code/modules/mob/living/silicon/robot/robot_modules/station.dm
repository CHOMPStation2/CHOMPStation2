var/global/list/robot_modules = list(
	"Standard"		= /obj/item/robot_module/robot/standard, // CHOMPEdit - Removal of obj/item/weapon
	"Service" 		= /obj/item/robot_module/robot/clerical/butler, // CHOMPEdit - Removal of obj/item/weapon
	"Clerical" 		= /obj/item/robot_module/robot/clerical/general, // CHOMPEdit - Removal of obj/item/weapon
	"Research" 		= /obj/item/robot_module/robot/research, // CHOMPEdit - Removal of obj/item/weapon
	"Miner" 		= /obj/item/robot_module/robot/miner, // CHOMPEdit - Removal of obj/item/weapon
	"Crisis" 		= /obj/item/robot_module/robot/medical/crisis, // CHOMPEdit - Removal of obj/item/weapon
//	"Surgeon" 		= /obj/item/robot_module/robot/medical/surgeon, // CHOMPedit: Surgeon module removal. // CHOMPEdit - Removal of obj/item/weapon
	"Security" 		= /obj/item/robot_module/robot/security/general, // CHOMPEdit - Removal of obj/item/weapon
	"Combat" 		= /obj/item/robot_module/robot/security/combat, // CHOMPEdit - Removal of obj/item/weapon
	"Engineering"	= /obj/item/robot_module/robot/engineering, // CHOMPEdit - Removal of obj/item/weapon
	"Janitor" 		= /obj/item/robot_module/robot/janitor, // CHOMPEdit - Removal of obj/item/weapon
	"Gravekeeper"	= /obj/item/robot_module/robot/gravekeeper, // CHOMPEdit - Removal of obj/item/weapon
	"Lost"			= /obj/item/robot_module/robot/lost, // CHOMPEdit - Removal of obj/item/weapon
	"Protector" 	= /obj/item/robot_module/robot/syndicate/protector, // CHOMPEdit - Removal of obj/item/weapon
	"Mechanist" 	= /obj/item/robot_module/robot/syndicate/mechanist, // CHOMPEdit - Removal of obj/item/weapon
	"Combat Medic"	= /obj/item/robot_module/robot/syndicate/combat_medic // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/robot_module // CHOMPEdit - Removal of obj/item/weapon
	name = "robot module"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_module"
	w_class = ITEMSIZE_NO_CONTAINER
	item_state = "std_mod"
	var/pto_type = null
	var/hide_on_manifest = FALSE
	var/channels = list()
	var/networks = list()
	var/languages = list(LANGUAGE_SOL_COMMON= 1,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_UNATHI		= 0,
					LANGUAGE_SIIK		= 0,
					LANGUAGE_SKRELLIAN	= 0,
					LANGUAGE_GUTTER		= 0,
					LANGUAGE_SCHECHI	= 0,
					LANGUAGE_SIGN		= 0,
					LANGUAGE_BIRDSONG	= 0,
					LANGUAGE_SAGARU		= 0,
					LANGUAGE_CANILUNZT	= 0,
					LANGUAGE_ECUREUILIAN= 0,
					LANGUAGE_DAEMON		= 0,
					LANGUAGE_ENOCHIAN	= 0,
					LANGUAGE_DRUDAKAR	= 0)
	var/can_be_pushed = 0
	var/no_slip = 0
	var/list/modules = list()
	var/list/datum/matter_synth/synths = list()
	var/list/emag = list()
	var/list/subsystems = list()
	var/list/obj/item/borg/upgrade/supported_upgrades = list()

	// Bookkeeping
	var/list/original_languages = list()
	var/list/added_networks = list()

/obj/item/robot_module/proc/hide_on_manifest() // CHOMPEdit - Removal of obj/item/weapon
	. = hide_on_manifest

/obj/item/robot_module/New(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	..()
	R.module = src
	R.can_buckle = 1 //Chomp Addition; Makes all borgs rideable.

	add_camera_networks(R)
	add_languages(R)
	add_subsystems(R)
	apply_status_flags(R)
	handle_shell(R)

	if(R.radio)
		if(R.shell)
			channels = R.mainframe.aiRadio.channels
		R.radio.recalculateChannels()

	R.set_default_module_icon()
	R.choose_icon(SSrobot_sprites.get_module_sprites_len(R.modtype, R) + 1)
	if(!R.client)
		R.icon_selected = FALSE			// It wasnt a player selecting icon? Let them do it later!

	create_equipment(R)

	for(var/obj/item/I in modules)
		I.canremove = FALSE

/obj/item/robot_module/proc/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/robot_module/proc/Reset(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	remove_camera_networks(R)
	remove_languages(R)
	remove_subsystems(R)
	remove_status_flags(R)

	if(R.radio)
		R.radio.recalculateChannels()
	R.choose_icon(0)

	R.scrubbing = FALSE

/obj/item/robot_module/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	for(var/module in modules)
		qdel(module)
	for(var/emg in emag)
		qdel(emg)
	for(var/synth in synths)
		qdel(synth)
	modules.Cut()
	synths.Cut()
	emag.Cut()
	return ..()

/obj/item/robot_module/emp_act(severity) // CHOMPEdit - Removal of obj/item/weapon
	if(modules)
		for(var/obj/O in modules)
			O.emp_act(severity)
	if(emag)
		for(var/obj/O in emag)
			O.emp_act(severity)
	if(synths)
		for(var/datum/matter_synth/S in synths)
			S.emp_act(severity)
	..()
	return

/obj/item/robot_module/proc/respawn_consumable(var/mob/living/silicon/robot/R, var/rate) // CHOMPEdit - Removal of obj/item/weapon
	if(!synths || !synths.len)
		return

	for(var/datum/matter_synth/T in synths)
		T.add_charge(T.recharge_rate * rate)

/obj/item/robot_module/proc/rebuild()//Rebuilds the list so it's possible to add/remove items from the module // CHOMPEdit - Removal of obj/item/weapon
	var/list/temp_list = modules
	modules = list()
	for(var/obj/O in temp_list)
		if(O)
			modules += O

/obj/item/robot_module/proc/add_languages(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	// Stores the languages as they were before receiving the module, and whether they could be synthezized.
	for(var/datum/language/language_datum in R.languages)
		original_languages[language_datum] = (language_datum in R.speech_synthesizer_langs)

	for(var/language in languages)
		R.add_language(language, languages[language])

/obj/item/robot_module/proc/remove_languages(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	// Clear all added languages, whether or not we originally had them.
	for(var/language in languages)
		R.remove_language(language)

	// Then add back all the original languages, and the relevant synthezising ability
	for(var/original_language in original_languages)
		R.add_language(original_language, original_languages[original_language])
	original_languages.Cut()

/obj/item/robot_module/proc/add_camera_networks(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	if(R.camera && (NETWORK_ROBOTS in R.camera.network))
		for(var/network in networks)
			if(!(network in R.camera.network))
				R.camera.add_network(network)
				added_networks |= network

/obj/item/robot_module/proc/remove_camera_networks(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	if(R.camera)
		R.camera.remove_networks(added_networks)
	added_networks.Cut()

/obj/item/robot_module/proc/add_subsystems(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	add_verb(R,subsystems) //CHOMPEdit TGPanel

/obj/item/robot_module/proc/remove_subsystems(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	remove_verb(R,subsystems)  //CHOMPEdit

/obj/item/robot_module/proc/apply_status_flags(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	if(!can_be_pushed)
		R.status_flags &= ~CANPUSH

/obj/item/robot_module/proc/remove_status_flags(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	if(!can_be_pushed)
		R.status_flags |= CANPUSH

/obj/item/robot_module/proc/handle_shell(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	if(R.braintype == BORG_BRAINTYPE_AI_SHELL)
		channels = list(
			"Medical" = 1,
			"Engineering" = 1,
			"Security" = 1,
			"Service" = 1,
			"Supply" = 1,
			"Science" = 1,
			"Command" = 1,
			"Explorer" = 1 //CHOMP keep explo
			)

/obj/item/robot_module/robot/New(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	..()

	if(R.sprite_datum)
		R.sprite_datum.do_equipment_glamour(src)

// Cyborgs (non-drones), default loadout. This will be given to every module.
/obj/item/robot_module/robot/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	//CHOMPEdit Start
	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 10
	water.max_energy = 1000
	robot.water_res = water
	synths += water
	var/obj/item/robot_tongue/T = new /obj/item/robot_tongue(src) // CHOMPEdit - Removal of obj/item/device
	T.water = water
	src.modules += T
	//CHOMPEdit End
	src.modules += new /obj/item/gps/robot(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/boop_module(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/flash/robot(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/extinguisher(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/scene(src) //CHOMPEdit - Give all borgs a scene gripper // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/crowbar/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/standard // CHOMPEdit - Removal of obj/item/weapon
	name = "standard robot module"
	pto_type = PTO_CIVILIAN

/obj/item/robot_module/robot/standard/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/tool/wrench/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/healthanalyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/melee/baton/loaded(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/melee/energy/sword(src) // CHOMPEdit - Removal of obj/item/weapon

	src.modules += new /obj/item/dogborg/sleeper/compactor/generic(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "medical robot module"
	channels = list("Medical" = 1)
	networks = list(NETWORK_MEDICAL)
	subsystems = list(/mob/living/silicon/proc/subsystem_crew_monitor)
	pto_type = PTO_MEDICAL
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/bellycapupgrade)

/* CHOMPedit start: Removal of Surgeon module. *

/obj/item/robot_module/robot/medical/surgeon // CHOMPEdit - Removal of obj/item/weapon
	name = "surgeon robot module"


/obj/item/robot_module/robot/medical/surgeon/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/healthanalyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/sleevemate(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/reagent_containers/borghypo/surgeon(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/autopsy_scanner(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/scalpel/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/hemostat/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/retractor/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/cautery/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bonegel/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/FixOVein/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bonesetter/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/circular_saw/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/surgicaldrill/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bioregen/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/organ(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/medical(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/shockpaddles/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/dropper(src) // Allows surgeon borg to fix necrosis // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/syringe(src) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/reagent_containers/spray/PS = new /obj/item/reagent_containers/spray(src) // CHOMPEdit - Removal of obj/item/weapon

	src.emag += PS
	PS.reagents.add_reagent("pacid", 250)
	PS.name = "Polyacid spray"

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(10000)
	synths += medicine

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	var/obj/item/stack/medical/advanced/ointment/O = new /obj/item/stack/medical/advanced/ointment(src) //VoreStation edit: we have burn surgeries so they should be able to do them
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(medicine)
	B.uses_charge = 1
	B.charge_costs = list(1000)
	B.synths = list(medicine)
	O.uses_charge = 1
	O.charge_costs = list(1000)
	O.synths = list(medicine)
	src.modules += N
	src.modules += B
	src.modules += O

	src.modules += new /obj/item/dogborg/sleeper/trauma(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/medical/surgeon/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/reagent_containers/syringe/S = locate() in src.modules // CHOMPEdit - Removal of obj/item/weapon
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	var/obj/item/reagent_containers/spray/PS = locate() in src.emag // CHOMPEdit - Removal of obj/item/weapon
	if(PS)
		PS.reagents.add_reagent("pacid", 2 * amount)

	..()

* CHOMPedit end: Removal of Surgeon module. */

/obj/item/robot_module/robot/medical/crisis // CHOMPEdit - Removal of obj/item/weapon
	name = "crisis robot module"

/obj/item/robot_module/robot/medical/crisis/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/healthanalyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/sleevemate(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/reagent_scanner/adv(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/reagent_containers/borghypo/crisis(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/glass/beaker/large/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/dropper/industrial(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/syringe(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/organ(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/medical(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/shockpaddles/robot(src) // CHOMPEdit - Removal of obj/item/weapon
// CHOMPedit start: Combining Surgeon and Crisis.
	src.modules += new /obj/item/autopsy_scanner(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/scalpel/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/hemostat/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/retractor/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/cautery/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bonegel/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/FixOVein/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bonesetter/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/circular_saw/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/surgicaldrill/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/bioregen/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
// CHOMPedit end: Combining Surgeon and Crisis.
	src.modules += new /obj/item/inflatable_dispenser/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/reagent_containers/spray/PS = new /obj/item/reagent_containers/spray(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += PS
	PS.reagents.add_reagent("pacid", 250)
	PS.name = "Polyacid spray"

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(30000) // CHOMPedit: Increased capacity.
	synths += medicine

	var/obj/item/stack/medical/advanced/clotting/C = new (src) // CHOMPedit: Clotting kit from medhound.
	var/obj/item/stack/medical/advanced/ointment/O = new /obj/item/stack/medical/advanced/ointment(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
// CHOMPedit start: Clotting kit from medhound.
	C.uses_charge = 1
	C.charge_costs = list(5000)
	C.synths = list(medicine)
// CHOMPedit end: Clotting kit from medhound.
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
	src.modules += C //CHOMPEdit - AND ACTUALLY ADD IT TO THE MODULES LIST

	src.modules += new /obj/item/dogborg/sleeper(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) //Pounce // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/medical/crisis/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/reagent_containers/syringe/S = locate() in src.modules // CHOMPEdit - Removal of obj/item/weapon
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	var/obj/item/reagent_containers/spray/PS = locate() in src.emag // CHOMPEdit - Removal of obj/item/weapon
	if(PS)
		PS.reagents.add_reagent("pacid", 2 * amount)

	..()


/obj/item/robot_module/robot/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = "engineering robot module"
	channels = list("Engineering" = 1)
	networks = list(NETWORK_ENGINEERING)
	subsystems = list(/mob/living/silicon/proc/subsystem_power_monitor)
	pto_type = PTO_ENGINEERING

/obj/item/robot_module/robot/engineering/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/weldingtool/electric/mounted/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/screwdriver/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wrench/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wirecutters/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/multitool(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/t_scanner(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/analyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/geiger(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/taperoll/engineering(src)
	src.modules += new /obj/item/gripper(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/circuit(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/lightreplacer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/pipe_dispenser(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/floor_painter(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/rms(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/inflatable_dispenser/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/melee/baton/robot/arm(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/rcd/electric/mounted/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/pickaxe/plasmacutter/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/loader(src) // CHOMPEdit - Removal of obj/item/weapon

	var/datum/matter_synth/metal = new /datum/matter_synth/metal(40000)
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(40000)
	var/datum/matter_synth/plasteel = new /datum/matter_synth/plasteel(20000)
	var/datum/matter_synth/wood = new /datum/matter_synth/wood(40000)
	var/datum/matter_synth/plastic = new /datum/matter_synth/plastic(40000)

	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += metal
	synths += glass
	synths += plasteel
	synths += wood
	synths += plastic
	synths += wire

	var/obj/item/matter_decompiler/MD = new /obj/item/matter_decompiler(src) // CHOMPEdit - Removal of obj/item/weapon
	MD.metal = metal
	MD.glass = glass
	src.modules += MD

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/R = new /obj/item/stack/rods/cyborg(src)
	R.synths = list(metal)
	src.modules += R

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	var/obj/item/stack/material/cyborg/plasteel/PS = new (src)
	PS.synths = list(plasteel)
	src.modules += PS

	var/obj/item/stack/tile/floor/cyborg/S = new /obj/item/stack/tile/floor/cyborg(src)
	S.synths = list(metal)
	src.modules += S

	var/obj/item/stack/tile/roofing/cyborg/CT = new /obj/item/stack/tile/roofing/cyborg(src)
	CT.synths = list(metal)
	src.modules += CT

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/tile/wood/cyborg/WT = new /obj/item/stack/tile/wood/cyborg(src)
	WT.synths = list(wood)
	src.modules += WT

	var/obj/item/stack/material/cyborg/wood/W = new (src)
	W.synths = list(wood)
	src.modules += W

	var/obj/item/stack/material/cyborg/plastic/PL = new (src)
	PL.synths = list(plastic)
	src.modules += PL

	var/obj/item/dogborg/sleeper/compactor/decompiler/BD = new /obj/item/dogborg/sleeper/compactor/decompiler(src) // CHOMPEdit - Removal of obj/item/device
	BD.metal = metal
	BD.glass = glass
	BD.wood = wood
	BD.plastic = plastic
	src.modules += BD

	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/security // CHOMPEdit - Removal of obj/item/weapon
	name = "security robot module"
	channels = list("Security" = 1)
	networks = list(NETWORK_SECURITY)
	subsystems = list(/mob/living/silicon/proc/subsystem_crew_monitor)
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/tasercooler, /obj/item/borg/upgrade/restricted/bellycapupgrade)
	pto_type = PTO_SECURITY

/obj/item/robot_module/robot/security/general // CHOMPEdit - Removal of obj/item/weapon
	name = "security robot module"

/obj/item/robot_module/robot/security/general/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/handcuffs/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/melee/baton/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/taser/mounted/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/taperoll/police(src)
	src.modules += new /obj/item/reagent_containers/spray/pepper(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/security(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/ticket_printer(src)	//VOREStation Add // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/gun/energy/locked/phasegun/unlocked/mounted/cyborg(src) // CHOMPedit: Phasegun for regular sec cyborg. // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/gun/energy/laser/mounted(src) // CHOMPEdit - Removal of obj/item/weapon

	src.modules += new /obj/item/dogborg/sleeper/K9(src) //Eat criminals. Bring them to the brig. // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/dogborg/pounce(src) //Pounce // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/security/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/flash/F = locate() in src.modules // CHOMPEdit - Removal of obj/item/device
	if(F.broken)
		F.broken = 0
		F.times_used = 0
		F.icon_state = "flash"
	else if(F.times_used)
		F.times_used--
	var/obj/item/gun/energy/taser/mounted/cyborg/T = locate() in src.modules // CHOMPEdit - Removal of obj/item/weapon
	if(T.power_supply.charge < T.power_supply.maxcharge)
		T.power_supply.give(T.charge_cost * amount)
		T.update_icon()
	else
		T.charge_tick = 0

/obj/item/robot_module/robot/janitor // CHOMPEdit - Removal of obj/item/weapon
	name = "janitorial robot module"
	channels = list("Service" = 1)
	pto_type = PTO_CIVILIAN

/obj/item/robot_module/robot/janitor/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/soap/nanotrasen(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/bag/trash(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/mop(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/pupscrubber(src)
	src.modules += new /obj/item/lightreplacer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/vac_attachment(src) //CHOMPAdd // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/borg/sight/janitor(src)
	var/obj/item/reagent_containers/spray/LS = new /obj/item/reagent_containers/spray(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += LS
	LS.reagents.add_reagent("lube", 250)
	LS.name = "Lube spray"

	//Starts empty. Can only recharge with recycled material.
	var/datum/matter_synth/metal = new /datum/matter_synth/metal()
	metal.name = "Steel reserves"
	metal.recharge_rate = 0
	metal.max_energy = 50000
	metal.energy = 0
	var/datum/matter_synth/glass = new /datum/matter_synth/glass()
	glass.name = "Glass reserves"
	glass.recharge_rate = 0
	glass.max_energy = 50000
	glass.energy = 0

	synths += metal
	synths += glass

	//Sheet refiners can only produce raw sheets.
	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.name = "steel recycler"
	M.desc = "A device that refines recycled steel into sheets."
	M.synths = list(metal)
	M.recipes = list()
	M.recipes += new/datum/stack_recipe("steel sheet", /obj/item/stack/material/steel, 1, 1, 20)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.name = "glass recycler"
	G.desc = "A device that refines recycled glass into sheets."
	G.material = get_material_by_name("placeholder") //Hacky shit but we want sheets, not windows.
	G.synths = list(glass)
	G.recipes = list()
	G.recipes += new/datum/stack_recipe("glass sheet", /obj/item/stack/material/glass, 1, 1, 20)
	src.modules += G

	var/obj/item/dogborg/sleeper/compactor/C = new /obj/item/dogborg/sleeper/compactor(src) // CHOMPEdit - Removal of obj/item/device
	C.metal = metal
	C.glass = glass
	src.modules += C

	src.emag += new /obj/item/dogborg/pounce(src) //Pounce // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/janitor/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/lightreplacer/LR = locate() in src.modules // CHOMPEdit - Removal of obj/item/device
	LR.Charge(R, amount)

	var/obj/item/reagent_containers/spray/LS = locate() in src.emag // CHOMPEdit - Removal of obj/item/weapon
	if(LS)
		LS.reagents.add_reagent("lube", 2 * amount)

/obj/item/robot_module/robot/clerical // CHOMPEdit - Removal of obj/item/weapon
	name = "service robot module"
	channels = list(
		"Service" = 1,
		"Command" = 1
		)
	languages = list(
					LANGUAGE_SOL_COMMON	= 1,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_UNATHI		= 1,
					LANGUAGE_SIIK		= 1,
					LANGUAGE_SKRELLIAN	= 1,
					LANGUAGE_ROOTLOCAL	= 0,
					LANGUAGE_GUTTER		= 1,
					LANGUAGE_SCHECHI	= 1,
					LANGUAGE_SIGN		= 0,
					LANGUAGE_BIRDSONG	= 1,
					LANGUAGE_SAGARU		= 1,
					LANGUAGE_CANILUNZT	= 1,
					LANGUAGE_ECUREUILIAN= 1,
					LANGUAGE_DAEMON		= 1,
					LANGUAGE_ENOCHIAN	= 1,
					LANGUAGE_DRUDAKAR	= 1,
					LANGUAGE_TAVAN		= 1
					)
	pto_type = PTO_CIVILIAN

/obj/item/robot_module/robot/clerical/butler // CHOMPEdit - Removal of obj/item/weapon
	channels = list("Service" = 1)

/obj/item/robot_module/robot/clerical/butler // CHOMPEdit - Removal of obj/item/weapon
	name = "service robot module"

/obj/item/robot_module/robot/clerical/butler/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/gripper/service(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/glass/bucket(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/material/minihoe(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/material/knife/machete/hatchet(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/analyzer/plant_analyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/storage/bag/serviceborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/robot_harvester(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/material/knife(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/material/kitchen/rollingpin(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/multitool(src) //to freeze trays // CHOMPEdit - Removal of obj/item/device

	var/obj/item/rsf/M = new /obj/item/rsf(src) // CHOMPEdit - Removal of obj/item/weapon
	M.stored_matter = 30
	src.modules += M

	src.modules += new /obj/item/reagent_containers/dropper/industrial(src) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/flame/lighter/zippo/L = new /obj/item/flame/lighter/zippo(src) // CHOMPEdit - Removal of obj/item/weapon
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/tray/robotray(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/borghypo/service(src) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/reagent_containers/food/drinks/bottle/small/beer/PB = new /obj/item/reagent_containers/food/drinks/bottle/small/beer(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += PB

	var/datum/reagents/R = new/datum/reagents(50)
	PB.reagents = R
	R.my_atom = PB
	R.add_reagent("beer2", 50)
	PB.name = "Auntie Hong's Final Sip"
	PB.desc = "A bottle of very special mix of alcohol and poison. Some may argue that there's alcohol to die for, but Auntie Hong took it to next level."

	src.modules += new /obj/item/dogborg/sleeper/compactor/brewer(src) // CHOMPEdit - Removal of obj/item/device

	src.emag += new /obj/item/dogborg/pounce(src) //Pounce // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/clerical/butler/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/reagent_containers/food/drinks/bottle/small/beer/PB = locate() in src.emag // CHOMPEdit - Removal of obj/item/weapon
	if(PB)
		PB.reagents.add_reagent("beer2", 2 * amount)

/obj/item/robot_module/robot/clerical/general // CHOMPEdit - Removal of obj/item/weapon
	name = "clerical robot module"

/obj/item/robot_module/robot/clerical/general/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/pen/robopen(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/form_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/paperwork(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/hand_labeler(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/stamp(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/stamp/denied(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/stamp/chameleon(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/pen/chameleon(src) // CHOMPEdit - Removal of obj/item/weapon

	src.modules += new /obj/item/dogborg/sleeper/compactor/generic(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/miner // CHOMPEdit - Removal of obj/item/weapon
	name = "miner robot module"
	channels = list("Supply" = 1)
	networks = list(NETWORK_MINE)
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/pka, /obj/item/borg/upgrade/restricted/diamonddrill)
	pto_type = PTO_CARGO

/obj/item/robot_module/robot/miner/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/borg/sight/material(src)
	src.modules += new /obj/item/tool/wrench/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/screwdriver/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/bag/ore(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/pickaxe/borgdrill(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/bag/sheetsnatcher/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/miner(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/mining_scanner(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/locked/phasegun/unlocked/mounted/cyborg(src) //CHOMPedit: Phasegun for regular mining cyborg. // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/vac_attachment(src) //CHOMPAdd // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/kinetic_crusher/machete/dagger(src) // CHOMPEdit - Removal of obj/item/weapon

	src.modules += new /obj/item/dogborg/sleeper/compactor/supply(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/research // CHOMPEdit - Removal of obj/item/weapon
	name = "research module"
	channels = list("Science" = 1)
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/advrped)
	pto_type = PTO_SCIENCE

/obj/item/robot_module/robot/research/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/portable_destructive_analyzer(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/research(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/circuit(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/organ/robotics(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/mech(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/loader(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/robotanalyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/card/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/weldingtool/electric/mounted/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/screwdriver/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wrench/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wirecutters/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/multitool(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/surgical/hemostat/cyborg(src) //Synth repair // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/surgical/surgicaldrill/cyborg(src) //NIF repair // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/syringe(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/glass/beaker/large/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/part_replacer(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/shockpaddles/robot/jumper(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/melee/baton/slime/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/taser/xeno/robot(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/xenoarch_multi_tool(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/pickaxe/excavationdrill(src) // CHOMPEdit - Removal of obj/item/weapon

	src.emag += new /obj/item/hand_tele(src) // CHOMPEdit - Removal of obj/item/weapon

	var/datum/matter_synth/nanite = new /datum/matter_synth/nanite(10000)
	synths += nanite
	var/datum/matter_synth/wire = new /datum/matter_synth/wire()						//Added to allow repairs, would rather add cable now than be asked to add it later,
	synths += wire																		//Cable code, taken from engiborg,

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(nanite)
	src.modules += N

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)	//Cable code, taken from engiborg,
	C.synths = list(wire)
	src.modules += C

	src.modules += new /obj/item/dogborg/sleeper/compactor/analyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/robot/research/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/reagent_containers/syringe/S = locate() in src.modules // CHOMPEdit - Removal of obj/item/weapon
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	..()

/obj/item/robot_module/robot/security/combat // CHOMPEdit - Removal of obj/item/weapon
	name = "combat robot module"
	hide_on_manifest = TRUE
	supported_upgrades = list(/obj/item/borg/upgrade/restricted/bellycapupgrade)

/obj/item/robot_module/robot/security/combat/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/handcuffs/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/taperoll/police(src)
	src.modules += new /obj/item/gun/energy/laser/mounted(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/taser/mounted/cyborg/ertgun(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/pickaxe/plasmacutter/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/melee/combat_borgblade(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/borg/combat/shield(src)
	src.modules += new /obj/item/borg/combat/mobility(src)
	src.modules += new /obj/item/melee/borg_combat_shocker(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/ticket_printer(src) // CHOMPEdit - Removal of obj/item/device
	src.emag += new /obj/item/gun/energy/lasercannon/mounted(src) // CHOMPEdit - Removal of obj/item/weapon

	src.modules += new /obj/item/dogborg/sleeper/K9/ert(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon


/* Drones */

/obj/item/robot_module/drone // CHOMPEdit - Removal of obj/item/weapon
	name = "drone module"
	hide_on_manifest = TRUE
	no_slip = 1
	networks = list(NETWORK_ENGINEERING)

/obj/item/robot_module/drone/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/weldingtool/electric/mounted/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/screwdriver/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wrench/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/crowbar/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/tool/wirecutters/cyborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/t_scanner(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/multitool(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/lightreplacer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/gripper(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/soap(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/no_use/loader(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/extinguisher(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/pipe_painter(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/floor_painter(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/pipe_dispenser(src) // CHOMPEdit - Removal of obj/item/weapon

	robot.internals = new/obj/item/tank/jetpack/carbondioxide(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += robot.internals

	var/obj/item/pickaxe/plasmacutter/borg/PC = new /obj/item/pickaxe/plasmacutter/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.emag += PC
	PC.name = "Plasma Cutter"

	var/datum/matter_synth/metal = new /datum/matter_synth/metal(25000)
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(25000)
	var/datum/matter_synth/wood = new /datum/matter_synth/wood(25000)
	var/datum/matter_synth/plastic = new /datum/matter_synth/plastic(25000)
	var/datum/matter_synth/wire = new /datum/matter_synth/wire(30)
	synths += metal
	synths += glass
	synths += wood
	synths += plastic
	synths += wire

	var/obj/item/matter_decompiler/MD = new /obj/item/matter_decompiler(src) // CHOMPEdit - Removal of obj/item/weapon
	MD.metal = metal
	MD.glass = glass
	MD.wood = wood
	MD.plastic = plastic
	src.modules += MD

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/R = new /obj/item/stack/rods/cyborg(src)
	R.synths = list(metal)
	src.modules += R

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	var/obj/item/stack/tile/floor/cyborg/S = new /obj/item/stack/tile/floor/cyborg(src)
	S.synths = list(metal)
	src.modules += S

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/tile/wood/cyborg/WT = new /obj/item/stack/tile/wood/cyborg(src)
	WT.synths = list(wood)
	src.modules += WT

	var/obj/item/stack/material/cyborg/wood/W = new (src)
	W.synths = list(wood)
	src.modules += W

	var/obj/item/stack/material/cyborg/plastic/P = new (src)
	P.synths = list(plastic)
	src.modules += P

/obj/item/robot_module/drone/construction // CHOMPEdit - Removal of obj/item/weapon
	name = "construction drone module"
	hide_on_manifest = TRUE
	channels = list("Engineering" = 1)
	languages = list()

/obj/item/robot_module/drone/construction/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/rcd/electric/mounted/borg/lesser(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/robot_module/drone/respawn_consumable(var/mob/living/silicon/robot/R, var/amount) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/lightreplacer/LR = locate() in src.modules // CHOMPEdit - Removal of obj/item/device
	LR.Charge(R, amount)
	..()
	return

/obj/item/robot_module/drone/mining // CHOMPEdit - Removal of obj/item/weapon
	name = "miner drone module"
	channels = list("Supply" = 1)
	networks = list(NETWORK_MINE)

/obj/item/robot_module/drone/mining/create_equipment(var/mob/living/silicon/robot/robot) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.modules += new /obj/item/borg/sight/material(src)
	src.modules += new /obj/item/pickaxe/borgdrill(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/bag/ore(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/storage/bag/sheetsnatcher/borg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/locked/phasegun/unlocked/mounted/cyborg(src)  //Chompedit, makes the mining borg able to defend itself. // CHOMPEdit - Removal of obj/item/weapon
	src.emag += new /obj/item/pickaxe/diamonddrill(src) // CHOMPEdit - Removal of obj/item/weapon
