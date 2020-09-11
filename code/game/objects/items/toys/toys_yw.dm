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

/obj/item/toy/plushie/teshari/eili
	name = "Eili"
	desc = "This is a plushie that resembles an Avali named Eili. The ammount of detail makes it almost look lifelike! Looks like she is sleeping. Shhh!"
	icon_state = "jeans_eiliplush"
	item_state = "jeans_eiliplush"
	slot_flags = SLOT_BACK
	pokephrase = "Weh!"
	icon = 'icons/vore/custom_items_yw.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/vore/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'icons/vore/righthand_toys_yw.dmi',
		slot_wear_back_str = 'icons/vore/custom_items_yw_special.dmi',

	rename_plushie()
		set name = "Name Plushie"
		set category = "Object"
		set desc = "Give your plushie a cute name!"
		var/mob/M = usr
		if(!M.mind)
			return 0

		if(src && !M.stat && in_range(M,src))
			to_chat(M, "You cannot rename Eili! You hug her anyway.")
			return 1

/obj/item/toy/plushie/teshari_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_brown"
	pokephrase = "Rya!"

/obj/item/toy/plushie/teshariw_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_white"
	pokephrase = "Rya!"
/obj/item/toy/plushie/tesharib_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_black"
	pokephrase = "Rya!"
/obj/item/toy/plushie/teshariy_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_yellow"
	pokephrase = "Rya!"