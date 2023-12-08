/hook/startup/proc/Modular_Borg_init_Exploration()
	robot_modules["Exploration"] = /obj/item/weapon/robot_module/robot/exploration //add to array
	robot_module_types += "Exploration" //Add to global list
	return 1

//Explo doggos
/obj/item/weapon/robot_module/robot/exploration
	name = "exploration robot module"
	channels = list("Exploration" = 1)
	languages = list(
					LANGUAGE_SOL_COMMON	= 1,
					LANGUAGE_UNATHI		= 1,
					LANGUAGE_SIIK		= 1,
					LANGUAGE_AKHANI		= 1,
					LANGUAGE_SKRELLIAN	= 1,
					LANGUAGE_SKRELLIANFAR = 0,
					LANGUAGE_ROOTLOCAL	= 0,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_GUTTER		= 0,
					LANGUAGE_SCHECHI	= 1,
					LANGUAGE_EAL		= 1,
					LANGUAGE_TERMINUS	= 1,
					LANGUAGE_SIGN		= 0
					)

/obj/item/weapon/robot_module/robot/exploration
	can_be_pushed = 0
/obj/item/weapon/robot_module/robot/exploration/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/dogborg/sleeper/exploration(src)
	src.modules += new /obj/item/device/cataloguer(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg/flare(src)
	src.modules += new /obj/item/weapon/dogborg/pounce(src)
	src.modules += new /obj/item/weapon/melee/combat_borgblade/explotailspear(src)
	src.modules += new /obj/item/weapon/gun/energy/smallmedigun/mounted(src)
	src.modules += new /obj/item/shield_projector/line/exploborg(src)
	src.modules += new /obj/item/roller_holder(src)

	src.emag 	 += new /obj/item/weapon/melee/jaws/big/explojaws(src)

	..()

/obj/item/device/dogborg/sleeper/exploration //No need to inherit from the brig one, we cna direclty make a proper new one
	name = "Store-Belly"
	desc = "Equipment for a ExploreHound unit. A mounted portable-storage device that holds supplies/person."
	icon_state = "sleeperlost"
	injection_chems = null
	compactor = TRUE
	max_item_count = 4
	medsensor = FALSE
	recycles = TRUE

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
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "swordtail"
	desc = "A glowing tail dagger. It appears to be extremely sharp."
	force = 25
	armor_penetration = 25 //To try and make it not useless against armored mobs but not fully nullify it
	throwforce = 0 //This shouldn't be thrown in the first place.
	hitsound = 'sound/weapons/blade1.ogg'
	attack_verb = list("slashed", "stabbed", "jabbed", "mauled", "sliced")
	reach = 2
	projectile_parry_chance = 15.

/obj/item/weapon/melee/jaws/big/explojaws
	name = "explo jaws"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "jaws"
	desc = "The jaws of the law."
	force = 40
	armor_penetration = 25 //To try and make it not useless against armored mobs but not fully nullify it
	throwforce = 0
	hitsound = 'sound/weapons/bite.ogg'
	attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
	projectile_parry_chance = 15

/obj/item/weapon/gun/energy/smallmedigun
	name = "borg directed restoration system"
	desc = "An adapted version of the BL-3 'Phoenix, for expiremental useage in borgs."
	icon_state = "medbeam"
	item_state = "medbeam"
	icon = 'icons/obj/gun_vr.dmi'
	projectile_type = /obj/item/projectile/beam/medical_cell/borg
	charge_cost = 300

/obj/item/weapon/gun/energy/smallmedigun/mounted
	self_recharge = 1
	use_external_power = 1

/obj/item/projectile/beam/medical_cell/borg
	range = 4

/obj/item/projectile/beam/medical_cell/borg/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustBruteLoss(-0.75)
			target.adjustFireLoss(-0.75)
			target.adjustToxLoss(-0.75)
	else
		return 1