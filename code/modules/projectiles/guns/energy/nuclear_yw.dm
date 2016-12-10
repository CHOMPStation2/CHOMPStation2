/obj/item/weapon/gun/energy/las
	name = "SF 2000"
	desc = "A oddly shaped red colored energy gun, can fire both stun and lethal lasers"
	icon_state = "lasstun"
	icon = 'icons/obj/gun_yw.dmi'
	item_state = null	//so the human update icon uses the icon_state instead.
	fire_sound = 'sound/weapons/Taser.ogg'
	fire_delay = 10 // Handguns should be inferior to two-handed weapons.

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="lasstun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 240),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="laskill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 480),
		)