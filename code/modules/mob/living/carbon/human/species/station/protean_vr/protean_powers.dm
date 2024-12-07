#define PER_LIMB_STEEL_COST SHEET_MATERIAL_AMOUNT
////
//  One-part Refactor
////
/mob/living/carbon/human/proc/nano_partswap()
	set name = "Ref - Single Limb"
	set desc = "Allows you to replace and reshape your limbs as you see fit."
	set category = "Abilities"
	set hidden = TRUE

<<<<<<< HEAD
	if(stat)
		to_chat(src,span_warning("You must be awake and standing to perform this action!"))
		return

	if(!isturf(loc))
		to_chat(src,span_warning("You need more space to perform this action!"))
=======
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	if(nano_dead_check(protie))
		to_chat(protie, span_warning("You need to be repaired first before you can act!"))
		return
	if(stat)
		to_chat(protie,span_warning("You must be awake and standing to perform this action!"))
		return

	if(!isturf(protie.loc))
		to_chat(protie,span_warning("You need more space to perform this action!"))
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
<<<<<<< HEAD
		to_chat(src,span_warning("You don't have a working refactory module!"))
		return

	var/choice = tgui_input_list(src,"Pick the bodypart to change:", "Refactor - One Bodypart", species.has_limbs)
=======
		to_chat(protie,span_warning("You don't have a working refactory module!"))
		return

	var/choice = tgui_input_list(protie,"Pick the bodypart to change:", "Refactor - One Bodypart", species.has_limbs)
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
	if(!choice)
		return

	//Organ is missing, needs restoring
	if(!organs_by_name[choice] || istype(organs_by_name[choice], /obj/item/organ/external/stump)) //allows limb stumps to regenerate like removed limbs.
		if(refactory.get_stored_material(MAT_STEEL) < PER_LIMB_STEEL_COST)
<<<<<<< HEAD
			to_chat(src,span_warning("You're missing that limb, and need to store at least [PER_LIMB_STEEL_COST] steel to regenerate it."))
			return
		var/regen = tgui_alert(src,"That limb is missing, do you want to regenerate it in exchange for [PER_LIMB_STEEL_COST] steel?","Regenerate limb?",list("Yes","No"))
=======
			to_chat(protie,span_warning("You're missing that limb, and need to store at least [PER_LIMB_STEEL_COST] steel to regenerate it."))
			return
		var/regen = tgui_alert(protie,"That limb is missing, do you want to regenerate it in exchange for [PER_LIMB_STEEL_COST] steel?","Regenerate limb?",list("Yes","No"))
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
		if(regen != "Yes")
			return
		if(!refactory.use_stored_material(MAT_STEEL,PER_LIMB_STEEL_COST))
			return
		if(organs_by_name[choice])
			var/obj/item/organ/external/oldlimb = organs_by_name[choice]
			oldlimb.removed()
			qdel(oldlimb)

		var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
		active_regen = TRUE
		if(do_after(blob,5 SECONDS))
			var/list/limblist = species.has_limbs[choice]
			var/limbpath = limblist["path"]
			var/obj/item/organ/external/new_eo = new limbpath(src)
			organs_by_name[choice] = new_eo
			new_eo.robotize(synthetic ? synthetic.company : null) //Use the base we started with
			new_eo.sync_colour_to_human(src)
			regenerate_icons()
		active_regen = FALSE
		nano_outofblob(blob)
		return

	//Organ exists, let's reshape it
	var/list/usable_manufacturers = list()
	for(var/company in chargen_robolimbs)
		var/datum/robolimb/M = chargen_robolimbs[company]
		if(!(choice in M.parts))
			continue
		if(species?.base_species in M.species_cannot_use)
			continue
		if(M.whitelisted_to && !(ckey in M.whitelisted_to))
			continue
		usable_manufacturers[company] = M
	if(!usable_manufacturers.len)
		return
<<<<<<< HEAD
	var/manu_choice = tgui_input_list(src, "Which manufacturer do you wish to mimic for this limb?", "Manufacturer for [choice]", usable_manufacturers)
