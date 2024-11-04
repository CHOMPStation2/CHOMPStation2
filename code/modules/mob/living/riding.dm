/mob/living/proc/toggle_rider_reins()
	set name = "Give Reins"
<<<<<<< HEAD
	set category = "Abilities.General" //CHOMPEdit
=======
	set category = "Abilities.General"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	set desc = "Let people riding on you control your movement."

	if(riding_datum)
		if(istype(riding_datum,/datum/riding))
			if(riding_datum.keytype)
				riding_datum.keytype = null
				to_chat(src, span_filter_notice("Rider control enabled."))
				return
			else
				riding_datum.keytype = /obj/item/material/twohanded/riding_crop
				to_chat(src, span_filter_notice("Rider control restricted."))
				return
	return
