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

/obj/item/clothing/suit/storage/labcoat/fluff/eioni_1/verb/toggle()
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

/obj/item/clothing/suit/storage/hoodie/fluff/redax_1/verb/toggle()
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

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3/verb/toggle()
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

/obj/item/clothing/suit/storage/hoodie/fluff/eviriik_4
	name = "Striped Jacket"
	desc = "A somewhat dated looking jacket."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "striped_jacket"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "striped_jacket_mob"

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

/obj/item/clothing/accessory/medal/silver/fluff/kaeninmedal
	name = "Kaenin Qerrlar\'s medal of valor"
	desc = "A silver medal, polished to a shine. On it, it says \"For Honorable Service, Kaenin Qerrlar, among the first to volunteer to save the world of Virgo-Erigone Four, homeworld of the zorren. Qerrlar piloted a combat exosuit to combat a hostile lifeform until it simply ran out of power, after this, he continued on foot.\" It is adorned with a purple ribbon."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "valormedal"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "valormedal_mob"
	overlay_state = "valormedal_mob"


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

/obj/item/storage/belt/security/tactical/amara_belt
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

/obj/item/clothing/under/rank/security/corp/fluff/sam_bodysuit
	name = "Mech Pilot Bodysuit"
	desc = "A black white and blue bodysuit made of reinforced materials. It clings tightly to its wearers body."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pilotsuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "pilotsuit"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

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

/obj/item/storage/belt/utility/fluff/sam_belt
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

//Nika Domashev

/obj/item/clothing/under/rank/security/corp/fluff/nika
	name = "PCRC navy uniform"
	desc = "A pair of navy digital camo pants and a navy blue shirt. The nameplate on it reads 'N. Domashev' and the rank indicated on it is Lance Corporal. There also is a belt to keep the pants in place and kneepads for protection."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "lcpl"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "lcpl"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/officer/fluff/nika
	name = "Light armor vest"
	desc = "An outdated looking armor vest with pouches on the front. Not as flexible as security gear of today, but still as protective as it and surprisingly also lighter."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "lcplvest_nobadge"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_badge = "lcplvest_badge"
	icon_nobadge = "lcplvest_nobadge"

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

/obj/item/storage/belt/utility/fluff/raja_belt
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

//Shel Nargol

/obj/item/clothing/gloves/fluff/shel_gloves
	name = "Leather armwraps"
	desc = "A bunch of leather and linen strips to act as some sort of gloves. The fingers are free, and the left arm is covered in the wraps completely."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "armwraps"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "armwraps"

/obj/item/clothing/under/fluff/shel
	name = "Padded pants"
	desc = "A pair of padded linen pants reinforced with leather every here and there. Comes with a plain black belt too."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "paddedpants_s"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "paddedpants"

//Alva Karlholm

