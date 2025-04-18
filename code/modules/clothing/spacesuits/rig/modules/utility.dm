/* Contains:
 * /obj/item/rig_module/device
 * /obj/item/rig_module/device/plasmacutter
 * /obj/item/rig_module/device/healthscanner
 * /obj/item/rig_module/device/drill
 * /obj/item/rig_module/device/orescanner
 * /obj/item/rig_module/device/rcd
 * /obj/item/rig_module/device/arch_drill
 * /obj/item/rig_module/device/anomaly_scanner
 * /obj/item/rig_module/maneuvering_jets
 * /obj/item/rig_module/device/broadcaster
 * /obj/item/rig_module/chem_dispenser
 * /obj/item/rig_module/chem_dispenser/injector
 * /obj/item/rig_module/voice
 * /obj/item/rig_module/device/paperdispenser
 * /obj/item/rig_module/device/pen
 * /obj/item/rig_module/device/stamp
 * /obj/item/rig_module/mounted/mop
 * /obj/item/rig_module/cleaner_launcher
 */

/obj/item/rig_module/device
	name = "mounted device"
	desc = "Some kind of hardsuit mount."
	usable = 0
	selectable = 1
	toggleable = 0
	disruptive = 0

	var/device_type
	var/obj/item

/obj/item/rig_module/device/plasmacutter
	name = "hardsuit plasma cutter"
	desc = "A lethal-looking industrial cutter."
	icon_state = "plasmacutter"
	interface_name = "plasma cutter"
	interface_desc = "A self-sustaining plasma arc capable of cutting through walls."
	suit_overlay_active = "plasmacutter"
	suit_overlay_inactive = "plasmacutter"
	use_power_cost = 0.5

	device_type = /obj/item/pickaxe/plasmacutter

/obj/item/rig_module/device/healthscanner
	name = "health scanner module"
	desc = "A hardsuit-mounted health scanner."
	icon_state = "scanner"
	interface_name = "health scanner"
	interface_desc = "Shows an informative health readout when used on a subject."

	device_type = /obj/item/healthanalyzer

/obj/item/rig_module/device/drill
	name = "hardsuit drill mount"
	desc = "A very heavy diamond-tipped drill."
	icon_state = "drill"
	interface_name = "mounted drill"
	interface_desc = "A diamond-tipped industrial drill."
	suit_overlay_active = "mounted-drill"
	suit_overlay_inactive = "mounted-drill"
	use_power_cost = 0.1

	device_type = /obj/item/pickaxe/diamonddrill

/obj/item/rig_module/device/anomaly_scanner
	name = "hardsuit anomaly scanner"
	desc = "You think it's called an Elder Sarsparilla or something."
	icon_state = "eldersasparilla"
	interface_name = "Alden-Saraspova counter"
	interface_desc = "An exotic particle detector commonly used by xenoarchaeologists."
	engage_string = "Begin Scan"
	usable = 1
	selectable = 0
	device_type = /obj/item/ano_scanner

/obj/item/rig_module/device/orescanner
	name = "ore scanner module"
	desc = "A clunky old ore scanner."
	icon_state = "scanner"
	interface_name = "ore detector"
	interface_desc = "A sonar system for detecting large masses of ore."
	engage_string = "Begin Scan"
	usable = 1
	selectable = 0
	device_type = /obj/item/mining_scanner

/obj/item/rig_module/device/rcd
	name = "RCD mount"
	desc = "A cell-powered rapid construction device for a hardsuit."
	icon_state = "rcd"
	interface_name = "mounted RCD"
	interface_desc = "A device for building or removing walls. Cell-powered."
	usable = 1
	engage_string = "Configure RCD"

	device_type = /obj/item/rcd/electric/mounted/rig

/obj/item/rig_module/device/arch_drill
	name = "archaeology drill mount"
	desc = "A cell-powered fine-excavation device for a hardsuit."
	icon_state = "exdrill"
	interface_name = "mounted excavation tool"
	interface_desc = "A device for excavating ancient relics."
	usable = 1
	engage_string = "Configure Drill Depth"

	device_type = /obj/item/pickaxe/excavationdrill

/obj/item/rig_module/device/Initialize(mapload)
	. = ..()
	if(device_type) device = new device_type(src)

