//occult stuff
/*
/obj/item/prop/explo_loot
	name = "alien object"
	desc = "A strange piece of equipment, could be utilized to enginer a new device if all the pieces are collected."
	icon_state = "health"

/obj/item/prop/explo_loot/storm_staff

/obj/item/prop/explo_loot/storm_staff/piece_a

/obj/item/prop/explo_loot/storm_staff/piece_b

/obj/item/prop/explo_loot/storm_staff/piece_c

/obj/item/gun/magic/storm
	name = "staff of storm"
	desc = "A strange weapon made of unknown technolgy, but mimics a staff one would see in fantasty."
	icon_state = "staffofstorms"
	fire_sound = 'sound/weapons/emitter.ogg'
	w_class = ITEMSIZE_LARGE
	projectile_type = null
	max_charges = 2
	recharge_rate = 4
	can_charge = TRUE
*/

/obj/item/cell/device/weapon/recharge/cult
	name = "occult cell"
	desc = "An alien technology that produces energy seemingly out of nowhere, perhaps from another realm?"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "soulstone2"
	charge = 300
	maxcharge = 300
	charge_amount = 300
	charge_delay = 50

//mouse stuff
/obj/item/prop/explo_loot/space_mountain/piece_a

/obj/item/prop/explo_loot/space_mountain/piece_b

/obj/item/prop/explo_loot/space_mountain/piece_c


/obj/item/clothing/shoes/magboots/advanced/climbing
	name = "space mountaineer boots"
	desc = "A pair of specialized magboots designed for climbing mountains in abnormal gravity conditions."
	rock_climbing = TRUE
	climbing_delay = 0.1
	color = "#595959"

/*
/obj/item/prop/explo_loot/wierd_helmet/piece_a

/obj/item/prop/explo_loot/wierd_helmet/piece_b

/obj/item/prop/explo_loot/wierd_helmet/piece_c
*/

/obj/item/clothing/head/psy_crown/ling
	name = "expirmental helmet"
	desc = "A strange helmet with odd circuitry, and wiring, design to increase the wearer's efficiency."
	description_info = "This has a chance to cause the wearer to become hardy against death, and increase dodging, but hungry when in extreme danger."
	icon_state = "lingchameleon"
	flavor_equip = span_warning("You feel a bit hungrier after putting on this helmet.")
	flavor_unequip = span_notice("You feel sated after removing the helmet.")
	flavor_drop = span_notice("You feel much more sated after letting go of the helmet.")
	flavor_activate = span_danger("An otherworldly feeling seems to enter your mind, and it drives your mind into gluttony!")
	brainloss_cost = 0

/obj/item/clothing/head/psy_crown/ling/activate_ability(var/mob/living/wearer)
	..()
	wearer.add_modifier(/datum/modifier/supersolider, 60 SECONDS)

/datum/modifier/supersolider
	evasion = 40
	bleeding_rate_percent = 0.2
	metabolism_percent = 3
	pain_immunity = 1

//pirate stuff
/*
/obj/item/prop/explo_loot/eyepatch/piece_a

/obj/item/prop/explo_loot/eyepatch/piece_b

/obj/item/prop/explo_loot/eyepatch/piece_c


/obj/item/prop/explo_loot/gloves/piece_a

/obj/item/prop/explo_loot/gloves/piece_b

/obj/item/prop/explo_loot/gloves/piece_c

for refrence
/obj/item/clothing/glasses/graviton/medgravpatch

/obj/item/clothing/gloves/regen
*/