/obj/item/clothing/under/rank/security/corp/fluff/alva
	name = "PCRC dress uniform"
	desc = "A black skirt along with a navy blue sweater. The nametag on the sweater reads 'A. Karlholm' and the rank indicated on it is Sergeant. It also comes with a belt who's buckle is a shiny platinum."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sgt"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sgt"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/toggle/labcoat/fluff/alva
	name = "PCRC labcoat"
	desc = "A white labcoat with the logo of the Proxima Centauri Risk Control logo on the back. The sleeves are rolled back too."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "labcoat_sgt"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "labcoat_sgt"

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
	flags_inv = HIDETAIL|HIDETIE|HIDEHOLSTER
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
	desc = "A armored dark colored set of and bracers fit for a large sergal, their design allows to keep high mobility but leaves exposed areas."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "sergal_legs"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "sergal_legs"
	armor = list(melee = 65, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

//Aurora Goldtail

/obj/item/clothing/glasses/omnihud/prescription/aurora
	name = "Round glasses"
	desc = "A pair of circular shaped prescription glasses. They seem fit for a avian head and will most likely make anyone wearing these look like a big nerd. It seems they are outfitted with a augmented reality module."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "aurora_glasses"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "aurora_glasses"

//Strix Hades

/obj/item/clothing/suit/storage/teshari/cloak/fluff/strix
	name = JOB_ALT_COLONY_DIRECTOR + " Coat"
	desc = "It drapes over a Avali's shoulders and closes at the neck with pockets convienently placed inside. It bears the " + JOB_ALT_COLONY_DIRECTOR + "'s colors. The name 'Strix Hades' is embroilled in gold lettering around a golden embroilled outline on the neck collar."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tesh_cloak_cd"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tesh_cloak_cd"

/obj/item/clothing/under/teshari/undercoat/fluff/strix
	name = JOB_ALT_COLONY_DIRECTOR + " Undercoat"
	desc = "Made of carbon nanofiber, it is light and billowy, perfect for going fast and stylishly!"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "tesh_uniform_cd"
	item_state = "tesh_uniform_cd"
	sprite_sheets = list(
					SPECIES_TESHARI = 'icons/vore/custom_onmob_yw.dmi'
					)

/obj/item/clothing/suit/storage/teshari/cloak/fluff/strix_cco
	name = "Central Command Cloak"
	desc = "It drapes over a Avali's shoulders and closes at the neck with pockets convienently placed inside. It bears the Central Command's colors. The name 'Strix Hades' is embroilled in gold lettering around a golden embroilled outline on the neck collar."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tesh_cloak_cco"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tesh_cloak_cco"

/obj/item/clothing/under/teshari/undercoat/fluff/strix_cco
	name = "Central Command Undercoat"
	desc = "Made of carbon nanofiber, it is light and billowy, perfect for going fast and stylishly!"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "tesh_uniform_cco"
	item_state = "tesh_uniform_cco"
	sprite_sheets = list(
					"Teshari" = 'icons/vore/custom_onmob_yw.dmi'
					)

//Plague Boye
/obj/item/clothing/suit/storage/trench/fluff/kelplaguecoat
	name = "Dark Leather coat"
	desc = "A finely made dark leather coat."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "kelplaguecoat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "kelplaguecoat_mob"
	blood_overlay_type = "coat"

/obj/item/clothing/under/fluff/kelplagueuniform
	name = "Dark vest"
	desc = "A fancy looking leather suit made of dark cloths. Edgy."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "kelplagueuniform"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "kelplagueuniform_mob"

/obj/item/clothing/mask/gas/plaguedoctor/fluff/kelplaguemask
	name = "Customized Gas Mask"
	desc = "A dark leather gas mask with rivets instead of stiches holding the two halves together."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "kelplaguedoctor"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "kelplaguedoctor"
	item_state_slots = null
	armor = list(melee = 0, bullet = 0, laser = 2,energy = 2, bomb = 0, bio = 90, rad = 0)
	body_parts_covered = HEAD|FACE|EYES

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

// ***************
// Vanesa FancyFin
// ***************

//Vanesa Fancyfin

/obj/item/clothing/gloves/weddingring/fluff/vanesa

	name = "Golden Rings"
	desc = "A set of beautiful gold rings, worn on the fingers to show off high class at it's finest."

// ********
// Vitorhks
// ********

//Jessica Mayer

/obj/item/clothing/under/rank/security/corp/fluff/jessica
	name = "PCRC navy BDU"
	desc = "A BDU with a navy blue digital camo pattern. The nametag on it reads 'J. Mayer' and the rank indications show the rank Private First class. Its sleeves are rolled back, there is a belt around the waist and there are kneepads for protection."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pfc"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "pfc"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/officer/fluff/jessica
	name = "PCRC security contractor vest"
	desc = "A somewhat outdated, lightweight security vest with inbuilt pouches to carry security equipment. It is rather bulky, but nontheless still flexible."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pfcvest_nobadge"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_badge = "pfcvest_badge"
	icon_nobadge = "pfcvest_nobadge"

// ************
// Championfire
// ************

//Ivy Kaeire

/obj/item/clothing/under/fluff/ivy
	name = "Casual Attire"
	desc = "This set of clothing is anything but fancy. It's a simple grey shirt with black pants. The pants have small black belts around them on the pant legs."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "Ivysuit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "Ivysuit"

/obj/item/clothing/suit/storage/fluff/ivy
	name = "Ivy's Trenchcoat"
	desc = "A black trenchcoat with purplish pink material as the inside of the jacket. It's got some belts around the waist that are presumably used to seal the jacket, but it's never really used. It's got the name Ivy Kaeire sewn on the inside. It also has a hood."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "Ivycoat"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "Ivycoat"
	body_parts_covered = UPPER_TORSO
	var/hoodup = 1

/obj/item/clothing/suit/storage/fluff/ivy/verb/toggle()
	set name = "Toggle Hood"
	set category = "Object"
	set src in usr

	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	switch(hoodup)
		if(0)
			icon_state = "[initial(icon_state)]"
			item_state = "[initial(item_state)]"
			hoodup = 1
			usr << "You take off the hood."
		if(1)
			icon_state = "[initial(icon_state)]_up"
			item_state = "[initial(item_state)]_up"
			hoodup= 0
			usr << "You put on the hood."
	usr.update_inv_wear_suit()

//Kita

/obj/item/clothing/suit/storage/teshari/cloak/fluff/kita
	name = "Magical Cloak"
	desc = "It drapes over a Teshari's shoulders and closes at the neck with pockets convienently placed inside. It bears magical colors."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tesh_cloak_kita"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tesh_cloak_kita"

// ********
// lukevale
// ********

//For use in jackets with hoods. Doesn't have any sprites assigned but feel free to use it ~ Luke

/obj/item/clothing/suit/storage/toggle/hoodiebuttoned
	name = "labcoat"
	desc = "A suit that protects against minor chemical spills."
	icon_state = "jiao_labcoat"
	item_state_slots = list(slot_r_hand_str = "labcoat", slot_l_hand_str = "labcoat")
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	flags_inv = HIDEHOLSTER
	allowed = list(POCKET_GENERIC,POCKET_MEDICAL,POCKET_GENERIC)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)
	hoodtype = /obj/item/clothing/head/hood/hoodiebuttoned //Default hoodie.
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

	var/suittoggled = 0
	var/hooded = 0
	actions_types = list(/datum/action/item_action/toggle_hood)
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/clothing/head/hood/hoodiebuttoned
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE




