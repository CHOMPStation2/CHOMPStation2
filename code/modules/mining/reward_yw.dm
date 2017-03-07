/obj/machinery/miningreward
	name = "Mining reward machine"
	desc = "Feed coins, get something worth your time.. Ish..."
	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "control"
	anchored = 1
	density = 1
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 10

	var/totalmoney = 0
	var/list/products	= list(
								/obj/item/device/binoculars,
								/obj/item/weapon/pickaxe/silver,
								/obj/item/weapon/pickaxe/drill,
								/obj/item/weapon/pickaxe/jackhammer,
								/obj/item/weapon/pickaxe/gold,
								/obj/item/weapon/pickaxe/plasmacutter,
								/obj/item/weapon/pickaxe/diamond,
								/obj/item/weapon/pickaxe/diamonddrill,
								/obj/vehicle/bike/,
								/obj/vehicle/train/rover/engine,
								/obj/vehicle/train/rover/trolley)

	var/list/prices		= list( /obj/item/device/binoculars = 200,
								/obj/item/weapon/pickaxe/silver = 200,
								/obj/item/weapon/pickaxe/drill = 240,
								/obj/item/weapon/pickaxe/jackhammer = 300,
								/obj/item/weapon/pickaxe/gold = 360,
								/obj/item/weapon/pickaxe/plasmacutter = 460,
								/obj/item/weapon/pickaxe/diamond = 500,
								/obj/item/weapon/pickaxe/diamonddrill = 600,
								/obj/vehicle/bike/ = 1500,
								/obj/vehicle/train/rover/engine = 3000,
								/obj/vehicle/train/rover/trolley = 200)


/obj/machinery/miningreward/New()
	..()


/obj/machinery/miningreward/Destroy()//Perhaps damage and run stability checks rather than just qdel on the others
	..()


/obj/machinery/miningreward/emp_act(severity)
	..()
	return 0


/obj/machinery/miningreward/bullet_act(var/obj/item/projectile/Proj)
	return 0



/obj/machinery/miningreward/update_icon()
	return


/obj/machinery/miningreward/attackby(obj/item/W, mob/user)
	if(!istype(W) || !user) return
	if(istype(W, /obj/item/weapon/wrench))
		if(!anchored)
			playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
			user.visible_message("[user.name] secures the [src.name] to the floor.", \
				"You secure the anchor bolts to the floor.", \
				"You hear a ratchet")
			src.anchored = 1
		else
			playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
			user.visible_message("[user.name] unsecures the [src.name].", \
				"You remove the anchor bolts.", \
				"You hear a ratchet")
			src.anchored = 0
		return

	if(istype(W, /obj/item/weapon/coin))
		user.remove_from_mob(W)
		W.loc = src
		user.update_icons()
		user.visible_message("[user.name] inserts a [W.name] into the [src.name].", \
				"You insert a [W.name].", \
				"You hear a thunk.")

		if(istype(W, /obj/item/weapon/coin/iron))
			totalmoney += 1
		else if(istype(W, /obj/item/weapon/coin/phoron))
			totalmoney += 2
		else if(istype(W, /obj/item/weapon/coin/uranium))
			totalmoney += 3
		else if(istype(W, /obj/item/weapon/coin/platinum))
			totalmoney += 4
		else if(istype(W, /obj/item/weapon/coin/silver))
			totalmoney += 5
		else if(istype(W, /obj/item/weapon/coin/gold))
			totalmoney += 10
		else if(istype(W, /obj/item/weapon/coin/diamond))
			totalmoney += 20
		return

	..()
	return


/obj/machinery/miningreward/attack_hand(mob/user as mob)
	if(anchored)
		interact(user)
	return


/obj/machinery/miningreward/interact(mob/user)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!istype(user, /mob/living/silicon/ai))
			user.unset_machine()
			user << browse(null, "window=RWcontrol")
			return
	user.set_machine(src)

	var/dat = ""
	dat += "Mining Reward Panel<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "Points: [totalmoney] <BR>"

	for(var/i=1;i<=products.len;++i)
		var/product = products[i]
		var/obj/P = new product()
		dat += "<A href='?src=\ref[src];task=vend;id=[i]'>[P.name] - [(products[i] in prices) ? prices[products[i]] : 0]</A><BR>"

	user << browse(dat, "window=RWcontrol;size=420x500")
	onclose(user, "RWcontrol")
	return


/obj/machinery/miningreward/Topic(href, href_list)
	..()
	//Ignore input if we are broken or guy is not touching us, AI can control from a ways away
	if(stat & (BROKEN|NOPOWER) || (get_dist(src, usr) > 1 && !istype(usr, /mob/living/silicon/ai)))
		usr.unset_machine()
		usr << browse(null, "window=RWcontrol")
		return

	else if(href_list["close"])
		usr << browse(null, "window=RWcontrol")
		usr.unset_machine()
		return

	else if(href_list["task"] && href_list["task"] == "vend")
		var/ID = text2num(href_list["id"])
		var/product = products[ID]
		if(products[product] != 0 && totalmoney >= prices[product])
			totalmoney -= prices[product]
			products[product]-=1
			var/obj/prod = new product
			prod.loc = src.loc

	updateDialog()
	return