=======
	var/manu_choice = tgui_input_list(protie, "Which manufacturer do you wish to mimic for this limb?", "Manufacturer for [choice]", usable_manufacturers)
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)

	if(!manu_choice)
		return //Changed mind

	var/obj/item/organ/external/eo = organs_by_name[choice]
	if(!eo)
		return //Lost it meanwhile

	eo.robotize(manu_choice)
	visible_message(span_infoplain(span_bold("[src]") + "'s [choice] loses its shape, then reforms."))
	update_icons_body()

<<<<<<< HEAD
////
//  Full Refactor
////
/mob/living/carbon/human/proc/nano_regenerate() //fixed the proc, it used to leave active_regen true.
	set name = "Ref - Whole Body"
	set desc = "Allows you to regrow limbs and replace organs, given you have enough materials."
	set category = "Abilities"
	set hidden = TRUE

	if(stat)
		to_chat(src,span_warning("You must be awake and standing to perform this action!"))
		return

	if(!isturf(loc))
		to_chat(src,span_warning("You need more space to perform this action!"))
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,span_warning("You don't have a working refactory module!"))
		return

	//Already regenerating
	if(active_regen)
		to_chat(src, span_warning("You are already refactoring!"))
		return

	var/swap_not_rebuild = tgui_alert(src,"Do you want to rebuild, or reshape?","Rebuild or Reshape",list("Reshape","Cancel","Rebuild"))
	if(!swap_not_rebuild || swap_not_rebuild == "Cancel")
		return
	if(swap_not_rebuild == "Reshape")
		var/list/usable_manufacturers = list()
		for(var/company in chargen_robolimbs)
			var/datum/robolimb/M = chargen_robolimbs[company]
			if(!(BP_TORSO in M.parts))
				continue
			if(species?.base_species in M.species_cannot_use)
				continue
			if(M.whitelisted_to && !(ckey in M.whitelisted_to))
				continue
			usable_manufacturers[company] = M
		if(!usable_manufacturers.len)
			return
		var/manu_choice = tgui_input_list(src, "Which manufacturer do you wish to mimic?", "Manufacturer", usable_manufacturers)

		if(!manu_choice)
			return //Changed mind
		if(!organs_by_name[BP_TORSO])
			return //Ain't got a torso!

		var/obj/item/organ/external/torso = organs_by_name[BP_TORSO]
		to_chat(src, span_danger("Remain still while the process takes place! It will take 5 seconds."))
		visible_message(span_infoplain(span_bold("[src]") + "'s form collapses into an amorphous blob of black ichor..."))

		var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
		active_regen = TRUE
		if(do_after(blob,5 SECONDS))
			synthetic = usable_manufacturers[manu_choice]
			torso.robotize(manu_choice) //Will cascade to all other organs.
			regenerate_icons()
			visible_message(span_infoplain(span_bold("[src]") + "'s form reshapes into a new one..."))
		active_regen = FALSE
		nano_outofblob(blob)
		return

	//Not enough resources (AND spends the resources, should be the last check)
	if(!refactory.use_stored_material(MAT_STEEL,refactory.max_storage))
		to_chat(src, span_warning("You need to be maxed out on normal metal to do this!"))
		return

	var/delay_length = round(active_regen_delay * species.active_regen_mult)
	to_chat(src, span_danger("Remain still while the process takes place! It will take [delay_length/10] seconds."))
	visible_message(span_infoplain(span_bold("[src]") + "'s form begins to shift and ripple as if made of oil..."))
	active_regen = TRUE

	var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
	if(do_after(blob, delay_length, null, 0))
		if(stat != DEAD && refactory)
			var/list/holder = refactory.materials
			species.create_organs(src)
			var/obj/item/organ/external/torso = organs_by_name[BP_TORSO]
			torso.robotize() //synthetic wasn't defined here.
			LAZYCLEARLIST(blood_DNA)
			LAZYCLEARLIST(feet_blood_DNA)
			blood_color = null
			feet_blood_color = null
			regenerate_icons() //Probably worth it, yeah.
			var/obj/item/organ/internal/nano/refactory/new_refactory = locate() in internal_organs
			if(!new_refactory)
				log_debug("[src] protean-regen'd but lacked a refactory when done.")
			else
				new_refactory.materials = holder
			to_chat(src, span_notice("Your refactoring is complete.")) //Guarantees the message shows no matter how bad the timing.
			to_chat(blob, span_notice("Your refactoring is complete!"))
		else
			to_chat(src,  span_critical("Your refactoring has failed."))
			to_chat(blob, span_critical("Your refactoring has failed!"))
	else
		to_chat(src,  span_critical("Your refactoring is interrupted."))
		to_chat(blob, span_critical("Your refactoring is interrupted!"))
	active_regen = FALSE
	nano_outofblob(blob)


