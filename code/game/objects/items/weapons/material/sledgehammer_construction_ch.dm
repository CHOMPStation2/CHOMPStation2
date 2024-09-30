/obj/item/hammer_head
	name = "hammer head"
	desc = "A rectangular plasteel head. Feels very heavy in your hand.."
	icon = 'icons/obj/hammer_construction_ch.dmi'
	icon_state = "hammer_construction_1"
	description_info = "You need rods, metal, a wrench and welding fuel to finish this up."

	var/construction_stage = 1

/obj/item/hammer_head/attackby(var/obj/item/thing, var/mob/user)

	if(istype(thing, /obj/item/stack/rods) && construction_stage == 1)
		var/obj/item/stack/rods = thing
		if(rods.get_amount() < 4)
			to_chat(user, "<span class='warning'>You need at least 4 rods for this task.</span>")
			return
		rods.use(4)
		user.visible_message("<span class='notice'>\The [user] puts some rods together in \the [src] hole.</span>")
		increment_construction_stage()
		return

	if(istype(thing, /obj/item/weldingtool) && construction_stage == 2)
		var/obj/item/weldingtool/welder = thing
		if(!welder.isOn())
			to_chat(user, "<span class='warning'>Turn it on first!</span>")
			return

		if(!welder.remove_fuel(0,user))
			to_chat(user, "<span class='warning'>You need more fuel!</span>")
			return

		user.visible_message("<span class='notice'>\The [user] weld the rods to the head \the [src] together with \the [thing].</span>")
		playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
		spawn(5)
		increment_construction_stage()
		return

	if(istype(thing, /obj/item/stack/rods) && construction_stage == 3)
		var/obj/item/stack/rods = thing
		if(rods.get_amount() < 4)
			to_chat(user, "<span class='warning'>You need at least 4 rods for this task.</span>")
			return
		rods.use(4)
		user.visible_message("<span class='notice'>\The [user] jams \the [thing]'s into \the [src].</span>")
		increment_construction_stage()
		return

	if(istype(thing, /obj/item/weldingtool) && construction_stage == 4)
		var/obj/item/weldingtool/welder = thing

		if(!welder.isOn())
			to_chat(user, "<span class='warning'>Turn it on first!</span>")
			return

		if(!welder.remove_fuel(0,user))
			to_chat(user, "<span class='warning'>You need more fuel!</span>")
			return

		user.visible_message("<span class='notice'>\The [user] welds the rods together of the handle into place, forming a long irregular shaft.</span>")
		playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)

		increment_construction_stage()
		return

	if(istype(thing, /obj/item/stack/material) && construction_stage == 5)
		var/obj/item/stack/material/reinforcing = thing
		var/material/reinforcing_with = reinforcing.get_material()
		if(reinforcing_with.name == DEFAULT_WALL_MATERIAL) // Steel
			if(reinforcing.get_amount() < 3)
				to_chat(user, "<span class='warning'>You need at least 3 [reinforcing.singular_name]\s for this task.</span>")
				return
			reinforcing.use(3)
			user.visible_message("<span class='notice'>\The [user] shapes some metal sheets around the rods.</span>")
			increment_construction_stage()
			return

	if(istype(thing, /obj/item/weldingtool) && construction_stage == 6)
		var/obj/item/weldingtool/welder = thing
		if(!welder.isOn())
			to_chat(user, "<span class='warning'>Turn it on first!</span>")
			return
		if(!welder.remove_fuel(10,user))
			to_chat(user, "<span class='warning'>You need more fuel!</span>")
			return
		user.visible_message("<span class='notice'>\The [user] heats up the metal sheets until it glows red.</span>")
		playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
		increment_construction_stage()
		return


	if(istype(thing, /obj/item/tool/wrench) && construction_stage == 7)
		user.visible_message("<span class='notice'>\The [user] whacks at \the [src] like a caveman, shaping the metal with \the [thing] into a rough handle, finishing it off.</span>")
		increment_construction_stage()
		playsound(src.loc, 'sound/weapons/smash5.ogg', 100, 1)
		var/obj/item/material/twohanded/sledgehammer/sledge = new(loc)
		var/put_in_hands
		var/mob/M = src.loc
		if(istype(M))
			put_in_hands = M == user
			M.drop_from_inventory(src)
		if(put_in_hands)
			user.put_in_hands(sledge)
		qdel(src)
		return


	return ..()

/obj/item/hammer_head/proc/increment_construction_stage()
	if(construction_stage < 7)
		construction_stage++
	icon_state = "hammer_construction_[construction_stage]"

/obj/item/hammer_head/examine(var/mob/user)
	. = ..(user,2)
	if(.)
		switch(construction_stage)
			if(2) to_chat(user, "<span class='notice'>It has a bunch of rods sticking out of the hole.</span>")
			if(3) to_chat(user, "<span class='notice'>It has a short rough metal shaft sticking to it, quite short.</span>")
			if(4) to_chat(user, "<span class='notice'>It has a bunch of rods jammed into the shaft/</span>")
			if(4) to_chat(user, "<span class='notice'>It has a pretty long rough metal shaft sticking out of it, it look hard to grab.</span>")
			if(5) to_chat(user, "<span class='notice'>It has a few sheets bent in half across the handle.</span>")
			if(6) to_chat(user, "<span class='notice'>It has red hot, pliable looking metal sheets spread over the handle. What a sloppy job.</span>")
			if(7) to_chat(user, "<span class='notice'>It has a roughly shaped metal handle.</span>")