/obj/item/clothing/suit/storage/toggle/hoodiebuttoned/example
	name = "example"
	desc = "an example version."
	icon_state = "jiao_labcoat"

	hoodtype = /obj/item/clothing/head/hood/hoodiebuttoned/example

/obj/item/clothing/head/hood/hoodiebuttoned/example
	name = "example hood"
	desc = "An example hood."
	icon_state = "skinner_helm"

//end of hoodiebuttoned

//Lena Shaw

/obj/item/clothing/accessory/fluff/lena_collar
	name = "Ruby Embedded Collar"
	desc = "A gold and platinum collar, with a embedded ruby gem. On the back is a engraving. 'The only one for me, Quanah Hastings', encompassing the engraving is a heart."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "W_Collar_R"
	item_state = "W_Collar_R"
	overlay_state = "W_collar_R_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

//Mitsuko Jiao

/obj/item/clothing/suit/storage/toggle/labcoat/fluff/jiao_labcoat
	name = "Fluffy elongated labcoat"
	desc = "A white labcoat that seems to have been extended down to cover the legs as well, around the cuffs and bottom is a lay of fluff."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_labcoat"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/clothing/glasses/hud/health/aviator/fluff/jiao_glasses
	name = "Mitsuko's AR glasses"
	desc = "A set of metal frame glasses that seem to be modified to fit easier on a elongated snout. On the glasses is a set of low perspiration lenses with a thin overlay for medical hub to be turned on."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_glasses"
	off_state = "jiao_glasses_off"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "jiao_glasses"
	species_restricted = list("Akula")

/obj/item/clothing/under/rank/medical/fluff/jiao_uniform
	name = "A Kanghu Navy Force medical doctor uniform"
	desc = "A slandered issue Kanghu Navy Force medical doctor uniform, it has a a white base with blue ocean camo overlaying the shoulders, waist, and back, with deep blue accents, and light blue highlights. The uniform is loose fitting, and has a set of buttons running up the middle to take it on and off. This one seems to have the shoulder straps vacant of any epaulettes."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_uniform"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "jiao_uniform"
	rolled_sleeves = -1

/obj/item/clothing/head/beret/fluff/jiao_beret
	name = "A Kanghu Navy Beret"
	desc = "This camo beret has a white flash signifying the person as medical personnel, however, there is no rank or insignia on the flash, and it is left blank."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_beret"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/clothing/shoes/boots/jackboots/fluff/jiao_boots
	name = "Modified Navy Boots"
	desc = "This is a set of boots from the Kanghu navy, as denoted by the seal in the sole of the boot, that has been modified to fit not human feet."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_boots"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/storage/belt/medical/fluff/jiao_belt
	name = "Navy medical belt"
	desc = "A customized medical belt to sport the navy colors of the Kanghu force."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_belt"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/clothing/gloves/sterile/fluff/jiao_gloves
	name = "Padded Sterile Gloves"
	desc = "These light gray latex gloves have a blue, thick pad on the back of the hand, and on the back of the fingers, designed to survive all the life toughest that a field medic would face."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jiao_gloves"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	force = 2
	punch_force = 2


