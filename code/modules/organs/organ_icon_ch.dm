// override the organ icon getting proc if digitigrade and not a synth

/obj/item/organ/external/get_icon(var/skeletal)
	var/digitigrade = 0

	// preferentially take digitigrade value from owner if available, THEN DNA.
	// this allows limbs to be set properly when being printed in the bioprinter without an owner
	// this also allows the preview mannequin to update properly because customisation topic calls don't call a DNA check
	if(owner)
		digitigrade = owner.digitigrade
	else
		digitigrade = dna.digitigrade

	if( !model && digitigrade && ( istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot) ) )

		var/gender = "m"
		if(owner && owner.gender == FEMALE)
			gender = "f"

		if(!force_icon_key)
			icon_cache_key = "[icon_name]_[species ? species.get_bodytype() : SPECIES_HUMAN]" //VOREStation Edit
		else
			icon_cache_key = "[icon_name]_[force_icon_key]"

		if(force_icon)
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
				else if (robotic >= ORGAN_ROBOT)
					mob_icon = new /icon('icons/mob/human_races/robotic.dmi', "[icon_name][gender ? "_[gender]" : ""]")
					apply_colouration(mob_icon)
				else
					mob_icon = new /icon(species.icodigi, "[icon_name][gender ? "_[gender]" : ""]")
					apply_colouration(mob_icon)

				/*
				//Body markings, actually does not include head this time. Done separately above.
				if(!istype(src,/obj/item/organ/external/head))
					for(var/M in markings)
						var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
						var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
						mark_s.Blend(markings[M]["color"], mark_style.color_blend_mode) // VOREStation edit
						add_overlay(mark_s) //So when it's not on your body, it has icons
						mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
						icon_cache_key += "[M][markings[M]["color"]]"
				*/
		dir = EAST
		icon = mob_icon
		return mob_icon

	else
		. = ..()