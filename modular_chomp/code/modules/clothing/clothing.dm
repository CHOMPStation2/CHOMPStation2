/obj/item/clothing
	var/update_icon_define_orig = null // temp storage for original update_icon_define (if it exists)
	var/update_icon_define_digi = null
	var/fit_for_digi = FALSE // flag for if clothing has already been reskinned to digitigrade

/obj/item/clothing/shoes
	update_icon_define_digi = "modular_chomp/icons/inventory/feet/mob_digi.dmi"

/obj/item/clothing/suit
	update_icon_define_digi = "modular_chomp/icons/inventory/suit/mob_digi.dmi"

/obj/item/clothing/under
	update_icon_define_digi = "modular_chomp/icons/inventory/uniform/mob_digi.dmi"

/obj/item/clothing/shoes/MouseDrop_T(mob/living/target, mob/living/user)
	if(!istype(user)) return ..() // If the user passed in isn't a living mob, exit
	if(target != user) return ..() // If the user didn't drag themselves, exit
	if(user.incapacitated() || user.buckled) return ..() // If user is incapacitated or buckled, exit
	if(get_holder_of_type(src, /mob/living/carbon/human) == user) return ..() // No jumping into your own equipment
	if(ishuman(user) && user.get_effective_size() > 0.25) return ..() // Only micro characters

	var/full = 0
	for(var/mob/M in src)
		if(istype(M,/mob/living/voice)) //Don't count voices as people!
			continue
		full++
	if(full >= 2)
		to_chat(user, "<span class='warning'>It doesn't seem like there is room in \the [src]!</span>")
	else
		to_chat(user, "<span class='warning'>You crawl into \the [src]!</span>")
		user.forceMove(src)

	return ..()


/obj/item/clothing/proc/handle_digitigrade(var/mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		// if digitigrade-use flag is set
		if(H.digitigrade)

			// figure out what slot we care about
			if(!update_icon_define_digi)
				return

			// Don't reset if already set
			if(!fit_for_digi)
				fit_for_digi = TRUE // set flag even if no icon_state exists, so we don't repeat checks

				//if update_icon_define is already set to something, place it in a var to hold it temporarily
				if(update_icon_define)
					update_icon_define_orig = update_icon_define

				// only override icon if a corresponding digitigrade replacement icon_state exists
				// otherwise, keep the old non-digi icon_define (or nothing)
				if(icon_state && icon_states(update_icon_define_digi).Find(icon_state))
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