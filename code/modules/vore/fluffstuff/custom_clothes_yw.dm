// **************
// Unleashed_Mana
// **************
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

// *************
// CynicalTester
// *************
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

// ****************
// Valhallaviking01
// ****************
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

// **************
// RandySavage205
// **************
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

// *************
// GeneralPantsu
// *************

// Amara Faell

/obj/item/clothing/suit/storage/fluff/fedcoat/amara_jacket
	name = "Scorched lieutenant jacket"
	desc = "A classic, bit too big leather bomberjacket with warm, fuzzy fur at the collar and on its insides and rolled up sleeves. It got several rather bad scorch marks that reveal there is a lining of durable but flexible material underneath it, but besides that it looks far from falling apart. There are outdated military insignias for the rank of 'Lieutenant' on each shoulder."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "faellbomber"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "faellbomber_mob"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/beret/amara_beret
	name = "Mercenary beret"
	desc = "An olive green beret with a silver emblem that consists of a shield and crossed swords. Seems to be part of some mercenary-band."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mberet"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mberet_mob"

/obj/item/clothing/gloves/fluff/amara_gloves
	name = "Mercenary gloves"
	desc = "A pair of dark, tactical fingerless gloves. Their knuckles are reinforced  and they are surprisingly comfy. They also don't cause problems with trigger-guards. Alas, they rarely are used on the field anymore."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tgloves"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tgloves_mob"

/obj/item/clothing/under/fluff/amara_uniform
	name = "Tactical Attire"
	desc = "A durable, tight fitting comfy black and red tanktop and a pair of just as black cargo pants that are being held in place by a belt. The beltbuckle reads 'DOG'."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tacgear"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tacgear_mob"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/shoes/boots/jackboots/fluff/amara_boots
	name = "Marching boots"
	desc = "A pair of worn, comfy boots optimized for those that need to wear them over a long period of time. They got reinforced soles and steel tips."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mboots"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mboots_mob"

/obj/item/clothing/accessory/collar/fluff/amara_collar
	name = "Pet's Collar"
	desc = "A black synthleather collar with spikey studs and a mark reading sharkie's button."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "collar_amara"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "collar_amara_mob"
	overlay_state = "collar_amara_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/clothing/suit/storage/vest/hoscoat/amara_hos
	name = "Mercenary chest rig"
	desc = "A high-quality heavy kevlar plate carrier with many pouches. Comes with shoulder, elbow and kneepads aswell as an emblem depicting a shield and crossed swords."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mercvest_nobadge"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_badge = "mercvest_badge"
	icon_nobadge = "mercvest_nobadge"

/obj/item/weapon/storage/belt/security/tactical/amara_belt
	name = "Mercenary belt"
	desc = "A sturdy military belt with a shiny buckle and a bunch of pouches."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mercenarybelt"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mercenarybelt_mob"

//Zara Venlee

/obj/item/clothing/shoes/magboots/fluff/zara_leg_enhancer
	name = "Enhancer Boots"
	desc = "A modified set of limb-enhancer boots made by Ward-Takahashi. They never saw use past a few prototypes such as these."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "leg_enhancer0"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "leg_enhancer0_mob"
	canremove = 0
	slowdown = 0
	icon_base = "leg_enhancer"

/obj/item/clothing/shoes/magboots/fluff/zara_leg_enhancer/attack_self(mob/user)
	if(magpulse)
		item_flags &= ~NOSLIP
		magpulse = 0
		set_slowdown(0)
		force = 3
		if(icon_base) icon_state = "[icon_base]0"
		user << "You disable the mag-pulse traction system."
	else
		item_flags |= NOSLIP
		magpulse = 1
		set_slowdown(3)
		force = 5
		if(icon_base) icon_state = "[icon_base]1"
		user << "You enable the mag-pulse traction system."
	user.update_inv_shoes()	//so our mob-overlays update
	user.update_action_buttons()

/obj/item/clothing/gloves/combat/fluff/zara_arm_enhancer
	name = "Enhancer Gauntlets"
	desc = "A modified set of limb-enhancer gauntlets made by Ward-Takahashi. They never saw use past a few prototypes such as these."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "arm_enhancer"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "arm_enhancer_mob"
	canremove = 0
	body_parts_covered = HANDS|ARMS