=======
/mob/living/carbon/human/proc/nano_regenerate()
	set name = "Total Reassembly"
	set desc = "Fully repair yourself or reload your appearance from whatever character slot you have loaded."
	//set category = "Abilities.Protean"
	set hidden = 1
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	var/input = tgui_alert(protie,{"Do you want to rebuild or reassemble yourself?
	Rebuilding will cost 10,000 steel and will rebuild all of your limbs as well as repair all damage over a 40s period.
	Reassembling costs no steel and will copy the appearance data of your currently loaded save slot."},"Reassembly",list("Rebuild","Reassemble","Cancel"))
	if(input == "Cancel" || !input)
		return
	if(input == "Rebuild")
		var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
		if(refactory.get_stored_material(MAT_STEEL) >= 10000)
			to_chat(protie, span_notify("You begin to rebuild. You will need to remain still."))
			if(do_after(protie, 400,exclusive = TASK_ALL_EXCLUSIVE))
				if(species?:OurRig)	//Unsafe, but we should only ever be using this with a Protean
					species?:OurRig?:make_alive(src,1)	//Re-using this proc
					refactory.use_stored_material(MAT_STEEL,refactory.get_stored_material(MAT_STEEL))	//Use all of our steel
				else
					to_chat(protie, span_userdanger("Somehow, you are missing your protean rig. You are unable to rebuild without one."))
		else
			to_chat(protie, span_warning("You do not have enough steel stored for this operation."))
	else
		input = tgui_alert(protie,{"Include Flavourtext?"},"Reassembly",list("Yes","No","Cancel"))
		if(input == "Cancel" || !input)
			return
		var/flavour = 0
		if(input == "Yes")
			flavour = 1
		input = tgui_alert(protie,{"Include OOC notes?"},"Reassembly",list("Yes","No","Cancel"))
		if(input == "Cancel" || !input)
			return
		var/oocnotes = 0
		if(input == "Yes")
			oocnotes = 1
		to_chat(protie, span_notify("You begin to reassemble. You will need to remain still."))
		protie.visible_message(span_notify("[protie] rapidly contorts and shifts!"), span_danger("You begin to reassemble."))
		if(do_after(protie, 40,exclusive = TASK_ALL_EXCLUSIVE))
			if(protie.client.prefs)	//Make sure we didn't d/c
				var/obj/item/rig/protean/Rig = species?:OurRig
				protie.client.prefs.vanity_copy_to(src, FALSE, flavour, oocnotes, TRUE)
				species?:OurRig = Rig	//Get a reference to our Rig and put it back after reassembling
				protie.visible_message(span_notify("[protie] adopts a new form!"), span_danger("You have reassembled."))


/mob/living/carbon/human/proc/nano_copy_body()
	set name = "Copy Form"
	set desc = "If you are aggressively grabbing someone, with their consent, you can turn into a copy of them. (Without their name)."
	//set category = "Abilities.Protean"
	set hidden = 1
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form

	var/grabbing_but_not_enough
	var/mob/living/carbon/human/victim = null
	for(var/obj/item/grab/G in protie)
		if(G.state < GRAB_AGGRESSIVE)
			grabbing_but_not_enough = TRUE
			return
		else
			victim = G.affecting
	if (!victim)
		if (grabbing_but_not_enough)
			to_chat(protie, span_warning("You need a better grip to do that!"))
		else
			to_chat(protie, span_notice("You need to be aggressively grabbing someone before you can copy their form."))
		return
	if (!istype(victim))
		to_chat(protie, span_warning("You can only perform this on human mobs!"))
		return
	if (!victim.client)
		to_chat(protie, span_notice("The person you try this on must have a client!"))
		return


	to_chat(protie, span_notice("Waiting for other person's consent."))
	var/consent = tgui_alert(victim, "Allow [src] to copy what you look like?", "Consent", list("Yes", "No"))
	if (consent != "Yes")
		to_chat(protie, span_notice("They declined your request."))
		return

	var/input = tgui_alert(protie,{"Copy [victim]'s flavourtext?"},"Copy Form",list("Yes","No","Cancel"))
	if(input == "Cancel" || !input)
		return
	var/flavour = 0
	if(input == "Yes")
		flavour = 1

	var/checking = FALSE
	for(var/obj/item/grab/G in protie)
		if(G.affecting == victim && G.state >= GRAB_AGGRESSIVE)
			checking = TRUE
	if (!checking)
		to_chat(protie, span_warning("You lost your grip on [victim]!"))
		return

	to_chat(protie, span_notify("You begin to reassemble into [victim]. You will need to remain still."))
	protie.visible_message(span_notify("[protie] rapidly contorts and shifts!"), span_danger("You begin to reassemble into [victim]."))
	if(do_after(protie, 40,exclusive = TASK_ALL_EXCLUSIVE))
		checking = FALSE
		for(var/obj/item/grab/G in protie)
			if(G.affecting == victim && G.state >= GRAB_AGGRESSIVE)
				checking = TRUE
		if (!checking)
			to_chat(protie, span_warning("You lost your grip on [victim]!"))
			return
		if(protie.client)	//Make sure we didn't d/c
			var/obj/item/rig/protean/Rig = species?:OurRig
			transform_into_other_human(victim, FALSE, flavour, TRUE)
			species?:OurRig = Rig	//Get a reference to our Rig and put it back after reassembling
			protie.visible_message(span_notify("[protie] adopts the form of [victim]!"), span_danger("You have reassembled into [victim]."))

>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
////
//  Storing metal
////
/mob/living/carbon/human/proc/nano_metalnom()
	set name = "Ref - Store Metals"
	set desc = "If you're holding a stack of material, you can consume some and store it for later."
<<<<<<< HEAD
	set category = "Abilities"
	set hidden = TRUE
=======
	//set category = "Abilities.Protean"
	set hidden = 1

	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	if(nano_dead_check(protie))
		to_chat(protie, span_warning("You need to be repaired first before you can act!"))
		return
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
<<<<<<< HEAD
		to_chat(src,span_warning("You don't have a working refactory module!"))
		return

	var/held = get_active_hand()
	if(!istype(held,/obj/item/stack/material))
		to_chat(src,span_warning("You aren't holding a stack of materials in your active hand...!"))
=======
		to_chat(protie,span_warning("You don't have a working refactory module!"))
		return

	var/held = protie.get_active_hand()
	if(!istype(held,/obj/item/stack/material))
		to_chat(protie,span_warning("You aren't holding a stack of materials in your active hand!"))
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
		return

	var/obj/item/stack/material/matstack = held
	var/substance = matstack.material.name
	var allowed = FALSE
	for(var/material in PROTEAN_EDIBLE_MATERIALS)
		if(material == substance) allowed = TRUE
	if(!allowed)
<<<<<<< HEAD
		to_chat(src,span_warning("You can't process [substance]!"))
		return //Only a few things matter, the rest are best not cluttering the lists.

	var/howmuch = tgui_input_number(src,"How much do you want to store? (0-[matstack.get_amount()])","Select amount",null,matstack.get_amount(),0)
	if(!howmuch || matstack != get_active_hand() || howmuch > matstack.get_amount())
=======
		to_chat(protie,span_warning("You can't process [substance]!"))
		return

	var/howmuch = tgui_input_number(protie,"How much do you want to store? (0-[matstack.get_amount()])","Select amount",null,matstack.get_amount())
	if(!howmuch || matstack != protie.get_active_hand() || howmuch > matstack.get_amount())
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)
		return //Quietly fail

	var/actually_added = refactory.add_stored_material(substance,howmuch*matstack.perunit)
	matstack.use(CEILING((actually_added/matstack.perunit), 1))
	if(actually_added && actually_added < howmuch)
<<<<<<< HEAD
		to_chat(src,span_warning("Your refactory module is now full, so only [actually_added] units were stored."))
		visible_message(span_notice("[src] nibbles some of the [substance] right off the stack!"))
	else if(actually_added)
		to_chat(src,span_notice("You store [actually_added] units of [substance]."))
		visible_message(span_notice("[src] devours some of the [substance] right off the stack!"))
	else
		to_chat(src,span_notice("You're completely capped out on [substance]!"))
=======
		to_chat(protie,span_warning("Your refactory module is now full, so only [actually_added] units were stored."))
		visible_message(span_notice("[protie] nibbles some of the [substance] right off the stack!"))
	else if(actually_added)
		to_chat(protie,span_notice("You store [actually_added] units of [substance]."))
		visible_message(span_notice("[protie] devours some of the [substance] right off the stack!"))
	else
		to_chat(protie,span_notice("You're completely capped out on [substance]!"))
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)

