/*
 * Crap
 */
/obj/item/cell/crap // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper rechargable AA battery"
	desc = "You can't top the plasma top." //TOTALLY TRADEMARK INFRINGEMENT
	origin_tech = list(TECH_POWER = 0)
	icon_state = "crap"
	maxcharge = 500
	matter = list(MAT_STEEL = 700, MAT_GLASS = 40)

/obj/item/cell/crap/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0

/*
 * Robot
 */
/obj/item/cell/robot_station // CHOMPEdit - Removal of obj/item/weapon
	name = "standard robot power cell"
	maxcharge = 7500

/*
 * Syndicate
 */
/obj/item/cell/robot_syndi // CHOMPEdit - Removal of obj/item/weapon
	name = "syndicate robot power cell"
	description_fluff = "Almost as good as a hyper."
	icon_state = "b_sup" //We don't want roboticists confuse it with a low standard cell
	maxcharge = 25000

/*
 * Security Borg
 */
/obj/item/cell/secborg // CHOMPEdit - Removal of obj/item/weapon
	name = "security borg rechargable D battery"
	origin_tech = list(TECH_POWER = 0)
	icon_state = "secborg"
	maxcharge = 2400	//who the hell thought 6 shots was enough for a dogborg taser?
	matter = list(MAT_STEEL = 700, MAT_GLASS = 40)

/obj/item/cell/secborg/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0
	update_icon()

/*
 * APC
 */
/obj/item/cell/apc // CHOMPEdit - Removal of obj/item/weapon
	name = "heavy-duty power cell"
	origin_tech = list(TECH_POWER = 1)
	icon_state = "apc"
	maxcharge = 5000
	matter = list(MAT_STEEL = 700, MAT_GLASS = 50)

/*
 * High
 */
/obj/item/cell/high // CHOMPEdit - Removal of obj/item/weapon
	name = "high-capacity power cell"
	origin_tech = list(TECH_POWER = 2)
	icon_state = "b_hi"
	maxcharge = 10000
	matter = list(MAT_STEEL = 700, MAT_GLASS = 60)

/obj/item/cell/high/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0
	update_icon()

/*
 * Super
 */
/obj/item/cell/super // CHOMPEdit - Removal of obj/item/weapon
	name = "super-capacity power cell"
	origin_tech = list(TECH_POWER = 5)
	icon_state = "b_sup"
	maxcharge = 20000
	matter = list(MAT_STEEL = 700, MAT_GLASS = 70)

/obj/item/cell/super/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0
	update_icon()

/*
 * Hyper
 */
/obj/item/cell/hyper // CHOMPEdit - Removal of obj/item/weapon
	name = "hyper-capacity power cell"
	origin_tech = list(TECH_POWER = 6)
	icon_state = "b_hy"
	maxcharge = 30000
	matter = list(MAT_STEEL = 700, MAT_GLASS = 80)

/obj/item/cell/hyper/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0
	update_icon()

/*
 * Giga
 */
/obj/item/cell/giga // CHOMPEdit - Removal of obj/item/weapon
	name = "giga-capacity power cell"
	origin_tech = list(TECH_POWER = 8)
	icon_state = "meb_b_hi"
	maxcharge = 40000
	matter = list(MAT_STEEL = 1000, MAT_GLASS = 100)

/obj/item/cell/giga/empty/Initialize() //ChompEDIT New --> Initialize // CHOMPEdit - Removal of obj/item/weapon
	..()
	charge = 0
	update_icon()
/*
 * Mecha
 */
/obj/item/cell/mech // CHOMPEdit - Removal of obj/item/weapon
	name = "mecha power cell"
	icon_state = "exs_s"
	charge = 15000
	maxcharge = 15000
	matter = list(MAT_STEEL = 800, MAT_GLASS = 60)

/obj/item/cell/mech/high // CHOMPEdit - Removal of obj/item/weapon
	name = "high-capacity mecha power cell"
	origin_tech = list(TECH_POWER = 3)
	icon_state = "exs_m"
	charge = 20000
	maxcharge = 20000
	matter = list(MAT_STEEL = 800, MAT_GLASS = 80)