// ************
// RadiantFlash
// ************

//Vasharr Zahirn

/obj/item/clothing/accessory/fluff/vasharr_armlets
	name = "Glistening Armlets"
	desc = "A pair of thin golden Armlets, meant to be worn on the upper arm. These appear to have Tajaran runic script written along them."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "bangles_v"
	item_state = "bangles_v_mob"
	overlay_state = "bangles_v_mob"
	slot_flags = SLOT_GLOVES
	w_class = 2

/obj/item/clothing/accessory/fluff/vasharr_pendant
	name = "Zahirn pendant"
	desc = "A golden necklace, the symbol for the Zahirn clan can be found on it's pendant."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "pendant_v"
	item_state = "pendant_v_mob"
	overlay_state = "pendant_v_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/clothing/under/explorer/utility/command/engineering/fluff/vasharr
	name = "Cartographer Engineering Command Uniform"
	desc = "A Engineering Command Uniform from the Galactic Cartographers Society, A group of intrepid explorers. This one has gold trim and organge blazes."
// ********
// Dwaggy90
// ********

//Saur Darastrix

/obj/item/storage/backpack/dufflebag/fluff/saur_dufflebag
	name = "Saur's Dufflebag"
	desc = "A large custom made dufflebag to fit snug between a pair of wings, fitted with custom purple straps and golden medical cross, with the name 'Saur Darastrix' written under it."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	item_icons = list(slot_l_hand_str = 'icons/vore/custom_items_left_hand_yw.dmi', slot_r_hand_str = 'icons/vore/custom_items_right_hand_yw.dmi', slot_back_str = 'icons/vore/custom_onmob_yw.dmi')
	icon_state = "saur_duffle"
	slowdown = 0

//PCarrier, currently using the sprites and path for the navy version. will be changed with icon overrides once i have a hold of them. Here's to Izacs sanity.
/obj/item/clothing/suit/armor/pcarrier/navy/fluff/saur_pccarrier
	name = "Saur's Plate Carrier"
	desc = "A mostly black and purple striped armour carrier, geared up and ready to go. It looks well maintained, either its not seen much action yet, or any damage done is meticulously repaired, Several small blood splatters that have dried on the inside of it seem to suggest the latter. this carrier has been modified to have holes in the back for wings to slot through."
	starting_accessories = list(/obj/item/clothing/accessory/armor/armguards/navy/fluff/saur_arm, /obj/item/clothing/accessory/armor/legguards/navy/fluff/saur_leg, /obj/item/clothing/accessory/armor/armorplate/tactical/fluff/saur_plate, /obj/item/clothing/accessory/storage/pouches/navy/fluff/saur, /obj/item/clothing/accessory/armor/tag/pcrc/fluff/saur)

/obj/item/clothing/accessory/armor/armguards/navy/fluff/saur_arm
	name = "Saur's Armguards"
	desc = "Armguards for a Plate Carrier, this set is black and purple, and has a tag on the underside with the name 'Saur Darastrix' on them."

/obj/item/clothing/accessory/armor/legguards/navy/fluff/saur_leg
	name = "Saur's Legguards"
	desc = "A pair of Leg guards for a plate carrier set. These are black and purple. They have a name tag on the back of them with the name 'Saur Darastrix' on"

/obj/item/clothing/accessory/armor/armorplate/tactical/fluff/saur_plate
	name = "Saur's Plate"
	desc = "A standard tactical plate for a carrier, with a tag on the top of it with the name 'Saur Darastrix' on. There is also a group picture attached to the back of the plate, what looks to be Saur Darastrix standing with two Tajaran's and a Naga."

/obj/item/clothing/accessory/storage/pouches/navy/fluff/saur
	name = "Saur's PCpouches"
	desc = "Standard pouches for a Plate Carrier. Black and purple in colour, checking the inside of a pocket would reveal a name tag with 'Saur Darastrix' Written on it."

/obj/item/clothing/accessory/armor/tag/pcrc/fluff/saur
	name = "BlueShield PCRC tag"
	desc = "A tag for a Plate Carrier, with the title 'Blueshield' written across it. Under that in small is written PCRC."

// ******
// Dushka
// ******

//Saroth

