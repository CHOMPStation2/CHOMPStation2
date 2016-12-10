/******GLOCK******/
/*****************/
/obj/item/weapon/gun/projectile/automatic/glock
	name = "Glock G18"
	desc = "A automatic handgun that uses .9mm rounds."
	icon_state = "glock"
	item_state = "glock"
	icon = 'icons/obj/gun_yw.dmi'
	caliber = "9mm"
	load_method = MAGAZINE
	fire_sound = 'sound/weapons/semiauto.ogg'
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = list(/obj/item/ammo_magazine/mc9mm)

	firemodes = list(
	list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
	list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
	)

/obj/item/weapon/gun/projectile/automatic/glock/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]-empty"


/*******PPK*******/
/*****************/
/obj/item/weapon/gun/projectile/ppk
	name = "PPK"
	desc = "A handgun that uses .9mm rounds."
	icon_state = "ppk"
	item_state = "ppk"
	icon = 'icons/obj/gun_yw.dmi'
	caliber = "9mm"
	load_method = MAGAZINE
	fire_sound = 'sound/weapons/semiauto.ogg'
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = list(/obj/item/ammo_magazine/mc9mm)

/obj/item/weapon/gun/projectile/ppk/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]-empty"

/**/