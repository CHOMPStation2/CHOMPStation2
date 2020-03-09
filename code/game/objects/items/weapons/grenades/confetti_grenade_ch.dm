/obj/item/weapon/grenade/confetti
	desc = "It is set to detonate in 2 seconds. These party grenades will make everyone jump with joy (or fright)!"
	name = "grenatti"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "grenade"
	det_time = 20
	item_state = "grenade"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/confetti_spread
	var/confetti_strength = 8

/obj/item/weapon/grenade/confetti/New()
	..()
	src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
	src.confetti_spread.attach(src)

/obj/item/weapon/grenade/confetti/Destroy()
	qdel(confetti_spread)
	confetti_spread = null
	return ..()

/obj/item/weapon/grenade/confetti/detonate() //Find a good confetti firework or pop sound effect later
	playsound(src.loc, 'sound/effects/snap.ogg', 50, 1, -3)
	src.confetti_spread.set_up(10, 0, usr.loc)
	spawn(0)
		for(var/i = 1 to confetti_strength)
			src.confetti_spread.start()
			sleep(10)
		qdel(src)

	return