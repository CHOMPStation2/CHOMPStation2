/obj/item/gun/energy/laser
	charge_cost = 160
	projectile_type = /obj/item/projectile/beam/midlaser

	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 160),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 50),
		)


/obj/item/projectile/beam/midlaser
	damage = 15
	armor_penetration = 0

/obj/item/projectile/beam/weaklaser
	damage = 5

/obj/item/projectile/beam/smalllaser
	damage = 10

/obj/item/projectile/beam/burstlaser
	damage = 5
	armor_penetration = 0 //why was polaris obssesed with lasers having 10 AP

obj/item/projectile/beam/mininglaser
	damage = 5
	armor_penetration = 20

/obj/item/projectile/beam/heavylaser
	damage = 20
	armor_penetration = 30

/obj/item/projectile/beam/heavylaser/cannon
	damage = 30
	armor_penetration = 50


/obj/item/projectile/beam/xray
	damage = 10
	armor_penetration = 50

/obj/item/projectile/beam/gamma
	damage = 5
	armor_penetration = 90
	irradiate = 20


/obj/item/projectile/beam/cyan
	damage = 15

/obj/item/projectile/beam/pulse
	damage = 40
	armor_penetration = 100

/obj/item/projectile/beam/sniper
	damage = 30
	armor_penetration = 10

/obj/item/projectile/beam/precursor
	damage = 8
	armor_penetration = 90

//hello stun projectiles.
/obj/item/projectile/beam/stun
	agony = 15
	range = 4

/obj/item/projectile/beam/stun/weak
	agony = 10

/obj/item/projectile/beam/stun/med
	agony = 20

/obj/item/projectile/beam/phaser //The "medium" phaser beam.
	damage = 6
	mob_bonus_damage = 6

/obj/item/projectile/beam/phaser/light
	damage = 5
	mob_bonus_damage = 5


/obj/item/projectile/beam/phaser/heavy
	damage = 7
	mob_bonus_damage = 7

/obj/item/projectile/beam/phaser/heavy/cannon
	damage = 10
	mob_bonus_damage = 10