////
//  Blob Form
////
/mob/living/carbon/human/proc/nano_blobform()
	set name = "Toggle Blobform"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"
	set hidden = TRUE

	var/atom/movable/to_locate = temporary_form || src
	if(!isturf(to_locate.loc))
		to_chat(to_locate,span_warning("You need more space to perform this action!"))
		return

	//Blob form
	if(temporary_form)
		if(health < maxHealth*0.5)
			to_chat(temporary_form,span_warning("You need to regenerate more nanites first!"))
		else if(temporary_form.stat)
			to_chat(temporary_form,span_warning("You can only do this while not stunned."))
		else
			nano_outofblob(temporary_form)

	//Human form
	else if(stat)
		to_chat(src,span_warning("You can only do this while not stunned."))
		return
	else
		nano_intoblob()

////
//  Change fitting
////
/mob/living/carbon/human/proc/nano_change_fitting()
	set name = "Change Species Fit"
	set desc = "Tweak your shape to change what suits you fit into (and their sprites!)."
	set category = "Abilities"

	if(stat)
		to_chat(src,span_warning("You must be awake and standing to perform this action!"))
		return

	var/new_species = tgui_input_list(src, "Please select a species to emulate.", "Shapeshifter Body", GLOB.playable_species)
	if(new_species)
		species?.base_species = new_species // Really though you better have a species
		regenerate_icons() //Expensive, but we need to recrunch all the icons we're wearing

