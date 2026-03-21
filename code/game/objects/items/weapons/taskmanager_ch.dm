#define TM_MODE_BRIDGE "Bridge"
#define TM_MODE_ENGINEERING "Engineering"
#define TM_MODE_MEDICAL "Medical"
#define TM_MODE_SCIENCE "Science"
#define TM_MODE_SERVICE "Service"
#define TM_MODE_SECURITY "Security"

/obj/item/taskmanager
	name = "Task Manager"
	desc = "A high-tech tool used to pull surplus items from offsite storage. Select a department to begin! Has a five minute cooldown between successful uses"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "taskmanager"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_vr.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_vr.dmi',
	)
	force = 0
	throwforce = 7
	throw_speed = 1
	throw_range = 3
	w_class = ITEMSIZE_NORMAL
	preserve_item = FALSE
	var/scancount = 0
	var/scanreq = 3
	var/mode = TM_MODE_BRIDGE
	var/formatx1 = 0
	var/formatx2 = 0
	var/formatx3 = 0
	var/format = ""
	var/ready = 1
	var/static/list/scannables = alist(
		TM_MODE_BRIDGE = list(
			/mob/living/simple_mob/animal/passive/dog/corgi/Ian,
			/obj/machinery/photocopier,
			/obj/machinery/papershredder,
			/obj/item/pen/multi,
			/obj/structure/filingcabinet/chestdrawer,
			/obj/item/folder/blue,
			/obj/item/folder/red,
			/obj/machinery/computer/communications,
			/obj/machinery/photocopier/faxmachine,
			/obj/item/hand_labeler,
			/obj/item/megaphone,
			/obj/item/taperecorder,
			/obj/item/melee/chainofcommand,
			/obj/item/hand_tele,
			/obj/item/stamp/captain,
			/obj/item/stamp/denied,
			/obj/machinery/blackbox_recorder,
			/obj/machinery/pointdefense_control,
			/obj/machinery/computer/teleporter,
			/obj/item/storage/box/ids,
			/obj/item/storage/box/PDAs,
			/obj/item/gun/energy/locked/phasegun,
			/obj/structure/closet/secure_closet/hop,
			/obj/machinery/account_database),
		TM_MODE_ENGINEERING = list(
			/obj/item/book/manual/supermatter_engine,
			/obj/machinery/computer/security/engineering,
			/obj/item/rcd,
			/obj/item/stamp/ce,
			/obj/item/folder/yellow_ce,
			/obj/item/clothing/glasses/meson,
			/obj/item/tape_roll,
			/obj/machinery/computer/power_monitor,
			/obj/machinery/computer/rcon,
			/obj/machinery/computer/atmos_alert,
			/obj/machinery/pipedispenser,
			/obj/machinery/pipedispenser/disposal,
			/obj/item/clothing/head/welding,
			/obj/item/clothing/glasses/welding,
			/obj/machinery/vending/tool,
			/obj/machinery/vending/engivend,
			/obj/structure/reagent_dispensers/fueltank,
			/obj/structure/reagent_dispensers/watertank,
			/obj/machinery/power/generator,
			/obj/machinery/gravity_generator/main/station,
			/obj/machinery/power/breakerbox,
			/obj/machinery/power/port_gen/pacman,
			/obj/machinery/computer/atmoscontrol,
			/obj/machinery/computer/shutoff_monitor,
			/obj/machinery/computer/drone_control,
			/obj/machinery/drone_fabricator/unify,
			/obj/machinery/power/smes/buildable/max_charge,
			/obj/machinery/shieldgen,
			/obj/structure/closet/secure_closet/engineering_welding,
			/obj/structure/closet/secure_closet/engineering_electrical,
			/obj/item/clamp,
			/obj/machinery/vending/wardrobe/engidrobe,
			/obj/machinery/vending/wardrobe/atmosdrobe,
			/mob/living/simple_mob/animal/passive/opossum/poppy,
			/obj/item/book/manual/evaguide,
			/obj/item/book/manual/wiki/engineering_guide,
			/obj/item/book/manual/atmospipes,
			/obj/item/pipe_painter,
			/obj/item/geiger),
		TM_MODE_MEDICAL = list(
			/obj/item/reagent_containers/spray/cleaner,
			/obj/item/sleevemate,
			/obj/item/defib_kit/loaded,
			/obj/item/organ/internal/lungs/erikLungs,
			/obj/machinery/reagentgrinder,
			/obj/machinery/chem_master,
			/obj/machinery/chemical_dispenser/full,
			/obj/item/reagent_containers/glass/beaker/large,
			/obj/item/reagent_containers/glass/beaker,
			/obj/item/mass_spectrometer/adv,
			/obj/item/storage/firstaid/adv,
			/obj/item/storage/firstaid/o2,
			/obj/item/storage/firstaid/toxin,
			/obj/item/storage/firstaid/fire,
			/obj/machinery/vending/medical,
			/obj/item/roller,
			/obj/machinery/vending/blood,
			/obj/machinery/atmospherics/unary/cryo_cell,
			/obj/machinery/clonepod/transhuman/full,
			/obj/machinery/body_scanconsole,
			/obj/machinery/sleep_console,
			/obj/machinery/sleeper,
			/obj/machinery/bodyscanner,
			/obj/machinery/iv_drip,
			/obj/machinery/organ_printer/flesh/full,
			/obj/machinery/dna_scannernew,
			/obj/machinery/computer/transhuman/designer,
			/obj/machinery/transhuman/autoresleever,
			/obj/machinery/computer/scan_consolenew,
			/obj/machinery/computer/pandemic,
			/obj/machinery/smartfridge/secure/virology,
			/obj/machinery/chemical_dispenser/biochemistry/full,
			/obj/machinery/injector_maker,
			/obj/machinery/vitals_monitor,
			/obj/machinery/computer/cloning,
			/obj/item/gene_scanner,
			/obj/item/gun/launcher/syringe,
			/obj/item/wheelchair,
			/obj/item/surgical/cautery,
			/obj/item/defib_kit/compact/loaded,
			/obj/structure/closet/secure_closet/medical3,
			/obj/structure/closet/secure_closet/paramedic,
			/obj/structure/closet/secure_closet/chemical,
			/obj/item/extraction_pack,
			/obj/item/storage/box/masks,
			/obj/machinery/vending/wardrobe/medidrobe,
			/obj/machinery/vending/wardrobe/genedrobe,
			/obj/machinery/vending/wardrobe/virodrobe,
			/obj/structure/morgue/crematorium,
			/obj/machinery/cryopod,
			/obj/machinery/computer/cryopod),
		TM_MODE_SCIENCE = list(
			/obj/machinery/mecha_part_fabricator_tg/prosthetics,
			/obj/machinery/mecha_part_fabricator_tg,
			/obj/machinery/autolathe,
			/obj/machinery/rnd/production/circuit_imprinter,
			/obj/machinery/computer/rdconsole_tg,
			/obj/machinery/rnd/production/protolathe,
			/mob/living/simple_mob/slime/xenobio/rainbow/kendrick,
			/obj/machinery/computer/rdservercontrol,
			/obj/machinery/rnd/server/master,
			/obj/machinery/rnd/server,
			/obj/item/storage/box/monkeycubes,
			/obj/item/gun/energy/taser/xeno,
			/obj/item/melee/baton/slime/loaded,
			/obj/item/slime_scanner,
			/obj/machinery/processor,
			/obj/machinery/anomaly_harvester,
			/obj/item/anomaly_scanner,
			/obj/machinery/doppler_array,
			/obj/machinery/vending/phoronresearch,
			/obj/item/geiger,
			/obj/machinery/particle_smasher,
			/obj/machinery/rnd/destructive_analyzer,
			/obj/machinery/smartfridge/secure/extract,
			/obj/machinery/seed_storage/xenobotany,
			/obj/machinery/botany/editor,
			/obj/machinery/botany/extractor,
			/obj/item/mmi,
			/obj/machinery/transhuman/synthprinter,
			/obj/item/robotanalyzer,
			/obj/item/disk/design_disk,
			/obj/item/disk/tech_disk,
			/obj/structure/closet/secure_closet/scientist,
			/obj/machinery/vending/wardrobe/robodrobe,
			/obj/machinery/vending/wardrobe/scidrobe,
			/obj/structure/closet/l3closet/scientist,
			/obj/item/anomaly_releaser/science,
			/obj/item/integrated_circuit_printer,
			/obj/item/capture_crystal,
			/obj/item/gun/energy/floragun),
		TM_MODE_SERVICE = list(
			/obj/machinery/holosign/bar,
			/obj/item/material/kitchen/utensil/spoon,
			/obj/item/material/kitchen/utensil/fork,
			/mob/living/carbon/human/monkey/punpun,
			/obj/machinery/chemical_dispenser/bar_alc/full,
			/obj/machinery/chemical_dispenser/bar_soft/full,
			/obj/machinery/smartfridge/drinks,
			/obj/machinery/vending/boozeomat,
			/obj/machinery/media/jukebox,
			/obj/machinery/chem_master/condimaster,
			/obj/machinery/microwave,
			/obj/machinery/vending/dinnerware,
			/obj/structure/closet/secure_closet/freezer/meat,
			/obj/structure/closet/secure_closet/freezer/fridge,
			/obj/machinery/appliance/cooker/fryer,
			/obj/machinery/appliance/cooker/grill,
			/obj/machinery/appliance/cooker/oven,
			/obj/machinery/icecream_vat,
			/obj/machinery/gibber,
			/obj/structure/kitchenspike,
			/obj/machinery/portable_atmospherics/hydroponics,
			/obj/machinery/vending/hydronutrients,
			/obj/machinery/seed_storage/garden,
			/obj/machinery/honey_extractor,
			/obj/machinery/biogenerator,
			/obj/machinery/seed_extractor,
			/obj/machinery/libraryscanner,
			/obj/machinery/librarycomp,
			/obj/machinery/librarywikicomp,
			/obj/machinery/bookbinder,
			/obj/machinery/computer/HolodeckControl,
			/obj/machinery/vr_sleeper,
			/obj/structure/closet/jcloset,
			/obj/vehicle/train/engine/janicart,
			/obj/structure/janitorialcart,
			/obj/structure/closet/secure_closet/bar,
			/obj/item/nullrod,
			/obj/item/barcodescanner,
			/obj/machinery/scale,
			/obj/machinery/appliance/mixer/cereal,
			/obj/machinery/appliance/mixer/candy,
			/obj/machinery/vending/wardrobe/bardrobe,
			/obj/machinery/vending/wardrobe/chefdrobe,
			/obj/machinery/vending/wardrobe/hydrobe,
			/obj/machinery/vending/wardrobe/chapdrobe),
		TM_MODE_SECURITY = list(
			/obj/machinery/deployable/barrier,
			/obj/machinery/flasher/portable,
			/obj/item/storage/box/flashbangs,
			/obj/item/taperecorder,
			/mob/living/simple_mob/animal/passive/snake/python/noodle,
			/obj/item/gun/energy/taser,
			/obj/item/gun/energy/stunrevolver,
			/obj/item/reagent_containers/spray/pepper,
			/obj/item/storage/box/handcuffs,
			/obj/item/clothing/glasses/sunglasses/sechud/aviator,
			/obj/machinery/computer/secure_data,
			/obj/machinery/computer/security,
			/obj/item/storage/briefcase/crimekit,
			/obj/machinery/microscope,
			/obj/machinery/dnaforensics,
			/obj/machinery/flasher,
			/obj/structure/closet/secure_closet/brig,
			/obj/structure/closet/secure_closet/warden,
			/obj/machinery/vending/security,
			/obj/structure/closet/secure_closet/hos2,
			/obj/structure/closet/secure_closet/hos,
			/obj/item/stamp/hos,
			/obj/structure/closet/secure_closet/security,
			/obj/machinery/computer/secure_data/detective_computer,
			/obj/machinery/vending/security_armor,
			/obj/machinery/vending/security_armory_armor,
			/obj/machinery/autolathe/armory,
			/obj/item/forensics/sample_kit/powder,
			/obj/item/forensics/sample_kit,
			/obj/item/storage/box/swabs,
			/obj/item/storage/box/evidence,
			/obj/item/personal_shield_generator/belt/security/loaded,
			/obj/item/gun/energy/plasmastun,
			/obj/item/gun/energy/gun/burst,
			/obj/item/melee/energy/spear,
			/obj/item/melee/baton/loaded,
			/obj/item/gun/energy/laser,
			/obj/item/shield/riot,
			/obj/item/clothing/suit/armor/combat,
			/obj/item/clothing/suit/armor/bulletproof/alt,
			/obj/item/clothing/suit/armor/laserproof,
			/obj/item/clothing/suit/armor/riot/alt,
			/obj/structure/closet/secure_closet/detective,
			/obj/item/handcuffs,
			/obj/item/stamp/ward,
			/obj/item/stamp/internalaffairs,
			/obj/item/clothing/glasses/hud/security,
			/obj/machinery/cryopod,
			/obj/machinery/computer/cryopod,
			/obj/item/storage/box/teargas,
			/obj/machinery/computer/prisoner,
			/obj/item/gun/energy/gun,
			/obj/item/gun/energy/ionrifle,
			/obj/item/gun/projectile/shotgun/pump,
			/obj/item/reagent_containers/spray/luminol,
			/obj/item/uv_light,
			/obj/item/ammo_magazine/m45,
			/obj/item/ammo_magazine/ammo_box/b12g,
			/obj/item/ammo_magazine/m9mmp90)
	)
	var/list/scanned = list()
	var/static/image/radial_image_bridge = image(icon = 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "bridge")
	var/static/image/radial_image_engineering = image(icon= 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "eng")
	var/static/image/radial_image_medical = image(icon = 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "medbay")
	var/static/image/radial_image_science = image(icon = 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "sci")
	var/static/image/radial_image_service = image(icon = 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "bar")
	var/static/image/radial_image_security = image(icon = 'modular_chomp/icons/mob/radial_ch.dmi', icon_state = "armory")

