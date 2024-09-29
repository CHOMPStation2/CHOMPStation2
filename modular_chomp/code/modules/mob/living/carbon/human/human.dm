/mob/living/carbon/human/update_fullness(var/returning = FALSE)
	if(!returning)
		if(updating_fullness)
			return
	var/previous_stomach_fullness = vore_fullness_ex["stomach"]
	var/previous_taur_fullness = vore_fullness_ex["taur belly"]
	//update_vore_tail_sprite()
	//update_vore_belly_sprite()
	var/list/new_fullness = ..(TRUE)
	. = new_fullness
	for(var/datum/category_group/underwear/undergarment_class in global_underwear.categories)
		if(!new_fullness[undergarment_class.name])
			continue
		new_fullness[undergarment_class.name] = -1 * round(-1 * new_fullness[undergarment_class.name]) // Doing a ceiling the only way BYOND knows how I guess
		new_fullness[undergarment_class.name] = (min(2, new_fullness[undergarment_class.name]) - 2) * -1 //Complicated stuff to get it correctly aligned with the expected TRUE/FALSE
		var/datum/category_item/underwear/UWI = all_underwear[undergarment_class.name]
		if(!UWI || UWI.name == "None")
			//Welllll okay then. If the former then something went wrong, if None was selected then...
			if(istype(undergarment_class.items_by_name[new_fullness[undergarment_class.name + "-ifnone"]], /datum/category_item/underwear))
				UWI = undergarment_class.items_by_name[new_fullness[undergarment_class.name + "-ifnone"]]
				all_underwear[undergarment_class.name] = UWI
		if(UWI && UWI.has_color && new_fullness[undergarment_class.name + "-color"])
			all_underwear_metadata[undergarment_class.name]["[gear_tweak_free_color_choice]"] = new_fullness[undergarment_class.name + "-color"]
		if(UWI && UWI.name != "None" && hide_underwear[undergarment_class.name] != new_fullness[undergarment_class.name])
			hide_underwear[undergarment_class.name] = new_fullness[undergarment_class.name]
			update_underwear(1)
	if(vore_fullness_ex["stomach"] != previous_stomach_fullness)
		update_vore_belly_sprite()
	if(vore_fullness_ex["taur belly"] != previous_taur_fullness)
		update_vore_tail_sprite()

/mob/living/carbon/human/vs_animate(var/belly_to_animate)
	if(belly_to_animate == "stomach")
		vore_belly_animation()
	else if(belly_to_animate == "taur belly")
		vore_tail_animation()
	else
		return

/mob/living/carbon/human/verb/hide_headset()
	set name = "Show/Hide Headset"
	set category = "IC.Settings"
	set desc = "Toggle headset worn icon visibility."
	hide_headset = !hide_headset
	update_inv_ears()

/mob/living/carbon/human/verb/hide_glasses()
	set name = "Show/Hide Glasses"
	set category = "IC.Settings"
	set desc = "Toggle glasses worn icon visibility."
	hide_glasses = !hide_glasses
	update_inv_glasses()

/mob/living/carbon/human/verb/flip_lying()
	set name = "Flip Resting Direction"
	set category = "Abilities.General"
	set desc = "Switch your horizontal direction while prone."
	if(isnull(rest_dir))
		rest_dir = FALSE
	rest_dir = !rest_dir
	update_transform(TRUE)

/mob/living/carbon/human/proc/synth_reag_toggle()
	set name = "Toggle Reagent Processing"
	set category = "Abilities.Vore"
	set desc = "Toggle reagent processing as synth."
	synth_reag_processing = !synth_reag_processing

//Formally used from a paper, gave this to everyone.
/mob/living/carbon/human/verb/create_area()
    set name = "Create Area"
    set desc = "Create an area in a enclosed space, making it able to be powered by an APC."
    set category = "IC.Game"

    if(stat || world.time < last_special)
        to_chat(usr, "<span class='warning'>You recently tried to create an area. Wait a while before using it again.</span>")
        return

    last_special = world.time + 2 SECONDS // Antispam.
    create_new_area(usr)
    return

/mob/living/carbon/human/update_misc_tabs()
	..()
	if(species)
		species.update_misc_tabs(src)

	if(istype(back,/obj/item/rig))
		var/obj/item/rig/R = back
		RigPanel(R)

	else if(istype(belt,/obj/item/rig))
		var/obj/item/rig/R = belt
		RigPanel(R)

/mob/proc/RigPanel(var/obj/item/rig/R)
	if(R && !R.canremove && R.installed_modules.len)
		var/list/L = list()
		var/cell_status = R.cell ? "[R.cell.charge]/[R.cell.maxcharge]" : "ERROR"
		L[++L.len] = list("Suit charge: [cell_status]", null, null, null, null)
		for(var/obj/item/rig_module/module in R.installed_modules)
		{
			for(var/stat_rig_module/SRM in module.stat_modules)
				if(SRM.CanUse())
					L[++L.len] = list(SRM.module.interface_name,null,null,SRM.name,REF(SRM))
		}
		misc_tabs["Hardsuit Modules"] = L

/mob/living/update_misc_tabs()
	..()
	if(get_rig_stats)
		var/obj/item/rig/rig = get_rig()
		if(rig)
			RigPanel(rig)
