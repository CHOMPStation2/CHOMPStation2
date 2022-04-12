/obj/item/projectile/energy/phase/bolt
	range = 4
	SA_bonus_damage = 15	// 30 total on animals
	icon_state = "cbbolt"
	hud_state = "taser"

/obj/item/projectile/energy/phase/bolt/heavy
	range = 4
	SA_bonus_damage = 25	// 20 total on animals
	hud_state = "taser"

/obj/item/projectile/energy/plasma/vepr
	name = "plasma bolt"
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "vepr"
	fire_sound = 'sound/weapons/serdy/vepr.ogg'
	damage = 30
	armor_penetration = 10
	damage_type = BURN
	check_armour = "energy"
	muzzle_type = /obj/effect/projectile/muzzle/vepr
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	hitsound = 'sound/weapons/sear.ogg'
	hud_state = "laser_overcharge"

