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
/obj/item/oldtwohanded // CHOMPEdit - Removal of obj/item/weapon
	var/wielded = 0
	var/force_wielded = 0
	var/wieldsound = null
	var/unwieldsound = null
	var/base_icon

/obj/item/oldtwohanded/proc/unwield() // CHOMPEdit - Removal of obj/item/weapon
	wielded = 0
	force = initial(force)
	name = "[initial(name)]"
	update_icon()

/obj/item/oldtwohanded/proc/wield() // CHOMPEdit - Removal of obj/item/weapon
	wielded = 1
	force = force_wielded
	name = "[initial(name)] (Wielded)"
	update_icon()

/obj/item/oldtwohanded/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	update_icon()

/obj/item/oldtwohanded/mob_can_equip(M as mob, slot, disable_warning = FALSE) // CHOMPEdit - Removal of obj/item/weapon
	//Cannot equip wielded items.
	if(wielded)
		to_chat(M, "<span class='warning'>Unwield the [initial(name)] first!</span>")
		return 0

	return ..()

/obj/item/oldtwohanded/dropped(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	//handles unwielding a twohanded weapon when dropped as well as clearing up the offhand
	if(user)
		var/obj/item/oldtwohanded/O = user.get_inactive_hand() // CHOMPEdit - Removal of obj/item/weapon
		if(istype(O))
			O.unwield()
	return	unwield()

/obj/item/oldtwohanded/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "[base_icon][wielded]"
	item_state = icon_state

/obj/item/oldtwohanded/pickup(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	unwield()

/obj/item/oldtwohanded/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()

	if(wielded) //Trying to unwield it
		unwield()
		user << "<span class='notice'>You are now carrying the [name] with one hand.</span>"
		if (src.unwieldsound)
			playsound(src.loc, unwieldsound, 50, 1)

		var/obj/item/oldtwohanded/offhand/O = user.get_inactive_hand() // CHOMPEdit - Removal of obj/item/weapon
		if(O && istype(O))
			O.unwield()

	else //Trying to wield it
		if(user.get_inactive_hand())
			user << "<span class='warning'>You need your other hand to be empty</span>"
			return
		wield()
		user << "<span class='notice'>You grab the [initial(name)] with both hands.</span>"
		if (src.wieldsound)
			playsound(src.loc, wieldsound, 50, 1)

		var/obj/item/oldtwohanded/offhand/O = new(user) ////Let's reserve his other hand~ // CHOMPEdit - Removal of obj/item/weapon
		O.name = "[initial(name)] - offhand"
		O.desc = "Your second grip on the [initial(name)]"
		user.put_in_inactive_hand(O)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	return

///////////OFFHAND///////////////
/obj/item/oldtwohanded/offhand // CHOMPEdit - Removal of obj/item/weapon
	w_class = 5.0
	icon_state = "offhand"
	name = "offhand"

/obj/item/oldtwohanded/offhand/unwield() // CHOMPEdit - Removal of obj/item/weapon
	qdel(src)

/obj/item/oldtwohanded/offhand/wield() // CHOMPEdit - Removal of obj/item/weapon
	qdel(src)

/obj/item/oldtwohanded/offhand/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	return

//spears, bay edition
/obj/item/oldtwohanded/spear // CHOMPEdit - Removal of obj/item/weapon
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