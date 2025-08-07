/*
 * Giga
 */
/obj/item/cell/device/giga
	name = "giga device power cell"
	desc = "A small power cell that holds a blistering amount of energy, constructed by clever scientists using secrets gleaned from alien technology."
	icon_state = "meb_m_hi"
	charge = 10000
	maxcharge = 10000
	charge_amount = 20
	origin_tech = list(TECH_POWER = 8)

/obj/item/cell/device/giga/empty
	charge = 0

/obj/item/cell/device/super
	name = "super device power cell"
	desc = "A small upgraded power cell designed to power handheld devices."
	icon_state = "m_hy"
	charge = 3600
	maxcharge = 3600
	charge_amount = 20
	origin_tech = list(TECH_POWER = 3)

/obj/item/cell/device/super/empty
	charge = 0

/obj/item/cell/void/hybrid
	icon = 'icons/obj/power_vr.dmi'
	icon_state = "cellb"
	swaps_to = /obj/item/cell/device/weapon/recharge/alien/hybrid

/obj/item/cell/device/weapon/recharge/alien/omni
	name = "omni weapon power cell"
	desc = "A mix between alien technology and phoron-based tech. Not quite as good as a true void cell though."
	charge_amount = 90 // 2.5%.
	charge = 3600
	maxcharge = 3600
	charge_delay = 50
	swaps_to = null
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 6, TECH_PHORON = 6, TECH_ARCANE = 1, TECH_PRECURSOR = 1)

/obj/item/cell/device/weapon/recharge/alien/omni/empty
	charge = 0
