/obj/item/clipboard // CHOMPEdit - Removal of obj/item/weapon
	name = "clipboard"
	desc = "Used to clip paper to, for an on-the-go writing board."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "clipboard"
	item_state = "clipboard"
	throwforce = 0
	w_class = ITEMSIZE_SMALL
	throw_speed = 3
	throw_range = 10
	var/obj/item/pen/haspen		//The stored pen. // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/toppaper	//The topmost piece of paper. // CHOMPEdit - Removal of obj/item/weapon
	slot_flags = SLOT_BELT

/obj/item/clipboard/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	update_icon()

/obj/item/clipboard/MouseDrop(obj/over_object as obj) //Quick clipboard fix. -Agouri // CHOMPEdit - Removal of obj/item/weapon
	if(ishuman(usr))
		var/mob/M = usr
		if(!(istype(over_object, /obj/screen) ))
			return ..()

		if(!M.restrained() && !M.stat)
			switch(over_object.name)
				if("r_hand")
					M.unEquip(src)
					M.put_in_r_hand(src)
				if("l_hand")
					M.unEquip(src)
					M.put_in_l_hand(src)

			add_fingerprint(usr)
			return

/obj/item/clipboard/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(toppaper)
		add_overlay(toppaper.icon_state)
		add_overlay(toppaper.overlays)
	if(haspen)
		add_overlay("clipboard_pen")
	add_overlay("clipboard_over")
	return

/obj/item/clipboard/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon

	if(istype(W, /obj/item/paper) || istype(W, /obj/item/photo)) // CHOMPEdit - Removal of obj/item/weapon
		user.drop_item()
		W.loc = src
		if(istype(W, /obj/item/paper)) // CHOMPEdit - Removal of obj/item/weapon
			toppaper = W
		to_chat(user, "<span class='notice'>You clip the [W] onto \the [src].</span>")
		update_icon()

	else if(istype(toppaper) && istype(W, /obj/item/pen)) // CHOMPEdit - Removal of obj/item/weapon
		toppaper.attackby(W, usr)
		update_icon()

	return

