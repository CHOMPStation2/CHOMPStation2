//Invesitgating a runtime made me discover that all simplemobs have HUD on hands set to themselves
//Which cause this original code to die because the mob does not have a mymob var...
//So yeah this is why we now check if it is type of mob first...
//Is this pretty? Fuck no, but its how i know to fix it -shark
//Oh also the swap button on simple mob hands has hud set to null so we also need to catch that.
/obj/screen/inventory/add_overlays()
	if(!hud) //Simplemob swap hands button has this set to null :)
		return
	var/mob/user
	if(istype(hud,/mob )) //Simplemob hands directly reference the mob in hud, dont ask me.
		user = hud
	else
		user = hud.mymob //original intended behaviour
	if(hud && user && slot_id)

		var/obj/item/holding = user.get_active_hand()

		if(!holding || user.get_equipped_item(slot_id))
			return

		var/image/item_overlay = image(holding)
		item_overlay.alpha = 92

		if(!holding.mob_can_equip(user, slot_id, disable_warning = TRUE))
			item_overlay.color = "#ff0000"
		else
			item_overlay.color = "#00ff00"

		object_overlays += item_overlay
		add_overlay(object_overlays)
