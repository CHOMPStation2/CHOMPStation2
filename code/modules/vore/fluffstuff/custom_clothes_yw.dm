// **********
// Unleashed_Mana
// **********
/obj/item/clothing/suit/storage/labcoat/fluff/eioni_1
	name = "Eio'ni Co. labcoat"
	desc = "The official labcoat of the Eio'ni Corporation."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eioni_labcoat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eioni_labcoat_mob"

	var/unbuttoned = 0

	verb/toggle()
		set name = "Toggle coat buttons"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(unbuttoned)
			if(0)
				icon_state = "[initial(icon_state)]_open"
				item_state = "[initial(item_state)]_open"
				unbuttoned = 1
				usr << "You unbutton the coat."
			if(1)
				icon_state = "[initial(icon_state)]"
				item_state = "[initial(item_state)]"
				unbuttoned = 0
				usr << "You button up the coat."
		usr.update_inv_wear_suit()


/obj/item/clothing/under/fluff/eioni_2
	name = "Eio'ni Co. uniform"
	desc = "The official uniform of the Eio'ni Corporation"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eioni_uniform"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eioni_uniform_mob"

/obj/item/clothing/suit/storage/hoodie/fluff/redax_1
	name = "Red gradient hoodie"
	desc = "A black hoodie with a red gradient pattern."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "rgradient_hoodie"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "rgradient_hoodie_mob"
	/////////////////////////////TODO//////////////////////
	var/unbuttoned = 0

	verb/toggle()
		set name = "Toggle coat buttons"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(unbuttoned)
			if(0)
				icon_state = "[initial(icon_state)]_open"
				item_state = "[initial(item_state)]_open"
				unbuttoned = 1
				usr << "You unbutton the coat."
			if(1)
				icon_state = "[initial(icon_state)]"
				item_state = "[initial(item_state)]"
				unbuttoned = 0
				usr << "You button up the coat."
		usr.update_inv_wear_suit()

/obj/item/clothing/under/fluff/redax_2
	name = "Alarming outfit"
	desc = "No need to panic."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "alarming_outfit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "alarming_outfit_mob"

/obj/item/clothing/accessory/fluff/eviriik_1
	name = "Cursed amulet"
	desc = "Just looking at it sends chills down your spine."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eviriik_pendant"
	item_state = "eviriik_pendant_mob"
	overlay_state = "eviriik_pendant_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/clothing/under/fluff/eviriik_2
	name = "Strange suit"
	desc = "Formal Attire. For whom is another question..."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eviriik_suit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eviriik_suit_mob"

/obj/item/clothing/suit/storage/fluff/eviriik_3
	name = "Strange coat"
	desc = "Helps you blend in during the dead of night."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eviriik_coat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eviriik_coat_mob"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/fluff/eravik_vessi_2
	name = "Mysterious trenchcoat"
	desc = "A dark trenchcoat lined with warm fleece."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eravikcoat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eravikcoat_mob"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/under/fluff/eravik_vessi_3
	name = "Formal suit"
	desc = "A formal dress shirt and waistcoat."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "eraviksuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "eraviksuit_mob"

/obj/item/clothing/under/fluff/david_1
	name = "David's uniform"
	desc = "The uniform of the Rave God himself."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "davidsuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "davidsuit_mob"

/obj/item/clothing/suit/storage/fluff/david_2
	name = "David's armor"
	desc = "Straight outta CentComm."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "davidarmor"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "davidarmor_mob"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/accessory/fluff/zeke_vincir_1
	name = "Torn scarf"
	desc = "Such a sad display of fabric abuse. Has a single black stripe."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "zekescarf"
	item_state = "zekescarf_mob"
	overlay_state = "zekescarf_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/clothing/under/fluff/zeke_vincir_2
	name = "Rough suit"
	desc = "It's a little worse for wear, but it's alright."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "zekesuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "zekesuit_mob"

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3
	name = "Black jacket"
	desc = "A black bomber jacket. Looks a little shady."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "zekebomber"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "zekebomber_mob"
	body_parts_covered = UPPER_TORSO

	var/unbuttoned = 0

	verb/toggle()
		set name = "Toggle coat buttons"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(unbuttoned)
			if(0)
				icon_state = "[initial(icon_state)]_open"
				item_state = "[initial(item_state)]_open"
				unbuttoned = 1
				usr << "You unbutton the coat."
			if(1)
				icon_state = "[initial(icon_state)]"
				item_state = "[initial(item_state)]"
				unbuttoned = 0
				usr << "You button up the coat."
		usr.update_inv_wear_suit()

