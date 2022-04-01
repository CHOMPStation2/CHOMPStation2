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
		
// Begin TGMC Ammo HUD Port
/obj/screen/ammo
	name = "ammo"
	icon = 'icons/mob/ammoHUD.dmi'
	icon_state = "ammo"
	screen_loc = ui_ammo_hud1
	var/warned = FALSE
	var/static/list/ammo_screen_loc_list = list(ui_ammo_hud1, ui_ammo_hud2, ui_ammo_hud3 ,ui_ammo_hud4)

/obj/screen/ammo/proc/add_hud(var/mob/living/user)
	if(!user?.client)
		return

	var/obj/item/weapon/gun/G = user.get_active_hand()

	if(!G || !G.has_ammo_counter() || !G.hud_enabled)
		return

	user.client.screen += src

/obj/screen/ammo/proc/remove_hud(var/mob/living/user)
	user?.client?.screen -= src

/obj/screen/ammo/proc/update_hud(var/mob/living/user)
	if(!user?.client?.screen.Find(src))
		return

	var/obj/item/weapon/gun/G = user.get_active_hand()

	if(!G || !istype(G) || !G.has_ammo_counter() || !G.hud_enabled || !G.get_ammo_type() || isnull(G.get_ammo_count()))
		remove_hud()
		return

	var/list/ammo_type = G.get_ammo_type()
	var/rounds = G.get_ammo_count()

	var/hud_state = ammo_type[1]
	var/hud_state_empty = ammo_type[2]

	overlays.Cut()

	var/empty = image('icons/mob/ammoHUD.dmi', src, "[hud_state_empty]")

	if(rounds == 0)
		if(warned)
			overlays += empty
		else
			warned = TRUE
			var/obj/screen/ammo/F = new /obj/screen/ammo(src)
			F.icon_state = "frame"
			user.client.screen += F
			flick("[hud_state_empty]_flash", F)
			spawn(20)
				user.client.screen -= F
				qdel(F)
				overlays += empty
	else
		warned = FALSE
		overlays += image('icons/mob/ammoHUD.dmi', src, "[hud_state]")

	rounds = num2text(rounds)
	//Handle the amount of rounds
	switch(length(rounds))
		if(1)
			overlays += image('icons/mob/ammoHUD.dmi', src, "o[rounds[1]]")
		if(2)
			overlays += image('icons/mob/ammoHUD.dmi', src, "o[rounds[2]]")
			overlays += image('icons/mob/ammoHUD.dmi', src, "t[rounds[1]]")
		if(3)
			overlays += image('icons/mob/ammoHUD.dmi', src, "o[rounds[3]]")
			overlays += image('icons/mob/ammoHUD.dmi', src, "t[rounds[2]]")
			overlays += image('icons/mob/ammoHUD.dmi', src, "h[rounds[1]]")
		else //"0" is still length 1 so this means it's over 999
			overlays += image('icons/mob/ammoHUD.dmi', src, "o9")
			overlays += image('icons/mob/ammoHUD.dmi', src, "t9")
			overlays += image('icons/mob/ammoHUD.dmi', src, "h9")