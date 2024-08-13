/* Combat refactor walkback
/obj/item/projectile/beam
	damage = 20

/obj/item/projectile/beam/weaklaser
	damage = 10
	armor_penetration = -25

/obj/item/projectile/beam/smalllaser
	damage = 10


/obj/item/projectile/beam/burstlaser
	damage = 10
	armor_penetration = 10

/obj/item/projectile/beam/midlaser
	damage = 20
	armor_penetration = 20

/obj/item/projectile/beam/heavylaser
	damage = 25
	armor_penetration = 30

/obj/item/projectile/beam/heavylaser/cannon
	damage = 30
	armor_penetration = 50

/obj/item/projectile/beam/xray
	damage = 20
	armor_penetration = 50


/obj/item/projectile/beam/gamma
	damage = 6
	armor_penetration = 90

/obj/item/projectile/beam/cyan
	damage = 20

/obj/item/projectile/beam/sniper
	damage = 20
	armor_penetration = 40

/obj/item/projectile/beam/precursor
	damage = 25
*/
//Damage values back to old values for combat refactor walkback, keeping simplemob bonus damage.
/obj/item/projectile/beam/phaser //The "medium" phaser beam.
	//damage = 10
	SA_bonus_damage = 10

/obj/item/projectile/beam/phaser/light
	//damage = 5
	SA_bonus_damage = 5

/obj/item/projectile/beam/phaser/heavy
	//damage = 12
	SA_bonus_damage = 12


/obj/item/projectile/beam/phaser/heavy/cannon
	//damage = 15
	SA_bonus_damage = 15


/obj/item/projectile/scatter/laser
	damage = 40 //Old 20

	submunition_spread_max = 40
	submunition_spread_min = 10

	submunitions = list(
		/obj/item/projectile/beam/prismatic = 4
		)

/obj/item/projectile/beam/prismatic
	name = "prismatic beam"
	icon_state = "omnilaser"
	damage = 10 //Old 5?
	damage_type = BURN
	check_armour = "laser"
	light_color = "#00C6FF"
