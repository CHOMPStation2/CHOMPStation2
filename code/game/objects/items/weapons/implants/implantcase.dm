//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/item/implantcase // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case"
	desc = "A case containing an implant."
	icon = 'icons/obj/items.dmi'
	icon_state = "implantcase-0"
	item_state = "implantcase"
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_TINY
	var/obj/item/implant/imp = null // CHOMPEdit - Removal of obj/item/weapon

/obj/item/implantcase/proc/update() // CHOMPEdit - Removal of obj/item/weapon
	if (src.imp)
		src.icon_state = text("implantcase-[]", src.imp.implant_color)
	else
		src.icon_state = "implantcase-0"
	return

/obj/item/implantcase/attackby(obj/item/I as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if (istype(I, /obj/item/pen)) // CHOMPEdit - Removal of obj/item/weapon
		var/t = tgui_input_text(user, "What would you like the label to be?", text("[]", src.name), null, MAX_NAME_LEN)
		if (user.get_active_hand() != I)
			return
		if((!in_range(src, usr) && src.loc != user))
			return
		t = sanitizeSafe(t, MAX_NAME_LEN)
		if(t)
			src.name = text("Glass Case - '[]'", t)
		else
			src.name = "Glass Case"
	else if(istype(I, /obj/item/reagent_containers/syringe)) // CHOMPEdit - Removal of obj/item/weapon
		if(!src.imp)	return
		if(!src.imp.allow_reagents)	return
		if(src.imp.reagents.total_volume >= src.imp.reagents.maximum_volume)
			to_chat(user, "<span class='warning'>\The [src] is full.</span>")
		else
			spawn(5)
				I.reagents.trans_to_obj(src.imp, 5)
				to_chat(user, "<span class='notice'>You inject 5 units of the solution. The syringe now contains [I.reagents.total_volume] units.</span>")
	else if (istype(I, /obj/item/implanter)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/implanter/M = I // CHOMPEdit - Removal of obj/item/weapon
		if (M.imp)
			if ((src.imp || M.imp.implanted))
				return
			M.imp.loc = src
			src.imp = M.imp
			M.imp = null
			src.update()
			M.update()
		else
			if (src.imp)
				if (M.imp)
					return
				src.imp.loc = M
				M.imp = src.imp
				src.imp = null
				update()
			M.update()
	return


/obj/item/implantcase/tracking // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'tracking'"
	desc = "A case containing a tracking implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/tracking/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/tracking( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/explosive // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'explosive'"
	desc = "A case containing an explosive implant."
	icon_state = "implantcase-r"

/obj/item/implantcase/explosive/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/explosive( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/chem // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'chem'"
	desc = "A case containing a chemical implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/chem/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/chem( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/loyalty // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'loyalty'"
	desc = "A case containing a loyalty implant."
	icon_state = "implantcase-r"

/obj/item/implantcase/loyalty/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/loyalty( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/death_alarm // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'death alarm'"
	desc = "A case containing a death alarm implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/death_alarm/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/death_alarm( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/freedom // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'freedom'"
	desc = "A case containing a freedom implant."
	icon_state = "implantcase-r"

/obj/item/implantcase/freedom/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/freedom( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/adrenalin // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'adrenalin'"
	desc = "A case containing an adrenalin implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/adrenalin/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/adrenalin( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/dexplosive // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'explosive'"
	desc = "A case containing an explosive."
	icon_state = "implantcase-r"

/obj/item/implantcase/dexplosive/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/dexplosive( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return


/obj/item/implantcase/health // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'health'"
	desc = "A case containing a health tracking implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/health/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/health( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/language // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'GalCom'"
	desc = "A case containing a GalCom language implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/language/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/language( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/language/eal // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'EAL'"
	desc = "A case containing an Encoded Audio Language implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/language/eal/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/language/eal( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/shades // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Integrated Shades'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/shades/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/taser // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Taser'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/taser/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/laser // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Laser'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/laser/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/laser( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/dart // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Dart'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/dart/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/dart( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/toolkit // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Toolkit'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/toolkit/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/upperarm( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/medkit // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Toolkit'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/medkit/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/upperarm/medkit( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/surge // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Muscle Overclocker'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/surge/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/upperarm/surge( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/analyzer // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Scanner'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/analyzer/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/wrist( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/sword // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Scanner'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/sword/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/wrist/sword( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/sprinter // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Sprinter'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/sprinter/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/pelvic( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/armblade // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Armblade'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/armblade/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/upperarm/blade( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/handblade // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Handblade'"
	desc = "A case containing a nanite fabricator implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/handblade/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/organ/limbaugment/wrist/blade( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

/obj/item/implantcase/restrainingbolt // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'Restraining Bolt'"
	desc = "A case containing a restraining bolt."
	icon_state = "implantcase-b"

/obj/item/implantcase/restrainingbolt/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/restrainingbolt( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return
