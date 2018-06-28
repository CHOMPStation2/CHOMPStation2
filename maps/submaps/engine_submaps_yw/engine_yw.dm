//player pickble engine marker.
//Holds all objects related to player chosen engine. - gozulio.
//Engine submaps get declared in engine_yw_index.dm

/obj/effect/landmark/engine_loader_pickable
	name = "Player Picked Engine Loader"
	var/clean_turfs // A list of lists, where each list is (x, )

//check for duplicte loaders. TODO: Make referance a subsystem that isnt upstream. See /controllers/subsystems/mapping_yw.dm and mapping_vr.dm
/obj/effect/landmark/engine_loader_pickable/New()
	if(SSmapping.engine_loader_pickable)
		warning("Duplicate engine_loader landmarks: [log_info_line(src)] and [log_info_line(SSmapping.engine_loader)]")
		delete_me = TRUE
	SSmapping.engine_loader_pickable = src
	return ..()

/obj/effect/landmark/engine_loader_pickable/proc/get_turfs_to_clean()
	. = list()
	if(clean_turfs)
		for(var/list/coords in clean_turfs)
			. += block(locate(coords[1], coords[2], src.z), locate(coords[3], coords[4], src.z))

/obj/effect/landmark/engine_loader_pickable/proc/annihilate_bounds()
	var/deleted_atoms = 0
	admin_notice("<span class='danger'>Annihilating objects in engine loading locatation.</span>", R_DEBUG)
	var/list/turfs_to_clean = get_turfs_to_clean()
	if(turfs_to_clean.len)
		for(var/x in 1 to 2) // Requires two passes to get everything.
			for(var/turf/T in turfs_to_clean)
				for(var/atom/movable/AM in T)
					++deleted_atoms
					qdel(AM)
	admin_notice("<span class='danger'>Annihilated [deleted_atoms] objects.</span>", R_DEBUG)

/obj/machinery/computer/pickengine
	name = "Engine Selector."
	desc = "A Terminal for selecting what engine nanodrones will assemble for the station."
	icon = 'icons/obj/computer.dmi' //Barrowed from supply computer.
	icon_keyboard = "tech_key"
	icon_screen = "supply"
	light_color = "#b88b2e"
	req_one_access = list(access_engine, access_heads)
	var/lifetime = 750 //lifetime * 10.
	var/destroy = 0 //killmepls
	var/building = 0

/obj/machinery/computer/pickengine/New()
	message_admins("Engine select console placed at [src.x] [src.y] [src.z]")
	..()

/obj/machinery/computer/pickengine/attack_ai(var/mob/user as mob)
	user << "<span class='warning'>The network data sent by this machine is encrypted!</span>"
	return

/obj/machinery/computer/pickengine/attack_hand(var/mob/user as mob)

	if(!allowed(user))
		user << "<span class='warning'>Access Denied.</span>"
		return

	if(..())
		return

	add_fingerprint(user)
	user.set_machine(src)
	var/dat

	dat += "Engine Select console<BR>"
	dat += "Please select an engine for construction.<BR>"

	dat += "<A href='?src=\ref[src];TESLA=1'>Build Tesla engine</A><BR>"
	dat += "<A href='?src=\ref[src];SM=1'>Build Supermatter Engine</A><BR>"
	dat += "<A href='?src=\ref[src];RUSTEngine=1'>Build R-UST</A><BR>"

	dat += "<A href='?src=\ref[user];mach_close=computer'>Close</A>"
	user << browse(dat, "window=computer;size=575x450")
	onclose(user, "computer")
	return

/obj/machinery/computer/pickengine/Topic(href, href_list)
	if(..())
		return 1

	if( isturf(loc) && (in_range(src, usr) || istype(usr, /mob/living/silicon)) )
		usr.set_machine(src)

	if(href_list["RUSTEngine"] && !building)
		building = 1
		usr << browse(null, "window=computer")
		usr.unset_machine()
		SSmapping.pickEngine("R-UST Engine")
		destroy = 1

	if(href_list["TESLA"] && !building)
		building = 1
		usr << browse(null, "window=computer")
		usr.unset_machine()
		SSmapping.pickEngine("Edison's Bane")
		destroy = 1

	if(href_list["SM"] && !building)
		building = 1
		usr << browse(null, "window=computer")
		usr.unset_machine()
		SSmapping.pickEngine("Supermatter Engine")
		destroy = 1

	if(href_list["close"])
		usr << browse(null, "window=computer")
		usr.unset_machine()

	add_fingerprint(usr)
	updateUsrDialog()
	return

/obj/machinery/computer/pickengine/process()

	--lifetime

	if(lifetime <= 0)
		building = 1
		SSmapping.pickEngine(config.engine_map)
		destroy = 1

	if(destroy)
		src.Destroy()

	sleep(10)