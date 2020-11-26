/obj/item/projectile/beam/phaser //The "medium" phaser beam.
	damage = 10
	SA_bonus_damage = 40
	SA_vulnerability = list(SA_ANIMAL, MOB_CLASS_SYNTHETIC, MOB_CLASS_ABERRATION, MOB_CLASS_HUMANOID)
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "phaser"
	light_color = "#F18F12"
	muzzle_type = /obj/effect/projectile/muzzle/phaser
	tracer_type = /obj/effect/projectile/tracer/phaser
	impact_type = /obj/effect/projectile/impact/phaser
	

/obj/item/projectile/beam/phaser/light
	damage = 5
	SA_bonus_damage = 30
	icon_state = "phaser_light"
	light_range = 1.5
	light_power = 0.3
	muzzle_type = /obj/effect/projectile/muzzle/phaser/light
	tracer_type = /obj/effect/projectile/tracer/phaser/light
	impact_type = /obj/effect/projectile/impact/phaser/light

/obj/item/projectile/beam/phaser/heavy
	SA_bonus_damage = 55
	icon_state = "phaser_heavy"
	light_range = 3
	light_power = 1
	muzzle_type = /obj/effect/projectile/muzzle/phaser/heavy
	tracer_type = /obj/effect/projectile/tracer/phaser/heavy
	impact_type = /obj/effect/projectile/impact/phaser/heavy

/obj/item/projectile/beam/phaser/heavy/cannon
	damage = 15
	SA_bonus_damage = 60

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

