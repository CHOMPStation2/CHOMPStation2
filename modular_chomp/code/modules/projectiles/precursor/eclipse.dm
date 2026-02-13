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

/obj/item/grenade/chem_grenade/frost
	name = "frost grenade"
	desc = "Currently in the testing phase, pratical purposes are unknown."
	icon_state = "foam"
	path = 1
	stage = 2
	sealed = TRUE

/obj/item/grenade/chem_grenade/frost/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/bluespace/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/bluespace/B2 = new(src)

	B1.reagents.add_reagent(REAGENT_ID_CRYOSLURRY, 150)
	B1.reagents.add_reagent(REAGENT_ID_POTASSIUM, 150)
	B2.reagents.add_reagent(REAGENT_ID_PHOSPHORUS, 150)
	B2.reagents.add_reagent(REAGENT_ID_SUGAR, 150)

	detonator = new/obj/item/assembly_holder/timer_igniter(src)

	beakers += B1

/obj/item/projectile/bullet/frostshotgun
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/frostsphere = 4)

	hud_state = "plasma_sphere"

/obj/item/projectile/bullet/frostshotgun/on_range()
	qdel(src)

/obj/item/projectile/energy/frostsphere
	name = "frost sphere"
	icon_state = "ice_2"
	fire_sound = 'sound/weapons/pulse3.ogg'
	damage = 20
	modifier_type_to_apply = /datum/modifier/cryogelled
	modifier_duration = 0.25 MINUTE
	speed = 2.5
	range = 12
	hud_state = "water"

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

/obj/item/projectile/energy/eclipse_boss
	name = "experimental laser"
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "laser"
	check_armour = "laser"
	speed = 10
	crawl_destroy = TRUE

/obj/item/projectile/energy/eclipse_boss/chillingwind
	name = "ice winds"
	icon_state = "ice_wind"
	damage = 15
	armor_penetration = 70
	modifier_type_to_apply = /datum/modifier/cryogelled
	modifier_duration = 0.25 MINUTE

/obj/item/projectile/energy/eclipse_boss/metalsphere
	name = "metal sphere"
	icon_state = "metal_sphere"
	damage_type = BRUTE
	check_armour = "bullet"
	damage = 20
	agony = 10
	armor_penetration = 50

/obj/item/projectile/energy/eclipse_boss/energyjavelin
	name = "searing javelin"
	icon_state = "javelin"
	damage_type = SEARING
	damage = 40
	armor_penetration = 30

//projectiles
/obj/item/projectile/energy/astral_collective
	name = "abnormal energy"
	speed = 3
	damage = 28 //roughly 25 with intended armour
	damage_type = BURN //BRUTE, BURN, TOX, OXY, CLONE, HALLOSS, ELECTROCUTE, BIOACID, SEARING are the only things that should be in here
	check_armour = "laser" //Defines what armor to use when it hits things.  Must be set to bullet, laser, energy,or bomb	//Cael - bio and rad are also valid

/obj/item/projectile/energy/astral_collective/anti_mecha
	damage_type = BIOACID
	icon_state = "declone"

/obj/item/projectile/energy/astral_collective/armour_breaker
	damage = 10
	dephasing = TRUE
	hits_phased = TRUE
	icon_state = "fuel-deuterium"
	penetrating = 10
	armor_penetration = 100

/obj/item/projectile/energy/astral_collective/searing
	damage_type = SEARING
	icon_state = "bolter"

/obj/item/projectile/energy/astral_collective/green
	icon_state = "energy"
	irradiate = 40

/obj/item/projectile/energy/astral_collective/particle
	damage = 1
	armor_penetration = 100
	icon_state = "particle"
	incendiary = 1
	flammability = 3