////
//  Change size
////
/mob/living/carbon/human/proc/nano_set_size()
	set name = "Adjust Volume"
	set category = "Abilities"
	set hidden = TRUE

<<<<<<< HEAD
	var/mob/living/user = temporary_form || src

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(user,span_warning("You don't have a working refactory module!"))
		return

	var/nagmessage = "Adjust your mass to be a size between 25 to 200% (or between 1 to 600% in dorms area). Up-sizing consumes metal, downsizing returns metal."
	var/new_size = tgui_input_number(user, nagmessage, "Pick a Size", user.size_multiplier*100, 600, 1)
	if(!new_size || !size_range_check(new_size))
		return

	var/size_factor = new_size/100

	//Will be: -1.75 for 200->25, and 1.75 for 25->200
	var/sizediff = size_factor - user.size_multiplier

	//Negative if shrinking, positive if growing
	//Will be (PLSC*2)*-1.75 to 1.75
	//For 2000 PLSC that's -7000 to 7000
	var/cost = (PER_LIMB_STEEL_COST*2)*sizediff

	//Sizing up
	if(cost > 0)
		if(refactory.use_stored_material(MAT_STEEL,cost))
			user.resize(size_factor, ignore_prefs = TRUE)
		else
			to_chat(user,span_warning("That size change would cost [cost] steel, which you don't have."))
	//Sizing down (or not at all)
	else if(cost <= 0)
		cost = abs(cost)
		var/actually_added = refactory.add_stored_material(MAT_STEEL,cost)
		user.resize(size_factor, ignore_prefs = TRUE)
		if(actually_added != cost)
			to_chat(user,span_warning("Unfortunately, [cost-actually_added] steel was lost due to lack of storage space."))

	user.visible_message(span_notice("Black mist swirls around [user] as they change size."))
