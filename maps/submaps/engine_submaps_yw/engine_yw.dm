//player pickble engine marker.
//Holds all objects related to player chosen engine. - gozulio.
//Engine submaps get declared in engine_yw_index.dm
//The file _overlay.dmm is a backup of the the local area edited on Tether-05-station1.dmm

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

//Repurposed the Vores random engine select to handle mobs and observers more carefully.
/obj/effect/landmark/engine_loader_pickable/proc/annihilate_bounds()
	var/deleted_atoms = 0
	var/killed_mobs = 0
	admin_notice(span_danger("Annihilating objects in engine loading location."), R_DEBUG)
	var/list/turfs_to_clean = get_turfs_to_clean()
	if(turfs_to_clean.len)
		for(var/x in 1 to 2) // Delete things that shouldn't be players.
			for(var/turf/T in turfs_to_clean)
				for(var/atom/movable/AM in T)
					if(!istype(AM, /mob/living) && !istype(AM, /mob/observer))
						if(istype(AM, /mob)) // a mob we don't know what to do with got in somehow.
							message_admins("a mob of type [AM.type] was in the build area and got deleted.", R_DEBUG)
							++killed_mobs
						qdel(AM)
						++deleted_atoms

		for(var/turf/T in turfs_to_clean) //now deal with those pesky players.
			for(var/mob/living/LH in T)
				if(istype(LH, /mob/living))
					to_chat(LH, span_danger("It feels like you're being torn apart!"))
					LH.apply_effect(20, AGONY, 0, 0)
					LH.visible_message(span_danger("[LH.name] is ripped apart by something you can't see!"))
					LH.gib() //Murder them horribly!
					message_admins("[key_name(LH, LH.client)] was just killed by the engine loader!", R_DEBUG)
					++killed_mobs

	admin_notice(span_danger("Annihilated [deleted_atoms] objects."), R_DEBUG)
	admin_notice(span_danger("Annihilated [killed_mobs] Living Mobs."), R_DEBUG)

//Basically, initialise all of the Atmos machines, as if we just wrenched them down.
/obj/effect/landmark/engine_loader_pickable/proc/lateload_init()
	var/init_machines = 0
	var/init_nodes = 0
	var/list/turfs_to_init = get_turfs_to_clean()

	if(turfs_to_init.len)
		for(var/turf/T in turfs_to_init)
			for(var/obj/machinery/atmospherics/AM in T)
				++init_machines
				AM.atmos_init()
			for(var/obj/machinery/atmospherics/binary/AM in T)
				if(AM.node1)
					AM.node1.atmos_init()
					++init_nodes
				if(AM.node2)
					AM.node2.atmos_init()
					++init_nodes

		for(var/turf/T in turfs_to_init)
			for(var/obj/machinery/atmospherics/AM in T)
				AM.build_network()
			for(var/obj/machinery/atmospherics/binary/AM in T)
				if(AM.node1)
					AM.node1.build_network()
				if(AM.node2)
					AM.node2.build_network()

	admin_notice(span_danger("Initialised [init_machines] Atmos machines and [init_nodes] Atmos network nodes.."), R_DEBUG)

/obj/machinery/computer/pickengine
	name = "Engine Selector."
	desc = "A Terminal for selecting what engine will be assembled for the station."
	icon = 'icons/obj/computer.dmi' //Barrowed from supply computer.
	icon_keyboard = "tech_key"
	icon_screen = "supply"
	light_color = "#b88b2e"
	req_one_access = list(access_engine, access_heads)
	var/lifetime = 900 //lifetime decreases every second, hopefully. see process()
	var/destroy = 0 //killmepls
	var/building = 0

/obj/machinery/computer/pickengine/New()
	message_admins("Engine select console placed at [src.x] [src.y] [src.z]")
	..()

/obj/machinery/computer/pickengine/attack_ai(var/mob/user as mob)
	if(istype(user, /mob/living/silicon/robot))
		return attack_hand(user)
	else
		user << span_warning("The network data sent by this machine is encrypted!")
		return

/obj/machinery/computer/pickengine/attack_hand(var/mob/user as mob)

	if(!allowed(user))
		user << span_warning("Access Denied.")
		return

	if(..())
		return

	add_fingerprint(user)
	user.set_machine(src)
	var/dat

	dat += span_bold("Engine Select console") + "<BR>"
	dat += "Please select an engine for construction.<BR><HR>"
//	dat += "Engine autoselect in [time2text(src.lifetime SECONDS, "mm:ss")].<BR>"
	dat += "WARNING: Selecting an engine will deploy nanobots to construct it. These nanobots will attempt to disassemble anything in their way, including curious engineers!.<BR>"

	dat += "<A href='byond://?src=\ref[src];TESLA=1'>Build Tesla engine</A><BR>"
	dat += "<A href='byond://?src=\ref[src];SM=1'>Build Supermatter Engine</A><BR>"
//	dat += "<A href='byond://?src=\ref[src];SINGULO=1'>Build Singularity Engine</A><BR>" //Not enabled because of stability issues.
	dat += "<A href='byond://?src=\ref[src];RUSTEngine=1'>Build R-UST</A><BR>"
	dat += "<BR><A href='byond://?src=\ref[src];RANDOM=1'>Build Random Engine</A><BR>"

	dat += "<A href='byond://?src=\ref[user];mach_close=computer'>Close</A>"
	user << browse("<html>[dat]</html>", "window=computer;size=575x450")
	onclose(user, "computer")
	return

/obj/machinery/computer/pickengine/Topic(href, href_list)
	if(..())
		return 1

	if( isturf(loc) && (in_range(src, usr) || istype(usr, /mob/living/silicon)) )
		usr.set_machine(src)

	if(href_list["RUSTEngine"] && !building)
		setEngineType("R-UST Engine", usr)

	if(href_list["TESLA"] && !building)
		setEngineType("Edison's Bane", usr)

	if(href_list["SINGULO"] && !building)
		setEngineType("Singularity Engine", usr)

	if(href_list["SM"] && !building)
		setEngineType("Supermatter Engine", usr)

	if(href_list["RANDOM"] && !building)
		setEngineType(pick(CONFIG_GET(str_list/engine_map)), usr) // CHOMPEdit

	if(href_list["close"])
		usr << browse(null, "window=computer")
		usr.unset_machine()

	add_fingerprint(usr)
	updateUsrDialog(usr)
	return

//Take the engine tpe we're building, warn engineering, and pass it to the engine loader.
/obj/machinery/computer/pickengine/proc/setEngineType(engine, var/mob/usr)
	building = 1
	if(usr)
		usr << browse(null, "window=computer")
		usr.unset_machine()
	global_announcer.autosay("Engine selected: You have 30 seconds to clear the engine Room!", "Engine Constructor", "Engineering")
	spawn(300)
		SSmapping.pickEngine(engine)
	destroy = 1

//check every second and make sure we havent been alive to long..
//if we have been alive to long, and aren't building anything, pick an engine to build at random.
/obj/machinery/computer/pickengine/process()
//	--lifetime
//	if(lifetime <= 0 && !building)
//		setEngineType(pick(config.engine_map))
	if(destroy)
		qdel(src)
	sleep(1 SECOND)
