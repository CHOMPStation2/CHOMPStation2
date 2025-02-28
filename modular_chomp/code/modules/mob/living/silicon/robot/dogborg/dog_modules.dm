/obj/item/robot_tongue/examine(user)
	. = ..()
	if(Adjacent(user))
		if(water.energy)
			. += span_notice("[src] is wet. Just like it should be.")
		if(water.energy < 5)
			. += span_notice("[src] is dry.")

/obj/item/shield_projector/line/exploborg
	name = "expirmental shield projector"
	description_info = "This creates a shield in a straight line perpendicular to the direction where the user was facing when it was activated. \
	The shield allows projectiles to leave from inside but blocks projectiles from outside.  Everything else can pass through the shield freely, \
	including other people and thrown objects.  The shield also cannot block certain effects which take place over an area, such as flashbangs or explosions."
	shield_health = 90
	max_shield_health = 90
	shield_regen_amount = 25
	line_length = 7			// How long the line is.  Recommended to be an odd number.
	offset_from_center = 2	// How far from the projector will the line's center be.

// To repair a single module
/obj/item/self_repair_system
	name = "plating repair system"
	desc = "A nanite control system to repair damaged armour plating and wiring while not moving. Destroyed armour can't be restored."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "armor"
	var/repair_time = 25
	var/repair_amount = 2.5
	var/power_tick = 25
	var/disabled_icon = "armor"
	var/active_icon = "armor_broken"
	var/list/target_components = list("armour")
	var/repairing = FALSE

/obj/item/self_repair_system/New()
	..()
	flags |= NOBLUDGEON

/obj/item/self_repair_system/attack_self(mob/user)
	if(repairing)
		return
	var/mob/living/silicon/robot/R = user
	var/destroyed_components = FALSE
	var/list/repairable_components = list()
	for(var/target_component in target_components)
		var/datum/robot_component/C = R.components[target_component]
		if(!C)
			continue
		if(istype(C.wrapped, /obj/item/broken_device))
			destroyed_components = TRUE
		else if (C.brute_damage != 0 || C.electronics_damage != 0)
			repairable_components += C
	if(!repairable_components.len && destroyed_components)
		to_chat(R, span_warning("Repair system initialization failed. Can't repair destroyed [target_components.len == 1 ? "[R.components[target_components[1]]]'s" : "component's"] plating or wiring."))
		return
	if(!repairable_components.len)
		to_chat(R, span_warning("No brute or burn damage detected [target_components.len == 1 ? "in [R.components[target_components[1]]]" : ""]."))
		return
	if(destroyed_components)
		to_chat(R, span_warning("WARNING! Destroyed modules detected. Those can not be repaired!"))
	icon_state = active_icon
	update_icon()
	repairing = TRUE
	for(var/datum/robot_component/C in repairable_components)
		to_chat(R, span_notice("Repair system initializated. Repairing plating and wiring of [C]."))
		src.self_repair(R, C, repair_time, repair_amount)
	repairing = FALSE
	icon_state = disabled_icon
	update_icon()

// To repair multiple modules
/obj/item/self_repair_system/advanced
	name = "self repair system"
	desc = "A nanite control system to repair damaged components while not moving. Destroyed components can't be restored."
	target_components = list("actuator", "radio", "power cell", "diagnosis unit", "camera", "comms", "armour")
	power_tick = 10
	repair_time = 15
	repair_amount = 3

// Robot Weapons
/obj/item/gun/energy/robotic/flare
	name = "flare gun"
	desc = "A flare-gun"
	projectile_type = /obj/item/projectile/energy/flash/flare
	fire_sound = 'sound/weapons/tablehit1.ogg'
	icon = 'icons/obj/gun.dmi'
	icon_state = "taser"
	charge_cost = 480
	borg_flags = COUNTS_AS_ROBOT_GUN | COUNTS_AS_ROBOT_TASER

/obj/item/gun/energy/robotic/smallmedigun
	name = "borg directed restoration system"
	desc = "An adapted version of the BL-3 'Phoenix, for expiremental useage in borgs."
	projectile_type = /obj/item/projectile/beam/medical_cell/borg
	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon
	charge_cost = 600
	fire_delay = 6
	force = 5
	icon_state = "medbeam"
	icon = 'icons/obj/gun_vr.dmi'
	accuracy = 100
	fire_sound = 'sound/weapons/eluger.ogg'
	self_recharge = 1
	use_external_power = 1

/obj/item/projectile/beam/medical_cell/borg
	range = 4

/obj/item/projectile/beam/medical_cell/borg/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustBruteLoss(-3.75)
			target.adjustFireLoss(-3.75)
	else
		return 1

/obj/item/melee/robotic/blade/explotailspear
	name = "energy tail"
	desc = "A glowing tail spear with a moderate range. It appears to be extremely sharp."
	force = 45
	armor_penetration = 25 //30 to try and make it not useless against armored mobs but not fully nullify it.
	reach = 3
	projectile_parry_chance = 15.

/obj/item/melee/robotic/jaws/big/explojaws
	name = "explo jaws"
	desc = "Highly lethal jaws for close range combat."
	force = 60
	armor_penetration = 25 //To try and make it not useless against armored mobs but not fully nullify it
	projectile_parry_chance = 15

/obj/item/gun/energy/robotic/phasegun
	name = "EW26 Artemis Mounted"
	desc = "The RayZar EW26 Artemis, also known as the 'phase carbine', is a downsized energy-based weapon specifically designed for use against wildlife. This one has a safety interlock that prevents firing while in proximity to the facility." //ChompEDIT
	description_fluff = "RayZar is Ward-Takahashi’s main consumer weapons brand, known for producing and licensing a wide variety of specialist energy weapons of various types and quality primarily for the civilian market."
	icon = 'icons/obj/gun.dmi'
	icon_state = "phasecarbine"
	charge_cost = 160
	recharge_time = 16
	projectile_type = /obj/item/projectile/energy/phase
	use_external_power = 1
	self_recharge = 1
	borg_flags = COUNTS_AS_ROBOT_GUN | COUNTS_AS_ROBOT_LASER
