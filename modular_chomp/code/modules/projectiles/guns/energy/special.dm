/obj/item/weapon/gun/energy/taser/disabler/slow
	name = "plasma snare device"
	desc = "A modified disabler adjusted to impulse a target with a restrictive slowdown."
	icon_state = "disabler"
	projectile_type = /obj/item/projectile/energy/plasmastun/slow
	charge_cost = 480
	self_recharge = 1
	recharge_time = 3

/obj/item/projectile/energy/plasmastun/slow
	name = "plasma pulse"
	icon_state = "plasma_stun"
	fire_sound = 'sound/weapons/weaponsounds_laserstrong.ogg'
	armor_penetration = 10
	range = 9
	damage = 0
	agony = 0
	vacuum_traversal = 1
	hud_state = "plasma_rifle_blast"

/obj/item/projectile/energy/plasmastun/slow/on_hit(var/atom/target)
	if(isliving(target))
		var/mob/living/L = target
		L.add_modifier(/datum/modifier/entangled, 10 SECONDS)