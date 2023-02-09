/obj/item/organ/external/get_icon(var/skeletal)
	var/digitigrade = 0

	// preferentially take digitigrade value from owner if available, THEN DNA.
	// this allows limbs to be set properly when being printed in the bioprinter without an owner
	// this also allows the preview mannequin to update properly because customisation topic calls don't call a DNA check
	if(owner)
		digitigrade = owner.digitigrade && (istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot))
	else if(dna)
		digitigrade = dna.digitigrade && (istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot))

	var/robotic_digi = prosthetic_digi && digitigrade //could make it so the prosthetic digi var is more of a "does this limb have a custom digitigrade sprite for its robospriting" but this is fine for now

	var/gender = "m"
	if(owner && owner.gender == FEMALE)
		gender = "f"

	if(!force_icon_key)
		icon_cache_key = "[icon_name]_[species ? species.get_bodytype() : SPECIES_HUMAN]" //VOREStation Edit
	else
		icon_cache_key = "[icon_name]_[force_icon_key]"

	if(force_icon && !robotic_digi)
		mob_icon = new /icon(force_icon, "[icon_name][gendered_icon ? "_[gender]" : ""]")
	else
		if(!dna)
			mob_icon = new /icon('icons/mob/human_races/r_human.dmi', "[icon_name][gendered_icon ? "_[gender]" : ""]")
		else

			if(!gendered_icon)
				gender = null
			else
				if(dna.GetUIState(DNA_UI_GENDER))
					gender = "f"
				else
					gender = "m"

			if(skeletal)
				mob_icon = new /icon('icons/mob/human_races/r_skeleton.dmi', "[icon_name][gender ? "_[gender]" : ""]")
			else if (robotic >= ORGAN_ROBOT && !robotic_digi)
				mob_icon = new /icon('icons/mob/human_races/robotic.dmi', "[icon_name][gender ? "_[gender]" : ""]")
				apply_colouration(mob_icon)
			else
				if(is_hidden_by_markings())
					mob_icon = new /icon('icons/mob/human_races/r_blank.dmi', "[icon_name][gender ? "_[gender]" : ""]")
				else
					//Use digi icon if digitigrade, otherwise use regular icon. Ternary operator is based.
					mob_icon = new /icon(digitigrade ? species.icodigi : species.get_icobase(owner, (status & ORGAN_MUTATED)), "[icon_name][gender ? "_[gender]" : ""]")
					apply_colouration(mob_icon)

	if (model && !robotic_digi)
		icon_cache_key += "_model_[model]"
		apply_colouration(mob_icon)

	//Code here is copied from organ_icon.dm line 118 at time of writing (9/20/21), VOREStation edits are left in intentionally, because I think it's worth keeping track of the fact that the code is from Virgo's edits.
	//Body markings, actually does not include head this time. Done separately above.
	if((!istype(src,/obj/item/organ/external/head) && !(force_icon && !robotic_digi)) || (model && owner && owner.synth_markings))
		for(var/M in markings)
			var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
			var/isdigitype = istype(mark_style,/datum/sprite_accessory/marking/digi)
			if(!(digitigrade ^ isdigitype)) //Equivalent to XNOR; this code will only run if either both digitigrade and isdigitype are true, or if both are false.
				var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
				mark_s.Blend(markings[M]["color"], mark_style.color_blend_mode) // VOREStation edit
				add_overlay(mark_s) //So when it's not on your body, it has icons
				mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
				icon_cache_key += "[M][markings[M]["color"]]"
	if(body_hair && islist(h_col) && h_col.len >= 3)
		var/cache_key = "[body_hair]-[icon_name]-[h_col[1]][h_col[2]][h_col[3]]"
		if(!limb_icon_cache[cache_key])
			var/icon/I = icon(species.get_icobase(owner), "[icon_name]_[body_hair]")
			I.Blend(rgb(h_col[1],h_col[2],h_col[3]), ICON_MULTIPLY) //VOREStation edit
			limb_icon_cache[cache_key] = I
		mob_icon.Blend(limb_icon_cache[cache_key], ICON_OVERLAY)

	// VOREStation edit start
	if(nail_polish && (force_icon && !robotic_digi))
		var/icon/I = new(nail_polish.icon, nail_polish.icon_state)
		I.Blend(nail_polish.color, ICON_MULTIPLY)
		add_overlay(I)
		mob_icon.Blend(I, ICON_OVERLAY)
		icon_cache_key += "_[nail_polish.icon]_[nail_polish.icon_state]_[nail_polish.color]"
	// VOREStation edit end

	dir = EAST
	icon = mob_icon
	return mob_icon
