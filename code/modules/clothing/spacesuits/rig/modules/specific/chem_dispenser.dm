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

/obj/item/rig_module/chem_dispenser/injector/advanced/empty
	charges = list(
		list(REAGENT_ID_TRICORDRAZINE, REAGENT_ID_TRICORDRAZINE, 0, 0),
		list(REAGENT_ID_TRAMADOL,      REAGENT_ID_TRAMADOL,      0, 0),
		list("dexalin plus",  REAGENT_ID_DEXALINP,      0, 0),
		list("antibiotics",   REAGENT_ID_SPACEACILLIN,  0, 0),
		list("antitoxins",    REAGENT_ID_ANTITOXIN,    0, 0),
		list("nutrients",     REAGENT_ID_GLUCOSE,     0, 0),
		list(REAGENT_ID_HYRONALIN,     REAGENT_ID_HYRONALIN,     0, 0),
		list(REAGENT_ID_RADIUM,        REAGENT_ID_RADIUM,        0, 0),
		list("clotting agent", REAGENT_ID_MYELAMINE, 0, 0)
		)
