/obj/item/weapon/gun/energy/medigun/mounted
	name = "mounted directed restoration system"
	self_recharge = 1
	use_external_power = 1

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


/obj/item/weapon/gun/energy/rednetgun
	name = "experimental capture gun"
	desc = "An experimental gun, in efforts to expand net gun technology. Utilizing eletronic interferance and a \
	heat aura it in theory stops the subject from fighting back."
	icon_state = "goldstunrevolver"
	item_state = null
	projectile_type = /obj/item/projectile/energy/rednet
	charge_cost = 1440 //so a taser has 15 shots at 480 and I want five but this feels goofy


/obj/item/projectile/energy/rednet
	name = "expirmental energy net"
	icon_state = "toxin"
	damage = 0
	check_armour = "energy"
	hud_state = "pistol_tranq"
	fire_sound = 'sound/weapons/Taser.ogg'
	nodamage = 1
	modifier_type_to_apply = /datum/modifier/rednet
	modifier_duration = 0.5 MINUTE
	speed = 1.5

/datum/modifier/rednet
	mob_overlay_state = "red_electricity_constant"
	slowdown = 1