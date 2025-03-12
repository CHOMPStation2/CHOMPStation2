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
	var/mode = 0
	var/formatx1 = 0
	var/formatx2 = 0
	var/formatx3 = 0
	var/format = ""
	var/ready = 1
	var/list/scannables = list()
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
	var/list/choices = list(
		"Bridge" = radial_image_bridge,
		"Engineering" = radial_image_engineering,
		"Medical" = radial_image_medical,
		"Science" = radial_image_science,
		"Service" = radial_image_service,
		"Security" = radial_image_security
	)

	var/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE, tooltips = TRUE)
	if(!check_menu(user))
		return
	switch(choice)
		if("Bridge")
			mode = 1
			scancount = 0
			scanned = list()
			scannables = list(/mob/living/simple_mob/animal/passive/dog/corgi/Ian,/obj/machinery/photocopier,/obj/machinery/papershredder,/obj/item/pen/multi,
			/obj/structure/filingcabinet/chestdrawer,/obj/item/folder/blue,/obj/item/folder/red,/obj/machinery/computer/communications,
			/obj/machinery/photocopier/faxmachine,/obj/item/hand_labeler,/obj/item/megaphone,/obj/item/taperecorder,/obj/item/melee/chainofcommand,
			/obj/item/hand_tele,/obj/item/stamp/captain,/obj/item/stamp/denied)
		if("Engineering")
			mode = 2
			scancount = 0
			scanned = list()
			scannables = list(/obj/item/book/manual/supermatter_engine,/obj/machinery/computer/security/engineering,/obj/item/rcd,/obj/item/stamp/ce,
			/obj/item/folder/yellow_ce,/obj/item/clothing/glasses/meson,/obj/item/tape_roll,/obj/machinery/computer/power_monitor,/obj/machinery/computer/rcon,
			/obj/machinery/computer/atmos_alert,/obj/machinery/pipedispenser,/obj/machinery/pipedispenser/disposal,/obj/item/clothing/head/welding,/obj/item/clothing/glasses/welding,
			/obj/machinery/vending/tool,/obj/machinery/vending/engivend,/obj/structure/reagent_dispensers/fueltank,/obj/structure/reagent_dispensers/watertank)
		if("Medical")
			mode = 3
			scancount = 0
			scanned = list()
			scannables = list(/obj/item/reagent_containers/spray/cleaner,/obj/item/sleevemate,/obj/item/defib_kit/loaded,/obj/item/organ/internal/lungs/erikLungs,
			/obj/machinery/reagentgrinder,/obj/machinery/chem_master,/obj/machinery/chemical_dispenser/full,/obj/item/reagent_containers/glass/beaker/large,/obj/item/reagent_containers/glass/beaker,
			/obj/item/mass_spectrometer/adv,/obj/item/storage/firstaid/adv,/obj/item/storage/firstaid/o2,/obj/item/storage/firstaid/toxin,
			/obj/item/storage/firstaid/fire,/obj/machinery/vending/medical,/obj/item/roller,/obj/machinery/vending/blood,/obj/machinery/atmospherics/unary/cryo_cell,
			/obj/machinery/clonepod/transhuman/full,/obj/machinery/body_scanconsole,/obj/machinery/sleep_console)
		if("Science")
			mode = 4
			scancount = 0
			scanned = list()
			scannables = list(/obj/machinery/mecha_part_fabricator/pros,/obj/machinery/mecha_part_fabricator,/obj/machinery/autolathe,/obj/machinery/computer/rdconsole/robotics,
			/obj/machinery/r_n_d/circuit_imprinter,/obj/machinery/r_n_d/destructive_analyzer,/obj/machinery/computer/rdconsole/core,/obj/machinery/r_n_d/protolathe,
			/mob/living/simple_mob/slime/xenobio/rainbow/kendrick,/obj/machinery/computer/rdservercontrol,/obj/machinery/r_n_d/server/core,/obj/machinery/r_n_d/server/robotics,
			/obj/item/storage/box/monkeycubes,/obj/item/gun/energy/taser/xeno,/obj/item/melee/baton/slime/loaded,/obj/item/slime_scanner,
			/obj/machinery/processor)
		if("Service")
			mode = 5
			scancount = 0
			scanned = list()
			scannables = list(/obj/machinery/holosign/bar,/obj/item/material/kitchen/utensil/spoon,/obj/item/material/kitchen/utensil/fork,
			/mob/living/carbon/human/monkey/punpun,/obj/machinery/chemical_dispenser/bar_alc/full,/obj/machinery/chemical_dispenser/bar_soft/full,/obj/machinery/smartfridge/drinks,
			/obj/machinery/vending/boozeomat,/obj/machinery/media/jukebox,/obj/machinery/chem_master/condimaster,/obj/machinery/microwave,
			/obj/machinery/vending/dinnerware,/obj/structure/closet/secure_closet/freezer/meat,/obj/structure/closet/secure_closet/freezer/fridge,
			/obj/machinery/appliance/cooker/fryer,/obj/machinery/appliance/cooker/grill,/obj/machinery/appliance/cooker/oven,/obj/machinery/icecream_vat,/obj/machinery/gibber,/obj/structure/kitchenspike,
			/obj/machinery/portable_atmospherics/hydroponics,/obj/machinery/vending/hydronutrients,/obj/machinery/seed_storage/garden,/obj/machinery/honey_extractor,
			/obj/machinery/biogenerator,/obj/machinery/seed_extractor,/obj/machinery/microwave)
		if("Security")
			mode = 6
			scancount = 0
			scanned = list()
			scannables = list(/obj/machinery/deployable/barrier,/obj/machinery/flasher/portable,/obj/item/storage/box/flashbangs,/obj/item/taperecorder,
			/mob/living/simple_mob/animal/passive/snake/python/noodle,/obj/item/gun/energy/taser,/obj/item/gun/energy/stunrevolver,/obj/item/reagent_containers/spray/pepper,
			/obj/item/storage/box/handcuffs,/obj/item/clothing/glasses/sunglasses/sechud/aviator,/obj/machinery/computer/secure_data,/obj/machinery/computer/security,
			/obj/item/storage/briefcase/crimekit,/obj/machinery/microscope,/obj/machinery/dnaforensics,/obj/machinery/flasher,/obj/structure/closet/secure_closet/brig,
			/obj/structure/closet/secure_closet/warden,/obj/machinery/vending/security,/obj/structure/closet/secure_closet/hos2,/obj/structure/closet/secure_closet/hos,
			/obj/item/stamp/hos,/obj/structure/closet/secure_closet/security)
		else
			return

	scanreq = rand(3,9)
	to_chat(user, span_notice("Changed mode to '[choice]'."))
	playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
	return ..()



/obj/item/taskmanager/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(!ready)
		to_chat(user, span_notice("The Task Manager is still recharging!"))
		return
	if(mode == 0)
		to_chat(user, span_notice("You must choose a department first!"))
		return
	if((target.type in scannables) && scancount < scanreq && !(target.type in scanned))
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
		if (1)
			new /obj/item/surplus_voucher/com(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (2)
			new /obj/item/surplus_voucher/eng(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (3)
			new /obj/item/surplus_voucher/med(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (4)
			new /obj/item/surplus_voucher/sci(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (5)
			new /obj/item/surplus_voucher/ser(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
		if (6)
			new /obj/item/surplus_voucher/sec(T)
			playsound(src.loc, 'sound/machines/copier.ogg', 50, 0)
