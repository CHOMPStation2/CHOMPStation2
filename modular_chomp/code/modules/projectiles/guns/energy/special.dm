/obj/item/gun/energy/medigun/mounted
	name = "mounted directed restoration system"
	self_recharge = 1
	use_external_power = 1

/obj/item/gun/energy/taser/disabler/slow
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


/obj/item/gun/energy/rednetgun
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

/obj/item/projectile/bullet/magnetic/supercannon
	name = "railcannon slug"
	icon_state = "fuel-supermatter"
	damage = 1500 //You are not being defibbed from this.
	weaken = 2
	armor_penetration = 100
	penetrating = 1500 //Theoretically, this shouldn't stop flying for a while, unless someoneI t lines it up with a wall or fires it into a mountain.
	range = 200
	hud_state = "rocket_thermobaric"
	speed = 0.2

/obj/item/projectile/bullet/magnetic/supercannon/on_hit(var/atom/target, var/blocked = 0, var/def_zone = null)
	if(istype(target,/turf/simulated/wall) || istype(target,/mob/living))
		target.visible_message("<span class='danger'>The [src] burns a perfect hole through \the [target] with a blinding flash!</span>")
		playsound(target, 'sound/effects/teleport.ogg', 40, 0)
	return ..(target, blocked, def_zone)

/obj/item/projectile/bullet/magnetic/supercannon/Bump(atom/target) //On hit doesnt work on turfs, gotta snowflake it. Why is on_hit() called by the target, NOT the proj?????
	..()
	if(istype(target,/turf/simulated/wall))
		var/turf/simulated/wall/B = target
		B.dismantle_wall(1,1,0)

/obj/item/projectile/bullet/magnetic/supercannon/check_penetrate()
	return 1


/obj/item/gun/energy/supercannon
	name = "Super-Rail Cannon"
	desc = "This weapon seems to be vibrating with a barely containable energy, with no charging ports or battery ports in sight, you only have a singlular shot of this. Ever"
	icon = 'modular_chomp/icons/obj/guns/supercannon/supercannon.dmi'
	icon_state = "supercannon"
	item_state = "supercannon"
	wielded_item_state = "supercannon-wielded"
	w_class = ITEMSIZE_HUGE
	fire_sound = 'sound/weapons/Gunshot_cannon.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	charge_cost = 2400 //You got 1 shot...
	self_recharge = TRUE
	recharge_time = 6 HOURS //This is how to get around rechargers being able to recharge it, I dont wanna rewrite base level code
	projectile_type = /obj/item/projectile/bullet/magnetic/supercannon //Fuck you.
	cell_type = /obj/item/cell/device/weapon
	battery_lock = 1
	force = 15 //pretty robust
	one_handed_penalty = 90
	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/obj/guns/supercannon/lefthand_guns.dmi',
		slot_r_hand_str = 'modular_chomp/icons/obj/guns/supercannon/righthand_guns.dmi',
		)
