/*
 * Here lie the topic_command datums for the interserver shipping project.
 * In addition to the parameters specified, every request also requires the following two parameters:
 * @param	str query	The name of the command you wish to invoke.
 * @param	str auth	Your server's unique authorization key.
 *
 * All data is to be communicated as JSON.
 *
 * All replies will contain the following keys:
 * @param	int statuscode	The HTTP standard response code selected as appropriate for the query. 200 == OK.
 * @param	str	response	The response string describing the response. Can be freeform.
 * @param	mix	data		The data object put into the reply itself. Currently only implemented in the response to ship_ping.
 */

/**
 * @name	ship_send
 * @desc	Command used to notify the server that another server wishes to send items to it.
 *			Contains information for logging, coupled with the list of items to send.
 * @param	int rid		The unique ID of the shipping request from the origin server.
 * @param	str ckey	The ckey, canonical version, of the person who sent the request. For logging.
 * @param	lst items	The associated list of items to be sent. Format is: {"shipID" : count, "shipID2" : count}.
 *						The list should contain only unique keys.
 */
/datum/topic_command/shipping_send
	name = "ship_send"
	description = "API command used by other servers to initiate a trade deal."
	params = list(
		"rid" = list("name"="rid","desc"="The unique request ID of that shipping request.","req"=1,"type"="int"),
		"ckey" = list("name"="ckey","desc"="The ckey of the person sending the shipping request. For logging.","req"=1,"type"="str"),
		"items" = list("name"="items","desc"="The list of items, tied to their quantity, to be shipped.","req"=1,"type"="lst")
	)

/datum/topic_command/shipping_send/run_command(queryparams)
	var/list/items = queryparams["items"]

	// Istype check is done upon parameter verification.
	// Now we just need to check if there's actually shit in that list.
	if (!items.len)
		statuscode = 500
		response = "No items to be sent received."
		return 1

	// Too many items. Nothx.
	if (items.len > 100)
		statuscode = 500
		response = "Too many items specified."

	// Check if someone is trying to send too many individual items.
	for (var/path in items)
		// Malformed list, no associated count.
		if (isnull(items[path]))
			statuscode = 500
			response = "Malformed list sent."
			return 1
		else if (!isnum(items[path]))
			statuscode = 500
			response = "Malformed list sent."
			return 1
		// 0 or less of any item, or more than a reasonable amouunt.
		else if (items[path] < 1 || items[path] > 100)
			statuscode = 500
			response = "Too many or too few of one item specified."
			return 1
		// Unsupported shipping ID. :ree:
		else if (isnull(global_shipping_ids[path]))
			statuscode = 500
			response = "Shipping ID [path] is not supported by the server."
			return 1

	// List management actions, ahoy.
	if (isnull(shipping_contacts[queryparams["addr"]]))
		shipping_contacts[queryparams["addr"]] = list()
	// Catch a duplicate RID from the same point of origin.
	else if (!isnull(shipping_contacts[queryparams["addr"]]["[queryparams["rid"]]"]))
		statuscode = 500
		response = "Shipping request of the same RID already exists."
		return 1

	var/datum/shipping_request/ship
	// shipping_request/New() will cough up an exception if it finds stuff not in the whitelist, or something like that.
	try
		ship = new(queryparams["rid"], queryparams["ckey"], items, FALSE, queryparams["addr"])
	catch(var/e)
		statuscode = 500
		response = e
		return 1

	// File it away.
	shipping_contacts[queryparams["addr"]]["[queryparams["rid"]]"] = ship

	// Response time.
	statuscode = 200
	response = "Request received and added to processing."
	return 1

/**
 * @name	ship_reply
 * @desc	Command used to notify us that one of our shipments has been accepted or denied.
 *			Accepted shipments will be removed and their items shitcanned, denied shipments reimbursed.
 * @param	int rid		The unique ID of the shipping request from our server.
 * @param	str ckey	The ckey, canonical version, of the person who accepted/denied the request. For logging.
 * @param	int accept	1 - Request was accepted.
 *						0 - Request was denied.
 */
/datum/topic_command/shipping_reply
	name = "ship_reply"
	description = "Command used to confirm or deny a trade deal."
	params = list(
		"rid" = list("name"="rid","desc"="The unique request ID of that shipping request.","req"=1,"type"="int"),
		"ckey" = list("name"="ckey","desc"="The ckey of the person replying to the shipping request. For logging.","req"=1,"type"="str"),
		"accept" = list("name"="accept","desc"="Boolean on whether or not the shipping request was accepted.","req"=1,"type"="int")
	)

/datum/topic_command/shipping_reply/run_command(queryparams)
	// "origin" is the key where we save requests that /we/ have sent out.
	var/list/contacts = shipping_contacts["origin"]

	// We haven't sent out anything this round. What gives?!
	if (isnull(contacts) || !contacts.len)
		statuscode = 500
		response = "No shipping requests logged as having been sent."
		return 1

	var/datum/shipping_request/ship = contacts["[queryparams["rid"]]"]

	// We haven't sent this request. RIP.
	if (isnull(ship))
		statuscode = 500
		response = "No shipping requests logged as having been sent with this RID."
		return 1

	// Do the deed.
	if (queryparams["accept"])
		if (!ship.outbound_accepted())
			statuscode = 500
			response = ship.error_msg
		else
			statuscode = 200
			response = "Shipment items successfully logged as delivered."
	else
		if (!ship.outbound_denied())
			// This should never really happen. But fine.
			statuscode = 500
			response = ship.error_msg
		else
			statuscode = 200
			response = "Shipment items successfully reimbursed."

	// Clean it up!
	contacts -= ship
	qdel(ship)
	return 1

/**
 * @name	ship_msg
 * @desc	Command used to send a message to the station's QM from abroad.
 * @param	str ckey	The ckey, canonical version, of the person who sent the message. For logging.
 * @param	str msg		The message to be sent.
 */
/datum/topic_command/ship_message
	name = "ship_msg"
	description = "Sends a message to the station's QM."
	params = list(
		"ckey" = list("name"="ckey","desc"="The ckey of the person replying to the shipping request. For logging.","req"=1,"type"="str"),
		"msg" = list("name"="msg","desc"="The message you wish to send.","req"=1,"type"="str")
	)

/datum/topic_command/ship_message/run_command(queryparams)
	// Gotcha.
	if (length(queryparams["msg"]) > 1000)
		statuscode = 500
		response = "Message too long."
		return 1

	// PLACE HOLDER EFFECT.
	world << "<b>Message from shipping port:</b> [queryparams["msg"]]"
	statuscode = 200
	response = "Message delivered."
	return 1

/**
 * @name	ship_ping
 * @desc	Command used to ping the station to see if it's up and accepting requests.
 *			Will also return the ship IDs of all the items it accepts.
 */
/datum/topic_command/ship_ping
	name = "ship_ping"
	description = "Get a status and a list of accepted shiping IDs."
	no_throttle = 1

/datum/topic_command/ship_ping/run_command(queryparams)
	statuscode = 200
	response = "Pong."
	data = global_shipping_ids
	return 1
