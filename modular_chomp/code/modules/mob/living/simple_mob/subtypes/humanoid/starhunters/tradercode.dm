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


/mob/living/simple_mob/humanoid/starhunter/trader/proc/pay_with_cash(var/obj/item/weapon/spacecash/cashmoney, mob/user)
	if(currently_vending.price > cashmoney.worth)

		// This is not a status display message, since it's something the character
		// themselves is meant to see BEFORE putting the money in
		to_chat(usr, "\icon[cashmoney][bicon(cashmoney)] <span class='warning'>That is not enough money.</span>")
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