=======
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	if(nano_dead_check(src))
		to_chat(protie, span_warning("You need to be repaired first before you can act!"))
		return
	to_chat(protie, span_notice("You rapidly condense into your module."))
	if(forced || do_after(protie,20,exclusive = TASK_ALL_EXCLUSIVE))
		if(!temporary_form)	//If you're human, force you into blob form before rig'ing
			nano_blobform(forced)
		spawn(2)

		if(istype(src.species, /datum/species/protean))
			var/datum/species/protean/S = src.species
			var/mob/living/simple_mob/protean_blob/P = temporary_form
			if(S.OurRig) //Do we even have a RIG?
				if(P.loc == S.OurRig)	//we're inside our own RIG
					if(ismob(S.OurRig.loc))
						var/mob/m = S.OurRig.loc
						m.drop_from_inventory(S.OurRig)
					if(S.OurRig.wearer) //We're being worn. Engulf em', if prefs align.. otherwise just drop off.
						var/mob/living/carbon/human/victim = S.OurRig.wearer
						if(P.can_be_drop_pred && victim.devourable && victim.can_be_drop_prey)
							if(P.vore_selected)
								perform_the_nom(P,victim,P,P.vore_selected,1)
					P.forceMove(get_turf(S.OurRig))
					S.OurRig.forceMove(src)
					S.OurRig.myprotean = src
					src.equip_to_slot_if_possible(S.OurRig, slot_back)
					S.OurRig.Moved()
					P.has_hands = 1
				else	//We're not in our own RIG
					if(P.stat || P.resting && !forced)
						to_chat(P,span_warning("You can only do this while not stunned."))
					else
						if(P.l_hand)
							P.drop_l_hand()
						if(P.r_hand)
							P.drop_r_hand()
						P.has_hands = 0
						S.OurRig.myprotean = P
						src.drop_from_inventory(S.OurRig)
						P.forceMove(S.OurRig)
						S.OurRig.canremove = 1
				P.reset_view()
			else	//Make one if not
				to_chat(temporary_form, span_warning("Somehow, your RIG got disconnected from your species. This may have been caused by an admin heal. A new one has been created for you, contact a coder."))
				new /obj/item/rig/protean(src,src)
	else
		to_chat(protie, span_warning("You must remain still to condense!"))

