#define SERVERS 0
#define OPTIONS 1
#define RECEIVE 2
#define REC_CONF 3
#define SENDING 4
#define CHAT	5

/obj/machinery/computer/interservershipping
	name = "Shipping Computer"
	desc = "Used to send illicit goods to other stations with real humans."
	icon_keyboard = "med_key"
	icon_screen = "crew"
	light_color = "#315ab4"
	use_power = 1

	var/screen = SERVERS
	var/datum/shippingservers/server = null
	var/datum/shipping_request/request = null

/obj/machinery/computer/interservershipping/Destroy()
	request = null
	server = null
	return ..()

/obj/machinery/computer/interservershipping/attack_ai(mob/user)
	return attack_hand(user)

/obj/machinery/computer/interservershipping/attack_hand(mob/user)
	ui_interact(user)

/obj/machinery/computer/interservershipping/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)

	var/data[0]
	data["screen"] = screen
	data["error"] = 0
	switch (screen)
		if (SERVERS)
			if (!config.authedservers.len)
				data["error"] = 1
				data["error_msg"] = "We could not establish communication with any other stations."
			else
				var/list/temp = list()
				for (var/A in config.authedservers)
					var/datum/shippingservers/serv = config.authedservers[A]
					if (serv)
						temp += list(list("name" = serv.servername, "ref" = "\ref[serv]"))
				data["servers"] = temp
		if (OPTIONS)
			if (!server)
				data["error"] = 1
				data["error_msg"] = "Connection to the station lost. Resetting."
			else
				data["server"] = server.servername
				data["requests"] = 0
				if (shipping_contacts[server.serverip])
					var/list/A = shipping_contacts[server.serverip]
					data["requests"] = A.len
		if (RECEIVE)
			if (!server)
				data["error"] = 1
				data["error_msg"] = "Connection to the station lost. Resetting."
			else
				data["server"] = server.servername
				var/list/requests = shipping_contacts[server.serverip]
				var/list/temp = list()
				if (requests && requests.len)
					for (var/A in requests)
						var/datum/shipping_request/req = A
						temp += list(list("id" = req.request_id, "item_count" = req.items.len, "ref" = "\ref[req]"))
				data["requests"] = temp
		if (REC_CONF)
			if (!request || !server)
				data["error"] = 1
				data["error_msg"] = "Shipping request expired."
			else
				data["id"] = request.request_id
				data["server"] = server.servername
				var/list/temp = list()
				for (var/A in request.items)
					temp += list(list("id" = A, "count" = request.items[A]))
				data["items"] = temp
		if (SENDING)
			// TODO: Implement SENDING
		if (CHAT)
			// TODO: Implement CHAT
		else
			data["error"] = 1
			data["error_msg"] = "u wot m8"

	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "server_shipping.tmpl", src.name, 400, 500)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/interservershipping/Topic(href, href_list)
	if (..())
		return 1

	if (href_list["switch_menu"])
		var/new_menu = text2num(href_list["switch_menu"])
		screen = sanitize_integer(new_menu, 0, 5, 0)

		if (screen == REC_CONF)
			if (href_list["shipment"])
				var/datum/shipping_request/req = locate(href_list["shipment"])
				if (!req || !istype(req))
					screen = SERVERS
				else
					request = req
	else if (href_list["select_station"])
		var/datum/shippingservers/serv = locate(href_list["select_station"])
		if (!serv || !istype(serv))
			screen = SERVERS
		else
			server = serv
			screen = OPTIONS
	else if (href_list["confirm"])
		// Confirmation == TRUE or FALSE
		var/confirmation = text2num(href_list["confirm"])
		do_confirm(confirmation, usr)

	src.add_fingerprint(usr)
	src.updateUsrDialog(usr)
	return

/obj/machinery/computer/interservershipping/proc/do_confirm(var/confirmation, var/mob/user)
	if (!user || !istype(user) || !user.client)
		return

	if (!request)
		return

	if (confirmation)
		request.inbound_accepted(user.ckey)
	else
		request.inbound_denied(user.ckey)

	request = null
	screen = RECEIVE




/obj/machinery/intershipreceiver
	name = "Bluespace package receiver"
	desc = "Push crate in, be amaze."
	var/list/inserted = list()

/obj/machinery/intershipreceiver/Bumped(atom/movable/AM as mob)
	if(istype(AM, /obj/structure/closet/crate))
		inserted += AM
		AM.forceMove(src)

/obj/machinery/intershipreceiver/proc/GetItems(var/index)
	if(!isnull(inserted) && inserted.len > index)
		var/obj/structure/closet/crate/O = inserted[index]
		return O.contents

/obj/machinery/intershipreceiver/proc/PackageSent(var/index)
	if(!isnull(inserted) && inserted.len > index)
		var/obj/structure/closet/crate/O = inserted[index]
		inserted.Remove(O)
		qdel(O)



/obj/machinery/intershipdeployer
	name = "Bluespace package deployer"
	desc = "Press button, watch crate appear, be amaze."

/obj/machinery/intershipdeployer/proc/SpawnPackage(var/list/objs)
	var/obj/structure/closet/crate/C = new/obj/structure/closet/crate
	C.contents = objs
	C.loc = src.loc

#undef SERVERS
#undef OPTIONS
#undef RECEIVE
#undef REC_CONF
#undef SENDING
#undef CHAT