/obj/item/clothing/suit/storage/teshari/cloak/fluff/Saroth
	name = "Research Director cloak"
	desc = "It drapes over a Teshari's shoulders and closes at the neck with pockets conveniently placed inside. This one bears the colors of the science department with additional trimming to designate it as the research director's. It has 'operty of Saroth' sewed in on the inside at the neck. The pockets seem slightly bigger on the inside than they appear on the outside."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tesh_cloak_saroth"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tesh_cloak_saroth"

/obj/item/clothing/accessory/poncho/cloak/fluff/Jaree
	name = "plain cloak"
	desc = "A plain cloak to be worn for warmth or comfort. Looks cozy."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "jaree_cloak"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "jaree_cloak"

/obj/item/clothing/head/ushanka/alt/fluff/Jaree
	name = "ushanka"
	desc = "Perfect for winter in Siberia, da?"
	icon_state = "ushanka2down"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "ushanka2down"
	flags_inv = HIDEEARS

/obj/item/clothing/head/ushanka/alt/fluff/Jaree/attack_self(mob/user as mob)
	if(src.icon_state == "ushanka2down")
		src.icon_state = "ushanka2up"
		src.item_state = "ushanka2up"
		user << "You raise the ear flaps on the ushanka."
	else
		src.icon_state = "ushanka2down"
		src.item_state = "ushanka2down"
		user << "You lower the ear flaps on the ushanka."

// ******
// Benl8561
// ******

//M.I.S.S.Y

/obj/item/clothing/under/fluff/missy_skirt
	name = "Blue Micro Skirt"
	desc = "Its a rather odd skirt it really does not cover much! Might as well not even have the thing on at this point. there is a tag on the back with writing on it. 'PROPERTY OF M.I.S.S.Y :3' just barely fitting on it."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "micro_skirt"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "micro_skirt"
	body_parts_covered = null

//Quanah Hastings

/obj/item/clothing/accessory/fluff/quanah_collar
	name = "Sapphire Embedded Collar"
	desc = "A gold and silver collar, with a embedded sapphire gem. On the back is a engraving. 'Forever loved, Lena Hastings', encompassing the engraving is a heart."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "W_collar_S"
	item_state = "W_collar_S_mob"
	overlay_state = "W_collar_S_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// ******
// MaxieFoxie
// ******

//Maxie Drake

/obj/item/clothing/accessory/fluff/maxie_collar
	name = "Pink Wide Band Collar."
	desc = "A wide banded collar, made of a black band of fabric, with a pink band overlapping it over the center. On it is a small bit of circuitry that's out of the way. Inside the collar the name 'Maxie Drake' is stitched in it."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "maxie_collar_icon"
	item_state = "maxie_collar_mob"
	overlay_state = "maxie_collar_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// ******
// Paint It Red
// ******

//Noel Walsh

/obj/item/clothing/glasses/hud/health/aviator/prescription/fluff/noel_glasses
	name = "Noel's AR glasses"
	desc = "Noel's custom glasses, the initial's NW are written on the inside of the left ear frame, the frames are black and don't reach all the way around."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "noel_glasses"
	off_state = "noel_glasses_off"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "noel_glasses"

/obj/item/clothing/suit/storage/toggle/hoodie/fluff/noel_hoodie
	name = "Noel's casual hoodie"
	desc = "A blue faded black trimmed hoodie, it looks very simple and warm, there are the initials N.W. on the tag inside"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "noel_hoodie"
	// "noel_hoodie_open" will be the open state
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = null

/obj/item/clothing/ears/earings/fluff/noel_earings
	name = "Teardrop Earrings"
	desc = "A pair of simple earrings with diamonds set into a metal plate, they hang down from the ear by a small hook."
	var/ring_on = 0
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "noel_earings"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

/obj/item/clothing/ears/earings/fluff/noel_earings/verb/toggle_rings()
	set name = "Toggle right earring"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	var/base_icon = "noel_earings"

	if(ring_on)
		icon_state = "[base_icon]"
		ring_on = 0
		usr << span_notice("You remove the right earring.")
	else
		icon_state = "[base_icon]_on"
		ring_on = 1
		usr << span_notice("You put on the right earring.")

	update_clothing_icon()

/obj/item/clothing/under/fluff/noel_uniform
	name = "noel's uniform"
	desc = "A sweater with a skirt attached to it. Under the skirt is a set of shorts that cling to the body, showing a bulge very well if there is one."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "noel_uniform"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'

// ******
// Roguenoob
// ******

//Basir Fahim

