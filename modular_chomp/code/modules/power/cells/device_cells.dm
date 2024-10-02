/*
 * Device
 */
/obj/item/cell/device
	name = "device power cell"
	desc = "A small power cell designed to power handheld devices."
	icon = 'modular_chomp/icons/obj/power_cells.dmi'
	icon_state = "m_st"
	item_state = "egg6"
	w_class = ITEMSIZE_SMALL
	force = 0
	throw_speed = 5
	throw_range = 7
	maxcharge = 480
	charge_amount = 5
	matter = list(MAT_STEEL = 350, MAT_GLASS = 50)
	preserve_item = 1

/obj/item/cell/device/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * EMP Proof Device
 */
/obj/item/cell/device/empproof
	name = "shielded device power cell"
	desc = "A small power cell designed to power handheld devices. Shielded from EMPs."
	icon_state = "s_st"
	matter = list(MAT_STEEL = 400, MAT_GLASS = 60)
	emp_proof = TRUE
	origin_tech = list(TECH_POWER = 3)

/obj/item/cell/device/empproof/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * Weapon
 */
/obj/item/cell/device/weapon
	name = "advanced device power cell" //This was a yawn change. I quite like this, makes more sense.
	desc = "A small upgraded power cell designed to power handheld devices."
	icon_state = "m_sup"
	maxcharge = 2400
	charge_amount = 20
	origin_tech = list(TECH_POWER = 2)

/obj/item/cell/device/weapon/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/cell/device/super
	name = "super device power cell"
	desc = "A small upgraded power cell designed to power handheld devices."
	icon_state = "m_hy" //CHOMP Add
	maxcharge = 3600
	charge_amount = 20
	origin_tech = list(TECH_POWER = 3)

/obj/item/cell/device/super/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * Hyper
 */
/obj/item/cell/device/hyper
	name = "hyper device power cell"
	desc = "A small upgraded power cell designed to hold much more power for handheld devices."
	icon_state = "meb_m_st" //CHOMP Add
	maxcharge = 4800
	charge_amount = 20
	origin_tech = list(TECH_POWER = 4)

/obj/item/cell/device/hyper/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * Giga
 */
/obj/item/cell/device/giga
	name = "giga device power cell"
	desc = "A small power cell that holds a blistering amount of energy, constructed by clever scientists using secrets gleaned from alien technology."
	icon_state = "meb_m_hi"
	maxcharge = 10000
	charge_amount = 20
	origin_tech = list(TECH_POWER = 8)

/obj/item/cell/device/giga/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * EMP Proof Weapon
 */
/obj/item/cell/device/weapon/empproof
	name = "shielded weapon power cell"
	desc = "A small power cell designed to power handheld weaponry. Shielded from EMPs."
	icon_state = "s_hi"
	maxcharge = 2400
	charge_amount = 20
	matter = list(MAT_STEEL = 400, MAT_GLASS = 60)
	emp_proof = TRUE
	origin_tech = list(TECH_POWER = 4)

/obj/item/cell/device/weapon/empproof/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/*
 * Self-charging Weapon
 */
/obj/item/cell/device/weapon/recharge
	name = "self-charging weapon power cell"
	desc = "A small power cell designed to power handheld weaponry. This one recharges itself."
	icon_state = "meb_m_nu"
	matter = list(MAT_STEEL = 400, MAT_GLASS = 80)
	self_recharge = TRUE
	charge_amount = 60 //2.5%
	charge_delay = 75
	origin_tech = list(TECH_POWER = 5, TECH_ARCANE = 1)

/*
 * Captain's Self-charging Weapon
 */
/obj/item/cell/device/weapon/recharge/captain
	icon_state = "infinite_m"
	matter = list(MAT_STEEL = 400, MAT_GLASS = 100)
	charge_amount = 160	//Recharges a lot more quickly...
	charge_delay = 100	//... but it takes a while to get started

/*
 * Alien Void Cell
 */
