/*TEST*/
/******/

/obj/item/dogborg/pounce_module
	name = "pounce module"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "pounce"
	desc = "Routine to allow pouncing"
	throwforce = 0 //This shouldn't be thrown in the first place.
	w_class = ITEMSIZE_NORMAL

/obj/item/dogborg/pounce_module/New()
	..()
	flags |= NOBLUDGEON //No more attack messages

/obj/item/dogborg/pounce_module/attack_self(mob/user)
	return

/obj/item/dogborg/pounce_module/afterattack(atom/target, mob/user as mob, proximity)
	if(proximity && ishuman(target))
		user.visible_message("<span class='notice'>\the [user] pounces at \the [target]'s face!</span>", "<span class='notice'>You pounce at \the [target]!</span>")
		var/mob/living/L = target
		L.Weaken(10)
		user.loc = target.loc
		return
	return

/* Not needed anymore because we have removed boozeborg from the _vr file that Yawn wanted to put it in and restored the _ch file we had for this found in /code/modules/mob/living/silicon/robot/subtypes/boozeborg_ch.dm.
/mob/living/silicon/robot/proc/reskin_booze()
	set name = "Change Drink Color"
	set category = "Abilities.Silicon" //ChompEDIT - TGPanel
	set desc = "Choose the color of drink displayed inside you."

	var/mob/M = usr
	var/list/options = list()
	options["Beer"] = "Beer Buddy"
	options["Curacao"] = "Brilliant Blue"
	options["Coffee"] = "Caffine Dispenser"
	options["Space Mountain Wind"] = "Gamer Juice Maker"
	options["Whiskey Soda"] = "Liqour Licker"
	options["Grape Soda"] = "The Grapist"
	options["Demon's Blood"] = "Vampire's Aid"
	options["Slav Vodka"] = "Vodka Komrade"
	var/choice = input(M,"Choose your drink!") in options
	if(src && choice && !M.stat && in_range(M,src))
		icontype = options[choice]
		var/active_sound = 'sound/effects/bubbles.ogg'
		playsound(src.loc, "[active_sound]", 100, 0, 4)
		to_chat(M, "Your Tank now displays [choice]. Drink up and enjoy!")
		updateicon()
		return 1
*/
