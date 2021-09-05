//CHOMP Overrides for if holder is digitigrade
/obj/item/clothing
	var/update_icon_define_orig = null // temp storage for original update_icon_define (if it exists)
	var/fit_for_digi = FALSE // flag for if clothing has already been reskinned to digitigrade

/obj/item/clothing/proc/handle_digitigrade(var/mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		// if digitigrade-use flag is set
		if(H.digitigrade)

			// figure out what slot we care about
			var/update_icon_define_digi = null

			if(istype(src, /obj/item/clothing/shoes))
				update_icon_define_digi = "icons/inventory/feet/mob_digi_ch.dmi"
			else if(istype(src, /obj/item/clothing/suit)) //suit
				update_icon_define_digi = "icons/inventory/suit/mob_digi_ch.dmi"
			else if(istype(src, /obj/item/clothing/under)) //uniform
				update_icon_define_digi = "icons/inventory/uniform/mob_digi_ch.dmi"
			else
				return
			
			// Don't reset if already set
			if(!fit_for_digi)
				fit_for_digi = TRUE // set flag even if no icon_state exists, so we don't repeat checks
				
				// only override icon if a corresponding digitigrade replacement icon_state exists
				// otherwise, keep the old non-digi icon
				if(icon_state && icon_states(update_icon_define_digi).Find(icon_state))

					//if update_icon_define is already set to something, place it in a var to hold it temporarily
					if(update_icon_define)
						update_icon_define_orig = update_icon_define

					//set digi-leg sprite
					update_icon_define = update_icon_define_digi


		// if not-digitigrade, only act if the clothing was previously fit for a digitigrade char
		else 
			if(fit_for_digi)
				fit_for_digi = FALSE
				
				//either reset update_icon_define to it's old value
				// or reset update_icon_define to null
				if(update_icon_define_orig) 
					update_icon_define = update_icon_define_orig
					update_icon_define_orig = null
				else 
					update_icon_define = null

/obj/item/clothing/shoes/equipped(var/mob/user, var/slot)
	. = ..()
	handle_digitigrade(user)

/obj/item/clothing/suit/equipped(var/mob/user, var/slot)
	. = ..()
	handle_digitigrade(user)

/obj/item/clothing/under/equipped(var/mob/user, var/slot)
	. = ..()
	handle_digitigrade(user)