//Acid Rain Boss
/obj/item/melee/jellyfishwhip
	name = "dettached jellyfish tendril"
	desc = "The detatched limb of a titan jellyfish."
	sharp = FALSE
	edge = FALSE
	force = 28
	armor_penetration = 50
	flags = NOCONDUCT | NOBLOODY
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	icon = 'icons/obj/weapons.dmi'
	icon_state = "whip"
	item_state = "chain"

/obj/item/melee/jellyfishwhip/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(user.a_intent == I_HURT) //Healy mode
		. = ..()
		target.adjustFireLoss(10)
		user.adjustFireLoss(-7)
		user.adjustBruteLoss(-7)
	else if(user.a_intent == I_DISARM) //DoT mode
		. = ..()
		target.add_modifier(/datum/modifier/poisoned, 20)
	else if(user.a_intent == I_GRAB) //weaken mode
		. = ..()
		target.add_modifier(/datum/modifier/hivebot_weaken, 20)

/obj/item/cell/slime/jellyfish //Less max charge then slime but faster recharge
	name = "Jellyfish Cell Core"
	desc = "An energezied core of a toxic jellyfish titan."
	description_info = "This 'cell' holds a max charge of 10k and self recharges over time."
	maxcharge = 10000
	charge_amount = 1000

//Reworking an old weapon into Tyr melee loot. Old Weapon was the Midnight Blade
//E sword has 30 damage, 50 AP, and 65% projectile block
//Midnightblade has less AP, and less projectile block chance
//In exchange it has special charatisics on melee hits, and higher melee block
/obj/item/melee/energy/tyr_sabre
	name = "tyrian energy blade"
	slot_flags = SLOT_BELT | SLOT_BACK //should make a proper sprite some time but spriting energy is hard
	desc = "A forgien blade made via techniques of ages old. Gains a diffrent effect base off your stance."
	description_info = "Attacking whilst on grab intent weakens the target's healing, attacking whilst on disarm weakens the target's melee potential, and attacking whilst on harm has a 2% chance to deal guaranteed massive damage."
	active_force = 30
	active_armourpen = 30
	projectile_parry_chance = 20
	defend_chance = 20
	colorable = FALSE

	icon = 'modular_chomp/icons/mob/tribal_gear.dmi'
	icon_state = "sabre"
	item_state = "sabre"

	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/obj/guns/precursor/lefthand.dmi',
		slot_r_hand_str = 'modular_chomp/icons/obj/guns/precursor/righthand.dmi',
		)

/obj/item/melee/energy/tyr_sabre/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(user.a_intent == I_GRAB) //Anti-Heal mode
		. = ..()
		if(active)
			target.add_modifier(/datum/modifier/grievous_wounds, 20)
	else if(user.a_intent == I_DISARM) //weaken mode
		. = ..()
		if(active)
			target.add_modifier(/datum/modifier/berserk_exhaustion, 3)
	else if(user.a_intent == I_HURT) //Tiny Chance to crit
		. = ..()
		if(active && prob(2))
			target.adjustBruteLoss(-50)
			playsound(src, "blade1", 50, 1)

//Mining tool
/obj/item/personal_shield_generator/belt/magnetbelt
	name = "magnet generator belt"
	desc = "A belt that will pull in minerals torwards you."
	generator_hit_cost = 0
	generator_active_cost = 0
	damage_cost = 0
	modifier_type = /datum/modifier/magnet

/obj/item/personal_shield_generator/belt/fossiltank
	name = "expirmental magnet generator belt"
	desc = "A belt that will pull in minerals torwards you whilst bolstering your defense."
	modifier_type = /datum/modifier/magnet/defense

/datum/modifier/magnet //you are now a magnet
	name = "Magnet Pull"

/datum/modifier/magnet/tick()
	for(var/obj/item/ore/O in orange(4, holder))
		step_towards(O, get_turf(holder))

/datum/modifier/magnet/defense
	max_brute_resistance = 0.3
	min_brute_resistance = 0.8
	effective_brute_resistance = 1

	max_fire_resistance = 0.3
	min_fire_resistance = 0.8
	effective_fire_resistance = 1

//props meant to be scanned/deconstructed by science, obtained via exploration
/obj/item/prop/deconstructable
	name = "strange device"
	desc = "An advanced bit of technolgy, potentially useable by science."
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "gigapower_core"
	w_class = ITEMSIZE_SMALL

/obj/item/prop/deconstructable/gigacell
	name = "giga power assembly"

/obj/item/cell/device/weapon/recharge/cult
	name = "occult cell"
	desc = "An alien technology that produces energy seemingly out of nowhere, perhaps from another realm?"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "soulstone2"
	charge = 300
	maxcharge = 300
	charge_amount = 300
	charge_delay = 50
