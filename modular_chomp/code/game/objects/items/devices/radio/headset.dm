//Badmin piece of clothing that applies a few effects to a mob, used specifically for events with "hunters"
//This just helps me equip the hunters a little easier
/obj/item/device/radio/headset/event
	name = "totally normal headset"
	desc = "A headset with numerous toolkits appended to it, applying a wide variety of effects to its wearer set as per its manufacturer."
	icon_state = "cent_headset_alt"
	item_state = "headset"
	var/mob/living/carbon/human/wearer
	var/effect_icon = 'modular_chomp/icons/effects/effects.dmi'	//Cosmetic Effect that will be applied to the mob as an overlay
	var/effect_icon_state = "arrow2"
	var/image/effect_overlay = null	//Reference to an overlay so we can remove it on unequip
	var/overlay_offset_y = 32
	//Spells that will be added on equip
	var/list/spells = list("/spell/targeted/unrestricted/mend", "/spell/targeted/unrestricted/plasmastun")
	var/list/remove_spells = list()	//Reference to spells that'll get removed
	var/slowdown_to_set = 0.5
	var/item_slowdown_reset = 0	//Vars to copy and reset later
	var/slowdown_reset = 0
	light_range = 6
	light_power = 0				//Set this to 0 if you don't want a light
	light_color = "#ffaaaa"
	var/tele_threshold = 50
	var/telex = 16
	var/teley = 16
	var/telez = 0	//Set this in-round if you want a return point with fake health

/obj/item/device/radio/headset/event/equipped(var/mob/living/carbon/human/H)
	if(H && ((H.l_ear == src) || (H.r_ear == src)))
		wearer = H
		if(light_power)
			set_light(light_range,light_power,light_color,1)
		if(effect_icon)
			effect_overlay = image(effect_icon, effect_icon_state, pixel_y = overlay_offset_y*H.size_multiplier)
			effect_overlay.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
			effect_overlay.plane = PLANE_LIGHTING_ABOVE
			effect_overlay.layer = MOB_LAYER
			H.add_overlay(effect_overlay)
		if(spells.len)
			for(var/thing in spells)
				var/spell/SP = new thing(H)
				H.add_spell(SP)
				remove_spells += SP
		if(slowdown_to_set != 0)
			slowdown_reset = H.species.slowdown
			item_slowdown_reset = H.species.item_slowdown_mod
			H.species.slowdown = slowdown_to_set
			H.species.item_slowdown_mod = 0

/obj/item/device/radio/headset/event/dropped(var/mob/living/carbon/human/H)
	..()
	if(wearer)
		wearer = null
		if(light_power)
			light_on = 0
		if(effect_icon)
			H.cut_overlay(effect_overlay)
		if(remove_spells.len)
			for(var/spell/SP in remove_spells)
				H.remove_spell(SP)
				qdel(SP)
		if(slowdown_to_set != 0)
			H.species.slowdown = slowdown_reset
			H.species.item_slowdown_mod = item_slowdown_reset

/obj/item/device/radio/headset/event/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(!telez)
		return FALSE
	tele_threshold -= damage
	if(tele_threshold <= 0)
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(src, "sparks", 50, 1)
		user.visible_message("<span class='danger'>[user] is abruptly flung somewhere else in response to the damage!</span>")
		do_teleport(user, locate(telex,teley,telez), local = 0, bohsafe = 1)
		tele_threshold = initial(tele_threshold)
	return TRUE




/obj/item/device/radio/headset/outsider
	name = "generic headset"
	desc = "Headset used by those upon the planet, or in other words, outsiders."
	icon_state = "exp_headset"
	adhoc_fallback = TRUE

	ks1type = /obj/item/device/encryptionkey/headset_outsider


/obj/item/device/encryptionkey/headset_outsider
	name = "outsider radio encryption key"
	icon_state = "sec_cypherkey"

	channels = list(CHANNEL_OUTSIDER = 1)

/obj/item/device/radio/headset/headset_medsec
	name = "medical security radio headset"
	desc = "A headset with combined medical and security functionality."
	icon_state = "med_headset"
	ks2type = /obj/item/device/encryptionkey/headset_medsec
