//*****************
//**Cham Jumpsuit**
//*****************

/obj/item/proc/disguise(var/newtype)
	//this is necessary, unfortunately, as initial() does not play well with list vars
	var/obj/item/copy = new newtype(null) //so that it is GCed once we exit

	desc = copy.desc
	name = copy.name
	icon_state = copy.icon_state
	item_state = copy.item_state
	body_parts_covered = copy.body_parts_covered
	flags_inv = copy.flags_inv

	item_icons = copy.item_icons?.Copy()
	item_state_slots = copy.item_state_slots?.Copy()
	sprite_sheets = copy.sprite_sheets?.Copy()
	//copying sprite_sheets_obj should be unnecessary as chameleon items are not refittable.

	return copy //for inheritance

/proc/generate_chameleon_choices(var/basetype, var/blacklist=list())
	. = list()

	var/i = 1 //in case there is a collision with both name AND icon_state
	for(var/obj/O as anything in typesof(basetype) - blacklist)
		if(initial(O.icon) && initial(O.icon_state))
			var/name = initial(O.name)
			if(name in .)
				name += " ([initial(O.icon_state)])"
			if(name in .)
				name += " \[[i++]\]"
			.[name] = O

/obj/item/clothing/under/chameleon
//starts off as black
	name = "black jumpsuit"
	icon_state = "black"
	worn_state = "black"
	desc = "It's a plain jumpsuit. It seems to have a small dial on the wrist."
	origin_tech = list(TECH_ILLEGAL = 3)


/obj/item/clothing/under/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_jumpsuit_choices)
		var/blocked = list(src.type, /obj/item/clothing/under/gimmick)//Prevent infinite loops and bad jumpsuits.
		GLOB.chamelion_jumpsuit_choices = generate_chameleon_choices(/obj/item/clothing/under, blocked)

/obj/item/clothing/under/chameleon/emp_act(severity)
	name = "psychedelic"
	desc = "Groovy!"
	icon_state = "psyche"
	LAZYSET(item_state_slots, slot_w_uniform_str, "psyche")
	update_icon()
	update_clothing_icon()

/obj/item/clothing/under/chameleon/verb/change(picked in GLOB.chamelion_jumpsuit_choices)
	set name = "Change Jumpsuit Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_jumpsuit_choices[picked]))
		return

	disguise(GLOB.chamelion_jumpsuit_choices[picked])
	update_clothing_icon()	//so our overlays update.

//*****************
//**Chameleon Hat**
//*****************

/obj/item/clothing/head/chameleon
	name = "grey cap"
	icon_state = "greysoft"
	desc = "It looks like a plain hat, but upon closer inspection, there's an advanced holographic array installed inside. It seems to have a small dial inside."
	origin_tech = list(TECH_ILLEGAL = 3)
	body_parts_covered = 0

/obj/item/clothing/head/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_head_choices)
		var/blocked = list(src.type)//Prevent infinite loops and bad hats.
		GLOB.chamelion_head_choices = generate_chameleon_choices(/obj/item/clothing/head, blocked)

/obj/item/clothing/head/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "grey cap"
	desc = "It's a baseball hat in a tasteful grey colour."
	icon_state = "greysoft"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/head/chameleon/verb/change(picked in GLOB.chamelion_head_choices)
	set name = "Change Hat/Helmet Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_head_choices[picked]))
		return

	disguise(GLOB.chamelion_head_choices[picked])
	update_clothing_icon()	//so our overlays update.

//******************
//**Chameleon Suit**
//******************

/obj/item/clothing/suit/chameleon
	name = "armor"
	icon_state = "armor"
	desc = "It appears to be a vest of standard armor, except this is embedded with a hidden holographic cloaker, allowing it to change it's appearance, but offering no protection.. It seems to have a small dial inside."
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/clothing/suit/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_suit_choices)
		var/blocked = list(src.type, /obj/item/clothing/suit/cyborg_suit, /obj/item/clothing/suit/justice, /obj/item/clothing/suit/greatcoat)
		GLOB.chamelion_suit_choices = generate_chameleon_choices(/obj/item/clothing/suit, blocked)

/obj/item/clothing/suit/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "armor"
	desc = "An armored vest that protects against some damage."
	icon_state = "armor"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/suit/chameleon/verb/change(picked in GLOB.chamelion_suit_choices)
	set name = "Change Oversuit Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_suit_choices[picked]))
		return

	disguise(GLOB.chamelion_suit_choices[picked])
	update_clothing_icon()	//so our overlays update.

//*******************
//**Chameleon Shoes**
//*******************
/obj/item/clothing/shoes/chameleon
	name = "black shoes"
	icon_state = "black"
	desc = "They're comfy black shoes, with clever cloaking technology built in. It seems to have a small dial on the back of each shoe."
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/clothing/shoes/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_shoe_choices)
		var/blocked = list(src.type, /obj/item/clothing/shoes/syndigaloshes, /obj/item/clothing/shoes/cyborg)//prevent infinite loops and bad shoes.
		GLOB.chamelion_shoe_choices = generate_chameleon_choices(/obj/item/clothing/shoes, blocked)

