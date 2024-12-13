/client/verb/accept_request(var/port as text)
	set name = "Accept an inbound request"
	set category = "Shipping"

	if (shipping_contacts.len < 2)
		usr << "Not enough people have talked to you!"
		return

	var/choice = input("Choose the origin to review.", "Origin?", null) as anything in shipping_contacts
	if (!choice || choice == "origin")
		usr << "No selection sent, or origin selected."
		return

	var/list/rids = shipping_contacts[choice]

	if (!rids || !rids.len)
		usr << "No requests pending."
		return

	choice = null
	choice = input("Choose the RID to accept or deny.", "RID?", null) as anything in rids
	if (!choice)
		usr << "Cancelled."
		return

	var/datum/shipping_request/ship = rids[choice]

	if (!ship)
		usr << "Cannot find the ship! REE!"
		return

	choice = alert("Accept or deny?", "HRRRM?", "Accept", "Deny") == "Accept" ? TRUE : FALSE

	if (choice)
		ship.inbound_accepted()
	else
		ship.inbound_denied()

	rids -= ship
	qdel(ship)

/client/verb/finalize_outbound(var/target as text, var/port as text)
	set name = "Finalize outbound shipping"
	set category = "Shipping"

	var/list/rids = shipping_contacts["origin"]

	if (!rids || !rids.len)
		usr << "No requests to be finalized."
		return

	var/choice = input("Choose a RID to finalize and send off!", "RID?", null) as anything in rids
	if (!choice)
		usr << "Cancelled."
		return

	var/datum/shipping_request/ship = rids[choice]

	if (!ship)
		usr << "Cannot find the ship! REEE!"
		return

	var/list/out = list()
	for (var/obj/I in ship.items)
		if (isnull(global_shipping_paths["[I.type]"]))
			I.forceMove(shippping_return)
		else
			var/id = global_shipping_paths["[I.type]"]
			if (isnull(out[id]))
				out[id] = 1
			else
				out[id]++

	var/data_out = json_encode(list("query" = "ship_send", "rid" = ship.request_id, "ckey" = usr.ckey, "items" = out, "auth" = config.shipping_auth))
	var/data = json_decode(world.Export("byond://[target]?[data_out]"))

	if (!data)
		usr << "Failed!"
		qdel(ship)
		return

	if (data["statuscode"] != 200)
		usr << "Failed with [data["response"]]"
		qdel(ship)
		return

	usr << "Fucking done!"

/client/verb/create_shipping(var/count as num)
	set name = "Create a shipment"
	set category = "Shipping"

	if (!count || count < 0)
		usr << "Bad count"
		return

	var/list/shit_to_send = list()
	for (var/i = 0; i < count; i++)
		var/obj/item/beach_ball/A = new(usr.loc)
		shit_to_send += A

	var/datum/shipping_request/ship
	try
		ship = new(null, usr.ckey, shit_to_send, TRUE, "origin")
	catch (var/e)
		usr << ":REE: [e]"

	shipping_contacts["origin"]["[ship.request_id]"] = ship
	usr << "Created"