/obj/item/taskmanager/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/item/taskmanager/attack_self(mob/user)
	. = ..()
	var/list/choices = list(
		TM_MODE_BRIDGE = radial_image_bridge,
		TM_MODE_ENGINEERING = radial_image_engineering,
		TM_MODE_MEDICAL = radial_image_medical,
		TM_MODE_SCIENCE = radial_image_science,
		TM_MODE_SERVICE = radial_image_service,
		TM_MODE_SECURITY = radial_image_security
	)

	var/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE, tooltips = TRUE)
	if(!(choice in choices) || !check_menu(user))
		return

	mode = choice
	scancount = 0
	scanned.Cut()

	scanreq = rand(3,9)
	to_chat(user, span_notice("Changed mode to '[choice]'."))
	playsound(loc, 'sound/effects/pop.ogg', 50, 0)

/obj/item/taskmanager/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(!ready)
		to_chat(user, span_notice("The Task Manager is still recharging!"))
		return
	if(mode == 0)
		to_chat(user, span_notice("You must choose a department first!"))
		return
	if((target.type in scannables[mode]) && scancount < scanreq && !(target.type in scanned))
		scancount = scancount + 1
		scanned.Add(target.type)
		var/scansleft = scanreq - scancount
		playsound(src, 'sound/machines/beep.ogg', 50)
		to_chat(user, span_notice("You must scan [scansleft] more department objects!"))
		if (scancount == scanreq)
			formatx1 = rand(1,5)
			formatx2 = rand(0,80)
			formatx3 = rand(1,6)
			format = "Greetings supervisors,<BR> I have detected [formatx1] infractions in this department alone.<BR> Scans indicate that this department is functioning at [formatx2]% capacity.<BR> Additional supplies are requested, priority level [formatx3]<BR> I await your delivery"
			to_chat(user, span_notice("Scans complete! [formatx1] infractions detected, department at [formatx2]% capacity, alert level [formatx3]"))
			to_chat(user, span_notice("Please write down the following form on a paper, and replace all X's with the appopriate number. Do NOT change anything but the X's"))
			to_chat(user, span_notice("Greetings supervisors,<BR> I have detected X infractions in this department alone.<BR> Scans indicate that this department is functioning at X% capacity.<BR> Additional supplies are requested, priority level X<BR> I await your delivery"))
		return
	if(istype(target,/obj/item/paper) && scancount == scanreq)
		scan_paper(user,target)
		return
	else
		to_chat(user, span_notice("The Task Manager can't scan this!"))
		return

