// Buzzer Ring - Traitor, Merc.
/obj/item/clothing/gloves/ring/buzzer
	name = "ring"
	desc = "A plain metal band."
	description_antag = "This morphium-alloy ring continually generates an electric field, capable of electrocuting a target while not injuring the wearer.\
	The device is also capable of 'frankenstein'-ing a corpse, long after normal technology would be able to save them. The body will still be tied to the\
	normal damage limits for survival, however, so care must be taken."
	icon_state = "material"
	var/battery_type = /obj/item/cell/device/weapon/recharge
	var/obj/item/cell/battery = null

/obj/item/clothing/gloves/ring/buzzer/get_cell()
	return battery

/obj/item/clothing/gloves/ring/buzzer/Initialize(mapload)
	. = ..()
	if(!battery)
		battery = new battery_type(src)

/obj/item/clothing/gloves/ring/buzzer/Touch(var/atom/A, var/proximity)
	if(proximity && istype(usr, /mob/living/carbon/human))
		return zap(usr, A, proximity)
	return 0

/obj/item/clothing/gloves/ring/buzzer/proc/zap(var/mob/living/carbon/human/user, var/atom/movable/target, var/proximity)
	. = FALSE
	if(user.a_intent == I_HURT && battery.percent() >= 50)
		if(isliving(target))
			var/mob/living/L = target

			if(ishuman(L) && battery.percent() >= 90)	// Silent text-wise, for maximum potential for gimmicks.
				var/mob/living/carbon/human/H = L

				if(H.stat == DEAD)
					. = TRUE

					do_defib(H)

			to_chat(L, span_warning("You feel a powerful shock!"))
			if(!.)
				playsound(L, 'sound/effects/sparks7.ogg', 40, 1)
				L.electrocute_act(battery.percent() * 0.25, src)
				battery.emp_act(2)
			return .

	return 0

/obj/item/clothing/gloves/ring/buzzer/proc/do_defib(var/mob/living/carbon/human/H = null)
	if(!istype(H))
		return 0

	dead_mob_list.Remove(H)
	if((H in living_mob_list) || (H in dead_mob_list))
		WARNING("Mob [H] was ring-defibbed but already in the living or dead list still!")
	living_mob_list += H

	H.timeofdeath = 0
	H.set_stat(UNCONSCIOUS)
	H.failed_last_breath = 0
	H.reload_fullscreen()

	H.emote("gasp")
	H.Weaken(rand(10,25))
	H.updatehealth()

	battery.emp_act(1)
