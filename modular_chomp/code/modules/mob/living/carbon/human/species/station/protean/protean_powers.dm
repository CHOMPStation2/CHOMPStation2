//TODO: Replace ventcrawl with morphing. /mob/living/simple_mob/vore/hostile/morph
#define PER_LIMB_STEEL_COST SHEET_MATERIAL_AMOUNT
////
//  One-part Refactor
////
/mob/living/carbon/human/proc/nano_partswap()
	set name = "Ref - Single Limb"
	set desc = "Allows you to replace and reshape your limbs as you see fit."
	set category = "Abilities"
	set hidden = 1

	var/mob/living/caller = src
	if(temporary_form)
		caller = temporary_form
	if(stat)
		to_chat(caller,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	if(!isturf(caller.loc))
		to_chat(caller,"<span class='warning'>You need more space to perform this action!</span>")
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(caller,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	var/choice = tgui_input_list(src,"Pick the bodypart to change:", "Refactor - One Bodypart", species.has_limbs)
	if(!choice)
		return

	//Organ is missing, needs restoring
	if(!organs_by_name[choice] || istype(organs_by_name[choice], /obj/item/organ/external/stump)) //allows limb stumps to regenerate like removed limbs.
		if(refactory.get_stored_material(MAT_STEEL) < PER_LIMB_STEEL_COST)
			to_chat(caller,"<span class='warning'>You're missing that limb, and need to store at least [PER_LIMB_STEEL_COST] steel to regenerate it.</span>")
			return
		var/regen = tgui_alert(caller,"That limb is missing, do you want to regenerate it in exchange for [PER_LIMB_STEEL_COST] steel?","Regenerate limb?",list("Yes","No"))
		if(regen != "Yes")
			return
		if(!refactory.use_stored_material(MAT_STEEL,PER_LIMB_STEEL_COST))
			return
		if(organs_by_name[choice])
			var/obj/item/organ/external/oldlimb = organs_by_name[choice]
			oldlimb.removed()
			qdel(oldlimb)
		var/mob/living/simple_mob/protean_blob/blob
		if(!temporary_form)
			blob = nano_intoblob()
		else
			blob = temporary_form
		active_regen = 1
		if(do_after(blob,5 SECONDS))
			var/list/limblist = species.has_limbs[choice]
			var/limbpath = limblist["path"]
			var/obj/item/organ/external/new_eo = new limbpath(src)
			organs_by_name[choice] = new_eo
			new_eo.robotize(synthetic ? synthetic.company : null) //Use the base we started with
			new_eo.sync_colour_to_human(src)
			regenerate_icons()
		active_regen = 0
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
	var/manu_choice = tgui_input_list(caller, "Which manufacturer do you wish to mimic for this limb?", "Manufacturer for [choice]", usable_manufacturers)

	if(!manu_choice)
		return //Changed mind

	var/obj/item/organ/external/eo = organs_by_name[choice]
	if(!eo)
		return //Lost it meanwhile

	eo.robotize(manu_choice)
	update_icons_body()

/mob/living/carbon/human/proc/nano_regenerate()
	set name = "Total Reassembly (wip)"
	set desc = "Completely reassemble yourself from whatever save slot you have loaded in preferences. Assuming you meet the requirements."
	set category = "Abilities"
	set hidden = 1
	var/mob/living/caller = src
	if(temporary_form)
		caller = temporary_form
		to_chat(caller,"<span class ='warning'>This function isn't coded yet. Soon, my child.</span>")
	else
		to_chat(src,"<span class ='warning'>This function isn't coded yet. Soon, my child.</span>")



	/*if(stat)
		to_chat(src,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	if(!isturf(loc))
		to_chat(src,"<span class='warning'>You need more space to perform this action!</span>")
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	//Already regenerating
	if(active_regen)
		to_chat(src, "<span class='warning'>You are already refactoring!</span>")
		return

	var/swap_not_rebuild = tgui_alert(src,"Do you want to rebuild, or reshape?","Rebuild or Reshape",list("Reshape","Cancel","Rebuild"))
	if(swap_not_rebuild == "Cancel")
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
		to_chat(src, "<span class='danger'>Remain still while the process takes place! It will take 5 seconds.</span>")
		visible_message("<B>[src]</B>'s form collapses into an amorphous blob of black ichor...")

		var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
		active_regen = 1
		if(do_after(blob,5 SECONDS))
			synthetic = usable_manufacturers[manu_choice]
			torso.robotize(manu_choice) //Will cascade to all other organs.
			regenerate_icons()
			visible_message("<B>[src]</B>'s form reshapes into a new one...")
		active_regen = 0
		nano_outofblob(blob)
		return

	//Not enough resources (AND spends the resources, should be the last check)
	if(!refactory.use_stored_material(MAT_STEEL,refactory.max_storage))
		to_chat(src, "<span class='warning'>You need to be maxed out on normal metal to do this!</span>")
		return

	var/delay_length = round(active_regen_delay * species.active_regen_mult)
	to_chat(src, "<span class='danger'>Remain still while the process takes place! It will take [delay_length/10] seconds.</span>")
	visible_message("<B>[src]</B>'s form begins to shift and ripple as if made of oil...")
	active_regen = 1

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
			to_chat(src, "<span class='notice'>Your refactoring is complete.</span>") //Guarantees the message shows no matter how bad the timing.
			to_chat(blob, "<span class='notice'>Your refactoring is complete!</span>")
		else
			to_chat(src,  "<span class='critical'>Your refactoring has failed.</span>")
			to_chat(blob, "<span class='critical'>Your refactoring has failed!</span>")
	else
		to_chat(src,  "<span class='critical'>Your refactoring is interrupted.</span>")
		to_chat(blob, "<span class='critical'>Your refactoring is interrupted!</span>")
	active_regen = 0
	nano_outofblob(blob)*/

////
//  Storing metal
////
/mob/living/carbon/human/proc/nano_metalnom()
	set name = "Ref - Store Metals"
	set desc = "If you're holding a stack of material, you can consume some and store it for later."
	set category = "Abilities"
	set hidden = 1

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	var/held = get_active_hand()
	if(!istype(held,/obj/item/stack/material))
		to_chat(src,"<span class='warning'>You aren't holding a stack of materials in your active hand...!</span>")
		return

	var/obj/item/stack/material/matstack = held
	var/substance = matstack.material.name
	var allowed = 0
	for(var/material in PROTEAN_EDIBLE_MATERIALS)
		if(material == substance) allowed = 1
	if(!allowed)
		to_chat(src,"<span class='warning'>You can't process [substance]!</span>")
		return //Only a few things matter, the rest are best not cluttering the lists.

	var/howmuch = tgui_input_number(src,"How much do you want to store? (0-[matstack.get_amount()])","Select amount",null,matstack.get_amount(),0)
	if(!howmuch || matstack != get_active_hand() || howmuch > matstack.get_amount())
		return //Quietly fail

	var/actually_added = refactory.add_stored_material(substance,howmuch*matstack.perunit)
	matstack.use(CEILING((actually_added/matstack.perunit), 1))
	if(actually_added && actually_added < howmuch)
		to_chat(src,"<span class='warning'>Your refactory module is now full, so only [actually_added] units were stored.</span>")
		visible_message("<span class='notice'>[src] nibbles some of the [substance] right off the stack!</span>")
	else if(actually_added)
		to_chat(src,"<span class='notice'>You store [actually_added] units of [substance].</span>")
		visible_message("<span class='notice'>[src] devours some of the [substance] right off the stack!</span>")
	else
		to_chat(src,"<span class='notice'>You're completely capped out on [substance]!</span>")

////
//  Blob Form
////
/mob/living/carbon/human/proc/nano_blobform()
	set name = "Toggle Blobform"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"
	set hidden = 1

	var/atom/movable/to_locate = temporary_form || src
	if(!isturf(to_locate.loc))
		to_chat(to_locate,"<span class='warning'>You need more space to perform this action!</span>")
		return

	//Blob form
	if(temporary_form)
		if(temporary_form.stat)
			to_chat(temporary_form,"<span class='warning'>You can only do this while not stunned.</span>")
		else
			nano_outofblob(temporary_form)

	//Human form
	else if(stat)
		to_chat(src,"<span class='warning'>You can only do this while not stunned.</span>")
		return
	else if(handcuffed)
		to_chat(src, "<span class='warning'>You can't do this while handcuffed!</span>")
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
		to_chat(src,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	var/new_species = tgui_input_list(usr, "Please select a species to emulate.", "Shapeshifter Body", GLOB.playable_species)
	if(new_species)
		species?.base_species = new_species // Really though you better have a species
		regenerate_icons() //Expensive, but we need to recrunch all the icons we're wearing

////
//	Rig Transform
////
/mob/living/carbon/human/proc/nano_rig_transform()
	set name = "Modify Form - Hardsuit"
	set desc = "Allows a protean to retract its mass into its hardsuit module at will."
	set category = "Abilities"
	set hidden = 1

	if(!temporary_form)	//If you're human, force you into blob form before rig'ing
		nano_blobform()
	spawn(2)


	if(istype(src.species, /datum/species/protean))
		var/datum/species/protean/S = src.species
		var/mob/living/simple_mob/protean_blob/P = temporary_form
		if(S.OurRig) //Do we even have a RIG?
			if(P.loc == S.OurRig)	//we're inside our own RIG
				if(S.OurRig.wearer) //We're being worn. Engulf em', if prefs align.. otherwise just drop off.
					var/mob/living/carbon/human/victim = S.OurRig.wearer
					victim.drop_from_inventory(S.OurRig)
					if(P.can_be_drop_pred && victim.devourable && victim.can_be_drop_prey)
						if(P.vore_selected)
							perform_the_nom(P,victim,P,P.vore_selected,1)
				P.forceMove(get_turf(S.OurRig))
				S.OurRig.forceMove(src)
				S.OurRig.myprotean = null
				src.equip_to_slot_if_possible(S.OurRig, slot_back)
				S.OurRig.Moved()
				P.has_hands = 1
			else	//We're not in our own RIG
				if(P.stat)
					to_chat(P,"<span class='warning'>You can only do this while not stunned.</span>")
				else
					if(P.l_hand)
						drop_from_inventory(P.l_hand)
					if(P.r_hand)
						drop_from_inventory(P.r_hand)
					S.OurRig.myprotean = P
					src.drop_from_inventory(S.OurRig)
					P.forceMove(S.OurRig)
			P.reset_view()
		else	//Make one if not
			to_chat(temporary_form, "<span class='warning'>Somehow, your RIG got disconnected from your species. A new one has been created for you, contact a coder.</span>")
			new /obj/item/weapon/rig/protean(src,src)

////
//  Change size
////
/*CHOMP Removal start - I am replacing this with the OG set size. No more metal requirement.
/mob/living/carbon/human/proc/nano_set_size()
	set name = "Adjust Volume"
	set category = "Abilities"
	set hidden = 1

	var/mob/living/user = temporary_form || src

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(user,"<span class='warning'>You don't have a working refactory module!</span>")
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
			user.resize(size_factor, ignore_prefs = 1)
		else
			to_chat(user,"<span class='warning'>That size change would cost [cost] steel, which you don't have.</span>")
	//Sizing down (or not at all)
	else if(cost <= 0)
		cost = abs(cost)
		var/actually_added = refactory.add_stored_material(MAT_STEEL,cost)
		user.resize(size_factor, ignore_prefs = 1)
		if(actually_added != cost)
			to_chat(user,"<span class='warning'>Unfortunately, [cost-actually_added] steel was lost due to lack of storage space.</span>")

	user.visible_message("<span class='notice'>Black mist swirls around [user] as they change size.</span>")
CHOMP Removal end*/

/mob/living/carbon/human/proc/appearance_switch()
	set name = "Switch Blob Appearance"
	set desc = "Allows a protean blob to switch its outwards appearance."
	set category = "Abilities"
	set hidden = 1
	var/datum/species/protean/S = src.species
	var/mob/M = src
	if(temporary_form)
		M = temporary_form
	var/blobstyle = input(M, "Which blob style would you like?") in list("Red and Blue Stars", "Blue Star", "Plain")
	switch(blobstyle)
		if("Red and Blue Stars")
			S.blob_appearance = "puddle2"
		if("Blue Star")
			S.blob_appearance = "puddle1"
		if("Plain")
			S.blob_appearance = "puddle0"
	if(temporary_form)
		if(blobstyle)
			temporary_form.icon_living = S.blob_appearance
			temporary_form.item_state = S.blob_appearance
			temporary_form.update_icon()
			if(istype(temporary_form.loc, /obj/item/weapon/holder/protoblob))
				var/obj/item/weapon/holder/protoblob/PB = temporary_form.loc
				PB.item_state = S.blob_appearance

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



/// /// /// Ability objects for stat panel
/obj/effect/protean_ability
	name = "Activate"
	desc = ""
	icon = 'modular_chomp/icons/mob/species/protean/protean_powers.dmi'
	var/ability_name
	var/to_call

/obj/effect/protean_ability/proc/atom_button_text()
	return src

/obj/effect/protean_ability/Click(var/location, var/control, var/params)
	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(usr,"<span class='notice'><b>[ability_name]</b> - [desc]</span>")
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
	return 0

/// The actual abilities
/obj/effect/protean_ability/into_blob
	ability_name = "Toggle Blobform"
	desc = "Discard your shape entirely, changing to a low-energy blob that can fit into small spaces. You'll consume steel to repair yourself in this form."
	icon_state = "blob"
	to_call = /mob/living/carbon/human/proc/nano_blobform

/obj/effect/protean_ability/change_volume
	ability_name = "Change Volume"
	desc = "Alter your size between 25% and 200%."
	icon_state = "volume"
	to_call = /mob/living/proc/set_size

/obj/effect/protean_ability/reform_limb
	ability_name = "Ref - Single Limb"
	desc = "Rebuild or replace a single limb, assuming you have 2000 steel."
	icon_state = "limb"
	to_call = /mob/living/carbon/human/proc/nano_partswap

/obj/effect/protean_ability/reform_body
	ability_name = "Total Reassembly (wip)"
	desc = "Completely reassemble yourself from whatever save slot you have loaded in preferences. Assuming you meet the requirements."
	icon_state = "body"
	to_call = /mob/living/carbon/human/proc/nano_regenerate

/obj/effect/protean_ability/metal_nom
	ability_name = "Ref - Store Metals"
	desc = "Store the metal you're holding. Your refactory can only store steel, and all other metals will be converted into nanites ASAP for various effects."
	icon_state = "metal"
	to_call = /mob/living/carbon/human/proc/nano_metalnom

/obj/effect/protean_ability/hardsuit
	ability_name = "Hardsuit Transform"
	desc = "Coalesce your naniteswarm into their control module, allowing others to wear you."
	icon_state = "rig"
	to_call = /mob/living/carbon/human/proc/nano_rig_transform

/obj/effect/protean_ability/appearance_switch
	ability_name = "Blob Appearance"
	desc = "Toggle your blob appearance. Also affects your worn appearance."
	icon_state = "rig"
	to_call = /mob/living/carbon/human/proc/appearance_switch

#undef PER_LIMB_STEEL_COST