/obj/item/rig_module/device/engage(atom/target)
	if(!..() || !device)
		return 0

	if(!target)
		device.attack_self(holder.wearer)
		return 1

	var/turf/T = get_turf(target)
	if(istype(T) && !T.Adjacent(get_turf(src)))
		return 0

	var/resolved = target.attackby(device,holder.wearer)
	if(!resolved && device && target)
		device.afterattack(target,holder.wearer,1)
	return 1

/obj/item/rig_module/chem_dispenser
	name = "mounted chemical dispenser"
	desc = "A complex web of tubing and needles suitable for hardsuit use."
	icon_state = "injector"
	usable = 1
	selectable = 0
	toggleable = 0
	disruptive = 0

	engage_string = "Inject"

	interface_name = "integrated chemical dispenser"
	interface_desc = "Dispenses loaded chemicals directly into the wearer's bloodstream."

	charges = list(
		list(REAGENT_ID_TRICORDRAZINE, REAGENT_ID_TRICORDRAZINE, 0, 80),
		list(REAGENT_ID_TRAMADOL,      REAGENT_ID_TRAMADOL,      0, 80),
		list("dexalin plus",  REAGENT_ID_DEXALINP,      0, 80),
		list("antibiotics",   REAGENT_ID_SPACEACILLIN,  0, 80),
		list("antitoxins",    REAGENT_ID_ANTITOXIN,    0, 80),
		list("nutrients",     REAGENT_ID_GLUCOSE,     0, 80),
		list(REAGENT_ID_HYRONALIN,     REAGENT_ID_HYRONALIN,     0, 80),
		list(REAGENT_ID_RADIUM,        REAGENT_ID_RADIUM,        0, 80)
		)

	var/max_reagent_volume = 80 //Used when refilling.

/obj/item/rig_module/chem_dispenser/ninja
	interface_desc = "Dispenses loaded chemicals directly into the wearer's bloodstream. This variant is made to be extremely light and flexible."

	//Want more? Go refill. Gives the ninja another reason to have to show their face.
	charges = list(
		list(REAGENT_ID_TRICORDRAZINE, REAGENT_ID_TRICORDRAZINE, 0, 30),
		list(REAGENT_ID_TRAMADOL,      REAGENT_ID_TRAMADOL,      0, 30),
		list("dexalin plus",  REAGENT_ID_DEXALINP,      0, 30),
		list("antibiotics",   REAGENT_ID_SPACEACILLIN,  0, 30),
		list("antitoxins",    REAGENT_ID_ANTITOXIN,    0, 60),
		list("nutrients",     REAGENT_ID_GLUCOSE,       0, 80),
		list(REAGENT_ID_BICARIDINE,	  REAGENT_ID_BICARIDINE,    0, 30),
		list("clotting agent", REAGENT_ID_MYELAMINE,    0, 30),
		list(REAGENT_ID_PERIDAXON,     REAGENT_ID_PERIDAXON,     0, 30),
		list(REAGENT_ID_HYRONALIN,     REAGENT_ID_HYRONALIN,     0, 30),
		list(REAGENT_ID_RADIUM,        REAGENT_ID_RADIUM,        0, 30)
		)

/obj/item/rig_module/chem_dispenser/accepts_item(var/obj/item/input_item, var/mob/living/user)

	if(!input_item.is_open_container())
		return 0

	if(!input_item.reagents || !input_item.reagents.total_volume)
		to_chat(user, "\The [input_item] is empty.")
		return 0

	// Magical chemical filtration system, do not question it.
	var/total_transferred = 0
	for(var/datum/reagent/R in input_item.reagents.reagent_list)
		for(var/chargetype in charges)
			var/datum/rig_charge/charge = charges[chargetype]
			if(charge.display_name == R.id)

				var/chems_to_transfer = R.volume

				if((charge.charges + chems_to_transfer) > max_reagent_volume)
					chems_to_transfer = max_reagent_volume - charge.charges

				charge.charges += chems_to_transfer
				input_item.reagents.remove_reagent(R.id, chems_to_transfer)
				total_transferred += chems_to_transfer

				break

	if(total_transferred)
		to_chat(user, span_blue("You transfer [total_transferred] units into the suit reservoir."))
	else
		to_chat(user, span_danger("None of the reagents seem suitable."))
	return 1

