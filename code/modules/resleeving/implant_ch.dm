//Infinite use implanter. Feel free to make proper sprites for it or whatnot.
//I guess this would make more sense as a machine but there's all that extra machine code it doesn't need.
/obj/structure/backup_implanter_ch
	name = "\improper Backup implanter"
	icon = 'icons/obj/computer3.dmi'
	icon_state = "laptop-gun"
	desc = "After discovering clients constantly lacked staff to replace implants, Vey-Medical designed this version capable of creating implants on demand."
	anchored = TRUE
	germ_level = 0

//Click to get implant.
/obj/structure/backup_implanter_ch/attack_hand(mob/user)
	..()

	if(!istype(user, /mob/living/carbon))
		return

	if(user)
		user.visible_message(span_notice("[user] is injecting a backup implant into [user]."))

		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)

		if(do_after(user, 2.5 SECONDS))

			if(user && src)

				//Create the actual implant.
				var/obj/item/implant/backup/imp = new(src.contents)
				imp.germ_level = 0

				//Implant the implant.
				if(imp.handle_implant(user, user.zone_sel.selecting))
					imp.post_implant(user)
					add_attack_logs(user, user, "Implanted backup implant")
					user.visible_message(span_notice("[user] has been backup implanted by [user]."))

				//If implanting somehow fails, delete the implant.
				else
					qdel(imp)

/obj/structure/backup_implanter_ch/attackby(obj/item/O, mob/user)
	if(O.is_wrench())

		if(anchored)
			to_chat(user, span_notice("You start to unwrench the implanter."))
			playsound(src, O.usesound, 50, 1)

			if(do_after(user, 15 * O.toolspeed))
				to_chat(user, span_notice("You unwrench the implanter."))
				anchored = FALSE
				return
			else
				return

		else
			to_chat(user, span_notice("You start to wrench the implanter into place."))
			playsound(src, O.usesound, 50, 1)

			if(do_after(user, 15 * O.toolspeed))

				to_chat(user, span_notice("You wrench the implanter into place."))
				anchored = TRUE
				return
			else
				return
	..()
