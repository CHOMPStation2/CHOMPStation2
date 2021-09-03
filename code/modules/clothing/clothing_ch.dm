//CHOMP Overrides for if holder is digitigrade
/obj/item/clothing
	var/update_icon_define_orig = null

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

			// only override icon if a corresponding digitigrade replacement icon_state exists
			// otherwise, keep the old non-digi icon
			if(icon_state && icon_states(update_icon_define_digi).Find(icon_state))

				// Don't reset if already set
				if(update_icon_define <> update_icon_define_digi)

					//if update_icon_define is already set to something, place it in a var to hold it temporarily
					if(update_icon_define)
						update_icon_define_orig = update_icon_define

					//set digi-leg sprite
					update_icon_define = update_icon_define_digi


		// if not-digitigrade and update_icon_define set by previous digi-user, replacing an 'original' value
		else if(update_icon_define_orig)
			update_icon_define = update_icon_define_orig
			update_icon_define_orig = null


		else if(update_icon_define)
			// if not-digitigrade and update_icon_define set by previous digi-user, but nothing replaced
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