/obj/item/rig_module/chem_dispenser/engage(atom/target)

	if(!..())
		return 0

	var/mob/living/carbon/human/H = holder.wearer

	if(!charge_selected)
		to_chat(H, span_danger("You have not selected a chemical type."))
		return 0

	var/datum/rig_charge/charge = charges[charge_selected]

	if(!charge)
		return 0

	var/chems_to_use = 10
	if(charge.charges <= 0)
		to_chat(H, span_danger("Insufficient chems!"))
		return 0
	else if(charge.charges < chems_to_use)
		chems_to_use = charge.charges

	var/mob/living/carbon/target_mob
	if(target)
		if(istype(target,/mob/living/carbon))
			target_mob = target
		else
			return 0
	else
		target_mob = H

	if(target_mob != H)
		to_chat(H, span_danger("You inject [target_mob] with [chems_to_use] unit\s of [charge.display_name]."))
	to_chat(target_mob, span_danger("You feel a rushing in your veins as [chems_to_use] unit\s of [charge.display_name] [chems_to_use == 1 ? "is" : "are"] injected."))
	target_mob.reagents.add_reagent(charge.display_name, chems_to_use)

	charge.charges -= chems_to_use
	if(charge.charges < 0) charge.charges = 0

	return 1

/obj/item/rig_module/chem_dispenser/combat

	name = "combat chemical injector"
	desc = "A complex web of tubing and needles suitable for hardsuit use."

	charges = list(
		list(REAGENT_ID_SYNAPTIZINE,   REAGENT_ID_SYNAPTIZINE,   0, 30),
		list(REAGENT_ID_HYPERZINE,     REAGENT_ID_HYPERZINE,     0, 30),
		list(REAGENT_ID_OXYCODONE,     REAGENT_ID_OXYCODONE,     0, 30),
		list("nutrients",     REAGENT_ID_GLUCOSE,     0, 80),
		list("clotting agent", REAGENT_ID_MYELAMINE, 0, 80)
		)

	interface_name = "combat chem dispenser"
	interface_desc = "Dispenses loaded chemicals directly into the bloodstream."


/obj/item/rig_module/chem_dispenser/injector

	name = "mounted chemical injector"
	desc = "A complex web of tubing and a large needle suitable for hardsuit use."
	usable = 0
	selectable = 1
	disruptive = 1

	interface_name = "mounted chem injector"
	interface_desc = "Dispenses loaded chemicals via an arm-mounted injector."

/obj/item/rig_module/chem_dispenser/injector/advanced

	charges = list(
		list(REAGENT_ID_TRICORDRAZINE, REAGENT_ID_TRICORDRAZINE, 0, 80),
		list(REAGENT_ID_TRAMADOL,      REAGENT_ID_TRAMADOL,      0, 80),
		list("dexalin plus",  REAGENT_ID_DEXALINP,      0, 80),
		list("antibiotics",   REAGENT_ID_SPACEACILLIN,  0, 80),
		list("antitoxins",    REAGENT_ID_ANTITOXIN,    0, 80),
		list("nutrients",     REAGENT_ID_GLUCOSE,     0, 80),
		list(REAGENT_ID_HYRONALIN,     REAGENT_ID_HYRONALIN,     0, 80),
		list(REAGENT_ID_RADIUM,        REAGENT_ID_RADIUM,        0, 80),
		list("clotting agent", REAGENT_ID_MYELAMINE, 0, 80)
		)

/obj/item/rig_module/voice

	name = "hardsuit voice synthesiser"
	desc = "A speaker box and sound processor."
	icon_state = "megaphone"
	usable = 1
	selectable = 0
	toggleable = 0
	disruptive = 0

	engage_string = "Configure Synthesiser"

	interface_name = "voice synthesiser"
	interface_desc = "A flexible and powerful voice modulator system."

	var/obj/item/voice_changer/voice_holder

/obj/item/rig_module/voice/Initialize(mapload)
	. = ..()
	voice_holder = new(src)
	voice_holder.active = 0

/obj/item/rig_module/voice/installed()
	..()
	holder.speech = src

