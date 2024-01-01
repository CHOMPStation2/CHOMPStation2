/obj/item/device/robot_tongue/examine(user)
	. = ..()
	if(Adjacent(user))
		if(water.energy)
			. += "<span class='notice'>[src] is wet. Just like it should be.</span>"
		if(water.energy < 5)
			. += "<span class='notice'>[src] is dry.</span>"

/obj/item/weapon/gun/energy/taser/mounted/cyborg/flare
	name = "flare gun"
	desc = "A flare-gun"
	projectile_type = /obj/item/projectile/energy/flash/flare
	fire_sound = 'sound/weapons/tablehit1.ogg'

/obj/item/shield_projector/line/exploborg
	name = "expirmental shield projector"
	description_info = "This creates a shield in a straight line perpendicular to the direction where the user was facing when it was activated. \
	The shield allows projectiles to leave from inside but blocks projectiles from outside.  Everything else can pass through the shield freely, \
	including other people and thrown objects.  The shield also cannot block certain effects which take place over an area, such as flashbangs or explosions."
	shield_health = 35
	max_shield_health = 35
	shield_regen_amount = 10
	line_length = 7			// How long the line is.  Recommended to be an odd number.
	offset_from_center = 2	// How far from the projector will the line's center be.

/obj/item/weapon/melee/combat_borgblade/explotailspear
	name = "energy tail"
	desc = "A glowing tail spear with a moderate range. It appears to be extremely sharp."
	force = 25
	armor_penetration = 25 //30 to try and make it not useless against armored mobs but not fully nullify it.
	reach = 3
	projectile_parry_chance = 15.

/obj/item/weapon/melee/dogborg/jaws/big/explojaws
	name = "explo jaws"
	desc = "Highly lethal jaws for close range combat."
	force = 40
	armor_penetration = 25 //To try and make it not useless against armored mobs but not fully nullify it
	projectile_parry_chance = 15

/obj/item/weapon/gun/energy/medigun/mounted/smallmedigun
	name = "borg directed restoration system"
	desc = "An adapted version of the BL-3 'Phoenix, for expiremental useage in borgs."
	projectile_type = /obj/item/projectile/beam/medical_cell/borg
	accept_cell_type = /obj/item/weapon/cell/device
	cell_type = /obj/item/weapon/cell/device/weapon
	charge_cost = 600
	fire_delay = 6

/obj/item/projectile/beam/medical_cell/borg
	range = 4

/obj/item/projectile/beam/medical_cell/borg/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustBruteLoss(-3.75)
			target.adjustFireLoss(-3.75)
	else
		return 1

/obj/item/device/self_repair_system
	name = "plating repair system"
	desc = "A nanite control system to repair damaged armour plating and wiring while not moving. Destroyed armour can't be restored."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "armor"
	var/disabled_icon = "armor"
	var/active_icon = "armor_broken"
	var/target_component = "armour"
	var/repairing = FALSE

/obj/item/device/self_repair_system/New()
	..()
	flags |= NOBLUDGEON

/obj/item/device/self_repair_system/attack_self(mob/user)
	if(repairing)
		return
	var/mob/living/silicon/robot/R = user
	var/datum/robot_component/C = R.components[target_component]
	if(C && !istype(C.wrapped, /obj/item/broken_device))
		if(C.brute_damage == 0 && C.electronics_damage == 0)
			to_chat(R, "<span class='warning'>No brute or burn damage detected in [target_component].</span>")
			return
		to_chat(R, "<span class='notice'>Repair system initializated. Repairing plating and wiring.</span>")
		icon_state = active_icon
		update_icon()
		repairing = TRUE
		src.self_repair(R, C, 25, 2.5)
		repairing = FALSE
		icon_state = disabled_icon
		update_icon()
	else
		to_chat(R, "<span class='warning'>Repair system initialization failed. Can't repair destroyed [target_component]'s plating or wiring.</span>")

/obj/item/device/self_repair_system/proc/self_repair(mob/living/silicon/robot/R, datum/robot_component/C, var/tick_delay, var/heal_per_tick)
	if(!C || !R.cell)
		return
	if(R.cell.charge < 500) //We don't want to drain ourselves too far down during exploration
		to_chat(R, "<span class='warning'>Not enough power to initialize the repair system.</span>")
		return
	if(C.brute_damage == 0 && C.electronics_damage == 0)
		to_chat(R, "<span class='notice'>Repair of [target_component] completed.</span>")
		return
	if(do_after(R, tick_delay))
		if(!C || !R.cell)
			return
		C.brute_damage -= min(C.brute_damage, heal_per_tick)
		C.electronics_damage -= min(C.electronics_damage, heal_per_tick)
		R.updatehealth()
		R.cell.use(50)
		src.self_repair(R, C, tick_delay, heal_per_tick)
