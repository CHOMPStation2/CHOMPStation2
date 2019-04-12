/*TEST*/
/******/

/obj/item/device/dogborg/pounce_module
	name = "pounce module"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "pounce"
	desc = "Routine to allow pouncing"
	throwforce = 0 //This shouldn't be thrown in the first place.
	w_class = ITEMSIZE_NORMAL

/obj/item/device/dogborg/pounce_module/New()
	..()
	flags |= NOBLUDGEON //No more attack messages

/obj/item/device/dogborg/pounce_module/attack_self(mob/user)
	return

/obj/item/device/dogborg/pounce_module/afterattack(atom/target, mob/user as mob, proximity)
	if(proximity && ishuman(target))
		user.visible_message("<span class='notice'>\the [user] pounces at \the [target]'s face!</span>", "<span class='notice'>You pounce at \the [target]!</span>")
		var/mob/living/L = target
		L.Weaken(10)
		user.loc = target.loc
		return
	return