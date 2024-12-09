obj/item/shield/riot/stun
	name = "stun shield"
	desc = "An advanced riot shield made of conductive materials on one side, that can be used to stun personnel."
	icon = 'icons/obj/guns_yw.dmi'
	icon_state = "stunshieldoff"
	slot_flags = null
	force = 3
	throwforce = 3
	throw_speed = 3
	throw_range = 4
	w_class = ITEMSIZE_NORMAL
	var/active = 0
/*
/obj/item/shield/energy/IsShield()
	if(active)
		return 1
	else
		return 0
*/
/obj/item/shield/riot/tele/attack_self(mob/living/user)
	active = !active
	icon_state = "teleriot[active]"
	playsound(src.loc, 'sound/weapons/empty.ogg', 50, 1)

	if(active)
		force = 8
		throwforce = 5
		throw_speed = 2
		w_class = ITEMSIZE_LARGE
		slot_flags = SLOT_BACK
		user << "<span class='notice'>You extend \the [src].</span>"
	else
		force = 3
		throwforce = 3
		throw_speed = 3
		w_class = ITEMSIZE_NORMAL
		slot_flags = null
		user << "<span class='notice'>[src] can now be concealed.</span>"

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)
	return