/mob/living/carbon/human/proc/appearance_switch()
	set name = "Switch Blob Appearance"
	set desc = "Allows a protean blob to switch its outwards appearance."
	//set category = "Abilities.Protean"
	set hidden = 1
	var/datum/species/protean/S = src.species
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	var/list/icon_choices = list(
			"Primary" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "primary"),
			"Highlight" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "highlight"),
			"puddle1" = image(icon = 'icons/mob/species/protean/protean_powers.dmi', icon_state = "blob"),
			"puddle0" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "puddle"),
			"shadow" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "shadow"),
			"clean" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "clean"),
			"swarm" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "swarm"),
			"slime" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "slime"),
			"chaos" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "chaos"),
			"cloud" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "cloud"),
			/*"catslug" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "catslug"),
			"cat" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "cat"),
			"mouse" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "mouse"),
			"rabbit" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "rabbit"),
			"bear" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "bear"),
			"fen" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "fen"),
			"fox" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "fox"),
			"raptor" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "raptor"),
			"rat" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "rat", pixel_x = -16),
			"lizard" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "lizard", pixel_x = -16),
			"wolf" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "wolf", pixel_x = -16),
			//"drake" = image(icon = 'modular_chomp/icons/mob/species/protean/protean64x64.dmi', icon_state = "drake", pixel_x = -16),
			"teppi" = image(icon = 'icons/mob/species/protean/protean64x64.dmi', icon_state = "teppi", pixel_x = -16),
			"panther" = image(icon = 'icons/mob/species/protean/protean64x64.dmi', icon_state = "panther", pixel_x = -16),
			"robodrgn" = image(icon = 'icons/mob/species/protean/protean128x64.dmi', icon_state = "robodrgn", pixel_x = -48),
			"Dragon" = image(icon = 'icons/mob/bigdragon_small.dmi', icon_state = "dragon_small")*/
			)
	var/blobstyle = show_radial_menu(protie, protie, icon_choices, require_near = TRUE, tooltips = FALSE)
	if(!blobstyle || QDELETED(protie) || protie.incapacitated())
		return FALSE
	switch(blobstyle)
		if("Dragon")	//Fuck it, we ball
			var/list/options = list("Underbelly","Body","Ears","Mane","Horns","Eyes")
			for(var/option in options)
				LAZYSET(options, option, image('icons/effects/bigdragon_labels.dmi', option))
			var/choice = show_radial_menu(protie, protie, options, radius = 60)
			if(!choice || QDELETED(protie) || protie.incapacitated())
				return FALSE
			. = TRUE
			var/list/underbelly_styles = list(
				"dragon_underSmooth",
				"dragon_underPlated"
			)
			var/list/body_styles = list(
				"dragon_bodySmooth",
				"dragon_bodyScaled"
			)
			var/list/ear_styles = list(
				"dragon_earsNormal"
			)
			var/list/mane_styles = list(
				"dragon_maneNone",
				"dragon_maneShaggy",
				"dragon_maneDorsalfin"
			)
			var/list/horn_styles = list(
				"dragon_hornsPointy",
				"dragon_hornsCurved",
				"dragon_hornsCurved2",
				"dragon_hornsJagged",
				"dragon_hornsCrown",
				"dragon_hornsSkull"
			)
			var/list/eye_styles = list(
				"dragon_eyesNormal"
			)
			switch(choice)
				if("Underbelly")
					options = underbelly_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -48)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick underbelly color:","Underbelly Color", S.dragon_overlays[1]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[1] = choice
					S.dragon_overlays[S.dragon_overlays[1]] = new_color
				if("Body")
					options = body_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -48)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick body color:","Body Color", S.dragon_overlays[2]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[2] = choice
					S.dragon_overlays[S.dragon_overlays[2]] = new_color
				if("Ears")
					options = ear_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -76, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick ear color:","Ear Color", S.dragon_overlays[3]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[3] = choice
					S.dragon_overlays[S.dragon_overlays[3]] = new_color
				if("Mane")
					options = mane_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -76, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick mane color:","Mane Color", S.dragon_overlays[4]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[4] = choice
					S.dragon_overlays[S.dragon_overlays[4]] = new_color
				if("Horns")
					options = horn_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -86, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick horn color:","Horn Color", S.dragon_overlays[5]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[5] = choice
					S.dragon_overlays[S.dragon_overlays[5]] = new_color
				if("Eyes")
					options = eye_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 2, pixel_x = -48, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = input("Pick eye color:","Eye Color", S.dragon_overlays[6]) as null|color
					if(!new_color)
						return 0
					S.dragon_overlays[6] = choice
					S.dragon_overlays[S.dragon_overlays[6]] = new_color
			S.blob_appearance = "dragon"
		if("Primary")
			var/new_color = input("Pick primary color:","Protean Primary", "#FF0000") as null|color
			if(!new_color)
				return
			S.blob_color_1 = new_color
		if("Highlight")
			var/new_color = input("Pick highlight color:","Protean Highlight", "#FF0000") as null|color
			if(!new_color)
				return
			S.blob_color_2 = new_color
		else
			S.blob_appearance = blobstyle
	if(temporary_form)
		if(blobstyle)
			temporary_form.update_icon()
			if(istype(temporary_form.loc, /obj/item/holder/protoblob))
				var/obj/item/holder/protoblob/PB = temporary_form.loc
				PB.item_state = S.blob_appearance

/mob/living/carbon/human/proc/nano_latch()
	set name = "Latch/Unlatch host"
	set desc = "Allows a protean to forcibly latch or unlatch from a host."
	//set category = "Abilities.Protean"
	set hidden = 1
	var/mob/living/protie = src
	var/mob/living/carbon/human/target
	var/datum/species/protean/S = src.species
	if(nano_dead_check(src))
		return
	if(temporary_form)
		protie = temporary_form
		if(protie.loc == S.OurRig)
			target = S.OurRig.wearer
			if(target)
				target.drop_from_inventory(S.OurRig)
				to_chat(protie, span_notice("You detach from your host."))
			else
				to_chat(protie, span_warning("You aren't being worn, dummy."))
			return
	var/obj/held_item = protie.get_active_hand()
	if(istype(held_item,/obj/item/grab))
		var/obj/item/grab/G = held_item
		if(istype(G.affecting, /mob/living/carbon/human))
			target = G.affecting
			if(istype(target.species, /datum/species/protean))
				to_chat(protie, span_danger("You can't latch onto a fellow Protean!"))
				return
			if(G.loc == protie && G.state >= GRAB_AGGRESSIVE)
				protie.visible_message(span_warning("[protie] is attempting to latch onto [target]!"), span_danger("You attempt to latch onto [target]!"))
				if(do_after(protie, 50, target,exclusive = TASK_ALL_EXCLUSIVE))
					if(G.loc == protie && G.state >= GRAB_AGGRESSIVE)
						target.drop_from_inventory(target.back)
						protie.visible_message(span_danger("[protie] latched onto [target]!"), span_danger("You latch yourself onto [target]!"))
						target.Weaken(3)
						nano_rig_transform(1)
						spawn(5)	//Have to give time for the above proc to resolve
						//S.OurRig.forceMove(target)
						target.equip_to_slot(S.OurRig, slot_back)
						S.OurRig.Moved()
						spawn(1)	//Same here :(
						S.OurRig.wearer = target
			else
				to_chat(protie, span_warning("You need a more aggressive grab to do this!"))
		else
			to_chat(protie, span_warning("You can only latch onto humanoid mobs!"))
	else
		to_chat(protie, span_warning("You need to be grabbing a humanoid mob aggressively to latch onto them."))
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)