/obj/item/rig_module/voice/engage()

	if(!..())
		return 0

	var/choice = tgui_alert(usr, "Would you like to toggle the synthesiser or set the name?","",list("Enable","Disable","Set Name","Cancel"))

	if(!choice || choice == "Cancel")
		return 0

	switch(choice)
		if("Enable")
			active = 1
			voice_holder.active = 1
			to_chat(usr, span_blue("You enable the speech synthesiser."))
		if("Disable")
			active = 0
			voice_holder.active = 0
			to_chat(usr, span_blue("You disable the speech synthesiser."))
		if("Set Name")
			var/raw_choice = sanitize(tgui_input_text(usr, "Please enter a new name.", max_length=MAX_NAME_LEN))
			if(!raw_choice)
				return 0
			voice_holder.voice = raw_choice
			to_chat(usr, span_blue("You are now mimicking <B>[voice_holder.voice]</B>."))
	return 1

/obj/item/rig_module/maneuvering_jets

	name = "hardsuit maneuvering jets"
	desc = "A compact gas thruster system for a hardsuit."
	icon_state = "thrusters"
	usable = 1
	toggleable = 1
	selectable = 0
	disruptive = 0

	suit_overlay_active = "maneuvering_active"
	suit_overlay_inactive = null //"maneuvering_inactive"

	engage_string = "Toggle Stabilizers"
	activate_string = "Activate Thrusters"
	deactivate_string = "Deactivate Thrusters"

	interface_name = "maneuvering jets"
	interface_desc = "An inbuilt EVA maneuvering system that runs off the rig air supply."

	var/obj/item/tank/jetpack/rig/jets

/obj/item/rig_module/maneuvering_jets/engage()
	if(!..())
		return 0
	jets.toggle_rockets()
	return 1

/obj/item/rig_module/maneuvering_jets/activate()

	if(active)
		return 0

	active = 1

	spawn(1)
		if(suit_overlay_active)
			suit_overlay = suit_overlay_active
		else
			suit_overlay = null
		holder.update_icon()

	if(!jets.on)
		jets.toggle()
	return 1

/obj/item/rig_module/maneuvering_jets/deactivate()
	if(!..())
		return 0
	if(jets.on)
		jets.toggle()
	return 1

/obj/item/rig_module/maneuvering_jets/Initialize(mapload)
	. = ..()
	jets = new(src)

/obj/item/rig_module/maneuvering_jets/installed()
	..()
	jets.holder = holder
	jets.ion_trail.set_up(holder)

/obj/item/rig_module/maneuvering_jets/removed()
	..()
	jets.holder = null
	jets.ion_trail.set_up(jets)

//Deployable Mop
/obj/item/rig_module/mounted/mop

	name = "mop projector"
	desc = "A powerful mop projector."
	icon_state = "mop"

	activate_string = "Project Mop"
	deactivate_string = "Cancel Mop"

	interface_name = "mop projector"
	interface_desc = "A mop that can be deployed from the hand of the wearer."

	usable = 1
	selectable = 1
	toggleable = 1
	use_power_cost = 5
	active_power_cost = 0
	passive_power_cost = 0

	gun_type = /obj/item/gun/energy/temperature/mounted

/obj/item/rig_module/mounted/mop/process()

	if(holder && holder.wearer)
		if(!(locate(/obj/item/mop_deploy) in holder.wearer))
			deactivate()
			return 0

	return ..()

/obj/item/rig_module/mounted/mop/activate()

	..()

	var/mob/living/M = holder.wearer

	if(M.l_hand && M.r_hand)
		to_chat(M, span_danger("Your hands are full."))
		deactivate()
		return

	var/obj/item/mop_deploy/blade = new(M)
	blade.creator = M
	M.put_in_hands(blade)

/obj/item/rig_module/mounted/mop/deactivate()

	..()

	var/mob/living/M = holder.wearer

	if(!M)
		return

	for(var/obj/item/mop_deploy/blade in M.contents)
		M.drop_from_inventory(blade)
		qdel(blade)


	//Space Cleaner Launcher

/obj/item/rig_module/cleaner_launcher

	name = "mounted space cleaner launcher"
	desc = "A shoulder-mounted micro-cleaner dispenser."
	selectable = 1
	icon_state = "grenade_launcher"

	interface_name = "integrated cleaner launcher"
	interface_desc = "Discharges loaded cleaner grenades against the wearer's location."

	var/fire_force = 30
	var/fire_distance = 10

	charges = list(
		list("cleaner grenade",   "cleaner grenade",   /obj/item/grenade/chem_grenade/cleaner,  9),
		)

