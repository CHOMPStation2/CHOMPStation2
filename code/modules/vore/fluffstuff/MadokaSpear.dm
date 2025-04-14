/* Two-handed Weapons
 * Contains:
 * 		Twohanded
 *		Fireaxe
 *		Double-Bladed Energy Swords
 */

/*##################################################################
##################### TWO HANDED WEAPONS BE HERE~ -Agouri :3 ########
####################################################################*/

//Rewrote TwoHanded weapons stuff and put it all here. Just copypasta fireaxe to make new ones ~Carn
//This rewrite means we don't have two variables for EVERY item which are used only by a few weapons.
//It also tidies stuff up elsewhere.

/*
 * Twohanded
 */
/obj/item/oldtwohanded
	var/wielded = 0
	var/force_wielded = 0
	var/wieldsound = null
	var/unwieldsound = null
	var/base_icon

/obj/item/oldtwohanded/proc/unwield()
	wielded = 0
	force = initial(force)
	name = "[initial(name)]"
	update_icon()

/obj/item/oldtwohanded/proc/wield()
	wielded = 1
	force = force_wielded
	name = "[initial(name)] (Wielded)"
	update_icon()

/obj/item/oldtwohanded/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/oldtwohanded/mob_can_equip(M as mob, slot, disable_warning = FALSE)
	//Cannot equip wielded items.
	if(wielded)
		to_chat(M, span_warning("Unwield the [initial(name)] first!"))
		return 0

	return ..()

/obj/item/oldtwohanded/dropped(mob/user as mob)
	//handles unwielding a twohanded weapon when dropped as well as clearing up the offhand
	..()
	if(user)
		var/obj/item/oldtwohanded/O = user.get_inactive_hand()
		if(istype(O))
			O.unwield()
	return	unwield()

/obj/item/oldtwohanded/update_icon()
	icon_state = "[base_icon][wielded]"
	item_state = icon_state

/obj/item/oldtwohanded/pickup(mob/user)
	unwield()

/obj/item/oldtwohanded/attack_self(mob/user as mob)
	..()

	if(wielded) //Trying to unwield it
		unwield()
		user << span_notice("You are now carrying the [name] with one hand.")
		if (src.unwieldsound)
			playsound(src.loc, unwieldsound, 50, 1)

		var/obj/item/oldtwohanded/offhand/O = user.get_inactive_hand()
		if(O && istype(O))
			O.unwield()

	else //Trying to wield it
		if(user.get_inactive_hand())
			user << span_warning("You need your other hand to be empty")
			return
		wield()
		user << span_notice("You grab the [initial(name)] with both hands.")
		if (src.wieldsound)
			playsound(src.loc, wieldsound, 50, 1)

		var/obj/item/oldtwohanded/offhand/O = new(user) ////Let's reserve his other hand~
		O.name = "[initial(name)] - offhand"
		O.desc = "Your second grip on the [initial(name)]"
		user.put_in_inactive_hand(O)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	return

///////////OFFHAND///////////////
/obj/item/oldtwohanded/offhand
	w_class = 5.0
	icon_state = "offhand"
	name = "offhand"

/obj/item/oldtwohanded/offhand/unwield()
	qdel(src)

/obj/item/oldtwohanded/offhand/wield()
	qdel(src)

/obj/item/oldtwohanded/offhand/update_icon()
	return

//spears, bay edition
/obj/item/oldtwohanded/spear
	icon_state = "spearglass0"
	base_icon = "spearglass"
	name = "spear"
	desc = "A haphazardly-constructed yet still deadly weapon of ancient design."
	force = 14
	w_class = 4.0
	slot_flags = SLOT_BACK
	force_wielded = 22 // Was 13, Buffed - RR
	throwforce = 20
	throw_speed = 3
	edge = 0
	sharp = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