/obj/item/clothing/shoes/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "black shoes"
	desc = "A pair of black shoes."
	icon_state = "black"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/shoes/chameleon/verb/change(picked in GLOB.chamelion_shoe_choices)
	set name = "Change Footwear Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_shoe_choices[picked]))
		return

	disguise(GLOB.chamelion_shoe_choices[picked])
	update_clothing_icon()	//so our overlays update.

//**********************
//**Chameleon Backpack**
//**********************
/obj/item/storage/backpack/chameleon
	name = "backpack"
	icon_state = "backpack"
	desc = "A backpack outfitted with cloaking tech. It seems to have a small dial inside, kept away from the storage."
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/storage/backpack/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_back_choices)
		var/blocked = list(src.type, /obj/item/storage/backpack/satchel/withwallet)
		GLOB.chamelion_back_choices = generate_chameleon_choices(/obj/item/storage/backpack, blocked)

/obj/item/storage/backpack/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "backpack"
	update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_back()

/obj/item/storage/backpack/chameleon/verb/change(picked in GLOB.chamelion_back_choices)
	set name = "Change Backpack Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_back_choices[picked]))
		return

	disguise(GLOB.chamelion_back_choices[picked])

	//so our overlays update.
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_back()

/obj/item/storage/backpack/chameleon/full
	starts_with = list(
		/obj/item/clothing/under/chameleon,
		/obj/item/clothing/head/chameleon,
		/obj/item/clothing/suit/chameleon,
		/obj/item/clothing/shoes/chameleon,
		/obj/item/clothing/gloves/chameleon,
		/obj/item/clothing/mask/chameleon,
		/obj/item/clothing/glasses/chameleon,
		/obj/item/clothing/accessory/chameleon
	)

//********************
//**Chameleon Gloves**
//********************

/obj/item/clothing/gloves/chameleon
	name = "black gloves"
	icon_state = "black"
	desc = "It looks like a pair of gloves, but it seems to have a small dial inside."
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/clothing/gloves/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_glove_choices)
		GLOB.chamelion_glove_choices = generate_chameleon_choices(/obj/item/clothing/gloves, list(src.type))

/obj/item/clothing/gloves/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "black gloves"
	desc = "It looks like a pair of gloves, but it seems to have a small dial inside."
	icon_state = "black"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/gloves/chameleon/verb/change(picked in GLOB.chamelion_glove_choices)
	set name = "Change Gloves Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_glove_choices[picked]))
		return

	disguise(GLOB.chamelion_glove_choices[picked])
	update_clothing_icon()	//so our overlays update.

//******************
//**Chameleon Mask**
//******************

/obj/item/clothing/mask/chameleon
	name = "gas mask"
	icon_state = "gas_alt" //Chompedit: file change
	desc = "It looks like a plain gask mask, but on closer inspection, it seems to have a small dial inside."
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/clothing/mask/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_mask_choices)
		GLOB.chamelion_mask_choices = generate_chameleon_choices(/obj/item/clothing/mask, list(src.type))

/obj/item/clothing/mask/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "gas mask"
	desc = "It's a gas mask."
	icon_state = "gas_alt" //ChompEdit: file change
	update_icon()
	update_clothing_icon()

/obj/item/clothing/mask/chameleon/verb/change(picked in GLOB.chamelion_mask_choices)
	set name = "Change Mask Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_mask_choices[picked]))
		return

	disguise(GLOB.chamelion_mask_choices[picked])
	update_clothing_icon()	//so our overlays update.

//*********************
//**Chameleon Glasses**
//*********************

/obj/item/clothing/glasses/chameleon
	name = "Optical Meson Scanner"
	icon_state = "meson"
	item_state_slots = list(slot_r_hand_str = "meson", slot_l_hand_str = "meson")
	desc = "It looks like a plain set of mesons, but on closer inspection, it seems to have a small dial inside."
	origin_tech = list(TECH_ILLEGAL = 3)
	var/list/global/clothing_choices

/obj/item/clothing/glasses/chameleon/Initialize(mapload)
	. = ..()
	if(!clothing_choices)
		clothing_choices = generate_chameleon_choices(/obj/item/clothing/glasses, list(src.type))

/obj/item/clothing/glasses/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "Optical Meson Scanner"
	desc = "It's a set of mesons."
	icon_state = "meson"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/glasses/chameleon/verb/change(picked in clothing_choices)
	set name = "Change Glasses Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(clothing_choices[picked]))
		return

	disguise(clothing_choices[picked])
	update_clothing_icon()	//so our overlays update.

//******************
//**Chameleon Belt**
//******************

