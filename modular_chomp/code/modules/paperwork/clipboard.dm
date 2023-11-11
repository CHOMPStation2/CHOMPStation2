/**
 * Clipboard
 */
/obj/item/weapon/clipboard
	name = "clipboard"
	desc = "Used to clip paper to, for an on-the-go writing board."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "clipboard"
	item_state = "clipboard"
	throwforce = 0
	w_class = ITEMSIZE_SMALL
	throw_speed = 3
	throw_range = 10
	slot_flags = SLOT_BELT
	/// The stored pen
	var/obj/item/weapon/pen/pen
	/**
	 * Weakref of the topmost piece of paper
	 *
	 * This is used for the paper displayed on the clipboard's icon
	 * and it is the one attacked, when attacking the clipboard.
	 * (As you can't organise contents directly in BYOND)
	 */
	var/datum/weakref/toppaper_ref

/obj/item/weapon/clipboard/Initialize()
	update_icon()
	. = ..()

/obj/item/weapon/clipboard/Destroy()
	QDEL_NULL(pen)
	return ..()

/obj/item/weapon/clipboard/examine()
	. = ..()
	if(pen)
		. += "<span class='notice'>Alt-click to remove [pen].</span>"
	var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
	if(toppaper)
		. += "<span class='notice'>Right-click to remove [toppaper].</span>"

/// Take out the topmost paper
/obj/item/weapon/clipboard/proc/remove_paper(obj/item/weapon/paper/paper, mob/user)
	if(!istype(paper))
		return
	paper.forceMove(user.loc)
	user.put_in_hands(paper)
	to_chat(user, "<span class='notice'>You remove [paper] from [src].</span>")
	var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
	if(paper == toppaper)
		toppaper_ref = null
		var/obj/item/weapon/paper/newtop = locate(/obj/item/weapon/paper) in src
		if(newtop && (newtop != paper))
			toppaper_ref = WEAKREF(newtop)
		else
			toppaper_ref = null
	update_icon()

/obj/item/weapon/clipboard/proc/remove_pen(mob/user)
	pen.forceMove(user.loc)
	user.put_in_hands(pen)
	to_chat(user, "<span class='notice'>You remove [pen] from [src].</span>")
	pen = null
	update_icon()

/obj/item/weapon/clipboard/AltClick(mob/user)
	..()
	if(pen)
		remove_pen(user)

/*
/obj/item/weapon/clipboard/MouseDrop(obj/over_object as obj) //Quick clipboard fix. -Agouri
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
*/

/obj/item/weapon/clipboard/update_icon()
	cut_overlays()
	var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
	if(toppaper)
		add_overlay(toppaper.icon_state)
		add_overlay(toppaper.overlays)
	if(pen)
		add_overlay("clipboard_pen")
	add_overlay("clipboard_over")
	return

/obj/item/weapon/clipboard/attack_hand(mob/user, list/modifiers)
	if(LAZYACCESS(modifiers, RIGHT_CLICK))
		var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
		remove_paper(toppaper, user)
		return TRUE
	. = ..()

/obj/item/weapon/clipboard/attackby(obj/item/weapon, mob/user, params)
	var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
	if(istype(weapon, /obj/item/weapon/paper))
		//Add paper into the clipboard
		//if(!user.transferItemToLoc(weapon, src))
			//return

		// Replacement for above
		user.drop_item()
		weapon.loc = src
		// Replacement end

		toppaper_ref = WEAKREF(weapon)
		to_chat(user, "<span class='notice'>You clip [weapon] onto [src].</span>")
	else if(istype(weapon, /obj/item/weapon/pen) && !pen)
		//Add a pen into the clipboard, attack (write) if there is already one
		//if(!usr.transferItemToLoc(weapon, src))
			//return

		// Replacement for above
		usr.drop_item()
		weapon.loc = src
		// Replacement end

		pen = weapon
		to_chat(usr, "<span class='notice'>You slot [weapon] into [src].</span>")
	else if(toppaper)
		//toppaper.attackby(user.get_active_held_item(), user)
		toppaper.attackby(user.get_active_hand(), user)
	update_icon()

/*
/obj/item/weapon/clipboard/afterattack(turf/T as turf, mob/user as mob)
	for(var/obj/item/weapon/paper/P in T)
		P.loc = src
		toppaper = P
		update_icon()
		to_chat(user, "<span class='notice'>You clip the [P] onto \the [src].</span>")
*/

/obj/item/weapon/clipboard/attack_self(mob/user as mob)
	add_fingerprint(usr)
	tgui_interact(user)
	return

/obj/item/weapon/clipboard/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Clipboard")
		ui.open()

/obj/item/weapon/clipboard/tgui_data(mob/user)
	// prepare data for TGUI
	var/list/data = list()
	data["pen"] = "[pen]"

	var/obj/item/weapon/paper/toppaper = toppaper_ref?.resolve()
	data["top_paper"] = "[toppaper]"
	data["top_paper_ref"] = "[REF(toppaper)]"

	data["paper"] = list()
	data["paper_ref"] = list()
	for(var/obj/item/weapon/paper/paper in src)
		if(paper == toppaper)
			continue
		data["paper"] += "[paper]"
		data["paper_ref"] += "[REF(paper)]"

	return data

/obj/item/weapon/clipboard/tgui_act(action, params)
	. = ..()
	if(.)
		return

	if((usr.stat || usr.restrained()))
		return

	switch(action)
		// Take the pen out
		if("remove_pen")
			if(pen)
				remove_pen(usr)
				. = TRUE
		// Take paper out
		if("remove_paper")
			var/obj/item/weapon/paper/paper = locate(params["ref"]) in src
			if(istype(paper))
				remove_paper(paper, usr)
				. = TRUE
		// Look at (or edit) the paper
		if("edit_paper")
			var/obj/item/weapon/paper/paper = locate(params["ref"]) in src
			if(istype(paper))
				paper.ui_interact(usr)
				update_icon()
				. = TRUE
		// Move paper to the top
		if("move_top_paper")
			var/obj/item/weapon/paper/paper = locate(params["ref"]) in src
			if(istype(paper))
				toppaper_ref = WEAKREF(paper)
				to_chat(usr, "<span class='notice'>You move [paper] to the top.</span>")
				update_icon()
				. = TRUE
		// Rename the paper (it's a verb)
		if("rename_paper")
			var/obj/item/weapon/paper/paper = locate(params["ref"]) in src
			if(istype(paper))
				paper.rename()
				update_icon()
				. = TRUE
