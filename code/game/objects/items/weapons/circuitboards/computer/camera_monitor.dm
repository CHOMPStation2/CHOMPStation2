#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/security // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("security camera monitor")
	build_path = /obj/machinery/computer/security
	req_access = list(access_security)
	var/list/network
	var/locked = 1
	var/emagged = 0

/obj/item/circuitboard/security/New() // CHOMPEdit - Removal of obj/item/weapon
	..()

/obj/item/circuitboard/security/tv // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("security camera monitor - television")
	build_path = /obj/machinery/computer/security/wooden_tv

/obj/item/circuitboard/security/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("engineering camera monitor")
	build_path = /obj/machinery/computer/security/engineering
	req_access = list()

/obj/item/circuitboard/security/engineering/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	network = engineering_networks

/obj/item/circuitboard/security/mining // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("mining camera monitor")
	build_path = /obj/machinery/computer/security/mining
	network = list("Mining Outpost")
	req_access = list()

/obj/item/circuitboard/security/telescreen/entertainment // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("entertainment camera monitor")
	build_path = /obj/machinery/computer/security/telescreen/entertainment
	board_type = new /datum/frame/frame_types/display
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)

/obj/item/circuitboard/security/telescreen/entertainment/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	network = NETWORK_THUNDER

// CHOMPEdit Begin - Bodycam
/obj/item/circuitboard/security/telescreen/bodycamera // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("security bodycamera monitor")
	build_path = /obj/machinery/computer/security/telescreen/bodycamera
	board_type = new /datum/frame/frame_types/display
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)

/obj/item/circuitboard/security/telescreen/bodycamera/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	network = NETWORK_BODYCAM
// CHOMPEdit End

/obj/item/circuitboard/security/construct(var/obj/machinery/computer/security/C) // CHOMPEdit - Removal of obj/item/weapon
	if (..(C))
		C.set_network(network.Copy())

/obj/item/circuitboard/security/deconstruct(var/obj/machinery/computer/security/C) // CHOMPEdit - Removal of obj/item/weapon
	if (..(C))
		network = C.network.Copy()

/obj/item/circuitboard/security/emag_act(var/remaining_charges, var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	if(emagged)
		to_chat(user, "Circuit lock is already removed.")
		return
	to_chat(user, "<span class='notice'>You override the circuit lock and open controls.</span>")
	emagged = 1
	locked = 0
	return 1

/obj/item/circuitboard/security/attackby(obj/item/I as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(I,/obj/item/card/id)) // CHOMPEdit - Removal of obj/item/weapon
		if(emagged)
			to_chat(user, "<span class='warning'>Circuit lock does not respond.</span>")
			return
		if(check_access(I))
			locked = !locked
			to_chat(user, "<span class='notice'>You [locked ? "" : "un"]lock the circuit controls.</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
	else if(istype(I,/obj/item/multitool)) // CHOMPEdit - Removal of obj/item/device
		if(locked)
			to_chat(user, "<span class='warning'>Circuit controls are locked.</span>")
			return
		var/existing_networks = jointext(network,",")
		var/input = sanitize(tgui_input_text(usr, "Which networks would you like to connect this camera console circuit to? Separate networks with a comma. No Spaces!\nFor example: SS13,Security,Secret ", "Multitool-Circuitboard interface", existing_networks))
		if(!input)
			to_chat(usr, "No input found please hang up and try your call again.")
			return
		var/list/tempnetwork = splittext(input, ",")
		tempnetwork = difflist(tempnetwork,restricted_camera_networks,1)
		if(tempnetwork.len < 1)
			to_chat(usr, "No network found please hang up and try your call again.")
			return
		network = tempnetwork
	return
