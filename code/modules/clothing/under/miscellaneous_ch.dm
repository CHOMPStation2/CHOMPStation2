/obj/item/clothing/under/sexybunny_white
	name = "Bunny girl suit"
	desc = "this seems to come with extra padding, exaggerating the chest some."
	icon = 'icons/inventory/uniform/item_ch.dmi'
	icon_override = 'icons/inventory/uniform/mob_ch.dmi'
	icon_state = "sexybunny_white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/under/sexybunny_white/sexybunny_black
	icon_state = "sexybunny_black"

/obj/item/clothing/under/cohesion
	permeability_coefficient = 0  //Should have this anyway

/obj/item/clothing/under/cohesion/striped/testpartial //testing better coverage.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/under/cohesion/striped/testfull //testing both, but with full coverage.
	body_parts_covered = HEAD|UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

// SKINSUITS //

/obj/item/clothing/under/skinsuit/gray/short
	name = "short gray skinsuit"
	icon = 'icons/inventory/uniform/item_ch.dmi'
	icon_state = "skinsuit_handless_g"

/obj/item/clothing/under/skinsuit/fem/gray/short
	name = "feminine short gray skinsuit"
	icon = 'icons/inventory/uniform/item_ch.dmi'
	icon_state = "skinsuitfem_handless_g"

/obj/item/clothing/gloves/bluespace/deluxe
	name = "deluxe size standardization bracelet"
	desc = "A somewhat bulky metal bracelet featuring a crystal, glowing blue. The outer side of the bracelet has an elongated case that one might imagine \
	contains electronic components. This bracelet is used to standardize the size of crewmembers who may need a non-permanent size assist. This one appears \
	to be a deluxe edition and contains a wheel that allows for adjustment of what the 'standard' size is!"

/obj/item/clothing/gloves/bluespace/deluxe/examine(mob/user)
	. = ..()
	if(Adjacent(user))
		. += "The dial seems to be set to [target_size*100]%"

/obj/item/clothing/gloves/bluespace/deluxe/verb/turn_dial()
	set name = "Adjust Bluespace Dial"
	set desc = "Adjust your bracelet's standard size setting. Effect is limited to when you have the bracelet on."
	set category = "Object"
	set src in usr
	bluespace_size(usr)

/obj/item/clothing/gloves/bluespace/deluxe/proc/bluespace_size(mob/usr as mob) //Taken from HYPER suit
	if (!ishuman(usr))
		return

	var/mob/living/carbon/human/H = usr

	var/cooldowntime = round((10 SECONDS - (world.time - last_activated)) * 0.1) //Anti Spam
	if(cooldowntime >= 0)
		to_chat(H, span_warning("The bracelet is currently recharging!"))
		return

	if (H.stat || H.restrained())
		return

	if (src != H.gloves)
		to_chat(H, span_warning("You must be WEARING the bracelet and have it uncovered to change your size."))
		return

	var/new_size = tgui_input_number(usr, "Put the desired size you wish to be while wearing the bracelet (50-150%).", "Set Size", 100, 150, 50)
	if(!new_size)
		return

	//Check AGAIN because we accepted user input which is blocking.
	if (src != H.gloves)
		to_chat(H, span_warning("You must be WEARING the bracelet and have it uncovered to change your size."))
		return

	if (H.stat || H.restrained())
		return

	if (isnull(H.size_multiplier)) // Why would this ever be the case?
		to_chat(H, span_warning("The gloves panics and corrects your apparently microscopic size."))
		H.resize(RESIZE_NORMAL, ignore_prefs = TRUE)
		H.update_icons() //Just want the matrix transform
		return

	if(new_size)
		if(new_size != H.size_multiplier)
			if(!original_size)
				original_size = H.size_multiplier
			H.resize(new_size/100, ignore_prefs = TRUE) // Ignores prefs because you can only resize yourself
			H.visible_message(span_notice("The space around [H] distorts as they change size!"), span_notice("The space around you distorts as you change size!"))
			target_size = new_size/100
			last_activated = world.time
		else //They chose their current size.
			return
