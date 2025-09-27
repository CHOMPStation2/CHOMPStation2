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

//Midnightfog
//funny melee weapon
/obj/item/melee/midnightblade
	name = "midnight blade"
	icon_state = "katana"
	slot_flags = SLOT_BELT | SLOT_BACK //should make a proper sprite some time but spriting energy is hard
	desc = "A sword where the blade appears to be wreathed in rippling shadows."
	force = 32 //I don't think weakning melee/speed, or weaking healing is quite the same vaule as 50% block/deflect chance.
	armor_penetration = 50

/obj/item/melee/midnightblade/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(user.a_intent == I_HURT) //Anti-Heal mode
		. = ..()
		target.add_modifier(/datum/modifier/grievous_wounds, 20)
	else if(user.a_intent == I_DISARM) //weaken mode
		. = ..()
		target.add_modifier(/datum/modifier/berserk_exhaustion, 3)
	else if(user.a_intent == I_GRAB) //The meme mode. 1/1000000 to apply an instant kill debuff....that takes 2 mins to kill.
		. = ..()
		if(prob(0.0001))
			target.add_modifier(/datum/modifier/doomed, 120)

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

