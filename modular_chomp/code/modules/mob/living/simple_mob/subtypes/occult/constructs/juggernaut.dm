/mob/living/simple_mob/construct/juggernaut/behemoth/unstoppable
	name = "Behemoth"
	real_name = "Behemoth"
	desc = "The pinnacle of occult technology, Behemoths are nothing shy of both an Immovable Object, and Unstoppable Force."
	melee_damage_lower = 45
	melee_damage_upper = 55
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	projectiletype = /obj/item/projectile/icicle


/mob/living/simple_mob/construct/juggernaut/behemoth/unstoppable/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 20 - round(P.damage/3)
	if(prob(reflectchance))
		visible_message("<span class='danger'>The [P.name] gets reflected by [src]'s shell!</span>", \
						"<span class='userdanger'>The [P.name] gets reflected by [src]'s shell!</span>")

		// Find a turf near or on the original location to bounce to
		if(P.starting)
			var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/turf/curloc = get_turf(src)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, src)
			P.reflected = 1

		return -1 // complete projectile permutation

	return (..(P))