GLOBAL_LIST_EMPTY(simple_portals)

/obj/effect/simple_portal
	name = "Portal"
	desc = "It looks like a portal that leads to somewhere, although you can't quite see through it."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "portal"
	density = 1
	unacidable = TRUE
	anchored = TRUE
	var/atom/destination
	var/teleport_sound = 'sound/effects/portal_effect.ogg'

/obj/effect/simple_portal/Initialize(mapload)
	. = ..()
	GLOB.simple_portals += src

/obj/effect/simple_portal/linked/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/simple_portal/linked/LateInitialize()
	if(portal_id)
		link_portal()

/obj/effect/simple_portal/Destroy()
	. = ..()
	GLOB.simple_portals -= src

/obj/effect/simple_portal/Bumped(atom/movable/AM)
	. = ..()
	handle_teleport(AM)

/obj/effect/simple_portal/Crossed(atom/movable/AM)
	. = ..()
	handle_teleport(AM)

/obj/effect/simple_portal/proc/handle_teleport(atom/movable/AM)
	if(destination)
		AM.forceMove(destination)
		if(!AM.is_incorporeal() && !istype(AM,/mob/observer))
			playsound(get_turf(src),teleport_sound,60,1)
			playsound(get_turf(destination),teleport_sound,60,1)

/obj/effect/simple_portal/attack_ghost(var/mob/observer/dead/user)
	. = ..()
	handle_teleport(user)

/obj/effect/simple_portal/coords
	var/tele_x
	var/tele_y
	var/tele_z

/obj/effect/simple_portal/coords/handle_teleport(atom/movable/AM)
	destination = null
	if(!isnull(tele_x) && !isnull(tele_y) && !isnull(tele_z))
		destination = locate(tele_x,tele_y,tele_z)
	. = ..()

/obj/effect/simple_portal/linked
	icon_state = "portal1"
	var/obj/effect/simple_portal/linked/linked_portal
	var/portal_id

/obj/effect/simple_portal/linked/handle_teleport(atom/movable/AM)
	destination = null
	update_icon()
	if(linked_portal && icon_state == "portal")
		var/rel_x = round(rand(-1,1))
		var/rel_y = round(rand(-1,1))
		var/movingdir = get_dir(AM,src)
		if(!isnull(movingdir))
			destination = get_step(get_turf(linked_portal),movingdir)
		else
			while(rel_x == 0 && rel_y == 0)
				rel_x = round(rand(-1,1))
				rel_y = round(rand(-1,1))
			destination = locate(linked_portal.loc.x + rel_x, linked_portal.loc.y + rel_y, linked_portal.loc.z)
		if(!valid_destination(destination))
			var/list/possible_x = shuffle(list(-1,0,1))
			var/list/possible_y = shuffle(list(-1,0,1))
			for(rel_x in possible_x)
				for(rel_y in possible_y)
					if(rel_x == 0 && rel_y == 0)
						continue
					destination = locate(linked_portal.loc.x + rel_x, linked_portal.loc.y + rel_y, linked_portal.loc.z)
					if(valid_destination(destination))
						break
	. = ..()

/obj/effect/simple_portal/linked/proc/valid_destination(var/turf/dest,var/atom/movable/AM)
	if(!dest)
		return FALSE
	if(dest.density)
		return FALSE
	if(dest == get_turf(linked_portal))
		return FALSE
	var/windows = 0
	for(var/obj/struct in dest)
		var/obj/structure/window/window = struct
		if(istype(window))
			windows++
			if(window.fulltile)
				return FALSE
		else
			if(!struct.density)
				continue
			if(struct.throwpass || struct.flags & ON_BORDER)
				continue
			else
				return FALSE
	if(windows>2)
		return FALSE
	return TRUE

/obj/effect/simple_portal/linked/proc/link_portal()
	if(!portal_id)
		return "SET PORTAL ID FIRST"
	for(var/obj/effect/simple_portal/linked/candidate in GLOB.simple_portals)
		if(istype(candidate) && portal_id == candidate.portal_id && candidate != src)
			linked_portal = candidate
			break
	update_icon()

/obj/effect/simple_portal/linked/update_icon()
	if(linked_portal && !QDELETED(linked_portal))
		icon_state = "portal"
	else
		icon_state = "portal1"