/obj/item/clothing/accessory/ring/fluff/basir
	name = "Sundancer Engagement Ring"
	desc = "This ring is stylized to have an ornate sun, with a sample of phoron swirling around inside. Keep away from Fire! Inscribed along the band is a sentence in Siik; \"Always yours, my little frost-fire. With love. -Sheri\""
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "plasma_ring"

// ******
// Harpsong
// ******

//Harpsong

/obj/item/clothing/suit/armor/vest/harpsong
	name = "Kentauri Uniform (Tac)"
	desc = "A typical Kentauri uniform worn by those in Command, Tactical and Security disciplines. It is crafted specifically to fit the typically overweight body of the average Kentauri, and its colours match up with those of station security."
	species_restricted = null //Species restricted since all it cares about is a taur half
	icon = 'icons/vore/rigs_taur_yw.dmi'
	icon_override = 'icons/vore/rigs_taur_yw.dmi'
	icon_state = "kentauri_uniform"
	item_state = "kentauri_uniform"

/obj/item/clothing/suit/armor/vest/harpsong/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = 0)
	if(..())
		if(istype(H) && istype(H.tail_style, /datum/sprite_accessory/tail/taur/horse/big))
			return ..()
		else
			to_chat(H,span_warning("You need to have a kentauri half to wear this."))
			return 0

/obj/item/clothing/suit/armor/vest/harpsong/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer = 0, var/icon/clip_mask = null)
	var/image/result = ..()
	result.pixel_x = -16
	result.layer = BODY_LAYER + 15
	return result

// *****
// SASOperative
// *****

//Joseph Skinner

/obj/item/clothing/under/rank/security/fluff/skinner
	name = "Red Camo Fatigues"
	desc = "A set of fatigues which seem to be have kevlar sown in at places to help protect from some blunt trauma."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "skinner_under"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "skinner_under"

/obj/item/clothing/suit/armor/vest/fluff/skinner
	name = "Heavy Tactical Armor"
	desc = "A set of tactical armor with red markings and a extra layer of protection along the legs and arms. It has a red cross with a skull near the upper chest."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "skinner_heavy"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "skinner_heavy"

/obj/item/clothing/head/helmet/fluff/skinner
	name = "Tactical Helmet"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	desc = "A helmet with a red line going straight down the middle to accompany its matching set or armor."
	icon_state = "skinner_helm"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "skinner_helm"

/obj/item/clothing/mask/gas/fluff/skinner
	name =	"Tinted Gasmask"
	desc =  "A gasmask with red tinted lenses installed to hide the users eyes. Or to try and instill fear, it seems to have some form of Inhaler system installed, the wearer seems to breathe much heavier in this mask than others."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "skinnermask"
	item_state = "skinnermask"

// *****
// MASMC
// *****

// Kettek Ollarch
/obj/item/accessory/fluff/kettek_collar
	name = "Kettek's Collar"
	desc = "A colour-changing collar. The collar itself changes colour, and has a gold tag on it that says \"Kettek Ollarch\" in small black lettering. Stiched on the inside is the same name, seemingly in case the tag falls off."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "kettek_collar_default"
	item_state = "kettek_collar"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

/obj/item/accessory/fluff/kettek_collar/Initialize(mapload)
	. = ..()
	verbs |= /obj/item/accessory/fluff/kettek_collar/proc/change_color
	color = get_random_colour()
	update_icon()

/obj/item/accessory/fluff/kettek_collar/proc/change_color()
	set name = "Change collar colour"
	set category = "Object"
	set desc = "Chane the colour of the collar."
	set src in usr

	if(usr.stat || usr.incapacitated())
		return

	var/new_color = tgui_color_picker(usr, "Pick a new colour", "Collar Colour", color)

	if(new_color && (new_color != color))
		color = new_color

/obj/item/accessory/fluff/kettek_collar/emp_act()
	var/original_state = icon_state
	icon_state = "kettek_collar_emp"
	update_icon()

	spawn(200)
		if(src)
			icon_state = original_state
			update_icon()


// *****
// BAYBELL
// *****

//Takira

/obj/item/clothing/suit/storage/fluff/takirasuit
	name = "Old Vox Armor"
	desc = "The rusted and rather useless remains of a Vox Raider suit... Is this thing even safe to wear?"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "takira_suit"
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	item_state = "takira_suit"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO


/obj/item/clothing/mask/gas/fluff/takiramask
	name =	"Old Vox Mask"
	desc =  "Half-broken or completely broken? At least its breathing tubes work."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_override = 'icons/vore/custom_onmob_yw.dmi'
	icon_state = "takira_helmet"
	item_state = "takira_helmet"


