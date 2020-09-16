///START OF GAUSS WEAPONRY -Radiantflash ///
/obj/item/weapon/gun/energy/soapenergy/gauss
	name = "gauss pistol"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gausspistol"
	item_state = "gauss"
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 5
	fire_sound = 'sound/weapons/laser4.ogg' //lighter damage sound
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = 2
	projectile_type = /obj/item/projectile/energy/gauss
	origin_tech = null
	charge_cost = 250
	self_recharge = 1
	charge_meter = 1
	fire_delay = 10 //old technology

/obj/item/weapon/gun/energy/soapenergy/gaussrifle
	name = "gauss rifle"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gaussrifle"
	item_state = "gaussrifle"
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 5
	fire_sound = 'sound/weapons/Gauss_shoot.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = 4
	projectile_type = /obj/item/projectile/energy/gaussrifle
	origin_tech = null
	charge_cost =400
	self_recharge = 1
	charge_meter = 1
	recoil = 1
	fire_delay = 27 //old technology
///END OF GAUSS WEAPONRY///