/mob/living/silicon/robot
	var/sleeper_resting = FALSE //Enable resting belly sprites for dogborgs that have the sprites
	var/datum/matter_synth/water_res = null //Enable water for lick clean
	var/has_recoloured = FALSE
	//Multibelly support. We do not want to apply it to any module not supporting it in it's sprites
	var/list/vore_light_states = list() //Robot exclusive
	vore_capacity_ex = list()
	vore_fullness_ex = list()
	vore_icon_bellies = list()

/mob/living/silicon/robot/verb/purge_nutrition()
	set name = "Purge Nutrition"
	set category = "IC"
	set desc = "Allows you to clear out most of your nutrition if needed."

	if (stat != CONSCIOUS || nutrition <= 1000)
		return
	nutrition = 1000
	to_chat(src, "<span class='warning'>You have purged most of the nutrition lingering in your systems.</span>")
	return TRUE

/mob/living/silicon/robot/proc/ex_reserve_refill()
	set name = "Refill Extinguisher"
	set category = "Object"
	var/datum/matter_synth/water = water_res
	for(var/obj/item/weapon/extinguisher/E in module.modules)
		if(E.reagents.total_volume < E.max_water)
			if(water && water.energy > 0)
				var/amount = E.max_water - E.reagents.total_volume
				if(water.energy < amount)
					amount = water.energy
				water.use_charge(amount)
				E.reagents.add_reagent("water", amount)
				to_chat(src, "<span class='filter_notice'>You refill the extinguisher using your water reserves.</span>")
			else
				to_chat(src, "<span class='filter_notice'>Insufficient water reserves.</span>")

/mob/living/silicon/robot/proc/reset_belly_lights(var/b_class)
	if(sprite_datum.belly_light_list.len && sprite_datum.belly_light_list.Find(b_class))
		vore_light_states[b_class] = 0

/mob/living/silicon/robot/proc/update_belly_lights(var/b_class)
	if(sprite_datum.belly_light_list.len && sprite_datum.belly_light_list.Find(b_class))
		vore_light_states[b_class] = 2
		for (var/belly in vore_organs)
			var/obj/belly/B = belly
			if(b_class == "sleeper" && (B.silicon_belly_overlay_preference == "Vorebelly" || B.silicon_belly_overlay_preference == "Both") || b_class != "sleeper")
				if(B.digest_mode != DM_DIGEST || B.belly_sprite_to_affect != b_class || !B.contents.len)
					continue
				for(var/contents in B.contents)
					if(istype(contents, /mob/living))
						vore_light_states[b_class] = 1
						return

/mob/living/silicon/robot/module_reset()
	..()
	has_recoloured = FALSE
	// We only use the chomp system when the sprite supports it. Else we go through the fallback
	vore_capacity_ex = list()
	vore_fullness_ex = list()
	vore_light_states = list()

/mob/living/silicon/robot/verb/ColorMate()
	set name = "Recolour Module"
	set category = "Robot Commands"
	set desc = "Allows to recolour once."

	if(!has_recoloured)
		var/datum/ColorMate/recolour = new /datum/ColorMate(usr)
		recolour.tgui_interact(usr)
		return
	to_chat(usr, "You've already recoloured yourself once. Ask for a module reset for another.")
