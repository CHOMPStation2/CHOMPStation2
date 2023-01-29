/obj/item/organ/external
	var/prosthetic_digi = FALSE //CHOMPStation edit - when it's prosthetic, can it be a digitigrade

//new function to check for markings
/obj/item/organ/external/proc/is_hidden_by_markings()
	//code that checked all limbs.
	/*
	for(var/obj/item/organ/external/organ in owner.organs)
		for(var/M in organ.markings)
			var/datum/sprite_accessory/marking/mark_style = organ.markings[M]["datum"]
			if (mark_style.hide_body_parts && (organ_tag in mark_style.hide_body_parts))
				return 1
	*/
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		if(istype(mark_style,/datum/sprite_accessory/marking/ch) && (organ_tag in mark_style.hide_body_parts))
			return 1