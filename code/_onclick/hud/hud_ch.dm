/**
 * CHOMP-Specific HUD override. This will be backported to Polaris if they want it. 
 */
///Add an ammo hud to the user informing of the ammo count of G
/datum/hud/proc/add_ammo_hud(mob/living/user, obj/item/weapon/gun/G)
	if(length(ammo_hud_list) >= MAX_AMMO_HUD_POSSIBLE)
		return
	var/obj/screen/ammo/ammo_hud = new
	ammo_hud_list[G] = ammo_hud
	ammo_hud.screen_loc = ammo_hud.ammo_screen_loc_list[length(ammo_hud_list)]
	ammo_hud.add_hud(user, G)
	ammo_hud.update_hud(user, G)

///Remove the ammo hud related to the gun G from the user
/datum/hud/proc/remove_ammo_hud(mob/living/user, obj/item/weapon/gun/G)
	var/obj/screen/ammo/ammo_hud = ammo_hud_list[G]
	ammo_hud.remove_hud(user, G)
	qdel(ammo_hud)
	ammo_hud_list -= G
	var/i = 1
	for(var/key in ammo_hud_list)
		ammo_hud = ammo_hud_list[key]
		ammo_hud.screen_loc = ammo_hud.ammo_screen_loc_list[i]
		i++

///Update the ammo hud related to the gun G
/datum/hud/proc/update_ammo_hud(mob/living/user, obj/item/weapon/gun/G)
	var/obj/screen/ammo/ammo_hud = ammo_hud_list[G]
	ammo_hud?.update_hud(user, G)