/obj/item/clothing/mask/fluff/lucerna_1 //Doesn't work for some reason
	name =	"Mysterious mask"
	desc =  "Something about this isn't right..."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw_special.dmi'
	icon_state = "lucernamask"
	item_state = "lucernamask"

// **********
// Matt items
// **********
/obj/item/clothing/under/fluff/eliana_noya_1
	name = "Hard worn skirt"
	desc = "It appears to have a regular suit, though instead of pants, it has a skirt."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "elianasuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "elianasuit_mob"

/obj/item/clothing/head/helmet/fluff/korei_laskor_1
	name = "Shaped Helmet"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	desc = "A normal security helmet missing the goggles and fitted for a unathi skull specifically. It appears to have something written sinta'unathi written on the front."
	icon_state = "koreihelmet"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "koreihelmet_mob"

// **********
// CynicalTester
// **********
/obj/item/clothing/accessory/fluff/zeta_blackwell_1
	name = "Shub-niggurath pendant"
	desc = "It is a black pendant with what looks like a wolf head with tentacles coming out from the sides."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pendant_shubniggurath"
	item_state = "pendant_shubniggurath_mob"
	overlay_state = "pendant_shubniggurath_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// **********
// Valhallaviking01
// **********
/obj/item/clothing/accessory/fluff/wolf_erikson_1
	name = "USGN dogtags"
	desc = "The standard issue ID for all USGN corpsmen."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "usgn_dogtags"
	item_state = "usgn_dogtags_mob"
	overlay_state = "usgn_dogtags_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// **********
// RandySavage205
// **********
/obj/item/clothing/accessory/fluff/alex_wolf_1
	name = "UNSC Dog Tags"
	desc = "Feet first into hell!"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "usgn_dogtags"
	item_state = "usgn_dogtags_mob"
	overlay_state = "usgn_dogtags_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// **********
// GeneralPantsu
// **********
/obj/item/clothing/suit/storage/fluff/fedcoat/Amaracoat
	name = "Scorched lieutenant jacket"
	desc = "A dark gray military jacket that has seen better days. It's burned rather badly, but even with the ammount of burn marks and holes that show the kevlar-lining underneath it still doesn't fall apart, and looks as if it won't do so for a long time. The rank-emblems are outdated military ones showing the rank of Lieutenant and there is a halfways burnt off nameplate just reading 'Faell'."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "ltjacket"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "ltjacket_mob"

/obj/item/clothing/head/beret/Amaraberet
	name = "Mercenary beret"
	desc = "An olive green beret with a silver emblem that consists of a shield and crossed swords. Seems to be part of some mercenary-band."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mberet"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mberet_mob"

/obj/item/clothing/gloves/fluff/Amaragloves
	name = "Mercenary gloves"
	desc = "A pair of olive, fingerless gloves reinforced at the back of the hand and knuckles. Rarely see any use on the field as their use is limited."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tgloves"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tgloves_mob"

/obj/item/clothing/under/fluff/amara_faell_4
	name = "Sleeveless sweater"
	desc = "A gray sleeveless turtleneck-sweater and a pair of damaged camo pants."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "stnecksuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "stnecksuit_mob"

/obj/item/clothing/shoes/dutyboots/fluff/amara_faell_5
	name = "Marching boots"
	desc = "A pair of worn, comfy boots optimized for those that need to wear them over a long period of time. They got reinforced soles and steel tips."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mboots"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mboots_mob"