/obj/item/taskmanager/proc/scan_paper(user,paper)
	var/obj/item/paper/P = paper
	if(findtext(P.info,format))
		deploy_voucher(get_turf(src))
		scancount = 0
		scanned = list()
		del(P)
		to_chat(user, span_notice("Format accepted, printing voucher!"))
		ready = 0
		spawn(300 SECONDS)
			ready = 1
		return
	if(!findtext(P.info,format))
		to_chat(user, span_notice("Incorrect format!"))
		return
	else
		to_chat(user, span_notice("If you are reading this, something has gone horribly wrong!"))
		return

/obj/item/taskmanager/proc/deploy_voucher(var/turf/T)
	switch(mode)
		if (TM_MODE_BRIDGE)
			new /obj/item/surplus_voucher/com(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (TM_MODE_ENGINEERING)
			new /obj/item/surplus_voucher/eng(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (TM_MODE_MEDICAL)
			new /obj/item/surplus_voucher/med(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (TM_MODE_SCIENCE)
			new /obj/item/surplus_voucher/sci(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (TM_MODE_SERVICE)
			new /obj/item/surplus_voucher/ser(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (TM_MODE_SECURITY)
			new /obj/item/surplus_voucher/sec(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)

#undef TM_MODE_BRIDGE
#undef TM_MODE_ENGINEERING
#undef TM_MODE_MEDICAL
#undef TM_MODE_SCIENCE
#undef TM_MODE_SERVICE
#undef TM_MODE_SECURITY