/// /// /// A helper to reuse
/mob/living/proc/nano_get_refactory(obj/item/organ/internal/nano/refactory/R)
	if(istype(R))
		if(!(R.status & ORGAN_DEAD))
			return R
	return

/mob/living/simple_mob/protean_blob/nano_get_refactory()
	if(refactory)
		return ..(refactory)
	if(humanform)
		return humanform.nano_get_refactory()

/mob/living/carbon/human/nano_get_refactory()
	return ..(locate(/obj/item/organ/internal/nano/refactory) in internal_organs)

<<<<<<< HEAD
=======
//I hate this whole bit but I want proteans to be able to "die" and still be "alive" in their blob as a suit
/mob/living/carbon/human/proc/nano_dead_check(var/mob/living/protie)
	if(istype(src.species, /datum/species/protean))
		var/datum/species/protean/S = src.species
		if(S.pseudodead)
			return 1
	return 0
>>>>>>> ada9db131a (Merge pull request #16679 from ShadowLarkens/516more)


/// /// /// Ability objects for stat panel
/obj/effect/protean_ability
	name = "Activate"
	desc = ""
	icon = 'icons/mob/species/protean/protean_powers.dmi'
	var/ability_name
	var/to_call

/obj/effect/protean_ability/proc/atom_button_text()
	return src

/obj/effect/protean_ability/Click(var/location, var/control, var/params)
	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(usr,span_notice(span_bold("[ability_name]") + " - [desc]"))
	else
		//Humanform using it
		if(ishuman(usr))
			do_ability(usr)
		//Blobform using it
		else
			var/mob/living/simple_mob/protean_blob/blob = usr
			do_ability(blob.humanform)

/obj/effect/protean_ability/proc/do_ability(var/mob/living/L)
	if(istype(L))
		call(L,to_call)()
	return FALSE

/// The actual abilities
/obj/effect/protean_ability/into_blob
	ability_name = "Toggle Blobform"
	desc = "Discard your shape entirely, changing to a low-energy blob that can fit into small spaces. You'll consume steel to repair yourself in this form."
	icon_state = "blob"
	to_call = /mob/living/carbon/human/proc/nano_blobform

/obj/effect/protean_ability/change_volume
	ability_name = "Change Volume"
	desc = "Alter your size by consuming steel to produce additional nanites, or regain steel by reducing your size and reclaiming them."
	icon_state = "volume"
	to_call = /mob/living/carbon/human/proc/nano_set_size

/obj/effect/protean_ability/reform_limb
	ability_name = "Ref - Single Limb"
	desc = "Rebuild or replace a single limb, assuming you have 2000 steel."
	icon_state = "limb"
	to_call = /mob/living/carbon/human/proc/nano_partswap

/obj/effect/protean_ability/reform_body
	ability_name = "Ref - Whole Body"
	desc = "Rebuild your entire body into whatever design you want, assuming you have 10,000 metal."
	icon_state = "body"
	to_call = /mob/living/carbon/human/proc/nano_regenerate

/obj/effect/protean_ability/metal_nom
	ability_name = "Ref - Store Metals"
	desc = "Store the metal you're holding. Your refactory can only store steel, and all other metals will be converted into nanites ASAP for various effects."
	icon_state = "metal"
	to_call = /mob/living/carbon/human/proc/nano_metalnom

#undef PER_LIMB_STEEL_COST
