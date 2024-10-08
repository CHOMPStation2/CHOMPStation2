//Hyper pads, kinda a fusion between quantum pads and gateways. 3x3 teleporter with slow recharge.

/obj/machinery/hyperpad
	name = "quantum leap pad"
	desc = "A high scale quantum entangled teleportation device for secure short distance travel."
	icon = 'icons/obj/telescience_ch.dmi'
	icon_state = "hpad"
	density = 0
	anchored = 1
	var/obj/machinery/hyperpad/centre/primary

/obj/machinery/hyperpad/centre
	var/teleport_cooldown = 400 //30 seconds
	var/teleport_speed = 60
	var/last_teleport //to handle the cooldown
	var/teleporting = 0 //if it's in the process of teleporting
	var/obj/machinery/hyperpad/centre/linked_pad
	icon_state = "hpad_centre"
	var/newcolor = "#00FFFF" //used for colouring the overlays

	//mapping
	var/static/list/mapped_hyper_pads = list()
	var/map_pad_id = "" as text //what's my name
	var/map_pad_link_id = "" as text //who's my friend
	var/ready = 0
	var/list/linked = list()
	var/max_item_teleport = 30

/obj/machinery/hyperpad/centre/Initialize(mapload)
	. = ..()
	if(map_pad_id)
		mapped_hyper_pads[map_pad_id] = src
		detect()
	set_light(3, 1, newcolor)

/obj/machinery/hyperpad/operable()
	return 1

/obj/machinery/hyperpad/inoperable() //A lame way of making this machine always useable
	return 0

/obj/machinery/hyperpad/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/hyperpad/centre/attack_ghost(mob/observer/dead/ghost)
	. = ..()
	if(.)
		return
	if(linked_pad && !QDELETED(linked_pad))
		ghost.forceMove(get_turf(linked_pad))

/obj/machinery/hyperpad/attack_ghost(mob/observer/dead/ghost)
	. = ..()
	if(primary)
		primary.attack_ghost(ghost)

/obj/machinery/hyperpad/centre/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	detect(user)
	if(!linked_pad || QDELETED(linked_pad))
		if(!map_pad_link_id || !initMappedLink())
			to_chat(user, span_warning("There is no linked pad!"))
			return
	if(teleporting)
		to_chat(user, span_warning("[src] is charging up. Please wait."))
		return
	if(world.time < last_teleport + teleport_cooldown)
		to_chat(user, span_warning("[src] is recharging power. Please wait [round((last_teleport + teleport_cooldown - world.time)/10)] seconds."))
		return
	if(linked_pad.teleporting)
		to_chat(user, span_warning("Linked pad is busy. Please wait."))
		return
	src.add_fingerprint(user)
	startteleport(user)

/obj/machinery/hyperpad/attack_hand(mob/user)
	. = ..()
	if(primary)
		primary.attack_hand(user)

/obj/machinery/hyperpad/centre/proc/initMappedLink()
	. = FALSE
	var/obj/machinery/hyperpad/centre/link = mapped_hyper_pads[map_pad_link_id]
	if(link)
		linked_pad = link
		. = TRUE

/obj/machinery/hyperpad/centre/proc/detect(mob/user)
	if(!ready)
		var/list/dirs = list(1,2,4,8,5,9,6,10) //A really dumb way of making a circle of dirs around the centre piece. If there's a better way, tell me.
		var/list/turfs = trange(1, src) - loc
		var/iterate = 1
		for(var/turf/T in turfs)
			var/obj/machinery/hyperpad/new_pad = new /obj/machinery/hyperpad(T)
			linked.Add(new_pad)
			new_pad.primary = src
			new_pad.dir = dirs[iterate]
			iterate += 1
		if(linked.len == 8)
			ready = 1
			start_charge()
		else
			to_chat(user, span_warning("Pad detect failed. Are all eight pieces linked?"))

/obj/machinery/hyperpad/centre/proc/startteleport(mob/user)
	if(!linked_pad)
		return
	playsound(get_turf(src), 'sound/weapons/flash.ogg', 25, 1)
	teleporting = 1
	addtimer(CALLBACK(src, PROC_REF(doteleport), user), teleport_speed)
	var/speed = teleport_speed/8
	for(var/obj/machinery/hyperpad/P in linked)
		addtimer(CALLBACK(src, PROC_REF(animate_discharge), P), speed)
		speed += teleport_speed/8

/obj/machinery/hyperpad/centre/proc/animate_discharge(var/obj/machinery/hyperpad/Pad)
	Pad.cut_overlays()

/obj/machinery/hyperpad/centre/proc/doteleport(mob/user)
	if(!src || QDELETED(src))
		teleporting = 0
		return
	if(!linked_pad || QDELETED(linked_pad))
		to_chat(user, span_warning("Linked pad is not responding to ping. Teleport aborted."))
		teleporting = 0
		return

	teleporting = 0
	last_teleport = world.time
	var/limit = 0
	var/list/turfs = trange(1, src)
	for(var/turf/T in turfs)
		if(limit >= max_item_teleport)
			break
		var/xadjust = src.x - T.x
		var/yadjust = src.y - T.y
		for(var/atom/movable/ROI in T)
			if(ROI.anchored)
				if(isliving(ROI))
					var/mob/living/L = ROI
					if(L.buckled)
						// TP people on office chairs
						if(L.buckled.anchored)
							continue
					else
						continue
				if(!((istype(ROI,/obj/mecha)) || istype(ROI,/obj/vehicle)))
					continue //TP things that move that are "anchored"
			if(isobserver(ROI))
				continue
			var/datum/effect/effect/system/teleport_greyscale/tele1 = new /datum/effect/effect/system/teleport_greyscale()
			tele1.set_up(newcolor, get_turf(ROI))
			var/datum/effect/effect/system/teleport_greyscale/tele2 = new /datum/effect/effect/system/teleport_greyscale()
			tele2.set_up(linked_pad.newcolor, locate((linked_pad.x - xadjust), (linked_pad.y - yadjust), linked_pad.z))
			limit += 1
			do_teleport(ROI, locate((linked_pad.x - xadjust), (linked_pad.y - yadjust), linked_pad.z), local = FALSE, bohsafe = TRUE, asoundin = 'sound/weapons/emitter2.ogg', asoundout = 'sound/weapons/emitter2.ogg', aeffectin = tele1, aeffectout = tele2)

	cut_overlays()
	for(var/obj/machinery/hyperpad/P in linked)
		P.cut_overlays()
	start_charge()

/obj/machinery/hyperpad/centre/proc/start_charge()
	var/mutable_appearance/color_overlay = mutable_appearance('icons/obj/telescience_ch.dmi', "hpad_centre_on")
	color_overlay.color = newcolor
	add_overlay(color_overlay)

	color_overlay = mutable_appearance('icons/obj/telescience_ch.dmi', "hpad_on")
	color_overlay.color = newcolor
	var/timer = teleport_cooldown/8
	for(var/obj/machinery/hyperpad/P in linked)
		addtimer(CALLBACK(src, PROC_REF(animate_charge), P, color_overlay), timer)
		timer += teleport_cooldown/8

/obj/machinery/hyperpad/centre/proc/animate_charge(var/obj/machinery/hyperpad/Pad, var/mutable_appearance/color)
	Pad.add_overlay(color)
