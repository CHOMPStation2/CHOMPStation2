/obj/item/tvcamera
	name = "press camera drone"
	desc = "A Ward-Takahashi EyeBuddy media streaming hovercam. Weapon of choice for war correspondents and reality show cameramen."
	icon = 'icons/obj/device.dmi'
	icon_state = "camcorder"
	item_state = "camcorder"
	w_class = ITEMSIZE_LARGE
	slot_flags = SLOT_BELT
	var/channel = "NCS Northern Star News Feed"
	var/obj/machinery/camera/network/thunder/camera
	var/obj/item/radio/radio
	var/datum/weakref/showing
	var/showing_name

/obj/item/tvcamera/New()
	..()
	listening_objects += src

/obj/item/tvcamera/Destroy()
	listening_objects -= src
	qdel(camera)
	qdel(radio)
	camera = null
	radio = null
	..()

/obj/item/tvcamera/examine()
	. = ..()
	. += "Video feed is [camera.status ? "on" : "off"]"
	. += "Audio feed is [radio.broadcasting ? "on" : "off"]"

/obj/item/tvcamera/Initialize()
	. = ..()
	camera = new(src)
	camera.c_tag = channel
	camera.status = FALSE
	radio = new(src)
	radio.listening = FALSE
	radio.set_frequency(ENT_FREQ)
	radio.icon = src.icon
	radio.icon_state = src.icon_state
	update_icon()

/obj/item/tvcamera/hear_talk(mob/M, list/message_pieces, verb)
	radio.hear_talk(M, message_pieces, verb)
	. = ..()

/obj/item/tvcamera/attack_self(mob/user)
	add_fingerprint(user)
	user.set_machine(src)
	show_ui(user)

/obj/item/tvcamera/proc/show_ui(mob/user)
	var/dat = list()
	dat += "Channel name is: <a href='?src=\ref[src];channel=1'>[channel ? channel : "unidentified broadcast"]</a><br>"
	dat += "Video streaming is <a href='?src=\ref[src];video=1'>[camera.status ? "on" : "off"]</a><br>"
	if(camera.status && showing_name)
		dat += "- You're showing [showing_name] to your viewers.<br>"
	dat += "Mic is <a href='?src=\ref[src];sound=1'>[radio.broadcasting ? "on" : "off"]</a><br>"
	dat += "Sound is being broadcasted on frequency [format_frequency(radio.frequency)] ([get_frequency_name(radio.frequency)])<br>"
	var/datum/browser/popup = new(user, "Hovercamera", "Eye Buddy", 300, 390, src)
	popup.set_content(jointext(dat,null))
	popup.open()

/obj/item/tvcamera/Topic(bred, href_list, state = GLOB.tgui_physical_state)
	if(..())
		return 1
	if(href_list["channel"])
		var/nc = tgui_input_text(usr, "Channel name", "Select new channel name", channel, MAX_NAME_LEN)
		nc = sanitize(nc,MAX_NAME_LEN)
		if(nc)
			channel = nc
			camera.c_tag = channel
			to_chat(usr, "<span class='notice'>New channel name - '[channel]' is set</span>")
	if(href_list["video"])
		camera.set_status(!camera.status)
		if(camera.status)
			to_chat(usr,"<span class='notice'>Video streaming activated. Broadcasting on channel '[channel]'</span>")
			show_tvs(loc)
		else
			to_chat(usr,"<span class='notice'>Video streaming deactivated.</span>")
			hide_tvs()
			for(var/obj/machinery/computer/security/telescreen/entertainment/ES as anything in GLOB.entertainment_screens)
				ES.stop_showing()
		update_icon()
	if(href_list["sound"])
		radio.ToggleBroadcast()
		if(radio.broadcasting)
			to_chat(usr,"<span class='notice'>Audio streaming activated. Broadcasting on frequency [format_frequency(radio.frequency)].</span>")
		else
			to_chat(usr,"<span class='notice'>Audio streaming deactivated.</span>")
	if(!href_list["close"])
		attack_self(usr)

/obj/item/tvcamera/proc/show_tvs(atom/thing)
	if(showing)
		hide_tvs(showing)

	showing = WEAKREF(thing)
	showing_name = "[thing]"
	for(var/obj/machinery/computer/security/telescreen/entertainment/ES as anything in GLOB.entertainment_screens)
		ES.show_thing(thing)

	START_PROCESSING(SSobj, src)

/obj/item/tvcamera/proc/hide_tvs()
	if(!showing)
		return
	for(var/obj/machinery/computer/security/telescreen/entertainment/ES as anything in GLOB.entertainment_screens)
		ES.maybe_stop_showing(showing)
	STOP_PROCESSING(SSobj, src)
	showing = null
	showing_name = null

/obj/item/tvcamera/Moved(atom/old_loc, direction, forced = FALSE, movetime)
	. = ..()
	if(camera.status && loc != old_loc)
		show_tvs(loc)

