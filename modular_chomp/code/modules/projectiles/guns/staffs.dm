/obj/item/weapon/gun/magic/firestaff/vrwizard
	name = "vr staff"
	desc = "A magical staff brimming with energy."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staffoffire"
	item_state = "staff"
	fire_sound = 'sound/weapons/emitter.ogg'
	w_class = ITEMSIZE_HUGE
	checks_antimagic = TRUE
	max_charges = 10
	charges = 0
	recharge_rate = 2
	charge_tick = 0
	can_charge = TRUE

	projectile_type = /obj/item/projectile/energy/homing_bolt/wizard

/obj/item/weapon/gun/magic/firestaff/vrwizard/fire
	description_info = "It will burn the target along with reducing their bleeding."
	projectile_type = /obj/item/projectile/energy/homing_bolt/wizard/fire
	color = "#FF0000"

/obj/item/weapon/gun/magic/firestaff/vrwizard/lighting
	description_info = "It will lightly burn targets and open them up to energy based attacks."
	projectile_type = /obj/item/projectile/energy/homing_bolt/wizard/lighting
	color = "#C1F20B"

/obj/item/weapon/gun/magic/firestaff/vrwizard/poison
	description_info = "It will heavly poison targets."
	projectile_type = /obj/item/projectile/energy/homing_bolt/wizard/poison
	color = "#003300"

/obj/item/weapon/gun/magic/firestaff/vrwizard/frost
	description_info = "Will slow down and minorly poison targets."
	projectile_type = /obj/item/projectile/energy/homing_bolt/wizard/frost
	color = "#00CCFF"