/mob/living/simple_mob/humanoid/starhunter/trader
	var/vend_ready = 1 //Are we ready to vend?? Is it time??
	var/vend_delay = 10 //How long does it take to vend?
	var/categories = CAT_NORMAL // Bitmask of cats we're currently showing
	var/datum/stored_item/vending_product/currently_vending = null // What we're requesting payment for right now
	var/vending_sound = "machines/vending/vending_drop.ogg"

	/*
		Variables used to initialize the product list
		These are used for initialization only, and so are optional if
		product_records is specified
	*/
	var/list/products	= list() // For each, use the following pattern:
	var/list/contraband	= list() // list(/type/path = amount,/type/path2 = amount2)
	var/list/premium 	= list() // No specified amount = only one in stock
	/// Set automatically, allows coin use
	var/has_premium = FALSE
	var/list/prices     = list() // Prices for each item, list(/type/path = price), items not in the list don't have a price.
	/// Set automatically, enables pricing
	var/has_prices = FALSE
	// This one is used for refill cartridge use.
	var/list/refill	= list() // For each, use the following pattern:
	// Enables refilling with appropriate cartridges
	var/refillable = TRUE
	var/obj/item/weapon/coin/coin
	var/list/log = list()
	var/has_logs = 0
	var/list/product_records = list()


/mob/living/simple_mob/humanoid/starhunter/trader/Initialize()
	. = ..()
	build_inventory()


