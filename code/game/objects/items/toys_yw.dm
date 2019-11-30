/obj/item/toy/plushie/teshari/strix
	name = "Strix Hades"
	desc = "This is Strix Hades the plushie Avali. Very soft, with a pompom on the tail. The toy is made well, as if alive. Looks like he is sleeping. Shhh!"
	icon_state = "strixplush"
	pokephrase = "Weh!"
	icon = 'icons/obj/toy_yw.dmi'

	rename_plushie()
		set name = "Name Plushie"
		set category = "Object"
		set desc = "Give your plushie a cute name!"
		var/mob/M = usr
		if(!M.mind)
			return 0

		if(src && !M.stat && in_range(M,src))
			to_chat(M, "You cannot rename Strix Hades! You hug him anyway.")
			return 1