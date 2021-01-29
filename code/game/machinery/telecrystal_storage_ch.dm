/obj/machinery/smartfridge/tcrystal
	name = "Telecrystal storage"
	desc = "Some kind of storage machine that only accepts telecrystals"
	icon_state = "donkvendor"
	icon_base = "donkvendor"
	icon_contents = null
	icon = 'icons/obj/survival_pod_vend.dmi'
	light_range = 5
	light_power = 1.2
	light_color = "#DDFFD3"
	pixel_y = -4
	max_n_of_items = 1000000

/obj/machinery/smartfridge/tcrystal/accept_check(obj/item/O)
	return istype(O,/obj/item/stack/telecrystal)

/obj/machinery/smartfridge/tcrystal/proc/mod_amount(var/datum/stored_item/I,var/mod)
	if(I.amount + mod <= 0)
		item_records.Remove(I)
		qdel(I)
	else
		I.amount += mod

/obj/machinery/smartfridge/tcrystal/stock(obj/item/stack/telecrystal/O)
	var/hasRecord = FALSE	//Check to see if this passes or not.
	for(var/datum/stored_item/I in item_records)
		if((O.type == I.item_path) && (O.name == I.item_name))
			mod_amount(I,O.amount)
			hasRecord = TRUE
			break
	if(!hasRecord)
		var/datum/stored_item/item = new/datum/stored_item(src,O.type,O.name,O.amount)
		item_records.Add(item)

/obj/machinery/smartfridge/tcrystal/tgui_act(action, params)
	add_fingerprint(usr)
	switch(action)
		if("Release")
			var/amount = 0
			if(params["amount"])
				amount = params["amount"]
			else
				amount = input("How many items?", "How many items would you like to take out?", 1) as num|null
			
			if(QDELETED(src) || QDELETED(usr) || !usr.Adjacent(src))
				return FALSE
			
			var/index = text2num(params["index"])
			var/datum/stored_item/I = item_records[index]
			var/count = I.get_amount()

			// Sanity check, there are probably ways to press the button when it shouldn't be possible.
			if(count > 0)
				if((count - amount) < 0)
					amount = count
				mod_amount(I,-amount)
				var/crystal_amount = min(240,amount)
				while(crystal_amount > 0)
					new /obj/item/stack/telecrystal(loc,crystal_amount)
					amount -= crystal_amount
					crystal_amount = min(240,amount)

			return TRUE
	return FALSE

/datum/stored_item/telecrystals
	item_name = "Telecrystals"

/datum/stored_item/telecrystals/get_amount()
	return amount

/datum/stored_item/telecrystals/init_products()
	return