/obj/item/storage/belt/chameleon
	name = "belt"
	desc = "Can hold various things.  It also has a small dial inside one of the pouches."
	icon_state = "utilitybelt"
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/storage/belt/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_belt_choices)
		GLOB.chamelion_belt_choices = generate_chameleon_choices(/obj/item/storage/belt, list(src.type))

/obj/item/storage/belt/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "belt"
	desc = "Can hold various things."
	icon_state = "utilitybelt"
	update_icon()
	if(ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()

/obj/item/storage/belt/chameleon/verb/change(picked in GLOB.chamelion_belt_choices)
	set name = "Change Belt Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_belt_choices[picked]))
		return

	disguise(GLOB.chamelion_belt_choices[picked])

	if(ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt() //so our overlays update.

//******************
//**Chameleon Tie**
//******************

/obj/item/clothing/accessory/chameleon
	name = "black tie"
	desc = "Looks like a black tie, but his one also has a dial inside."
	icon = 'icons/inventory/accessory/item.dmi'
	icon_state = "blacktie"
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/clothing/accessory/chameleon/Initialize(mapload)
	. = ..()
	if(!GLOB.chamelion_accessory_choices)
		var/blocked = list(src.type, /obj/item/clothing/accessory/storage)
		GLOB.chamelion_accessory_choices = generate_chameleon_choices(/obj/item/clothing/accessory, blocked)

/obj/item/clothing/accessory/chameleon/emp_act(severity) //Because we don't have psych for all slots right now but still want a downside to EMP.  In this case your cover's blown.
	name = "black tie"
	desc = "Looks like a black tie, but his one also has a dial inside."
	icon_state = "blacktie"
	update_icon()
	update_clothing_icon()

/obj/item/clothing/accessory/chameleon/verb/change(picked in GLOB.chamelion_accessory_choices)
	set name = "Change Accessory Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.chamelion_accessory_choices[picked]))
		return

	disguise(GLOB.chamelion_accessory_choices[picked])
	update_icon()

//*****************
//**Chameleon Gun**
//*****************
/obj/item/gun/energy/chameleon
	name = "desert eagle"
	desc = "A hologram projector in the shape of a gun. There is a dial on the side to change the gun's disguise."
	icon_state = "deagle"
	w_class = ITEMSIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)
	matter = list()

	fire_sound = 'sound/weapons/gunshot1.ogg'
	projectile_type = /obj/item/projectile/chameleon
	charge_meter = 0
	charge_cost = 48 //uses next to no power, since it's just holograms
	battery_lock = 1

	var/obj/item/projectile/copy_projectile

/obj/item/gun/energy/chameleon/Initialize(mapload)
	. = ..()

	if(!LAZYLEN(GLOB.gun_choices))
		for(var/gun_type in typesof(/obj/item/gun/) - src.type)
			var/obj/item/gun/G = gun_type
			GLOB.gun_choices[initial(G.name)] = gun_type

/obj/item/gun/energy/chameleon/consume_next_projectile()
	var/obj/item/projectile/P = ..()
	if(P && ispath(copy_projectile))
		P.name = initial(copy_projectile.name)
		P.icon = initial(copy_projectile.icon)
		P.icon_state = initial(copy_projectile.icon_state)
		P.pass_flags = initial(copy_projectile.pass_flags)
		P.fire_sound = initial(copy_projectile.fire_sound)
		P.hitscan = initial(copy_projectile.hitscan)
		P.speed = initial(copy_projectile.speed)
		P.muzzle_type = initial(copy_projectile.muzzle_type)
		P.tracer_type = initial(copy_projectile.tracer_type)
		P.impact_type = initial(copy_projectile.impact_type)
	return P

/obj/item/gun/energy/chameleon/emp_act(severity)
	name = "desert eagle"
	desc = "It's a desert eagle."
	icon_state = "deagle"
	update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_r_hand()
		M.update_inv_l_hand()

/obj/item/gun/energy/chameleon/disguise(var/newtype)
	var/obj/item/gun/copy = ..()

	flags_inv = copy.flags_inv
	if(copy.fire_sound)
		fire_sound = copy.fire_sound
	else
		fire_sound = null
	fire_sound_text = copy.fire_sound_text

	var/obj/item/gun/G = copy
	if(istype(G))
		copy_projectile = G.projectile_type
		//charge_meter = E.charge_meter //does not work very well with icon_state changes, ATM
	else
		copy_projectile = null
		//charge_meter = 0

/obj/item/gun/energy/chameleon/verb/change(picked in GLOB.gun_choices)
	set name = "Change Gun Appearance"
	set category = "Chameleon Items"
	set src in usr

	if(!ispath(GLOB.gun_choices[picked]))
		return

	disguise(GLOB.gun_choices[picked])

	//so our overlays update.
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_r_hand()
		M.update_inv_l_hand()