/mob/living/simple_mob/humanoid/starhunter/trader/proc/build_inventory()
	var/list/all_products = list(
		list(products, CAT_NORMAL),
		list(contraband, CAT_HIDDEN),
		list(premium, CAT_COIN))

	for(var/current_list in all_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.amount = (current_list[1][entry]) ? current_list[1][entry] : 1
			product.category = category

			GLOB.vending_products[entry] = 1

	if(LAZYLEN(prices))
		has_prices = TRUE
	if(LAZYLEN(premium))
		has_premium = TRUE


	LAZYCLEARLIST(products)
	LAZYCLEARLIST(contraband)
	LAZYCLEARLIST(premium)
	LAZYCLEARLIST(prices)
	all_products.Cut()


/mob/living/simple_mob/humanoid/starhunter/trader/attackby(obj/item/weapon/W as obj, mob/user as mob)
	var/obj/item/weapon/card/id/I = W.GetID()

	if(I || istype(W, /obj/item/weapon/spacecash))
		attack_hand(user)
		return
	else if(istype(W, /obj/item/weapon/coin) && has_premium)
		user.drop_item()
		W.forceMove(src)
		coin = W
		categories |= CAT_COIN
		to_chat(user, "<span class='notice'>You insert \the [W] into \the [src].</span>")
		SStgui.update_uis(src)
		return
	else

		for(var/datum/stored_item/vending_product/R in product_records)
			if(istype(W, R.item_path) && (W.name == R.item_name))
				stock(W, R, user)
				return
		..()


/mob/living/simple_mob/humanoid/starhunter/trader/proc/pay_with_cash(var/obj/item/weapon/spacecash/cashmoney, mob/user)
	if(currently_vending.price > cashmoney.worth)

		// This is not a status display message, since it's something the character
		// themselves is meant to see BEFORE putting the money in
		to_chat(usr, "[icon2html(cashmoney,user.client)] <span class='warning'>That is not enough money.</span>")
		return 0

	if(istype(cashmoney, /obj/item/weapon/spacecash))

		visible_message("<span class='info'>\The [usr] inserts some cash into \the [src].</span>")
		cashmoney.worth -= currently_vending.price

		if(cashmoney.worth <= 0)
			usr.drop_from_inventory(cashmoney)
			qdel(cashmoney)
		else
			cashmoney.update_icon()

	// Vending machines have no idea who paid with cash
	credit_purchase("(cash)")
	return 1

/mob/living/simple_mob/humanoid/starhunter/trader/proc/credit_purchase(var/target as text)
	vendor_account.money += currently_vending.price

	var/datum/transaction/T = new()
	T.target_name = target
	T.purpose = "Purchase of [currently_vending.item_name]"
	T.amount = "[currently_vending.price]"
	T.source_terminal = name
	T.date = current_date_string
	T.time = stationtime2text()
	vendor_account.transaction_log.Add(T)

/mob/living/simple_mob/humanoid/starhunter/trader/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Vending", name)
		ui.open()

/mob/living/simple_mob/humanoid/starhunter/trader/tgui_data(mob/user)
	var/list/data = list()
	var/list/listed_products = list()

	data["chargesMoney"] = has_prices ? TRUE : FALSE

	data["products"] = listed_products

	if(coin)
		data["coin"] = coin.name
	else
		data["coin"] = FALSE

	if(currently_vending)
		data["actively_vending"] = currently_vending.item_name
	else
		data["actively_vending"] = null

	var/mob/living/carbon/human/H
	var/obj/item/weapon/card/id/C

	data["guestNotice"] = "Please present cash.";
	data["userMoney"] = 0
	data["user"] = null
	if(ishuman(user))
		H = user
		C = H.GetIdCard()
		var/obj/item/weapon/spacecash/S = H.get_active_hand()
		if(istype(S))
			data["userMoney"] = S.worth
			data["guestNotice"] = "Accepting [S.initial_name]. You have: [S.worth]₮."
		else if(istype(C))
			var/datum/money_account/A = get_account(C.associated_account_number)
			if(istype(A))
				data["user"] = list()
				data["user"]["name"] = A.owner_name
				data["userMoney"] = A.money
				data["user"]["job"] = (istype(C) && C.rank) ? C.rank : "No Job"
			else
				data["guestNotice"] = "Unlinked ID detected. Present cash to pay.";

	return data



/mob/living/simple_mob/humanoid/starhunter/trader/tgui_act(action, params)
	if(usr.stat || usr.restrained())
		return
	if(..())
		return TRUE

	. = TRUE
	switch(action)
		if("remove_coin")
			if(issilicon(usr))
				return FALSE

			if(!coin)
				to_chat(usr, "<span class='filter_notice'>There is no coin in this machine.</span>")
				return

			coin.forceMove(src.loc)
			if(!usr.get_active_hand())
				usr.put_in_hands(coin)

			to_chat(usr, "<span class='notice'>You remove \the [coin] from \the [src].</span>")
			coin = null
			categories &= ~CAT_COIN
			return TRUE
		if("vend")
			if(!vend_ready)
				to_chat(usr, "<span class='warning'>[src] is busy!</span>")
				return

			var/key = text2num(params["vend"])
			var/datum/stored_item/vending_product/R = product_records[key]

			// This should not happen unless the request from NanoUI was bad
			if(!(R.category & categories))
				return

			if(!can_buy(R, usr))
				return

			if(R.price <= 0)
				vend(R, usr)
				add_fingerprint(usr)
				return TRUE

			if(issilicon(usr)) //If the item is not free, provide feedback if a synth is trying to buy something.
				to_chat(usr, "<span class='danger'>Lawed unit recognized.  Lawed units cannot complete this transaction.  Purchase canceled.</span>")
				return
			if(!ishuman(usr))
				return

			vend_ready = FALSE // From this point onwards, vendor is locked to performing this transaction only, until it is resolved.

			var/mob/living/carbon/human/H = usr
			var/obj/item/weapon/card/id/C = H.GetIdCard()

			if(!vendor_account || vendor_account.suspended)
				to_chat(usr, "<span class='filter_notice'>Vendor account offline. Unable to process transaction.</span>")
				flick("[icon_state]-deny",src)
				vend_ready = TRUE
				return

			currently_vending = R

			var/paid = FALSE

			if(istype(usr.get_active_hand(), /obj/item/weapon/spacecash))
				var/obj/item/weapon/spacecash/cash = usr.get_active_hand()
				paid = pay_with_cash(cash, usr)
			else if(istype(usr.get_active_hand(), /obj/item/weapon/spacecash/ewallet))
				var/obj/item/weapon/spacecash/ewallet/wallet = usr.get_active_hand()
				paid = pay_with_ewallet(wallet)
			else if(istype(C, /obj/item/weapon/card))
				paid = pay_with_card(C, usr)
			/*else if(usr.can_advanced_admin_interact())
				to_chat(usr, "<span class='notice'>Vending object due to admin interaction.</span>")
				paid = TRUE*/
			else
				to_chat(usr, "<span class='warning'>Payment failure: you have no ID or other method of payment.</span>")
				vend_ready = TRUE
				flick("[icon_state]-deny",src)
				return TRUE // we set this because they shouldn't even be able to get this far, and we want the UI to update.
			if(paid)
				vend(currently_vending, usr) // vend will handle vend_ready
				. = TRUE
			else
				to_chat(usr, "<span class='warning'>Payment failure: unable to process payment.</span>")
				vend_ready = TRUE

/mob/living/simple_mob/humanoid/starhunter/trader/proc/vend(datum/stored_item/vending_product/R, mob/user)
	if(!can_buy(R, user))
		return

	if(!R.amount)
		to_chat(user, "<span class='warning'>[src] has ran out of that product.</span>")
		vend_ready = TRUE
		return

	vend_ready = FALSE //One thing at a time!!
	SStgui.update_uis(src)

	if(R.category & CAT_COIN)
		if(!coin)
			to_chat(user, "<span class='notice'>You need to insert a coin to get this item.</span>")
			return
		else
			qdel(coin)
			coin = null
			categories &= ~CAT_COIN

	flick("[icon_state]-vend",src)
	addtimer(CALLBACK(src, PROC_REF(delayed_vend), R, user), vend_delay)

/mob/living/simple_mob/humanoid/starhunter/trader/proc/delayed_vend(datum/stored_item/vending_product/R, mob/user)
	R.get_product(get_turf(src))

	playsound(src, "sound/[vending_sound]", 100, 1, 1)

	GLOB.items_sold_shift_roundstat++

	vend_ready = 1
	currently_vending = null
	SStgui.update_uis(src)

/mob/living/simple_mob/humanoid/starhunter/trader/proc/stock(obj/item/weapon/W, var/datum/stored_item/vending_product/R, var/mob/user)
	if(!user.unEquip(W))
		return

	to_chat(user, "<span class='notice'>You insert \the [W] in the product receptor.</span>")
	R.add_product(W)
	if(has_logs)
		do_logging(R, user)

	SStgui.update_uis(src)

/mob/living/simple_mob/humanoid/starhunter/trader/proc/pay_with_ewallet(var/obj/item/weapon/spacecash/ewallet/wallet)
	visible_message("<span class='info'>\The [usr] swipes \the [wallet] through \the [src].</span>")
	playsound(src, 'sound/machines/id_swipe.ogg', 50, 1)
	if(currently_vending.price > wallet.worth)
		to_chat(usr, "<span class='warning'>Insufficient funds on chargecard.</span>")
		return 0
	else
		wallet.worth -= currently_vending.price
		credit_purchase("[wallet.owner_name] (chargecard)")
		return 1

/**
 * Scan a card and attempt to transfer payment from associated account.
 *
 * Takes payment for whatever is the currently_vending item. Returns 1 if
 * successful, 0 if failed
 */
/mob/living/simple_mob/humanoid/starhunter/trader/proc/pay_with_card(obj/item/weapon/card/id/I, mob/M)
	visible_message("<span class='info'>[M] swipes a card through [src].</span>")
	playsound(src, 'sound/machines/id_swipe.ogg', 50, 1)

	var/datum/money_account/customer_account = get_account(I.associated_account_number)
	if(!customer_account)
		to_chat(M, "<span class='warning'>Error: Unable to access account. Please contact technical support if problem persists.</span>")
		return FALSE

	if(customer_account.suspended)
		to_chat(M, "<span class='warning'>Unable to access account: account suspended.</span>")
		return FALSE

	// Have the customer punch in the PIN before checking if there's enough money. Prevents people from figuring out acct is
	// empty at high security levels
	if(customer_account.security_level != 0) //If card requires pin authentication (ie seclevel 1 or 2)
		var/attempt_pin = tgui_input_number(usr, "Enter pin code", "Vendor transaction")
		customer_account = attempt_account_access(I.associated_account_number, attempt_pin, 2)

		if(!customer_account)
			to_chat(M, "<span class='warning'>Unable to access account: incorrect credentials.</span>")
			return FALSE

	if(currently_vending.price > customer_account.money)
		to_chat(M, "<span class='warning'>Insufficient funds in account.</span>")
		return FALSE

	// Okay to move the money at this point

	// debit money from the purchaser's account
	customer_account.money -= currently_vending.price

	// create entry in the purchaser's account log
	var/datum/transaction/T = new()
	T.target_name = "[vendor_account.owner_name] (via [name])"
	T.purpose = "Purchase of [currently_vending.item_name]"
	if(currently_vending.price > 0)
		T.amount = "([currently_vending.price])"
	else
		T.amount = "[currently_vending.price]"
	T.source_terminal = name
	T.date = current_date_string
	T.time = stationtime2text()
	customer_account.transaction_log.Add(T)

	// Give the vendor the money. We use the account owner name, which means
	// that purchases made with stolen/borrowed card will look like the card
	// owner made them
	credit_purchase(customer_account.owner_name)
	return 1

/mob/living/simple_mob/humanoid/starhunter/trader/proc/do_logging(datum/stored_item/vending_product/R, mob/user, var/vending = 0)
	if(user.GetIdCard())
		var/obj/item/weapon/card/id/tempid = user.GetIdCard()
		var/list/list_item = list()
		if(vending)
			list_item += "vend"
		else
			list_item += "stock"
		list_item += tempid.registered_name
		list_item += stationtime2text()
		list_item += R.item_name
		log[++log.len] = list_item

/mob/living/simple_mob/humanoid/starhunter/trader/proc/can_buy(datum/stored_item/vending_product/R, mob/user)
	return TRUE
