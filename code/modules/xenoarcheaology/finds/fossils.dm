
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// fossils

/obj/item/fossil // CHOMPEdit - Removal of obj/item/weapon
	name = "Fossil"
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "bone"
	desc = "It's a fossil."
	var/animal = 1

/obj/item/fossil/base/New() // CHOMPEdit - Removal of obj/item/weapon
	var/list/l = list(/obj/item/fossil/bone = 9,/obj/item/fossil/skull = 3, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/fossil/skull/horned = 2) // CHOMPEdit - Removal of obj/item/weapon
	var/t = pickweight(l)
	new t(src.loc)
	qdel(src)

/obj/item/fossil/bone // CHOMPEdit - Removal of obj/item/weapon
	name = "Fossilised bone"
	icon_state = "bone"
	desc = "It's a fossilised bone."

/obj/item/fossil/skull // CHOMPEdit - Removal of obj/item/weapon
	name = "Fossilised skull"
	icon_state = "skull"
	desc = "It's a fossilised skull."

/obj/item/fossil/skull/horned // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "hskull"
	desc = "It's a fossilised, horned skull."

/obj/item/fossil/skull/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W,/obj/item/fossil/bone)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/o = new /obj/skeleton(get_turf(src))
		var/a = new /obj/item/fossil/bone // CHOMPEdit - Removal of obj/item/weapon
		var/b = new src.type
		o.contents.Add(a)
		o.contents.Add(b)
		qdel(W)
		qdel(src)

/obj/skeleton
	name = "Incomplete skeleton"
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "uskel"
	desc = "Incomplete skeleton."
	var/bnum = 1
	var/breq
	var/bstate = 0
	var/plaque_contents = "Unnamed alien creature"

/obj/skeleton/New()
	src.breq = rand(6)+3
	src.desc = "An incomplete skeleton, looks like it could use [src.breq-src.bnum] more bones."

/obj/skeleton/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W,/obj/item/fossil/bone)) // CHOMPEdit - Removal of obj/item/weapon
		if(!bstate)
			bnum++
			src.contents.Add(new/obj/item/fossil/bone) // CHOMPEdit - Removal of obj/item/weapon
			qdel(W)
			if(bnum==breq)
				usr = user
				icon_state = "skel"
				src.bstate = 1
				src.density = TRUE
				src.name = "alien skeleton display"
				if(src.contents.Find(/obj/item/fossil/skull/horned)) // CHOMPEdit - Removal of obj/item/weapon
					src.desc = "A creature made of [src.contents.len-1] assorted bones and a horned skull. The plaque reads \'[plaque_contents]\'."
				else
					src.desc = "A creature made of [src.contents.len-1] assorted bones and a skull. The plaque reads \'[plaque_contents]\'."
			else
				src.desc = "Incomplete skeleton, looks like it could use [src.breq-src.bnum] more bones."
				to_chat(user, "Looks like it could use [src.breq-src.bnum] more bones.")
		else
			..()
	else if(istype(W,/obj/item/pen)) // CHOMPEdit - Removal of obj/item/weapon
		plaque_contents = sanitize(tgui_input_text(usr, "What would you like to write on the plaque:","Skeleton plaque",""))
		user.visible_message("[user] writes something on the base of [src].","You relabel the plaque on the base of [icon2html(src,viewers(src))] [src].")
		if(src.contents.Find(/obj/item/fossil/skull/horned)) // CHOMPEdit - Removal of obj/item/weapon
			src.desc = "A creature made of [src.contents.len-1] assorted bones and a horned skull. The plaque reads \'[plaque_contents]\'."
		else
			src.desc = "A creature made of [src.contents.len-1] assorted bones and a skull. The plaque reads \'[plaque_contents]\'."
	else
		..()

//shells and plants do not make skeletons
/obj/item/fossil/shell // CHOMPEdit - Removal of obj/item/weapon
	name = "Fossilised shell"
	icon_state = "shell"
	desc = "It's a fossilised shell."

/obj/item/fossil/plant // CHOMPEdit - Removal of obj/item/weapon
	name = "Fossilised plant"
	icon_state = "plant1"
	desc = "It's fossilised plant remains."
	animal = 0

/obj/item/fossil/plant/New() // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "plant[rand(1,4)]"
