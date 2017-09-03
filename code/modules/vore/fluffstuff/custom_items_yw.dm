// **********
// Unleashed_Mana
// **********
/obj/item/weapon/fluff/zekewatch
	name = "Zeke's pocketwatch"
	desc = "Looks like it's broken... or is it?"
	w_class = 1.0
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "zekewatch"

/obj/item/weapon/fluff/zekewatch/attack_self(mob/living/user)
	if(user.r_hand == src || user.l_hand == src)
		var/time1 = rand(0,11)
		var/time2 = rand(0,59)

		if(time1 < 10)
			time1 = "0[time1]"
		if(time2 < 10)
			time2 = "0[time2]"

		user.visible_message("<span class='rose'>[src] displays [time1]:[time2]</span>")
	else
		return ..()
	return

/obj/item/weapon/kitchenknife/tacknife/unathiknife/fluff/eravik_vessi_1
	name = "Noctis"
	desc = "A strange blade made of some kind of black metal. It feels... incomplete."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "eravikblade"

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/david_3
	name = "David's lucky bottle"
	desc = "As long as there is something in it, nothing can go wrong."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "davidbottle"

/obj/item/weapon/material/kitchen/utensil/fork/fluff/ragna_1
	name = "Ragna's fork"
	desc = "\"FEAR RAGNA!\""
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "ragnafork"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state_slots = list(slot_r_hand_str = "ragnafork_r", slot_l_hand_str = "ragnafork_l")

// **********
// Capt_matt
// **********
/obj/item/weapon/material/hatchet/unathiknife/fluff/payton_joghs_1
	name = "Payton's Knife"
	desc = "It appears to be a traditional unathi knife, though with 'Payton' written on the side and appearing to be made of steel."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "paytonknife"

// **********
// BlackAngelsAce
// **********
/obj/item/weapon/oldtwohanded/spear/fluff/madoka_koto_1
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_override = 'icons/vore/custom_items_yw.dmi'
	icon_state = "madokaspear0"
	base_icon = "madokaspear"

	item_state_slots = list(slot_back_str = "madokaspear0_mob")

	name = "Madoka's spear"
	desc = "A 10 foot long spear, with a sturdy wooden shaft to which is attached a strange, double spiked steel blade. One is slightly larger than the other."
	force = 14
	w_class = 5.0
	slot_flags = SLOT_BACK
	force_wielded = 22 // Was 13, Buffed - RR
	throwforce = 20
	throw_speed = 3
	edge = 0
	sharp = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("stabbed", "pierced", "jabbed", "torn", "gored")

// *************
// GeneralPantsu
// *************
/obj/item/weapon/flame/lighter/zippo/fluff/amara
	desc = "A zippo that comes in a metallic blood red case. How the flame can be lime green is an enigma in itself."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "bloodredzippo"

/obj/item/device/modkit_conversion/fluff/amara_hos_kit
	name = "Amara's modkit"
	desc = "A kit containing all the needed tools and parts to modify a Head of security armored coat. It has a red wolf painted on it."

	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "modkit"

	from_suit = /obj/item/clothing/suit/storage/vest/hoscoat
	to_suit = /obj/item/clothing/suit/storage/vest/hoscoat/amara_hos

// *******
// Dawidoe
// *******
/obj/item/weapon/flame/lighter/zippo/fluff/melissa
	name = "Zippo"
	desc = "A custom made zippo lighter with word 'Mel' engraved in white font on the bottom right corner. It's black, with red lines around the edges."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "melzippo"

/obj/item/device/modkit_conversion/fluff/melissa_gun_kit
	name = "Melissa's modkit"
	desc = "A kit containing all the needed tools and parts to modify a 45 Pistol."

	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "modkit"

	from_suit = /obj/item/weapon/gun/projectile/sec/flash
	to_suit = /obj/item/weapon/gun/projectile/fluff/m1911

// *******
// Deathty
// *******

/obj/item/device/modkit_conversion/fluff/art_hos_kit
	name = "Arthur's modkit"
	desc = "A kit containing all the needed tools and parts to modify a Head of security armored coat."

	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "modkit"

	from_suit = /obj/item/clothing/suit/storage/vest/hoscoat
	to_suit = /obj/item/clothing/suit/storage/vest/hoscoat/art_hos

// ************
// championfire
// ************

//Anoki Windroar

/obj/item/weapon/implanter/reagent_generator/roiz/anoki
	implant_type = /obj/item/weapon/implant/reagent_generator/roiz/anoki

/obj/item/weapon/implant/reagent_generator/roiz/anoki
	name = "egg laying implant"
	desc = "This is an implant that allows the user to lay eggs."
	generated_reagent = "egg"
	usable_volume = 500
	transfer_amount = 50

	empty_message = list("Your lower belly feels smooth and empty. Sorry, we're out of eggs!", "The reduced pressure in your lower belly tells you there are no more eggs.")
	full_message = list("Your lower belly looks swollen with irregular bumps, and it feels heavy.", "Your lower abdomen feels really heavy, making it a bit hard to walk.")
	emote_descriptor = list("an egg right out of Anoki's lower belly!", "into Anoki' belly firmly, forcing him to lay an egg!", "Anoki really tight, who promptly lays an egg!")