/obj/item/clipboard/afterattack(turf/T as turf, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	for(var/obj/item/paper/P in T) // CHOMPEdit - Removal of obj/item/weapon
		P.loc = src
		toppaper = P
		update_icon()
		to_chat(user, "<span class='notice'>You clip the [P] onto \the [src].</span>")

/obj/item/clipboard/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	var/dat = "<title>Clipboard</title>"
	if(haspen)
		dat += "<A href='?src=\ref[src];pen=1'>Remove Pen</A><BR><HR>"
	else
		dat += "<A href='?src=\ref[src];addpen=1'>Add Pen</A><BR><HR>"

	//The topmost paper. I don't think there's any way to organise contents in byond, so this is what we're stuck with.	-Pete
	if(toppaper)
		var/obj/item/paper/P = toppaper // CHOMPEdit - Removal of obj/item/weapon
		dat += "<A href='?src=\ref[src];write=\ref[P]'>Write</A> <A href='?src=\ref[src];remove=\ref[P]'>Remove</A> <A href='?src=\ref[src];rename=\ref[P]'>Rename</A> - <A href='?src=\ref[src];read=\ref[P]'>[P.name]</A><BR><HR>"

	for(var/obj/item/paper/P in src) // CHOMPEdit - Removal of obj/item/weapon
		if(P==toppaper)
			continue
		dat += "<A href='?src=\ref[src];remove=\ref[P]'>Remove</A> <A href='?src=\ref[src];rename=\ref[P]'>Rename</A> - <A href='?src=\ref[src];read=\ref[P]'>[P.name]</A><BR>"
	for(var/obj/item/photo/Ph in src) // CHOMPEdit - Removal of obj/item/weapon
		dat += "<A href='?src=\ref[src];remove=\ref[Ph]'>Remove</A> <A href='?src=\ref[src];rename=\ref[Ph]'>Rename</A> - <A href='?src=\ref[src];look=\ref[Ph]'>[Ph.name]</A><BR>"

	user << browse(dat, "window=clipboard")
	onclose(user, "clipboard")
	add_fingerprint(usr)
	return

/obj/item/clipboard/Topic(href, href_list) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if((usr.stat || usr.restrained()))
		return

	if(src.loc == usr)

		if(href_list["pen"])
			if(istype(haspen) && (haspen.loc == src))
				haspen.loc = usr.loc
				usr.put_in_hands(haspen)
				haspen = null

		else if(href_list["addpen"])
			if(!haspen)
				var/obj/item/pen/W = usr.get_active_hand() // CHOMPEdit - Removal of obj/item/weapon
				if(istype(W, /obj/item/pen)) // CHOMPEdit - Removal of obj/item/weapon
					usr.drop_item()
					W.loc = src
					haspen = W
					to_chat(usr, "<span class='notice'>You slot the pen into \the [src].</span>")

		else if(href_list["write"])
			var/obj/item/P = locate(href_list["write"]) // CHOMPEdit - Removal of obj/item/weapon

			if(P && (P.loc == src) && istype(P, /obj/item/paper) && (P == toppaper) ) // CHOMPEdit - Removal of obj/item/weapon

				var/obj/item/I = usr.get_active_hand()

				if(istype(I, /obj/item/pen)) // CHOMPEdit - Removal of obj/item/weapon

					P.attackby(I, usr)

		else if(href_list["remove"])
			var/obj/item/P = locate(href_list["remove"])

			if(P && (P.loc == src) && (istype(P, /obj/item/paper) || istype(P, /obj/item/photo)) ) // CHOMPEdit - Removal of obj/item/weapon

				P.loc = usr.loc
				usr.put_in_hands(P)
				if(P == toppaper)
					toppaper = null
					var/obj/item/paper/newtop = locate(/obj/item/paper) in src // CHOMPEdit - Removal of obj/item/weapon
					if(newtop && (newtop != P))
						toppaper = newtop
					else
						toppaper = null

		else if(href_list["rename"])
			var/obj/item/O = locate(href_list["rename"]) // CHOMPEdit - Removal of obj/item/weapon

			if(O && (O.loc == src))
				if(istype(O, /obj/item/paper)) // CHOMPEdit - Removal of obj/item/weapon
					var/obj/item/paper/to_rename = O // CHOMPEdit - Removal of obj/item/weapon
					to_rename.rename()

				else if(istype(O, /obj/item/photo)) // CHOMPEdit - Removal of obj/item/weapon
					var/obj/item/photo/to_rename = O // CHOMPEdit - Removal of obj/item/weapon
					to_rename.rename()

		else if(href_list["read"])
			var/obj/item/paper/P = locate(href_list["read"]) // CHOMPEdit - Removal of obj/item/weapon

			if(P && (P.loc == src) && istype(P, /obj/item/paper) ) // CHOMPEdit - Removal of obj/item/weapon

				if(!(istype(usr, /mob/living/carbon/human) || istype(usr, /mob/observer/dead) || istype(usr, /mob/living/silicon)))
					usr << browse("<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[stars(P.info)][P.stamps]</BODY></HTML>", "window=[P.name]")
					onclose(usr, "[P.name]")
				else
					usr << browse("<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[P.info][P.stamps]</BODY></HTML>", "window=[P.name]")
					onclose(usr, "[P.name]")

		else if(href_list["look"])
			var/obj/item/photo/P = locate(href_list["look"]) // CHOMPEdit - Removal of obj/item/weapon
			if(P && (P.loc == src) && istype(P, /obj/item/photo) ) // CHOMPEdit - Removal of obj/item/weapon
				P.show(usr)

		else if(href_list["top"]) // currently unused
			var/obj/item/P = locate(href_list["top"])
			if(P && (P.loc == src) && istype(P, /obj/item/paper) ) // CHOMPEdit - Removal of obj/item/weapon
				toppaper = P
				to_chat(usr, "<span class='notice'>You move [P.name] to the top.</span>")

		//Update everything
		attack_self(usr)
		update_icon()
	return
