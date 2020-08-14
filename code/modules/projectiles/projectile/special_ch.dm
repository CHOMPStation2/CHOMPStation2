/obj/item/projectile/confetti
	name = "party ball"
	icon_state = "fireball"
	fire_sound = 'sound/weapons/gunshot2.ogg'
	damage = 0
	damage_type = HALLOSS
	nodamage = 1
	var/datum/effect/effect/system/confetti_spread
	var/confetti_strength = 3

/obj/item/projectile/confetti/New()
	..()
	src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
	src.confetti_spread.attach(src)

/obj/item/projectile/confetti/on_hit(atom/target, blocked = FALSE)
	playsound(src, 'sound/weapons/confetti_ball.ogg', 30, 1)
	src.confetti_spread.set_up(10, 0, usr.loc)
	spawn(0)
		for(var/i = 1 to confetti_strength)
			src.confetti_spread.start()
			sleep(10)
		qdel(src)

	..()