/obj/item/cell/mech/super // CHOMPEdit - Removal of obj/item/weapon
	name = "super-capacity mecha power cell"
	origin_tech = list(TECH_POWER = 6)
	icon_state = "exs_l"
	charge = 25000
	maxcharge = 25000
	matter = list(MAT_STEEL = 800, MAT_GLASS = 100)

/*
 * Infinite
 */
/obj/item/cell/infinite // CHOMPEdit - Removal of obj/item/weapon
	name = "infinite-capacity power cell!"
	icon_state = "infinite_b"
	origin_tech =  null
	maxcharge = 30000 //determines how badly mobs get shocked
	matter = list(MAT_STEEL = 700, MAT_GLASS = 80)

/obj/item/cell/infinite/check_charge() // CHOMPEdit - Removal of obj/item/weapon
	return 1

/obj/item/cell/infinite/use() // CHOMPEdit - Removal of obj/item/weapon
	return 1

/*
 * Potato
 */
/obj/item/cell/potato // CHOMPEdit - Removal of obj/item/weapon
	name = "potato battery"
	desc = "A rechargable starch based power cell."
	origin_tech = list(TECH_POWER = 0)
	icon_state = "potato"
	charge = 100
	maxcharge = 300
	minor_fault = 1

/*
 * Slime
 */
/obj/item/cell/slime // CHOMPEdit - Removal of obj/item/weapon
	name = "charged slime core"
	desc = "A yellow slime core infused with phoron, it crackles with power."
	origin_tech = list(TECH_POWER = 4, TECH_BIO = 5)
	icon = 'icons/mob/slimes.dmi' //'icons/obj/harvest.dmi'
	icon_state = "yellow slime extract" //"potato_battery"
	description_info = "This 'cell' holds a max charge of 20k and self recharges over time."
	maxcharge = 20000
	charge_amount = 500 // 2.5%.
	matter = null
	self_recharge = TRUE
	standard_overlays = FALSE

/*
 * Emergency Light
 */
/obj/item/cell/emergency_light // CHOMPEdit - Removal of obj/item/weapon
	name = "miniature power cell"
	desc = "A tiny power cell with a very low power capacity. Used in light fixtures to power them in the event of an outage."
	maxcharge = 120 //Emergency lights use 0.2 W per tick, meaning ~10 minutes of emergency power from a cell
	matter = list(MAT_GLASS = 20)
	icon_state = "em_light"
	w_class = ITEMSIZE_TINY

/obj/item/cell/emergency_light/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	var/area/A = get_area(src)
	if(!A.lightswitch || !A.light_power)
		charge = 0 //For naturally depowered areas, we start with no power

/*
 * Backup Battery
 *
 * Not actually a cell, but if people look for it, they'll probably look near other cells
 */
/obj/item/fbp_backup_cell // CHOMPEdit - Removal of obj/item/device
	name = "backup battery"
	desc = "A small one-time-use chemical battery for synthetic crew when they are low on power in emergency situations."
	icon = 'icons/obj/power_cells.dmi'
	icon_state = "backup"
	w_class = ITEMSIZE_SMALL
	var/amount = 100
	var/used = FALSE

/obj/item/fbp_backup_cell/Initialize() // CHOMPEdit - Removal of obj/item/device
	. = ..()
	add_overlay("[icon_state]_100")

/obj/item/fbp_backup_cell/attack(mob/living/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/device
	if(!used && ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isSynthetic())
			if(H.nutrition <= amount)
				use(user,H)
			else
				to_chat(user,"<span class='warning'>The difference in potential is too great. [user == M ? "You have" : "[H] has"] too much charge to use such a small battery.</span>")
		else if(M == user)
			to_chat(user,"<span class='warning'>You lick the cell, and your tongue tingles slightly.</span>")
		else
			to_chat(user,"<span class='warning'>This cell is meant for use on humanoid synthetics only.</span>")

	. = ..()

/obj/item/fbp_backup_cell/proc/use(var/mob/living/user, var/mob/living/target) // CHOMPEdit - Removal of obj/item/device
	if(used)
		return
	used = TRUE
	desc += " This one has already been used."
	cut_overlays()
	target.adjust_nutrition(amount)
	user.custom_emote(message = "connects \the [src] to [user == target ? "their" : "[target]'s"] charging port, expending it.")
