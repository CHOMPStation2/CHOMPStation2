/datum/power/changeling/fabricate_clothing
	name = "Fabricate Clothing"
	desc = "We reform our flesh to resemble various cloths, leathers, and other materials, allowing us to quickly create a disguise.  \
	We cannot be relieved of this clothing by others."
	helptext = "The disguise we create offers no defensive ability.  Each equipment slot that is empty will be filled with fabricated equipment. \
	To remove our new fabricated clothing, use this ability again."
	ability_icon_state = "ling_fabricate_clothing"
	genomecost = 1
	verbpath = /mob/proc/changeling_fabricate_clothing

//Grows biological versions of chameleon clothes.
/mob/proc/changeling_fabricate_clothing()
	set category = "Changeling"
	set name = "Fabricate Clothing (10)"

	if(changeling_generic_equip_all_slots(GLOB.changeling_fabricated_clothing, cost = 10))
		return 1
	return 0

/obj/item/clothing/under/chameleon/changeling
	name = "malformed flesh"
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_uniforms.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_uniforms.dmi',
			)
	item_state = "lingchameleon"
	worn_state = "lingchameleon"
	desc = "The flesh all around us has grown a new layer of cells that can shift appearance and create a biological fabric that cannot be distinguished from \
	ordinary cloth, allowing us to make ourselves appear to wear almost anything."
	origin_tech = list() //The base chameleon items have origin technology, which we will inherit if we don't null out this variable.
	canremove = FALSE //Since this is essentially flesh impersonating clothes, tearing someone's skin off as if it were clothing isn't possible.

/obj/item/clothing/under/chameleon/changeling/emp_act(severity) //As these are purely organic, EMP does nothing to them.
	return

/obj/item/clothing/under/chameleon/changeling/verb/shred() //Remove individual pieces if needed.
	set name = "Shred Jumpsuit"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/clothing/head/chameleon/changeling
	name = "malformed head"
	icon_state = "lingchameleon"
	desc = "Our head is swelled with a large quanity of rapidly shifting skin cells.  We can reform our head to resemble various hats and \
	helmets that biologicals are so fond of wearing."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/head/chameleon/changeling/emp_act(severity)
	return

/obj/item/clothing/head/chameleon/changeling/verb/shred() //The copypasta is real.
	set name = "Shred Helmet"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/clothing/suit/chameleon/changeling
	name = "chitinous chest"
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_suits.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_suits.dmi',
			)
	item_state = "armor"
	desc = "The cells in our chest are rapidly shifting, ready to reform into material that can resemble most pieces of clothing."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/suit/chameleon/changeling/emp_act(severity)
	return

/obj/item/clothing/suit/chameleon/changeling/verb/shred()
	set name = "Shred Suit"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/clothing/shoes/chameleon/changeling
	name = "malformed feet"
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_shoes.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_shoes.dmi',
			)
	item_state = "black"
	desc = "Our feet are overlayed with another layer of flesh and bone on top.  We can reform our feet to resemble various boots and shoes."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/shoes/chameleon/changeling/emp_act()
	return

/obj/item/clothing/shoes/chameleon/changeling/verb/shred()
	set name = "Shred Shoes"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/storage/backpack/chameleon/changeling
	name = "backpack"
	icon_state = "backpack"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_storage.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_storage.dmi',
			)
	item_state = "backpack"
	desc = "A large pouch imbedded in our back, it can shift form to resemble many common backpacks that other biologicals are fond of using."
	origin_tech = list()
	canremove = FALSE

/obj/item/storage/backpack/chameleon/changeling/emp_act()
	return

/obj/item/storage/backpack/chameleon/changeling/verb/shred()
	set name = "Shred Backpack"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		for(var/atom/movable/AM in src.contents) //Dump whatever's in the bag before deleting.
			AM.forceMove(get_turf(loc))
		qdel(src)

/obj/item/clothing/gloves/chameleon/changeling
	name = "malformed hands"
	icon_state = "ling"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_gloves.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_gloves.dmi',
			)
	item_state = "ling"
	desc = "Our hands have a second layer of flesh on top.  We can reform our hands to resemble a large variety of fabrics and materials that biologicals \
	tend to wear on their hands.  Remember that these won't protect your hands from harm."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/gloves/chameleon/changeling/emp_act()
	return

/obj/item/clothing/gloves/chameleon/changeling/verb/shred()
	set name = "Shred Gloves"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/clothing/mask/chameleon/changeling
	name = "chitin visor"
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_masks.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_masks.dmi',
			)
	item_state = "gas_alt"
	desc = "A transparent visor of brittle chitin covers our face.  We can reform it to resemble various masks that biologicals use.  It can also utilize internal \
	tanks.."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/mask/chameleon/changeling/emp_act()
	return

/obj/item/clothing/mask/chameleon/changeling/verb/shred()
	set name = "Shred Mask"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/clothing/glasses/chameleon/changeling
	name = "chitin goggles"
	icon_state = "lingchameleon"
	item_state = "glasses"
	desc = "A transparent piece of eyewear made out of brittle chitin.  We can reform it to resemble various glasses and goggles."
	origin_tech = list()
	canremove = FALSE

/obj/item/clothing/glasses/chameleon/changeling/emp_act()
	return

/obj/item/clothing/glasses/chameleon/changeling/verb/shred()
	set name = "Shred Glasses"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/storage/belt/chameleon/changeling
	name = "waist pouch"
	desc = "We can store objects in this, as well as shift it's appearance, so that it resembles various common belts."
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_storage.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_storage.dmi',
			)
	item_state = "utility"
	origin_tech = list()
	canremove = FALSE

/obj/item/storage/belt/chameleon/changeling/emp_act()
	return

/obj/item/storage/belt/chameleon/changeling/verb/shred()
	set name = "Shred Belt"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/card/id/syndicate/changeling
	name = "chitinous card"
	desc = "A card that we can reform to resemble identification cards.  Due to the nature of the material this is made of, it cannot store any access codes."
	icon_state = "changeling"
	assignment = "Harvester"
	origin_tech = list()
	electronic_warfare = 1 //The lack of RFID stuff makes it hard for AIs to track, I guess. *handwaves*
	registered_user = null
	access = null
	canremove = FALSE

/obj/item/card/id/syndicate/changeling/Initialize(mapload)
	. = ..()
	if(ismob(loc))
		registered_user = loc

/obj/item/card/id/syndicate/changeling/Initialize(mapload)
	. = ..()
	access = null

/obj/item/card/id/syndicate/changeling/verb/shred()
	set name = "Shred ID Card"
	set category = "Chameleon Items"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		visible_message(span_warning("[H] tears off [src]!"),
		span_notice("We remove [src]."))
		qdel(src)

/obj/item/card/id/syndicate/changeling/Click() //Since we can't hold it in our hands, and attack_hand() doesn't work if it in inventory...
	if(!registered_user)
		registered_user = usr
		usr.set_id_info(src)
	tgui_interact(registered_user)
	..()
