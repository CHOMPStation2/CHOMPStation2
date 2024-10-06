/mob/living/simple_mob/vore/weatherbeast/acidrain/death()
	new /obj/item/melee/jellyfishwhip (src.loc)
	new /obj/item/cell/slime/jellyfish (src.loc)
	.=..()

/mob/living/simple_mob/vore/weatherbeast/starsky/death()
	new /obj/item/gun/energy/astarrail (src.loc)
	new /obj/item/weldingtool/silver (src.loc)
	.=..()

/mob/living/simple_mob/vore/weatherbeast/darkmist/death()
	new /obj/item/melee/midnightblade (src.loc)
	new /obj/item/reagent_containers/glass/beaker/gilded  (src.loc)
	.=..()

/mob/living/simple_mob/vore/weatherbeast/sandstorm/death()
	new /obj/item/gun/magnetic/matfed/phoronbore/modified (src.loc)
	new /obj/item/personal_shield_generator/belt/magnetbelt (src.loc)
	.=..()

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
		target.add_modifier(/datum/modifier/poisoned/weak/acid, 20)
	else if(user.a_intent == I_GRAB) //weaken mode
		. = ..()
		target.add_modifier(/datum/modifier/hivebot_weaken, 20)

/obj/item/cell/slime/jellyfish //Less max charge then slime but faster recharge
	name = "Jellyfish Cell Core"
	desc = "An energezied core of a toxic jellyfish titan."
	description_info = "This 'cell' holds a max charge of 10k and self recharges over time."
	maxcharge = 10000
	charge_amount = 1000

//Starry Nights
/obj/item/gun/energy/astarrail
	name = "Astral Slicer"
	desc = "A strange gun pulsing with energy, it feeling oddly lightweight."
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "star_revolver"
	item_state = "star_revolver"
	wielded_item_state = "cryogun-wielded"
	w_class = ITEMSIZE_SMALL
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)


	charge_cost = 600 //How much energy is needed to fire.

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/item/projectile/energy/astralrail

	recoil_mode = 0
	charge_meter = 1

	reload_time = 1 //Stupidly low recharge. Revolvery weapon.

	move_delay = 0


/obj/item/projectile/energy/astralrail
	name = "odd mist"
	icon = 'modular_chomp/icons/mob/starbeast.dmi'
	icon_state = "mist"
	fire_sound='sound/weapons/gauss_shoot.ogg'
	damage = 0
	nodamage = 1
	modifier_type_to_apply = /datum/modifier/astralkarma
	modifier_duration = 0.1 MINUTE

/datum/modifier/astralkarma
	name = "starfall"
	desc = "You feel dead."
	mob_overlay_state = "red_electricity_constant"
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/astralkarma/tick()
	holder.adjustBruteLoss(2.5)
	holder.adjustFireLoss(2.5)

/obj/item/weldingtool/silver
	name = "strange welding tool"
	desc = "A strange welding tool. Whilst slower then advanced gear of RnD and precursor technolgy, has benefits from both courses."
	icon_state = "hybwelder"
	toolspeed = 0.5
	flame_color = "#C2C2C2" // Light bluish.
	color = "#C2C2C2"
	eye_safety_modifier = 1
	always_process = TRUE
	reach = 2

/obj/item/weldingtool/silver/process()
	if(get_fuel() <= get_max_fuel())
		reagents.add_reagent("fuel", 1)
	..()

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

//A wierd beaker
/obj/item/reagent_containers/glass/beaker/gilded //Soo technically a good item but cumbersome to use.
	name = "golden beaker"
	desc = "An odd gold beaker, light seeming to bend around it, it's shadow dancing.."
	icon_state = "beakergold_unused"
	center_of_mass_x = 16
	center_of_mass_y= 13
	matter = list(MAT_GLASS = 500)
	volume = 400
	amount_per_transfer_from_this = 10
	flags = OPENCONTAINER | NOREACT

//Sandstorm
//Sticking with the mining theme
/obj/item/gun/magnetic/matfed/phoronbore/modified
	name = "modified portable phoron bore"
	mat_cost = 100 //more unwieldy ammo better effiency
	ammo_material = MAT_TRITIUM

//Mining tool
/obj/item/personal_shield_generator/belt/magnetbelt
	name = "magnet generator belt"
	desc = "A belt that will pull in minerals torwards you."
	generator_hit_cost = 0
	generator_active_cost = 0
	damage_cost = 0
	modifier_type = /datum/modifier/magnet

/datum/modifier/magnet //you are now a magnet
	name = "Magnet Pull"

/datum/modifier/magnet/tick()
	for(var/obj/item/ore/O in orange(4, holder))
		step_towards(O, get_turf(holder))