/obj/item/clothing/under/swimsuit/fluff/zara_uniform
	name = "Thermal Underwear"
	desc = "A sports bra and pair of compression shorts amde of a durable, stretchy material. Comfy and able to keep you warm for sure."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "thermal_underwear"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "thermal_underwear"
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/fluff/zara_bandana
	name = "Black and red Headband"
	desc = "A simple black headband with two red stripes that connect  in the middle, forming some sort of ark. Slightly suspicious."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "blackandredband"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "blackandredband_mob"

/obj/item/clothing/suit/storage/fluff/zara_coat
	name = "Rugged Coat"
	desc = "An old looking, black naval coat. It's sleeves got ripped off, some bits still hanging about, its bottom roughed up too. The epaulettes on each shoulder are a polished up gold and so are the many other golden ornaments on the coat."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "admiral_coat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "admiral_coat_mob"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//Sammantha Quzix

/obj/item/clothing/under/color/grey/fluff/sam_bodysuit
	name = "Mech Pilot Bodysuit"
	desc = "A black white and blue bodysuit made of reinforced materials. It clings tightly to its wearers body."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pilotsuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "pilotsuit"

/obj/item/clothing/gloves/sterile/latex/fluff/sam_gloves
	name = "Mech Pilot Gloves"
	desc = "A pair of durable, thin combat gloves, perfect for someone working with exosuits."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pilotgloves"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "pilotgloves_mob"

/obj/item/clothing/shoes/boots/jackboots/fluff/sam_boots
	name = "Reinforced Boots"
	desc = "A pair of tightly fitting boots, perfect for someone working with exosuits, seeing as they won't slip off fast."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pilotboots"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "pilotboots_mob"

/obj/item/weapon/storage/belt/utility/fluff/sam_belt
	name = "Mech Pilot Belt"
	desc = "A white-blue toolbelt with many slots to hold tools in, seems to be made to literally be attached onto a suit."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mechpilot"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mechpilot_mob"

/obj/item/clothing/suit/storage/fluff/fedcoat/sam_jacket
	name = "Mech Pilot Jacket"
	desc = "A black jacket made of genuine leather with blue markings on each shoulder. The letters 'ERT' are stenciled onto the back in gold lettering."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mechjacket"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mechjacket_mob"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// *******
// Izac112
// *******

//Ally Faell

/obj/item/clothing/under/fluff/ally_1
	name = "Skintight bodysuit"
	desc = "A black-purple bodysuit made of some durable synthetic material fitted for a akula. Lewd."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "satsuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "satsuit_mob"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/rank/security/corp/fluff/ally_2
	name = "Security uniform"
	desc = "A black Dark red security uniform with a tag on it that says Ally_F"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "allyuniform"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "allyuniform"

//Raja Bastet

/obj/item/weapon/storage/belt/utility/fluff/raja_belt
	name = "Mech Engineer Belt"
	desc = "A black-golden toolbelt with many slots to hold tools in. Also comes with a blue buckle."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mechengineer"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mechengineer_mob"

/obj/item/clothing/suit/storage/hooded/wintercoat/fluff/raja_coat
	name = "Mech Engineer Coat"
	desc = "A black winter coat made of genuine leather, decorated with blue markings and an interior made of genuine, white fur. The letters 'ERT' are stenciled onto the back in gold lettering."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "coatmech"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "coatmech_mob"

// ***********
// Johnwolf135
// ***********

/obj/item/clothing/under/fluff/rosetta
	name = "Pink medical scrubs"
	desc = "Its like standard medical scrubs...but PINK! remind you of anyone?."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "scrubspink"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "scrubspink_mob"

/obj/item/clothing/under/fluff/John
	name = "WTBU"
	desc = "A brand new looking tactical battle uniform but clearly old by the patch on the arm that reads 'Reaper'. The patch is faded and worn but is built onto the uniform which is weird because the rest of the uniform is very well maintained. The pants like the top are extremely taken care of the knee pads look like they've been replaced."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "johnbdu_s"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "johnbdu_mob"

// ************
// Mauser items
// ************

/obj/item/clothing/under/fluff/mauserunder
	name = "Mauser tank crew uniform"
	desc = "The standard uniform of the mauser tank division."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tankcrew_s"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tankcrew_mob"

