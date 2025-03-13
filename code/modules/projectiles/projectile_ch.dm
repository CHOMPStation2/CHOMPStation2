/obj/item/projectile
/// If this projectile is holy. Silver bullets, etc. Currently no effects.
	var/holy = 0

/obj/item/projectile/bullet/pellet/shotgun/silver
	name = "shrapnel"
	fire_sound = 'sound/weapons/weaponsounds_shotgunshot.ogg'
	damage = 10
	SA_bonus_damage = 16 // Potential 156 Damage against demons at point blank.
	SA_vulnerability = MOB_CLASS_DEMONIC | MOB_CLASS_ABERRATION
	embed_chance = -1
	pellets = 6
	range_step = 1
	spread_step = 20
	holy = 1
