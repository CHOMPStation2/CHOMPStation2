//currently only used by energy-type guns, that may change in the future.
/obj/item/weapon/cell/device
	name = "device power cell"
	desc = "A small power cell designed to power handheld devices."
	icon_state = "dcell"
	item_state = "egg6"
	w_class = ITEMSIZE_SMALL
	force = 0
	throw_speed = 5
	throw_range = 7
	maxcharge = 480
	charge_amount = 5
	matter = list("metal" = 350, "glass" = 50)
	preserve_item = 1

//Yawn changes
/obj/item/weapon/cell/device/weapon //Aka adv
	name = "advanced device power cell"
	desc = "A small upgraded power cell designed to power handheld devices."
	icon_state = "wcell"
	maxcharge = 2400
	charge_amount = 20
	origin_tech = list(TECH_POWER = 2)

/obj/item/weapon/cell/device/weapon/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/weapon/cell/device/super
	name = "super device power cell"
	desc = "A small upgraded power cell designed to power handheld devices."
	icon = 'icons/obj/power_yw.dmi'
	icon_state = "swcell"
	maxcharge = 3600
	charge_amount = 20
	origin_tech = list(TECH_POWER = 3)
	overlay_half_state = "swcell-partial"
	overlay_full_state = "swcell-full"

/obj/item/weapon/cell/device/super/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/weapon/cell/device/hyper
	name = "hyper device power cell"
	desc = "A small upgraded power cell designed to hold much more power for handheld devices."
	icon = 'icons/obj/power_yw.dmi'
	icon_state = "hwcell"
	maxcharge = 4800
	charge_amount = 20
	origin_tech = list(TECH_POWER = 4)
	overlay_half_state = "hwcell-partial"
	overlay_full_state = "hwcell-full"

/obj/item/weapon/cell/device/hyper/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()
//End of Yawn changes

/obj/item/weapon/cell/device/weapon/recharge
	name = "self-charging weapon power cell"
	desc = "A small power cell designed to power handheld weaponry. This one recharges itself."
//	icon_state = "wcell" //doesn't matter, not seen anywhere (all weapons that have it are batterylocked)
	self_recharge = TRUE
	charge_amount = 120
	charge_delay = 75

/obj/item/weapon/cell/device/weapon/recharge/captain
	charge_amount = 160	//Recharges a lot more quickly...
	charge_delay = 100	//... but it takes a while to get started


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

/obj/item/weapon/cell/device/weapon/recharge/alien
	name = "void cell"
	desc = "An alien technology that produces energy seemingly out of nowhere. Its small, cylinderal shape means it might be able to be used with human technology, perhaps?"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/precursor_a/alien_void_cell)
	icon = 'icons/obj/abductor.dmi'
	icon_state = "cell"
	charge_amount = 120 // 5%.
	charge_delay = 50 // Every five seconds, bit faster than the default.
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 6)

/obj/item/weapon/cell/device/weapon/recharge/alien/update_icon()
	return // No overlays please.

//YAWN Addtion
/obj/item/weapon/cell/device/weapon/recharge/alien/omni
	name = "omni weapon power cell"
	desc = "A mix between alien technology and phoron tech. Seems to fit in almost any cell slot..."
	charge_amount = 90 // 5%.
	maxcharge = 1800
	charge_delay = 50 SECONDS
	origin_tech = list(TECH_POWER = 6, TECH_ENGINEERING = 4, TECH_PHORON = 3)

/obj/item/weapon/cell/device/weapon/recharge/alien/omni/empty/Initialize()
	. = ..()
	charge = 0
