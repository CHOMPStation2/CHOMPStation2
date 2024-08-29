/*****************************Money bag********************************/

/obj/item/moneybag // CHOMPEdit - Removal of obj/item/weapon
	icon = 'icons/obj/storage.dmi'
	name = "Money bag"
	icon_state = "moneybag"
	force = 10.0
	throwforce = 2.0
	w_class = ITEMSIZE_LARGE

/obj/item/moneybag/attack_hand(user as mob) // CHOMPEdit - Removal of obj/item/weapon
	var/amt_gold = 0
	var/amt_silver = 0
	var/amt_diamond = 0
	var/amt_iron = 0
	var/amt_phoron = 0
	var/amt_uranium = 0

	for (var/obj/item/coin/C in contents) // CHOMPEdit - Removal of obj/item/weapon
		if (istype(C,/obj/item/coin/diamond)) // CHOMPEdit - Removal of obj/item/weapon
			amt_diamond++;
		if (istype(C,/obj/item/coin/phoron)) // CHOMPEdit - Removal of obj/item/weapon
			amt_phoron++;
		if (istype(C,/obj/item/coin/iron)) // CHOMPEdit - Removal of obj/item/weapon
			amt_iron++;
		if (istype(C,/obj/item/coin/silver)) // CHOMPEdit - Removal of obj/item/weapon
			amt_silver++;
		if (istype(C,/obj/item/coin/gold)) // CHOMPEdit - Removal of obj/item/weapon
			amt_gold++;
		if (istype(C,/obj/item/coin/uranium)) // CHOMPEdit - Removal of obj/item/weapon
			amt_uranium++;

	var/dat = text("<b>The contents of the moneybag reveal...</b><br>")
	if (amt_gold)
		dat += text("Gold coins: [amt_gold] <A href='?src=\ref[src];remove=gold'>Remove one</A><br>")
	if (amt_silver)
		dat += text("Silver coins: [amt_silver] <A href='?src=\ref[src];remove=silver'>Remove one</A><br>")
	if (amt_iron)
		dat += text("Metal coins: [amt_iron] <A href='?src=\ref[src];remove=iron'>Remove one</A><br>")
	if (amt_diamond)
		dat += text("Diamond coins: [amt_diamond] <A href='?src=\ref[src];remove=diamond'>Remove one</A><br>")
	if (amt_phoron)
		dat += text("Phoron coins: [amt_phoron] <A href='?src=\ref[src];remove=phoron'>Remove one</A><br>")
	if (amt_uranium)
		dat += text("Uranium coins: [amt_uranium] <A href='?src=\ref[src];remove=uranium'>Remove one</A><br>")
	user << browse("[dat]", "window=moneybag")

/obj/item/moneybag/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if (istype(W, /obj/item/coin)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/coin/C = W // CHOMPEdit - Removal of obj/item/weapon
		to_chat(user, span_blue("You add the [C.name] into the bag."))
		usr.drop_item()
		contents += C
	if (istype(W, /obj/item/moneybag)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/moneybag/C = W // CHOMPEdit - Removal of obj/item/weapon
		for (var/obj/O in C.contents)
			contents += O;
		to_chat(user, span_blue("You empty the [C.name] into the bag."))
	return

/obj/item/moneybag/Topic(href, href_list) // CHOMPEdit - Removal of obj/item/weapon
	if(..())
		return 1
	usr.set_machine(src)
	src.add_fingerprint(usr)
	if(href_list["remove"])
		var/obj/item/coin/COIN // CHOMPEdit - Removal of obj/item/weapon
		switch(href_list["remove"])
			if("gold")
				COIN = locate(/obj/item/coin/gold,src.contents) // CHOMPEdit - Removal of obj/item/weapon
			if("silver")
				COIN = locate(/obj/item/coin/silver,src.contents) // CHOMPEdit - Removal of obj/item/weapon
			if("iron")
				COIN = locate(/obj/item/coin/iron,src.contents) // CHOMPEdit - Removal of obj/item/weapon
			if("diamond")
				COIN = locate(/obj/item/coin/diamond,src.contents) // CHOMPEdit - Removal of obj/item/weapon
			if("phoron")
				COIN = locate(/obj/item/coin/phoron,src.contents) // CHOMPEdit - Removal of obj/item/weapon
			if("uranium")
				COIN = locate(/obj/item/coin/uranium,src.contents) // CHOMPEdit - Removal of obj/item/weapon
		if(!COIN)
			return
		COIN.loc = src.loc
	return



/obj/item/moneybag/vault // CHOMPEdit - Removal of obj/item/weapon

/obj/item/moneybag/vault/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/coin/silver(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/coin/silver(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/coin/silver(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/coin/silver(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/coin/gold(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/coin/gold(src) // CHOMPEdit - Removal of obj/item/weapon
