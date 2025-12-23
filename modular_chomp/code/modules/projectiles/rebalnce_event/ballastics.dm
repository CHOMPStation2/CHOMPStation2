//pistol stuff
/obj/item/projectile/bullet/pistol
	damage = 15

/obj/item/projectile/bullet/pistol/ap
	damage = 10
	armor_penetration = 50
	hud_state = "pistol_light_ap"

/obj/item/projectile/bullet/pistol/hp
	damage = 20
	armor_penetration = -50


/obj/item/projectile/bullet/pistol/medium
	damage = 20
	hud_state = "pistol"

/obj/item/projectile/bullet/pistol/medium/ap
	damage = 20
	armor_penetration = 15


/obj/item/projectile/bullet/pistol/medium/hp
	damage = 30
	armor_penetration = -50
	hud_state = "pistol_ap"

/obj/item/projectile/bullet/pistol/strong // .357 and .44 caliber stuff. High power pistols like the Mateba or Desert Eagle. Sacrifice capacity for power.
	fire_sound = 'sound/weapons/gunshot4.ogg'
	damage = 60
	hud_state = "pistol_heavy"

/obj/item/projectile/bullet/pistol/rubber/strong // "Rubber" bullets for high power pistols.
	fire_sound = 'sound/weapons/gunshot3.ogg' // Rubber shots have less powder, but these still have more punch than normal rubber shot.
	damage = 5
	agony = 20

/obj/item/projectile/bullet/pistol/rubber
	damage = 1
	agony = 15

//I am unsure why I am doing this for a single event
//here is the shotguns
/obj/item/projectile/bullet/shotgun
	damage = 30
	armor_penetration = 40
	range = 4

/obj/item/projectile/bullet/shotgun/beanbag		//because beanbags are not bullets
	name = "beanbag"
	damage = 50
	agony = 40
	embed_chance = 0
	sharp = FALSE
	check_armour = "melee"
	hud_state = "shotgun_beanbag"

/obj/item/projectile/bullet/pellet/shotgun
	damage = 5
	pellets = 10

//the desire to delete 70% of this stuff lol
/obj/item/projectile/bullet/rifle
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/a762
	damage = 25

/obj/item/projectile/bullet/rifle/a762/ap
	damage = 30
	armor_penetration = 50 // At 30 or more armor, this will do more damage than standard rounds.
	hud_state = "rifle_ap"

/obj/item/projectile/bullet/rifle/a762/hp
	damage = 40
	armor_penetration = -50

/obj/item/projectile/bullet/rifle/a762/hunter // Optimized for killing simple animals and not people, because Balance(tm)
	damage = 10
	mob_bonus_damage = 25

/obj/item/projectile/bullet/rifle/a545
	damage = 25

/obj/item/projectile/bullet/rifle/a545/ap
	damage = 20
	armor_penetration = 50

/obj/item/projectile/bullet/rifle/a545/hp
	damage = 35
	armor_penetration = -50

/obj/item/projectile/bullet/rifle/a545/hunter
	damage = 5
	mob_bonus_damage = 35

/obj/item/projectile/bullet/rifle/a145
	damage = 60
	stun = 0
	weaken = 0
	penetrating = 5
	armor_penetration = 100

/obj/item/projectile/bullet/rifle/a145/highvel
	damage = 30
	stun = 0
	weaken = 0
	penetrating = 15
	armor_penetration = 100
