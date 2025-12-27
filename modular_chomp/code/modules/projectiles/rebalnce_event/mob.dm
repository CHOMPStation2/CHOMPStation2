/obj/item/projectile/bullet/event_mob
	speed = 2
	damage = 15
	armor_penetration = 10
	damage_type = BRUTE
	icon_state = "bullet_alt"
	range = 20
	crawl_destroy = TRUE

/obj/item/projectile/bullet/event_mob/mousetank_missile
	name = "missile"
	icon_state = "missile"
	speed = 3
	damage = 50
	armor_penetration = 50

/obj/item/projectile/bullet/event_mob/mousemelee
	range = 5

/obj/item/projectile/energy/event_mob
	name = "laser"
	speed = 2
	damage = 15
	armor_penetration = 10
	damage_type = BURN
	icon_state = "laser"
	range = 20
	crawl_destroy = TRUE

/obj/item/projectile/energy/event_mob/pirate

/obj/item/projectile/energy/event_mob/pirate/acid
	damage_type = BIOACID
	icon_state = "declone"

/obj/item/projectile/energy/event_mob/pirate/electro
	damage_type = ELECTROCUTE
	icon_state = "particle-heavy"

/obj/item/projectile/bullet/rifle/sword_slash
	name = "blade slash"
	fire_sound = 'sound/weapons/gunshot_cannon.ogg' // This is literally an anti-tank rifle caliber. It better sound like a fucking cannon.
	damage = 10
	penetrating = 10
	armor_penetration = 100
	hitscan = 1
	icon_state = "bullet_alt"
	tracer_type = /obj/effect/projectile/tracer/cannon
	range = 20

/obj/item/projectile/bullet/rifle/sword_slash/short
	range = 3
