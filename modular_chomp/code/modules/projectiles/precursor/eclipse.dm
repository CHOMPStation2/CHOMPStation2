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

/obj/item/gun/energy/elementalray
	name = "Proto-type Weapon Avatar"
	desc = "A strange gun vibrating with energy, lathered with diffrent buttons and switches."
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "avatar"
	item_state = "avatar"
	wielded_item_state = "avatar-wielded"

	accept_cell_type = /obj/item/cell/device
	cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/item/projectile/bullet/flamegun

	matter = list(MAT_DURASTEEL = 1000, MAT_MORPHIUM = 500)
	origin_tech = list(TECH_COMBAT = 6, TECH_POWER = 5, TECH_PRECURSOR = 3)

	recoil_mode = 0
	charge_meter = 1

	move_delay = 0

	charge_cost = 160

	reload_time = 20

	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=15, projectile_type=/obj/item/projectile/bullet/flamegun, charge_cost = 160, modifystate="avatarfire"),
		list(mode_name="lighting", burst=1, fire_delay=20, projectile_type=/obj/item/projectile/beam/lightingsurge, charge_cost = 480, modifystate="avatarlighting"),
		list(mode_name="frost", burst=3, fire_delay=15, projectile_type=/obj/item/projectile/energy/frostsphere, charge_cost = 260, modifystate="avatarfrost"),
		list(mode_name="acid", burst=1, fire_delay=0.5, projectile_type=/obj/item/projectile/energy/muckblob, charge_cost = 10, modifystate="avataracid"),
		)

/obj/item/gun/energy/elementalray/emag_act(var/remaining_charges, var/mob/user)
	..()
	to_chat(user, "<span class='notice'>You short circuit the internal locking mechanisms of \the [src]!</span>")
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=15, projectile_type=/obj/item/projectile/bullet/flamegun, charge_cost = 160),
		list(mode_name="lighting", burst=1, fire_delay=20, projectile_type=/obj/item/projectile/beam/lightingsurge, charge_cost = 480),
		list(mode_name="frost", burst=3, fire_delay=15, projectile_type=/obj/item/projectile/energy/frostsphere, charge_cost = 160),
		list(mode_name="acid", burst=1, fire_delay=0.5, projectile_type=/obj/item/projectile/energy/muckblob, charge_cost = 10),
		list(mode_name="error", burst=1, fire_delay=30, projectile_type=/obj/item/projectile/bullet/errorelement, charge_cost = 1040),
		)
	return 1

/obj/item/projectile/bullet/errorelement //You are the bullet hell
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 3600
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/flamecrystal = 2, /obj/item/projectile/energy/frostsphere = 2, /obj/item/projectile/beam/lightingsurge = 1, /obj/item/projectile/energy/muckblob = 5)
	hud_state = "laser_heat"

/obj/item/projectile/beam/lightingsurge //Anti-synth laser
	damage = 60
	light_color = "#00CCFF"
	damage_type = ELECTROMAG

/obj/item/projectile/energy/muckblob
	damage = 4
	damage_type = BIOACID
	check_armour = "bio"
	combustion = FALSE
	modifier_type_to_apply = /datum/modifier/muck
	modifier_duration = 5
	speed = 0.6
	range = 8

/datum/modifier/muck
	name = "acid covered"
	desc = "You are covered in acid"
	mob_overlay_state = "poisoned"

	on_created_text = "<span class='warning'>You are covered in muck...</span>"
	on_expired_text = "<span class='notice'>You are no longer covered in muck.</span>"
	stacks = MODIFIER_STACK_ALLOWED

	slowdown = 0.2


/obj/item/gun/energy/pulseglove
	name = "Strange Glove"
	desc = "A bulky glove cladded with strange tech. It hums with energy, and the battery port is inaccessiable"
	icon = 'modular_chomp/icons/obj/guns/precursor/eclipse.dmi'
	icon_state = "darkglove"
	item_state = "darkglove"

	charge_cost = 380 // 13 shots

	projectile_type = /obj/item/projectile/bullet/lightingburst
	cell_type = /obj/item/cell/device/weapon/recharge/alien
	battery_lock = 1


/obj/item/projectile/energy/redlighting
	name = "Flame Crystal"
	icon = 'modular_chomp/icons/mob/eclipse.dmi' //commiting sin
	icon_state = "redlighting"
	damage = 20
	armor_penetration = 20
	hud_state = "laser_sniper"

/obj/item/projectile/energy/darkmeteor
	name = "Strange Sphere"
	icon = 'modular_chomp/icons/mob/eclipse.dmi' //commiting sin
	icon_state = "darkmeteor"
	damage = 60
	damage_type = BRUTE
	check_armour = "melee"
	speed = 15

/obj/item/projectile/bullet/meteorstorm
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 3600
	submunition_spread_min = 1200
	submunitions = list(/obj/item/projectile/energy/darkmeteor = 3)

/obj/item/projectile/bullet/lightingburst
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 200
	submunitions = list(/obj/item/projectile/energy/redlighting = 3)
	hud_state = "laser_sniper"