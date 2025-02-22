/obj/item/projectile/bullet/magnetic/flechette/rapid
	name = "rapid flechette"
	icon_state = "flechette"
	fire_sound = 'sound/weapons/rapidslice.ogg'
	damage = 15
	armor_penetration = 60 // Now that stun's gone from the parent type, we can boost this back up.
	hud_state = "alloy_spike"

/obj/item/projectile/bullet/magnetic/fuelrod/blitz
	name = "blitz rod"
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "fuel-blitz"
	damage = 900
	accuracy = 200
	incendiary = 20
	flammability = 4
	weaken = 40
	penetrating = 1
	armor_penetration = 100
	irradiate = 120
	range = 75
	searing = 1
	detonate_travel = 1
	detonate_mob = 1
	energetic_impact = 1
	hud_state = "rocket_thermobaric"

/obj/item/projectile/bullet/magnetic/fuelrod/blitz/on_impact(var/atom/A)
	if(src.loc)
		var/mob/living/M = A
		if(istype(M) && M.maxHealth<=200)
			M.dust()
		visible_message(span_warning("\The [src] impacts energetically with its target and shatters in a violent explosion!"))
		explosion(src.loc, 3, 4, 5, 10)
	..(A)
