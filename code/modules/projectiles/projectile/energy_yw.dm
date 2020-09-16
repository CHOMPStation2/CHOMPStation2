
//Gauss beam for gaussguns -RadiantFlash//
/obj/item/projectile/energy/gauss
	name = "gauss bolt"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "gauss"
	damage = 35
	stun = 0
	weaken = 1
	stutter = 4
	damage_type = BURN
	pass_flags = PASSTABLE | PASSGRILLE
	check_armour = "laser"

/obj/item/projectile/energy/gaussweak
	name = "gauss bolt"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "gauss"
	damage = 25
	stun = 0
	weaken = 5
	stutter = 4
	damage_type = BURN
	pass_flags = PASSTABLE | PASSGRILLE
	check_armour = "laser"

/obj/item/projectile/energy/gaussrifle
	name = "gauss bolt"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "gauss"
	damage = 60
	stun = 2
	weaken = 2
	stutter = 6
	damage_type = BURN
	pass_flags = PASSTABLE | PASSGRILLE
	penetrating = 0
	check_armour = "laser"
//End of gaussguns//

//Stun projectile for HOSgun
/obj/item/projectile/energy/electrode/x01stunshot //used for x01 gun
	name = "Stun Electrode"
	icon = 'icons/obj/projectiles_yw.dmi'
	icon_state = "s-spark"
	damage = 35
	taser_effect = 1
	agony = 65
	damage_type = HALLOSS
	stutter = 10
//plasma weaponry
/obj/item/projectile/energy/Plasma
	name = "Plasma Blast"
	icon = 'icons/obj/projectiles_yw.dmi'
	icon_state = "plasmablast"
	damage = 25
	damage_type = BURN
	pass_flags = PASSGRILLE
	check_armour = "laser"