//GENERAL STUFF (Common - No specific ckey)

/obj/item/clothing/suit/storage/fluff/techpriestrobes
	name = "TechPriest Armor"
	desc = "TechPriest Armor."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tp_bodyrobes_onmob"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tp_bodyrobes_onmob"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO

/obj/item/clothing/under/fluff/techpriestunder
	name = "TechPriest Under"
	desc = "Janky af"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tp_bodyrobes"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tp_bodyrobes_onmob"

/obj/item/clothing/head/helmet/fluff/techpriesthead
	name = "TechPriest Head"
	desc = "Literally a head"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tp_hat_onmob"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tp_hat_onmob"

/obj/item/clothing/shoes/boots/jackboots/fluff/techpriestboots
	name = "TechPriest boots"
	desc = "Boots"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tp_boots_onmob"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tp_boots_onmob"

/obj/item/clothing/gloves/fluff/techpriestgloves
	name = "TechPriest gloves"
	desc = "Gloves"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "tp_gloves_onmob"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "tp_gloves_onmob"

// ******
// RisingStarSlash
// ******
//Monika Wolfe
/obj/item/clothing/accessory/collar/fluff/stellar_collar
	name = "Heart Collar"
	desc = "The collar appears to have a heart shaped pin on the front, the medical logo on visible from a distance. Closer inspection shows that the heart can be opened, revealing a picture. On the picture you can see Monika and Isha close together, paws locked and facing the picture slightly sideways with beaming smiles."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "stellarcollar"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "stellarcollar_mob"
	overlay_state = "stellarcollar_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2

// ******
// CheekyCrenando
// ******
//Srusu Rskuzu-Ahslru
/obj/item/clothing/under/fluff/srususoviet
	name = "Soviet Uniform"
	desc = "A standard issue Soviet Dress uniform"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "srusuuniform"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "srusuuniform"

// ******
// Hagawaga
// ******
//Lana Xavier
/obj/item/clothing/under/fluff/romanarmor
	name = "Roman Legionary Armor"
	desc = "Basically looks like what you would expect a segmented plated armor from the early Roman Empire to look like."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "hagawaga_romanarmor"
	icon_override = "icons/vore/custom_clothes_yw.dmi"
	item_state = "hagawaga_romanarmor"

// ******
// Moca_The_Porg1
// ******
//Mocha
/obj/item/clothing/under/fluff/mocha_uniform
	name = "Winterized Explorer Jumpsuit"
	desc = "A Greenish-white uniform for operating in hazardous environments. This one is suited for colder environments."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mocha_uniform"
	icon_override = "icons/vore/custom_clothes_yw.dmi"
	item_state = "mocha_uniform"

/obj/item/clothing/suit/storage/hooded/fluff/mocha_suit
	name = "Winterized Explorer Suit"
	desc = "An armoured suit for exploring harsh environments. This one seems more suited for winter."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mocha_suit"
	icon_override = "icons/vore/custom_clothes_yw.dmi"
	item_state = "mocha_suit_s"
	slot_flags = SLOT_OCLOTHING
	flags = THICKMATERIAL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	hoodtype = /obj/item/clothing/head/hood/mocha_hood
	siemens_coefficient = 0.9
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 35, bio = 75, rad = 35) // Inferior to sec vests in bullet/laser but better for environmental protection.
	allowed = list(
		/obj/item/flashlight,
		/obj/item/gun,
		/obj/item/ammo_magazine,
		/obj/item/melee,
		/obj/item/material/knife,
		/obj/item/tank,
		/obj/item/radio,
		/obj/item/pickaxe
		)

/obj/item/clothing/head/hood/mocha_hood
	name = "Winterized Explorer Hood"
	desc = "An armoured hood for exploring harsh environments. This one seems fluffier."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mocha_hood"
	icon_override = "icons/vore/custom_clothes_yw.dmi"
	item_state = "mocha_hood_s"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 35, bio = 75, rad = 35)

/obj/item/clothing/accessory/poncho/cloak/fluff/mocha
	name = "Elaborate Cloak"
	desc = "A cloak denoting the rank of a warden, the name \"Mocha\" is embroidered along the collar in red lettering"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "mocha_cloak"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "mocha_cloak_s"
	overlay_state = "mocha_cloak_s"

// ******
// Lawst
// ******
//Domine Brisillidine