/obj/item/tvcamera/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	// CHOMPEdit
	if(!camera)
		return
	if(camera.status && !isturf(target))
		show_tvs(target)
		user.visible_message("<b>[user]</b> aims [src] at [target].", "You aim [src] at [target].")
		if(user.machine == src)
			show_ui(user) // refresh the UI

/obj/item/tvcamera/process()
	if(!showing)
		return PROCESS_KILL

	var/atom/A = showing.resolve()
	if(!A || QDELETED(A))
		show_tvs(loc)

	if(get_dist(get_turf(src), get_turf(A)) > 5)
		show_tvs(loc)

/obj/item/tvcamera/update_icon()
	..()
	if(camera.status)
		icon_state = "camcorder_on"
		item_state = "camcorder_on"
	else
		icon_state = "camcorder"
		item_state = "camcorder"
	var/mob/living/carbon/human/H = loc
	if(istype(H))
		H.update_inv_r_hand()
		H.update_inv_l_hand()
		H.update_inv_belt()

// CHOMPEdit Start - Bodycam
// Security Bodycam

/obj/item/clothing/accessory/bodycam
	name = "Body Camera"
	desc = "A small body camera for security personnel. It can be attached to your uniform! Use in hand to configure."
	icon_state = "eshield"
	item_state = "eshield"
	w_class = ITEMSIZE_COST_TINY
	slot_flags = ACCESSORY_SLOT_DECOR
	appearance_flags = RESET_COLOR
	icon = 'icons/obj/weapons.dmi'
	var/channel = "Default Bodycamera Feed"
	var/obj/machinery/camera/network/bodycamera/bcamera
	var/obj/item/radio/bradio
	var/datum/weakref/showing
	var/showing_name

/obj/item/clothing/accessory/bodycam/New()
	..()
	listening_objects += src

/obj/item/clothing/accessory/bodycam/Destroy()
	listening_objects -= src
	qdel(bcamera)
	qdel(bradio)
	bcamera = null
	bradio = null
	..()

/obj/item/clothing/accessory/bodycam/examine()
	. = ..()
	. += "Video feed is [bcamera.status ? "on" : "off"]"
	. += "Audio feed is [bradio.broadcasting ? "on" : "off"]"

/obj/item/clothing/accessory/bodycam/Initialize()
	. = ..()
	bcamera = new(src)
	bcamera.c_tag = channel
	bcamera.status = FALSE
	bradio = new(src)
	bradio.listening = FALSE
	bradio.set_frequency(BDCM_FREQ)
	bradio.icon = src.icon
	bradio.icon_state = src.icon_state
	update_icon()

/obj/item/clothing/accessory/bodycam/hear_talk(mob/M, list/message_pieces, verb)
	bradio.hear_talk(M, message_pieces, verb)
	. = ..()

/obj/item/clothing/accessory/bodycam/attack_self(mob/user)
	add_fingerprint(user)
	//user.set_machine(src)
	show_bodycam_ui(user)

/obj/item/clothing/accessory/bodycam/proc/show_bodycam_ui(mob/user)
	var/dat = list()
	dat += "Channel name is: <a href='?src=\ref[src];channel=1'>[channel ? channel : "unidentified broadcast"]</a><br>"
	dat += "Video streaming is <a href='?src=\ref[src];video=1'>[bcamera.status ? "on" : "off"]</a><br>"
	if(bcamera.status && showing_name)
		dat += "- You're showing [showing_name] to your viewers.<br>"
	dat += "Mic is <a href='?src=\ref[src];sound=1'>[bradio.broadcasting ? "on" : "off"]</a><br>"
	dat += "Sound is being broadcasted on frequency [format_frequency(bradio.frequency)] ([get_frequency_name(bradio.frequency)])<br>"
	var/datum/browser/popup = new(user, "Hovercamera", "Eye Buddy", 300, 390, src)
	popup.set_content(jointext(dat,null))
	popup.open()

/obj/item/clothing/accessory/bodycam/Topic(bred, href_list, state = GLOB.tgui_physical_state)

	if(..())
		return 1
	if(href_list["channel"])
		var/nc = tgui_input_text(usr, "Channel name", "Select new channel name", channel, MAX_NAME_LEN)
		nc = sanitize(nc,MAX_NAME_LEN)
		if(nc)
			channel = nc
			bcamera.c_tag = channel
			to_chat(usr, "<span class='notice'>New channel name - '[channel]' is set</span>")
	if(href_list["video"])
		bcamera.set_status(!bcamera.status)
		var/turf/here = get_turf(usr)
		if(bcamera.status)
			to_chat(usr,"<span class='notice'>Video streaming activated. Broadcasting on channel '[channel]'</span>")
			if(here)
				here.visible_message("<span class='notice'>[usr] turns on their body camera.</span>")
			show_bodycamera_tvs(loc)
		else
			to_chat(usr,"<span class='notice'>Video streaming deactivated.</span>")
			if(here)
				here.visible_message("<span class='warning'>[usr] turns off their body camera!</span>")
			hide_bodycamera_tvs()
			for(var/obj/machinery/computer/security/telescreen/bodycamera/ES as anything in GLOB.bodycamera_screens)
				ES.stop_showing()
		update_icon()
	if(href_list["sound"])
		bradio.ToggleBroadcast()
		if(bradio.broadcasting)
			to_chat(usr,"<span class='notice'>Audio streaming activated. Broadcasting on frequency [format_frequency(bradio.frequency)].</span>")
		else
			to_chat(usr,"<span class='notice'>Audio streaming deactivated.</span>")
	if(!href_list["close"])
		attack_self(usr)