/datum/category_item/catalogue/anomalous/precursor_a/alien_void_cell
	name = "Precursor Alpha Object - Void Cell"
	desc = "This is a very enigmatic and small machine. It is able to output a direct electrical current \
	from itself to another device or machine that it is connected to. Its shape has a similar form as \
	a battery cell, which might imply that the species who created these had a desire for some form of \
	a modular power supply.\
	<br><br>\
	These appear to be limited in throughput, only able to put out so much energy at a time. It is unknown \
	if this was intentional, or was a design constraint that the creators of this object had to work around. \
	Regardless, it will likely function inside of various devices which run off of conventional power cells.\
	<br><br>\
	Scanning similar objects may yield more information."
	value = CATALOGUER_REWARD_EASY

/obj/item/cell/device/weapon/recharge/alien
	name = "void cell"
	desc = "An alien technology that produces energy seemingly out of nowhere. Its small, cylinderal shape means it might be able to be used with human technology, perhaps?"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/precursor_a/alien_void_cell)
	icon = 'icons/obj/abductor.dmi'
	icon_state = "cell"
	maxcharge = 5000
	charge_amount = 130 // 2.5%.
	charge_delay = 50 // Every five seconds, bit faster than the default.
	origin_tech = list(TECH_POWER = 7, TECH_ENGINEERING = 6, TECH_PHORON = 6, TECH_ARCANE = 2, TECH_PRECURSOR = 2)

/obj/item/cell/device/weapon/recharge/alien/update_icon()
	return // No overlays please.

//CHOMP Add Putting virgo code into our code to make sure this does not change.
//The device cell
/obj/item/cell/device/weapon/recharge/alien
	name = "void cell (device)"
	var/swaps_to = /obj/item/cell/void
	standard_overlays = FALSE

/obj/item/cell/device/weapon/recharge/alien/attack_self(var/mob/user)
	user.remove_from_mob(src)
	to_chat(user, "<span class='notice'>You swap [src] to 'machinery cell' mode.</span>")
	var/obj/item/cell/newcell = new swaps_to(null)
	user.put_in_active_hand(newcell)
	var/percentage = charge/maxcharge
	newcell.charge = newcell.maxcharge * percentage
	qdel(src)

//The machine cell
/obj/item/cell/void
	name = "void cell (machinery)"
	desc = "An alien technology that produces energy seemingly out of nowhere. Its small, cylinderal shape means it might be able to be used with human technology, perhaps?"
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 6)
	icon = 'icons/obj/abductor.dmi'
	icon_state = "cell"
	maxcharge = 10000 
	charge_amount = 500
	self_recharge = TRUE
	charge_delay = 50
	matter = null
	standard_overlays = FALSE
	var/swaps_to = /obj/item/cell/device/weapon/recharge/alien

/obj/item/cell/void/attack_self(var/mob/user)
	user.remove_from_mob(src)
	to_chat(user, "<span class='notice'>You swap [src] to 'device cell' mode.</span>")
	var/obj/item/cell/newcell = new swaps_to(null)
	user.put_in_active_hand(newcell)
	var/percentage = charge/maxcharge
	newcell.charge = newcell.maxcharge * percentage
	qdel(src)

// Bloo friendlier hybrid tech
/obj/item/cell/device/weapon/recharge/alien/hybrid
	icon = 'icons/obj/power_vr.dmi'
	icon_state = "cellb"
	swaps_to = /obj/item/cell/void/hybrid

/obj/item/cell/void/hybrid
	icon = 'icons/obj/power_vr.dmi'
	icon_state = "cellb"
	swaps_to = /obj/item/cell/device/weapon/recharge/alien/hybrid


//YAWN Addtion
/obj/item/cell/device/weapon/recharge/alien/omni
	name = "omni weapon power cell"
	desc = "A mix between alien technology and phoron-based tech. Not quite as good as a true void cell though."
	charge_amount = 90 // 2.5%.
	maxcharge = 3600
	charge_delay = 50
	swaps_to = null
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 6, TECH_PHORON = 6, TECH_ARCANE = 1, TECH_PRECURSOR = 1)

/obj/item/cell/device/weapon/recharge/alien/omni/empty/Initialize()
	. = ..()
	charge = 0
