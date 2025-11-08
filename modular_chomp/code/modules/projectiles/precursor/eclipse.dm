/obj/item/gun/energy/freezegun
	name = "Pulse Froster Prototype"
	desc = "A strange gun pulsing with energy, it's touch chilling you to the core."
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "cryogun"
	item_state = "cryogun"
	wielded_item_state = "cryogun-wielded"
	matter = list(MAT_DURASTEEL = 1000, MAT_MORPHIUM = 500)
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)


	charge_cost = 80 //How much energy is needed to fire.

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/item/projectile/energy/frostsphere

	recoil_mode = 0
	charge_meter = 1

	reload_time = 10

	move_delay = 0

	firemodes = list(
		list(mode_name="normal", fire_delay=5, projectile_type=/obj/item/projectile/energy/frostsphere, charge_cost = 80),
		list(mode_name="shotgun", fire_delay=15, projectile_type=/obj/item/projectile/bullet/frostshotgun, charge_cost = 240),
		)

/obj/item/gun/energy/flamegun
	name = "Flame Crystal Projector"
	desc = "A strange gun pulsing with energy, it's touch warming you up."
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "flamegun"
	item_state = "flamegun"
	wielded_item_state = "flame-wielded"

	w_class = ITEMSIZE_LARGE

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/item/projectile/energy/flamecrystal

	matter = list(MAT_DURASTEEL = 1000, MAT_MORPHIUM = 500)
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0

	charge_cost = 80

	reload_time = 10

	firemodes = list(
		list(mode_name="normal", fire_delay=5, projectile_type=/obj/item/projectile/energy/flamecrystal, charge_cost = 80),
		list(mode_name="shotgun", fire_delay=15, projectile_type=/obj/item/projectile/bullet/flamegun, charge_cost = 240),
		list(mode_name="explosive", fire_delay=10, projectile_type=/obj/item/projectile/energy/fireball, charge_cost = 160),
		)

/obj/item/projectile/energy/mechahack
	name = "remote hack"
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "databreach"
	nodamage = 1
	irradiate = 3
	speed = 1 //a bit faster due to the source having a 3 second wind up

/obj/item/projectile/energy/mechahack/on_hit(var/atom/target)
	. = ..()
	if(istype(target, /obj/mecha))
		remote_eject(target)

/obj/item/projectile/energy/mechahack/proc/remote_eject(obj/mecha/M)
	if(!M)
		return
	visible_message(span_critical("\The [M] is remotly hacked and ejects [M.occupant]!"))
	M.go_out()

/obj/item/projectile/energy/lightingspark
	name = "lighting spark"
	icon_state = "spark"
	nodamage = 1
	damage_type = HALLOSS
	speed = 2
	var/power = 20				//How hard it will hit for with electrocute_act(), decreases with each bounce.

/obj/item/projectile/energy/lightingspark/attack_mob(var/mob/living/target_mob, var/distance, var/miss_modifier=0)
	//First we shock the guy we just hit.
	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/obj/item/organ/external/affected = H.get_organ(check_zone(BP_TORSO))
		H.electrocute_act(power, src, H.get_siemens_coefficient_organ(affected), affected, 0)
	else
		target_mob.electrocute_act(power, src, 0.75, BP_TORSO)

/obj/item/projectile/bullet/crystaline
	name = "crystal bullet"
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "crystal"
	damage = 30
	armor_penetration = 20
	embed_chance = 0
	speed = 2

/obj/item/projectile/energy/eclipse
	name = "experimental laser"
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "laser"
	check_armour = "laser"
	damage = 30
	armor_penetration = 20
	penetrating = 2
	speed = 2
	crawl_destroy = TRUE

//The normal laser respects more armor, but deals more damage if you don't have it.precursor will thwack folks equally.
/obj/item/projectile/energy/eclipse/lorge
	damage = 60
	armor_penetration = 30
	icon_state = "mega_laser"
	speed = 10

/obj/item/projectile/energy/eclipse/lorgealien
	damage = 20
	armor_penetration = 60
	icon_state = "mega_laser_p"
	speed = 10

/obj/item/projectile/bullet/crystalineburst
	use_submunitions = 1
	range = 0
	embed_chance = 0
	spread_submunition_damage = FALSE
	submunition_spread_max = 120
	submunition_spread_min = 60
	submunitions = list(/obj/item/projectile/bullet/crystaline = 5)

/obj/item/projectile/energy/eclipse/janusjavelin //This will end you
	name = "energy javelin"
	icon_state = "javelin"
	damage_type = SEARING
	check_armour = "bullet"
	damage = 45
	armor_penetration = 95
	speed = 10

/obj/item/projectile/energy/eclipse/chillingwind
	name = "ice winds"
	icon_state = "ice_wind"
	damage = 15
	armor_penetration = 70
	speed = 10
	modifier_type_to_apply = /datum/modifier/cryogelled
	modifier_duration = 0.25 MINUTE

/obj/item/projectile/energy/eclipse/mining
	name = "drill"
	icon_state = "drill"
	damage_type = BRUTE
	check_armour = "bullet"
	damage = 40
	armor_penetration = 30
	speed = 10
	excavation_amount = 100