/obj/item/clothing/head/beret/mauserhat
	name = "Crew cap"
	desc = "A floppy hat bearing the mauser logo."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tankcrewhat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tankcrewhat_mob"

/obj/item/clothing/shoes/boots/jackboots/fluff/mauserboots
	name = "Tanker boots"
	desc = "Pair of hig black leather boots pollished to a shine."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "leatherboots"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mboots_mob"

// **************
// Admiral Dragon
// **************

//Tikorak Korgask

/obj/item/clothing/shoes/magboots/fluff/tikorak_magboots
	name = "A.R. Magboots"
	desc = "These are A.R. Magboots standerd issue, these boots are worn as normal shoes by athorians so when they are worn they are noteably comfy and the toe claw seems to be able to raise and lower with the foot."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "arboots0"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "arboots0_mob"
	slowdown = 0
	icon_base = "arboots"

/obj/item/clothing/shoes/magboots/fluff/zara_leg_enhancer/attack_self(mob/user)
	if(magpulse)
		item_flags &= ~NOSLIP
		magpulse = 0
		set_slowdown(0)
		force = 3
		if(icon_base) icon_state = "[icon_base]0"
		user << "You disable the mag-pulse traction system."
	else
		item_flags |= NOSLIP
		magpulse = 1
		set_slowdown(3)
		force = 5
		if(icon_base) icon_state = "[icon_base]1"
		user << "You enable the mag-pulse traction system."
	user.update_inv_shoes()	//so our mob-overlays update
	user.update_action_buttons()

/obj/item/clothing/under/fluff/tikorak_uniform
	name = "A.R. Med/sci uniform"
	desc = "This is a A.R. Med/Sci uniform this is given to those who work in a medical field for the A.R."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "arclothes_s"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "arclothes"

// **************
// BlackAngelsAce
// **************

//Madoka

/obj/item/clothing/head/helmet/fluff/madoka_helm
	name = "Madoka's helm"
	desc = "A dark colored helmet fit for a large sergal head, it looks new but yet it has many scratches and deep scars."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sergal_helmet"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sergal_helmet"
	armor = list(melee = 65, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/fluff/madoka_chest
	name = "Madoka's chestpiece"
	desc = "A dark colored chestpiece made for a large sergal, it has a few scratches all around, and a big cut over the shoulder plate."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sergal_armor"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sergal_armor"
	armor = list(melee = 65, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/arm_guard/fluff/madoka_arms
	name = "Madoka's pauldron and bracers"
	desc = "A dark colored set of pauldron and bracers fit for a large sergal, they have scratch marks."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sergal_arms"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sergal_arms"
	armor = list(melee = 65, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/leg_guard/fluff/madoka_legs
	name = "Madoka's leg cuffs"
	desc = "A armored dark colored set of and bracers fit for a large sergal, their design allows to keep a mobility but leaves exposed areas."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sergal_legs"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sergal_legs"
	armor = list(melee = 65, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

// *******
// Dawidoe
// *******

//Melissa Krutz

/obj/item/clothing/under/rank/security/corp/fluff/melissa_uniform
	name = "Combat Uniform"
	desc = "A tactical jacket with, not so tactical short-skirt, combat ready and provides small amount of protection equivalent to security uniform."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mel"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mel"

// *******
// Deathty
// *******

//Arthur Schutz

/obj/item/clothing/under/rank/security/corp/fluf/art_uniform
	name = "SecCom Uniform"
	desc = "A standard issue SifGuard uniform for every military officer. Made from advanced fabrics which provide both the physical security and the fashionable security of it's wearer. They are designed with both purposes of utility work and formal work. This uniform has a couple of additional badges on the torso along with the nametag with 'A. Schutz' engraved onto it."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sifguardfox"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sifguardfox"

/obj/item/clothing/suit/storage/vest/hoscoat/art_hos
	name = "SecCom Jacket"
	desc = "A SifGuard fleet command jacket often worn by higher ranking SifGuard officers. Comes with an advanced microcarbon fabric which appears like any other fine fabric from a distance along with special ballistic weave enhancements under the fabric with improved fiberglass plates by the torso regions. This specific jacket has the symbol of the Lieutenant rank on each shoulder and above it the writting 'A. Schutz'"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sifguardjacket_fox"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_badge = "sifguardjacket_fox"
	icon_nobadge = "sifguardjacket_fox"