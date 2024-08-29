/obj/item/implanter // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter"
	icon = 'icons/obj/items.dmi'
	icon_state = "implanter0_1"
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	var/obj/item/implant/imp = null // CHOMPEdit - Removal of obj/item/weapon
	var/active = 1

/obj/item/implanter/attack_self(var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	active = !active
	to_chat(user, "<span class='notice'>You [active ? "" : "de"]activate \the [src].</span>")
	update()

/obj/item/implanter/verb/remove_implant() // CHOMPEdit - Removal of obj/item/weapon
	set category = "Object"
	set name = "Remove Implant"
	set src in usr

	if(!imp)
		return
	if(istype(usr, /mob))
		var/mob/M = usr
		imp.loc = get_turf(src)
		if(M.get_active_hand() == null)
			M.put_in_hands(imp)
		to_chat(M, "<span class='notice'>You remove \the [imp] from \the [src].</span>")
		name = "implanter"
		imp = null

	update()

	return

/obj/item/implanter/proc/update() // CHOMPEdit - Removal of obj/item/weapon
	if (src.imp)
		src.icon_state = "implanter1"
	else
		src.icon_state = "implanter0"
	src.icon_state += "_[active]"
	return

/obj/item/implanter/attack(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if (!istype(M, /mob/living/carbon))
		return
	if(active)
		if (imp)
			M.visible_message("<span class='warning'>[user] is attempting to implant [M].</span>")

			user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
			user.do_attack_animation(M)

			var/turf/T1 = get_turf(M)
			if (T1 && ((M == user) || do_after(user, 50)))
				if(user && M && (get_turf(M) == T1) && src && src.imp)
					M.visible_message("<span class='warning'>[M] has been implanted by [user].</span>")

					add_attack_logs(user,M,"Implanted with [imp.name] using [name]")

					if(imp.handle_implant(M))
						imp.post_implant(M)

						if(ishuman(M))
							var/mob/living/carbon/human/H = M
							BITSET(H.hud_updateflag, IMPLOYAL_HUD)
							BITSET(H.hud_updateflag, BACKUP_HUD) //VOREStation Add - Backup HUD updates

					src.imp = null
					update()
	else
		to_chat(user, "<span class='warning'>You need to activate \the [src.name] first.</span>")
	return

/obj/item/implanter/loyalty // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter-loyalty"

/obj/item/implanter/loyalty/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/loyalty( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return

/obj/item/implanter/explosive // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter (E)"

/obj/item/implanter/explosive/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/explosive( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return

/obj/item/implanter/adrenalin // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter-adrenalin"

/obj/item/implanter/adrenalin/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/adrenalin(src) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return

/obj/item/implanter/compressed // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter (C)"
	icon_state = "cimplanter1"

/obj/item/implanter/compressed/New() // CHOMPEdit - Removal of obj/item/weapon
	imp = new /obj/item/implant/compressed( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return

/obj/item/implanter/compressed/update() // CHOMPEdit - Removal of obj/item/weapon
	if (imp)
		var/obj/item/implant/compressed/c = imp // CHOMPEdit - Removal of obj/item/weapon
		if(!c.scanned)
			icon_state = "cimplanter1"
		else
			icon_state = "cimplanter2"
	else
		icon_state = "cimplanter0"
	return

/obj/item/implanter/compressed/attack(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/implant/compressed/c = imp // CHOMPEdit - Removal of obj/item/weapon
	if (!c)	return
	if (c.scanned == null)
		to_chat(user, "Please scan an object with the implanter first.")
		return
	..()

/obj/item/implanter/compressed/afterattack(atom/A, mob/user as mob, proximity) // CHOMPEdit - Removal of obj/item/weapon
	if(!proximity)
		return
	if(!active)
		to_chat(user, "<span class='warning'>Activate \the [src.name] first.</span>")
		return
	if(istype(A,/obj/item) && imp)
		var/obj/item/implant/compressed/c = imp // CHOMPEdit - Removal of obj/item/weapon
		if (c.scanned)
			to_chat(user, "<span class='warning'>Something is already scanned inside the implant!</span>")
			return
		c.scanned = A
		if(istype(A, /obj/item/storage)) // CHOMPEdit - Removal of obj/item/weapon
			to_chat(user, "<span class='warning'>You can't store \the [A.name] in this!</span>")
			c.scanned = null
			return
		if(istype(A.loc,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = A.loc
			H.remove_from_mob(A)
		else if(istype(A.loc,/obj/item/storage)) // CHOMPEdit - Removal of obj/item/weapon
			var/obj/item/storage/S = A.loc // CHOMPEdit - Removal of obj/item/weapon
			S.remove_from_storage(A)
		A.loc.contents.Remove(A)
		update()

/obj/item/implanter/restrainingbolt // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter (bolt)"

/obj/item/implanter/restrainingbolt/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/restrainingbolt( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return
