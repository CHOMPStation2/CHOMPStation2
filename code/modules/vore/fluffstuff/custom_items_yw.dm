/obj/item/clothing/accessory/fluff/zeta_blackwell_1
	name = "Shub-niggurath pendant"
	desc = "It is a black pendant with what looks like a wolf head with tentacles coming out from the sides."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "pendant_shubniggurath"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "pendant_shubniggurath_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2
//End cynicaltester

//valhallaviking01 items
/obj/item/clothing/accessory/fluff/Wolf_Erikson_1
	name = "USGN dogtags"
	desc = "The standard issue ID for all USGN corpsmen."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "usgn_dogtags"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "usgn_dogtags_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2
//end Valhallaviking01 items


//Manaspam
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

/obj/item/weapon/kitchenknife/tacknife/unathiknife/fluff/eravik_vessi1
	name = "Noctis"
	desc = "A strange blade made of some kind of black metal. It feels... incomplete."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "eravikblade"

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/david3
	name = "David's lucky bottle"
	desc = "As long as there is something in it, nothing can go wrong."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "davidbottle"

/obj/item/clothing/accessory/fluff/eviriik1
	name = "Cursed amulet"
	desc = "Just looking at it sends chills down your spine."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "eviriik_pendant"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "eviriik_pendant_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/weapon/kitchen/utensil/fork/fluff/ragna1
	name = "Ragna's fork"
	desc = "''FEAR RAGNA!''"
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "ragnafork"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "ragnafork_mob"

/obj/item/clothing/mask/fluff/lucerna1
	name =	"Mysterious mask"
	desc =  "Something about this isn't right..."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "lucernamask"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "lucernamask_mob"

/obj/item/clothing/accessory/fluff/Zeke_vincir1
	name = "Torn scarf"
	desc = "Such a sad display of fabric abuse. Has a single black stripe."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "zekescarf"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "zekescarf_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2
//end Manaspam

//matt items
/obj/item/weapon/kitchenknife/tacknife/unathiknife/fluff/payton_joghs
	name = "Payton's Knife"
	desc = "It appears to be a traditional unathi knife, though with 'Payton' written on the side and appearing to be made of steel."
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "paytonknife"
//end matt items

//RandySavage205 items
/obj/item/clothing/accessory/fluff/Alex_Wolf_1
	name = "UNSC Dog Tags"
	desc = "Feet first into hell!"
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "usgn_dogtags"
	icon_override = 'icons/vore/custom_items_yw.dmi'
	item_state = "usgn_dogtags_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2
//end RandySavage205 items

/obj/item/weapon/material/twohanded/spear/fluff/madoka_koto1
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_override = 'icons/vore/custom_items_yw.dmi'
	icon_state = "madokaspear0"
	base_icon = "madokaspear"
	name = "Madoka's spear"
	desc = "A 10 foot long spear, with a sturdy wooden shaft to which is attached a strange, double spiked steel blade. One is slightly larger than the other."
	force = 14
	w_class = 4.0
	slot_flags = SLOT_BACK
	force_wielded = 22 // Was 13, Buffed - RR
	throwforce = 20
	throw_speed = 3
	edge = 0
	sharp = 1
	unbreakable = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("stabbed", "pierced", "jabbed", "torn", "gored")