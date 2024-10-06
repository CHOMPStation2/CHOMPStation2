/obj/item/gun/projectile/automatic/mg42
	name = "MG42"
	desc = "Entfesseln die Holle" //Unleash the hell
	icon = 'icons/obj/gun_yw.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_yw.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_yw.dmi',
		)
	icon_state = "mg42closed"
	item_state = "mg42"
	w_class = ITEMSIZE_HUGE
	force = 10
	slot_flags = 0
	max_shells = 75
	caliber = "mauser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = "/obj/item/ammo_casing/a792x57m/lmg" // Is this really needed anymore?
	fire_sound = 'sound/weapons/mg42.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mg42
	allowed_magazines = list(/obj/item/ammo_magazine/mg42)
	burst_delay = 0.5

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="15-round bursts.. unleash hell",	burst=15, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2))
		)

	var/cover_open = 0

/obj/item/gun/projectile/automatic/mg42/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/gun/projectile/automatic/mg42/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/gun/projectile/automatic/mg42/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/gun/projectile/automatic/mg42/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/gun/projectile/automatic/mg42/update_icon()
	icon_state = "mg42[cover_open ? "open" : "closed"][ammo_magazine ? "" : "-empty"][cover_open && ammo_magazine && ammo_magazine.stored_ammo.len == 0 ? "0" : ""]"
	item_state = "mg42"
	update_held_icon()

/obj/item/gun/projectile/automatic/mg42/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/gun/projectile/automatic/mg42/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()