/obj/item/clothing/accessory/bodycam/proc/show_bodycamera_tvs(atom/thing)
	if(showing)
		hide_bodycamera_tvs(showing)

	showing = WEAKREF(thing)
	showing_name = "[thing]"
	for(var/obj/machinery/computer/security/telescreen/bodycamera/ES as anything in GLOB.bodycamera_screens)
		ES.show_thing(thing, src)

	START_PROCESSING(SSobj, src)

/obj/item/clothing/accessory/bodycam/proc/hide_bodycamera_tvs()
	if(!showing)
		return
	for(var/obj/machinery/computer/security/telescreen/bodycamera/ES as anything in GLOB.bodycamera_screens)
		ES.maybe_stop_showing(showing)
	STOP_PROCESSING(SSobj, src)
	showing = null
	showing_name = null

/obj/item/clothing/accessory/bodycam/Moved(atom/old_loc, direction, forced = FALSE, movetime)
	. = ..()
	if(bcamera.status && loc != old_loc)
		show_bodycamera_tvs(loc)

/*  // Kinda unneeded, since this one is worn on the suit.
/obj/item/clothing/accessory/bodycam/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(bcamera.status && !isturf(target))
		show_bodycamera_tvs(target)
		user.visible_message("<b>[user]</b> aims [src] at [target].", "You aim [src] at [target].")
		if(user.machine == src)
			show_bodycam_ui(user) // refresh the UI
*/
/obj/item/clothing/accessory/bodycam/process()
	if(!showing)
		return PROCESS_KILL

	var/atom/A = showing.resolve()
	if(!A || QDELETED(A))
		show_bodycamera_tvs(loc)

	if(get_dist(get_turf(src), get_turf(A)) > 5)
		show_bodycamera_tvs(loc)

/obj/item/clothing/accessory/bodycam/update_icon()
	..()
	if(bcamera.status)
		icon_state = "eshield"
		item_state = "eshield"
	else
		icon_state = "eshield"
		item_state = "eshield"
	var/mob/living/carbon/human/H = loc
	if(istype(H))
		H.update_inv_r_hand()
		H.update_inv_l_hand()
		H.update_inv_belt()
// CHOMPEdit End

//Assembly by roboticist

/obj/item/robot_parts/head/attackby(var/obj/item/assembly/S, mob/user as mob)
	if(!istype(S, /obj/item/assembly/infra))
		..()
		return
	var/obj/item/TVAssembly/A = new(user)
	qdel(S)
	user.put_in_hands(A)
	to_chat(user, "<span class='notice'>You add the infrared sensor to the robot head.</span>")
	user.drop_from_inventory(src)
	qdel(src)


/obj/item/TVAssembly
	name = "\improper TV Camera Assembly"
	desc = "A robotic head with an infrared sensor inside."
	icon = 'icons/obj/robot_parts.dmi'
	icon_state = "head"
	item_state = "head"
	var/buildstep = 0
	w_class = ITEMSIZE_LARGE

/obj/item/TVAssembly/attackby(W, mob/user)
	switch(buildstep)
		if(0)
			if(istype(W, /obj/item/robot_parts/robot_component/camera))
				var/obj/item/robot_parts/robot_component/camera/CA = W
				to_chat(user, "<span class='notice'>You add the camera module to [src]</span>")
				user.drop_item()
				qdel(CA)
				desc = "This TV camera assembly has a camera module."
				buildstep++
		if(1)
			if(istype(W, /obj/item/taperecorder))
				var/obj/item/taperecorder/T = W
				user.drop_item()
				qdel(T)
				buildstep++
				to_chat(user, "<span class='notice'>You add the tape recorder to [src]</span>")
		if(2)
			if(istype(W, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/C = W
				if(!C.use(3))
					to_chat(user, "<span class='notice'>You need six cable coils to wire the devices.</span>")
					..()
					return
				C.use(3)
				buildstep++
				to_chat(user, "<span class='notice'>You wire the assembly</span>")
				desc = "This TV camera assembly has wires sticking out"
				return
		if(3)
			if(istype(W, /obj/item/tool/wirecutters))
				to_chat(user, "<span class='notice'> You trim the wires.</span>")
				buildstep++
				desc = "This TV camera assembly needs casing."
				return
		if(4)
			if(istype(W, /obj/item/stack/material/steel))
				var/obj/item/stack/material/steel/S = W
				buildstep++
				S.use(1)
				to_chat(user, "<span class='notice'>You encase the assembly in a Ward-Takeshi casing.</span>")
				var/turf/T = get_turf(src)
				new /obj/item/tvcamera(T)
				user.drop_from_inventory(src)
				qdel(src)
				return

	..()