/obj/item/rig_module/cleaner_launcher/accepts_item(var/obj/item/input_device, var/mob/living/user)

	if(!istype(input_device) || !istype(user))
		return 0

	var/datum/rig_charge/accepted_item
	for(var/charge in charges)
		var/datum/rig_charge/charge_datum = charges[charge]
		if(input_device.type == charge_datum.product_type)
			accepted_item = charge_datum
			break

	if(!accepted_item)
		return 0

	if(accepted_item.charges >= 5)
		to_chat(user, span_danger("Another grenade of that type will not fit into the module."))
		return 0

	to_chat(user, span_boldnotice("You slot \the [input_device] into the suit module."))
	user.drop_from_inventory(input_device)
	qdel(input_device)
	accepted_item.charges++
	return 1

/obj/item/rig_module/cleaner_launcher/engage(atom/target)

	if(!..())
		return 0

	if(!target)
		return 0

	var/mob/living/carbon/human/H = holder.wearer

	if(!charge_selected)
		to_chat(H, span_danger("You have not selected a grenade type."))
		return 0

	var/datum/rig_charge/charge = charges[charge_selected]

	if(!charge)
		return 0

	if(charge.charges <= 0)
		to_chat(H, span_danger("Insufficient grenades!"))
		return 0

	charge.charges--
	var/obj/item/grenade/new_grenade = new charge.product_type(get_turf(H))
	H.visible_message(span_danger("[H] launches \a [new_grenade]!"))
	new_grenade.activate(H)
	new_grenade.throw_at(target,fire_force,fire_distance)

/obj/item/rig_module/device/paperdispenser
	name = "hardsuit paper dispenser"
	desc = "Crisp sheets."
	icon_state = "paper"
	interface_name = "paper dispenser"
	interface_desc = "Dispenses warm, clean, and crisp sheets of paper."
	engage_string = "Dispense"
	usable = 1
	selectable = 0
	device_type = /obj/item/paper_bin

/obj/item/rig_module/device/paperdispenser/engage(atom/target)

	if(!..() || !device)
		return 0

	if(!target)
		device.attack_hand(holder.wearer)
		return 1

/obj/item/rig_module/device/pen
	name = "mounted pen"
	desc = "For mecha John Hancocks."
	icon_state = "pen"
	interface_name = "mounted pen"
	interface_desc = "Signatures with style(tm)."
	engage_string = "Change color"
	usable = 1
	device_type = /obj/item/pen/multi

/obj/item/rig_module/device/stamp
	name = "mounted internal affairs stamp"
	desc = "DENIED."
	icon_state = "stamp"
	interface_name = "mounted stamp"
	interface_desc = "Leave your mark."
	engage_string = "Toggle stamp type"
	usable = 1
	var/iastamp
	var/deniedstamp

/obj/item/rig_module/device/stamp/Initialize(mapload)
	. = ..()
	iastamp = new /obj/item/stamp/internalaffairs(src)
	deniedstamp = new /obj/item/stamp/denied(src)
	device = iastamp

/obj/item/rig_module/device/stamp/engage(atom/target)
	if(!..() || !device)
		return 0

	if(!target)
		if(device == iastamp)
			device = deniedstamp
			to_chat(holder.wearer, span_notice("Switched to denied stamp."))
		else if(device == deniedstamp)
			device = iastamp
			to_chat(holder.wearer, span_notice("Switched to internal affairs stamp."))
		return 1

/obj/item/rig_module/sprinter
	name = "sprint module"
	desc = "A robust hardsuit-integrated sprint module."
	icon_state = "sprinter"

	var/sprint_speed = 1

	toggleable = 1
	disruptable = 1
	disruptive = 0

	use_power_cost = 50
	active_power_cost = 5
	passive_power_cost = 0
	module_cooldown = 30

	activate_string = "Enable Sprint"
	deactivate_string = "Disable Sprint"

	interface_name = "sprint system"
	interface_desc = "Increases power to the suit's actuators, allowing faster movement."

/obj/item/rig_module/sprinter/activate()

	if(!..())
		return 0

	var/mob/living/carbon/human/H = holder.wearer

	to_chat(H, span_boldnotice("You activate the suit's sprint mode."))

	holder.slowdown = initial(holder.slowdown) - sprint_speed

/obj/item/rig_module/sprinter/deactivate()

	if(!..())
		return 0

	var/mob/living/carbon/human/H = holder.wearer

	to_chat(H, span_danger("Your hardsuit returns to normal speed."))

	holder.slowdown = initial(holder.slowdown)
