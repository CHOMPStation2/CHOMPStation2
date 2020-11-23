//The confetti cannon is a simple weapon meant to be a toy. You shoot confetti at people and it makes a funny sound. Don't give this any combat use.
/obj/item/weapon/gun/launcher/confetti_cannon
	name = "confetti cannon"
	desc = "For those times when you absolutely need colored paper everywhere."
	icon = 'icons/obj/weapons_ch.dmi'
	icon_state = "confetti_cannon"
	item_state = "confetti_cannon"
	w_class = ITEMSIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 2)
	var/obj/item/weapon/grenade/confetti/party_ball/chambered = null

	var/confetti_charge = 0
	var/max_confetti = 20

/obj/item/weapon/gun/launcher/confetti_cannon/examine(mob/user)
	. = ..()
	if(get_dist(user, src) <= 2)
		. += "<font color='blue'>It's loaded with [confetti_charge] ball\s of confetti.</font>"

/obj/item/weapon/gun/launcher/confetti_cannon/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/weapon/paper) || istype(I, /obj/item/weapon/shreddedp))
		if(confetti_charge < max_confetti)
			user.drop_item()
			++confetti_charge
			to_chat(usr, "<font color='blue'>You put the paper in the [src].</font>")
			qdel(I)
		else
			to_chat(usr, "<font color='red'>[src] cannot hold more paper.</font>")

/obj/item/weapon/gun/launcher/confetti_cannon/proc/pump(mob/M as mob)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)
	if(!chambered)
		if(confetti_charge)
			chambered = new /obj/item/weapon/grenade/confetti/party_ball
			--confetti_charge
			to_chat(usr, "<font color='blue'>You compress a new confetti ball.</font>")
		else
			to_chat(usr, "<font color='red'>The [src] is out of confetti!</font>")
	else
		to_chat(usr, "<font color='red'>The [src] is already loaded!</font>")

/obj/item/weapon/gun/launcher/confetti_cannon/attack_self(mob/user)
	pump(user)

/obj/item/weapon/gun/launcher/confetti_cannon/consume_next_projectile()
	if(chambered)
		chambered.activate(null)
	return chambered

/obj/item/weapon/gun/launcher/confetti_cannon/handle_post_fire(mob/user)
	chambered = null