/obj/item/projectile/beam/phaser //The "medium" phaser beam.
	damage = 20
	mob_bonus_damage = 20
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "phaser"
	light_color = "#F18F12"
	muzzle_type = /obj/effect/projectile/muzzle/phaser
	tracer_type = /obj/effect/projectile/tracer/phaser
	impact_type = /obj/effect/projectile/impact/phaser
	hud_state = "laser_heat"


/obj/item/projectile/beam/phaser/light
	damage = 10
	mob_bonus_damage = 10
	icon_state = "phaser_light"
	light_range = 1.5
	light_power = 0.3
	muzzle_type = /obj/effect/projectile/muzzle/phaser/light
	tracer_type = /obj/effect/projectile/tracer/phaser/light
	impact_type = /obj/effect/projectile/impact/phaser/light


/obj/item/projectile/beam/phaser/heavy
	damage = 30
	mob_bonus_damage = 30
	icon_state = "phaser_heavy"
	light_range = 3
	light_power = 1
	muzzle_type = /obj/effect/projectile/muzzle/phaser/heavy
	tracer_type = /obj/effect/projectile/tracer/phaser/heavy
	impact_type = /obj/effect/projectile/impact/phaser/heavy


/obj/item/projectile/beam/phaser/heavy/cannon
	damage = 40
	mob_bonus_damage = 40


/obj/effect/projectile/tracer/phaser
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "phaser_tracer"
	light_color = "#F18F12"
	light_range = 2
	light_power = 0.5

/obj/effect/projectile/tracer/phaser/heavy
	icon_state = "phaser_heavy_tracer"
	light_range = 3
	light_power = 1

/obj/effect/projectile/tracer/phaser/light
	icon_state = "phaser_light_tracer"
	light_range = 1.5
	light_power = 0.3

/obj/effect/projectile/muzzle/phaser
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "phaser_muzzle"
	light_color = "#F18F12"
	light_range = 2
	light_power = 0.5

/obj/effect/projectile/muzzle/phaser/heavy
	icon_state = "phaser_heavy_muzzle"
	light_range = 3
	light_power = 1

/obj/effect/projectile/muzzle/phaser/light
	icon_state = "phaser_light_muzzle"
	light_range = 1.5
	light_power = 0.3

/obj/effect/projectile/impact/phaser
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "phaser_impact"
	light_color = "#F18F12"
	light_range = 2
	light_power = 0.5

/obj/effect/projectile/impact/phaser/heavy
	icon_state = "phaser_heavy_impact"
	light_range = 3
	light_power = 1

/obj/effect/projectile/impact/phaser/light
	icon_state = "phaser_light_impact"
	light_range = 1.5
	light_power = 0.3

/obj/effect/projectile/muzzle/vepr
	icon_state = "vepr_muzzle"
	light_color = "#FF6A00"
	light_range = 3
	light_power = 1




// ------------------------- GATTENING EARLY PORT STUFF, THIS IS (i pray to god) TEMPORARY ------------------------- //





/obj/item/projectile/beam/hellfire
	damage = 35
	mob_bonus_damage = 20
	agony = 10
	stutter = 5
	armor_penetration = 15
	fire_sound = 'sound/weapons/serdy/retrolaser.ogg'
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "hellfire"
	light_color = "#FF6A00"
	muzzle_type = /obj/effect/projectile/muzzle/hellfire
	tracer_type = /obj/effect/projectile/tracer/hellfire
	impact_type = /obj/effect/projectile/impact/hellfire
	hud_state = "laser_heat"

/obj/effect/projectile/muzzle/hellfire
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "muzzle_hellfire"
	light_color = "#FF6A00"
	light_range = 5
	light_power = 2

/obj/effect/projectile/tracer/hellfire
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "beam_hellfire"
	light_color = "#FF6A00"
	light_range = 3
	light_power = 2

/obj/effect/projectile/impact/hellfire
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "impact_hellfire"
	light_color = "#FF6A00"
	light_range = 4
	light_power = 2
