
/*
 * Security Borg
 */
/obj/item/cell/secborg
	name = "security borg rechargable D battery"
	origin_tech = list(TECH_POWER = 0)
	icon_state = "secborg"
	charge = 2400
	maxcharge = 2400	//who the hell thought 6 shots was enough for a dogborg taser?
	matter = list(MAT_STEEL = 700, MAT_GLASS = 40)

/obj/item/cell/secborg/empty
	charge = 0

/*
 * Giga
 */
/obj/item/cell/giga
	name = "giga-capacity power cell"
	origin_tech = list(TECH_POWER = 8)
	icon_state = "meb_b_hi"
	charge = 40000
	maxcharge = 40000
	matter = list(MAT_STEEL = 1000, MAT_GLASS = 100)

/obj/item/cell/giga/empty
	charge = 0
