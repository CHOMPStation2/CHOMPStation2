//CHOMP Specific overrides
/obj/item/material/whip
	icon = 'icons/obj/weapons_ch.dmi'

/obj/item/material/butterfly/saw //This Saw Cleaver is in here since I do not know where else to put it
	name = "Saw Cleaver"
	desc = "A weapon consisting of a long handle and a heavy serrated blade. Using centrifrical force the blade extends outword allowing it to slice it long cleaves. The smell of blood hangs in the air around it."
	icon = 'icons/obj/weapons_ch.dmi'
	icon_state = "sawcleaver"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/64x64_lefthand_ch.dmi',
			slot_r_hand_str = 'icons/mob/items/64x64_righthand_ch.dmi',
			)
	item_state = "cleaving_saw"
	active = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_LARGE
	edge = 1
	sharp = 1
	force_divisor = 0.7 //42 When Wielded in line with a sword
	thrown_force_divisor = 0.1 // 2 when thrown with weight 20 (steel) since frankly its too bulk to throw
	//holy = 1

/obj/item/material/butterfly/saw/update_force()
	if(active)
		w_class = ITEMSIZE_HUGE
		can_cleave = 1
		force_divisor = 0.4 //24 when wielded, Gains cleave and is better than a machete
		icon_state = "sawcleaver_open"
		item_state = "cleaving_saw_open"
		..()
	else
		w_class = initial(w_class)
		can_cleave = initial(can_cleave)
		force_divisor = initial(force_divisor)
		icon_state = initial(icon_state)
		item_state = initial(item_state)
		..()