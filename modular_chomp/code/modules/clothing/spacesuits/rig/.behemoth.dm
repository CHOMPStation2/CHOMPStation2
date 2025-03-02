/obj/item/rig/ch/aegis
	name = "aegis control module"
	desc = "A hefty armor formed from fallen redspace construct."
	suit_type = "aegis hardsuit"
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "aegis_rig"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 30, bomb = 10, bio = 100, rad = 100)

	slowdown = 6

	chest_type = /obj/item/clothing/suit/space/rig/ch/aegis
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/aegis
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch/aegis
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch/aegis

/obj/item/clothing/suit/space/rig/ch/aegis
	name = "chassis"
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'
	icon_state = "aegis_rig"
	desc = "A heft chestplate, humming with energy."

/obj/item/clothing/head/helmet/space/rig/ch/aegis
	name = "helmet"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_state = "aegis_rig"
	desc = "A protective dome for your head."

/obj/item/clothing/gloves/gauntlets/rig/ch/aegis
	name = "hardlight gloves"
	icon = 'icons/obj/clothing/gloves_ch.dmi'
	icon_state = "aegis_rig"
	desc = "Gloves created with alien tech"
	var/block_chance = 15

/obj/item/clothing/shoes/magboots/rig/ch/aegis
	name = "hardlight boots"
	icon = 'icons/obj/clothing/shoes_ch.dmi'
	icon_state = "aegis_rig"
	desc = "A pair of grabby boots"

/obj/item/rig/ch/aegis/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 70 - round(P.damage)
	if(prob(reflectchance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s shell!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s shell!"))

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

/obj/item/clothing/suit/space/rig/ch/aegis/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 70 - round(P.damage)
	if(prob(reflectchance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s shell!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s shell!"))

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

/obj/item/clothing/head/helmet/space/rig/ch/aegis/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 70 - round(P.damage)
	if(prob(reflectchance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s shell!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s shell!"))

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


/obj/item/clothing/gloves/gauntlets/rig/ch/aegis/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 70 - round(P.damage)
	if(prob(reflectchance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s shell!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s shell!"))

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


/obj/item/clothing/shoes/magboots/rig/ch/aegis/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 70 - round(P.damage)
	if(prob(reflectchance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s shell!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s shell!"))

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
