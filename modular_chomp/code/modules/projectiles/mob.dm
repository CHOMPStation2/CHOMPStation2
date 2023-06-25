/obj/item/projectile/energy/mob
	icon = 'icons/obj/projectiles_impact.dmi'

/obj/item/projectile/energy/mob/heavylaser
	name = "heavy laser"
	icon_state = "impact_beam_heavy"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 60
	armor_penetration = 30
	light_range = 3
	light_power = 1
	light_color = "#FF0D00"

/obj/item/projectile/energy/mob/midlaser
	name = "laser"
	icon_state = "impact_laser"
	fire_sound = 'sound/weapons/Laser.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 40
	armor_penetration = 10
	damage_type = BURN
	check_armour = "laser"

/obj/item/projectile/energy/mob/smalllaser
	name = "laser"
	icon_state = "impact_laser"
	fire_sound = 'sound/weapons/Laser.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 30
	armor_penetration = 0
	damage_type = BURN
	check_armour = "laser"


/obj/item/projectile/energy/mob/drone
	name = "laser"
	icon_state = "impact_laser"
	fire_sound = 'sound/weapons/Laser.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 10
	damage_type = BURN
	check_armour = "laser"

/obj/item/projectile/energy/inversion
	name = "inversion blast"
	icon = 'icons/obj/projectiles_impact.dmi'
	icon_state = "impact_invert"
	damage = 15
	armor_penetration = 60
	damage_type = BURN
	check_armour = "laser"
	color = "#ffffff"
	fire_sound = 'sound/weapons/spiderlunge.ogg'

/obj/item/projectile/energy/mob/electric_spider
	name = "stun beam"
	icon_state = "impact_stun"
	fire_sound = 'sound/weapons/Taser.ogg'
	nodamage = 1
	taser_effect = 1
	damage_type = HALLOSS
	light_color = "#FFFFFF"
	hitsound = 'sound/weapons/zapbang.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	combustion = FALSE
	agony = 20

/obj/item/projectile/energy/mob/precursor
	name = "precursor beam"
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "impact_prec"
	fire_sound = 'sound/weapons/MediumLaser.ogg'
	light_color = "#FF0099"

	hud_state = "plasma_rifle"
	damage = 48
	armor_penetration = 10


//Eclipse mob stuff

/obj/item/projectile/energy/blob/moth
	damage = 20
	armor_penetration = 25
	my_chems = list("fuel", "mold")
	flammability = 0.25
	modifier_type_to_apply = /datum/modifier/fire
	modifier_duration = 6 SECONDS
	color = "#38b9ff"

/obj/item/projectile/bullet/pistol/medium/ap/eclipse
	armor_penetration = 20
	ricochets = 1
	ricochets_max = 8
	ricochet_chance = 100

/obj/item/projectile/energy/electrode/eclipse
	damage = 20
	damage_type = BURN
	color = "#38b9ff"

/obj/item/projectile/beam/sniper/eclipse
	armor_penetration = 50
	damage = 30

/obj/item/projectile/energy/declone/burn
	damage = 10
	armor_penetration = 10
	nodamage = 0