/obj/item/clothing/accessory/medal/silver/fluff/dominemedal
	name = "Domine Brisillidine's medal of valor"
	desc = "A silver medal, polished to a shine. On it, it says \"For Honorable Service, Domine Brisillidine, among the first to volunteer to save the world of Virgo-Erigone Four, homeworld of the zorren. Domine lead the volunteer team in to the combat zone and assisted with arming and coordinating them against the hostile forces.\" It is adorned with a purple ribbon."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "valormedal1"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "valormedal1_mob"
	overlay_state = "valormedal1_mob"

// ******
// Foxicide
// ******
/obj/item/storage/backpack/fluff/kaith
	name = "Light duffle bag"
	desc = "A compact duffle bag, meant for long hikes."
	icon = 'icons/inventory/back/item.dmi'
	icon_state = "duffle"


// ******
// SplinterGP
// ******

/obj/item/clothing/accessory/poncho/cloak/fluff/aroozee
	name = "Aroozee Cloak"
	desc = "A cloak made especially for a vasilissan, it smells of perfume."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "aroozee_cloak"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "aroozee_cloak_mob"
	flags_inv = HIDETAIL
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/accessory/poncho/cloak/fluff/aroozeehos
	name = "Aroozee Head of Security Cloak"
	desc = "A cloak denoting the rank of head of security, it's made especially for a vasilissan and smells of perfume."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "aroozee_cloak_hos"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "aroozee_cloak_hos_mob"
	flags_inv = HIDETAIL
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/accessory/collar/fluff/aroozee_valhollide_ring
	name = "Aroozee valhollide ring"
	desc = "A long, loose chain lace of silver, holding a special ring of a perfect, crystalline definition. <br>It's touch is perpetually that of deep ice-cold, no matter how long you hold it.<br> Staring at it, you feel quiet, your mind calm, your thoughts very still."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "aroozee_valhollide_ring"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "aroozee_valhollide_ring_mob"
	overlay_state = "aroozee_valhollide_ring_mob"
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	w_class = 2


// *****
// Rouwren
// *****

/obj/item/clothing/accessory/medal/fluff/rindeimos
	name = "Broken Life Crystal"
	desc = "The broken life crystal doesn't do anything, except remind you of loss."
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "khlife3"
	icon_override = 'icons/vore/custom_items_vr.dmi'
	item_state = "khlife_overlay"
	overlay_state = "khlife_overlay"

// ******
// KBraid
// ******
/obj/item/clothing/glasses/fluff/avigoggles_yw
	name = "aviation goggles"
	desc = "You're such a goggle head!"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "avigoggles_i"
	item_state = "avigoggles"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	actions_types = list(/datum/action/item_action/toggle_goggles)
	item_flags = AIRTIGHT
	var/up = 0

/obj/item/clothing/glasses/fluff/avigoggles_yw/attack_self()
	toggle()

/obj/item/clothing/glasses/fluff/avigoggles_yw/verb/toggle()
	set category = "Object"
	set name = "Adjust aviation goggles"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			item_state = initial(item_state)
			to_chat(usr, "You flip \the [src] down to protect your eyes.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			item_state = "[initial(item_state)]_up"
			to_chat(usr, "You push \the [src] up out of your face.")
		update_clothing_icon()
		usr.update_action_buttons()

/obj/item/clothing/glasses/fluff/avigoggles_yw/get_worn_icon_file(var/body_type,var/slot_name,var/default_icon,var/inhands)
	if(body_type == SPECIES_TESHARI)
		if(!inhands)
			return 'icons/vore/custom_clothes_yw_special.dmi'
	else
		return ..()

/obj/item/clothing/suit/storage/hooded/fluff/kbraid
	name = "Braid's outfit"
	desc = "The uniform of an Avali named Braid"
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "kbraid_outfit"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "kbraid_outfit_s"
	body_parts_covered = UPPER_TORSO|ARMS|FEET
	hoodtype = /obj/item/clothing/head/hood/kbraid_hood
	actions_types = list(/datum/action/item_action/toggle_hood)

/obj/item/clothing/head/hood/kbraid_hood
	name = "Earphones"
	desc = "A set of Avali earphones."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "kbraid_head"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "kbraid_head_s"
	ear_protection = 1

// ********
// Whiteout
// ********
/obj/item/clothing/under/harness_white
	name = "white gear harness"
	desc = "How... minimalist."
	icon = 'icons/vore/custom_clothes_yw.dmi'
	icon_state = "gear_harness_white_s"
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
	item_state = "gear_harness_white_s"
	body_parts_covered = 0
