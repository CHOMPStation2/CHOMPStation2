/obj/item/weapon/gun/projectile/confetti_cannon
	name = "confetti cannon"
	desc = "For those times when you absolutely need colored paper everywhere."
	icon_state = "judge"
	item_state = "judge"
	w_class = ITEMSIZE_LARGE
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/gunshot2.ogg'
	projectile_type = /obj/item/projectile/confetti

	var/confetti_charge = 0
	var/max_confetti = 20

/obj/item/weapon/gun/projectile/confetti_cannon/examine(mob/user)
	. = ..()
	if(get_dist(user, src) <= 2)
		. += "<font color='blue'>It's loaded with [confetti_charge] balls of confetti.</font>"

/obj/item/weapon/gun/projectile/confetti_cannon/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/weapon/paper) || istype(I, /obj/item/weapon/shreddedp))
		if(confetti_charge < max_confetti)
			user.drop_item()
			++confetti_charge
			to_chat(user, "<font color='blue'>You put the paper in the [src].</font>")
			qdel(I)
		else
			to_chat(usr, "<font color='red'>[src] cannot hold more paper.</font>")

/obj/item/weapon/gun/projectile/confetti_cannon/consume_next_projectile()
	if(confetti_charge)
		--confetti_charge
		return
	return