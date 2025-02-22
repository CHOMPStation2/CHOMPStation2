///START OF GAUSS WEAPONRY -Radiantflash ///
/obj/item/gun/energy/soapenergy/gauss
	name = "gauss pistol"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gausspistol"
	item_state = "gauss"
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 5
	fire_sound = 'modular_chomp/sound/weapons/laser4.ogg' //lighter damage sound //CHMOMPEdit - Sound moved to modular files to prevent conflict with an upstream laser sound file
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = 2
	projectile_type = /obj/item/projectile/energy/gauss
	origin_tech = null
	charge_cost = 250
	self_recharge = 1
	charge_meter = 1
	fire_delay = 10 //old technology

/obj/item/gun/energy/soapenergy/gaussrifle
	name = "gauss rifle"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gaussrifle"
	item_state = "gaussrifle"
	item_icons = list(slot_r_hand_str = 'icons/mob/items/righthand_guns_yw.dmi', slot_l_hand_str = 'icons/mob/items/lefthand_guns_yw.dmi', slot_back_str = 'icons/mob/back_yw.dmi')
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 8
	fire_sound = 'sound/weapons/Gauss_shoot.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEMSIZE_HUGE //CHOMP Edit.
	projectile_type = /obj/item/projectile/energy/gaussrifle
	origin_tech = null
	charge_cost =400
	self_recharge = 1
	charge_meter = 1
	recoil = 1
	fire_delay = 27 //old technology
	move_delay = 0 // CHOMPEdit: Pistols have move_delay of 0
///END OF GAUSS WEAPONRY///
