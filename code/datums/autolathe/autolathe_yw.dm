#define AUTOLATHE_MAIN_MENU		1
#define AUTOLATHE_CATEGORY_MENU	2
#define AUTOLATHE_SEARCH_MENU	3

/obj/machinery/autolathe
	name = "autolathe"
	desc = "It produces items using metal and glass."
	icon_state = "autolathe"
	density = 1
	anchored = 1
	use_power = USE_POWER_IDLE
	idle_power_usage = 10
	active_power_usage = 2000
	clicksound = "keyboard"
	clickvol = 30

	circuit = /obj/item/weapon/circuitboard/autolathe
	var/list/stored_material =  list(DEFAULT_WALL_MATERIAL = 0, "glass" = 0)
	var/list/storage_capacity = list(DEFAULT_WALL_MATERIAL = 0, "glass" = 0)

	var/hacked = 0
	var/disabled = 0
	var/shocked = 0
	var/busy = 0
	var/input_dir_name = "North"
	var/input_dir = NORTH
	var/operating = 0.0
	var/list/queue = list()
	var/queue_max_len = 12
	var/turf/BuildTurf
	var/list/L = list()
	var/list/LL = list()
	var/prod_coeff
	var/list/being_built = list()
	var/datum/research/files

	var/mat_efficiency = 1
	var/list/datum/design/item/autolathe/matching_designs
	var/temp_search
	var/selected_category
	var/screen = 1
	var/list/categories = list("Arms and Ammunition", "Devices", "Engineering", "General", "Medical", "Tools", "Imported")

	var/datum/wires/autolathe/wires = null

/obj/machinery/autolathe/New()
	..()

/obj/machinery/autolathe/Initialize()
	. = ..()
	wires = new(src)
	default_apply_parts()
	RefreshParts()
	files = new /datum/research/autolathe(src)
	matching_designs = list()

/obj/machinery/autolathe/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/machinery/autolathe/attack_hand(mob/user)

	if(..() || (disabled && !panel_open))
		to_chat(user, "<span class='danger'>\The [src] is disabled!</span>")
		return

	if(shocked)
		shock(user, 50)
	else
		ui_interact(user)

/obj/machinery/autolathe/dismantle()
	for(var/mat in stored_material)
		var/material/M = get_material_by_name(mat)
		if(!istype(M))
			continue
		var/obj/item/stack/material/S = new M.stack_type(get_turf(src))
		if(stored_material[mat] > S.perunit)
			S.amount = round(stored_material[mat] / S.perunit)
		else
			qdel(S)
	..()
	return 1

/obj/machinery/autolathe/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)
	var/data[0]
	data["screen"] = screen
	data["total_amount"] = (stored_material[DEFAULT_WALL_MATERIAL] + stored_material["glass"])
	data["max_amount"] = (storage_capacity[DEFAULT_WALL_MATERIAL] + storage_capacity["glass"])
	data["metal_amount"] = stored_material[DEFAULT_WALL_MATERIAL]
	data["glass_amount"] = stored_material["glass"]
	switch(screen)
		if(AUTOLATHE_MAIN_MENU)
			data["uid"] = "\ref[src]"
			data["categories"] = categories
		if(AUTOLATHE_CATEGORY_MENU)
			data["selected_category"] = selected_category
			var/list/designs = list()
			data["designs"] = designs
			for(var/datum/design/item/D in files.known_designs)
				if(!D.build_path || D.hidden && !hacked || selected_category != D.category)
					continue
				var/list/design = list()
				designs[++designs.len] = design
				design["name"] = D.name
				design["id"] = D.id
				design["disabled"] = disabled || !can_build(D) ? "disabled" : null
				if(ispath(D.build_path, /obj/item/stack))
					design["max_multiplier"] = min(D.maxstack, D.materials[DEFAULT_WALL_MATERIAL] ? round(stored_material[DEFAULT_WALL_MATERIAL] / D.materials[DEFAULT_WALL_MATERIAL]) : INFINITY, D.materials["glass"] ? round(stored_material["glass"] / D.materials["glass"]) : INFINITY)
				else
					design["max_multiplier"] = null
				design["materials"] = design_cost_data(D)
		if(AUTOLATHE_SEARCH_MENU)
			data["search"] = temp_search
			var/list/designs = list()
			data["designs"] = designs
			for(var/datum/design/item/D in matching_designs)
				var/list/design = list()
				designs[++designs.len] = design
				design["name"] = D.name
				design["id"] = D.id
				design["disabled"] = disabled || !can_build(D) ? "disabled" : null
				if(ispath(D.build_path, /obj/item/stack))
					design["max_multiplier"] = min(D.maxstack, D.materials[DEFAULT_WALL_MATERIAL] ? round(stored_material[DEFAULT_WALL_MATERIAL] / D.materials[DEFAULT_WALL_MATERIAL]) : INFINITY, D.materials["glass"] ? round(stored_material["glass"] / D.materials["glass"]) : INFINITY)
				else
					design["max_multiplier"] = null
				design["materials"] = design_cost_data(D)

	data = queue_data(data)

	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "autolathe.tmpl", name, 800, 550)
		ui.set_initial_data(data)
		ui.open()

	return data

/obj/machinery/autolathe/Topic(href, href_list)
	if(..())
		return
	add_fingerprint(usr)

	if(href_list["menu"])
		screen = text2num(href_list["menu"])

	if(href_list["category"])
		selected_category = href_list["category"]
		screen = AUTOLATHE_CATEGORY_MENU

	if(href_list["make"])
		BuildTurf = loc

		/////////////////
		//href protection
		var/datum/design/design_last_ordered
		design_last_ordered = FindDesign(href_list["make"]) //check if it's a valid design
		if(!design_last_ordered)
			return

		//multiplier checks : only stacks can have one and its value is 1, 10 ,25 or max_multiplier
		var/multiplier = text2num(href_list["multiplier"])
		var/max_multiplier = min(design_last_ordered.maxstack, design_last_ordered.materials[DEFAULT_WALL_MATERIAL] ?round(stored_material[DEFAULT_WALL_MATERIAL]/design_last_ordered.materials[DEFAULT_WALL_MATERIAL]):INFINITY,design_last_ordered.materials["glass"]?round(stored_material["glass"]/design_last_ordered.materials["glass"]):INFINITY)
		var/is_stack = ispath(design_last_ordered.build_path, /obj/item/stack)

		if(!is_stack && (multiplier > 1))
			return
		if(!(multiplier in list(1, 10, 25, max_multiplier))) //"enough materials ?" is checked in the build proc
			return
		/////////////////

		if((queue.len + 1) < queue_max_len)
			add_to_queue(design_last_ordered,multiplier)
		else
			to_chat(usr, "<span class='warning'>The autolathe queue is full!</span>")
		if(!busy)
			busy = 1
			update_icon()
			process_queue()
			busy = 0
			update_icon()

	if(href_list["remove_from_queue"])
		var/index = text2num(href_list["remove_from_queue"])
		if(isnum(index) && ISINRANGE(index, 1, queue.len))
			remove_from_queue(index)
	if(href_list["queue_move"] && href_list["index"])
		var/index = text2num(href_list["index"])
		var/new_index = index + text2num(href_list["queue_move"])
		if(isnum(index) && isnum(new_index))
			if(ISINRANGE(new_index, 1, queue.len))
				queue.Swap(index,new_index)
	if(href_list["clear_queue"])
		queue = list()
	if(href_list["search"])
		if(href_list["to_search"])
			temp_search = href_list["to_search"]
		if(!temp_search)
			return
		matching_designs.Cut()

		for(var/datum/design/item/autolathe/D in files.known_designs)
			if(findtext(D.name, temp_search))
				matching_designs.Add(D)

		screen = AUTOLATHE_SEARCH_MENU

	SSnanoui.update_uis(src)
	return 1

/obj/machinery/autolathe/update_icon()
	overlays.Cut()

	icon_state = initial(icon_state)

	if(panel_open)
		overlays.Add(image(icon, "[icon_state]_panel"))
	if(stat & NOPOWER)
		return
	if(busy)
		icon_state = "[icon_state]_work"
	if(!busy)
		icon_state = "[icon_state]_pause"



/obj/machinery/autolathe/RefreshParts()
	..()
	var/mb_rating = 0
	var/man_rating = 0
	for(var/obj/item/weapon/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	storage_capacity[DEFAULT_WALL_MATERIAL] = mb_rating  * 25000
	storage_capacity["glass"] = mb_rating  * 12500
	mat_efficiency = 1.1 - man_rating * 0.1// Normally, price is 1.25 the amount of material, so this shouldn't go higher than 0.6. Maximum rating of parts is 5


/obj/machinery/autolathe/proc/design_cost_data(datum/design/D)
	var/list/data = list()
	var/coeff = get_coeff(D)
	var/has_metal = 1
	if(D.materials[DEFAULT_WALL_MATERIAL] && (stored_material[DEFAULT_WALL_MATERIAL] < (D.materials[DEFAULT_WALL_MATERIAL] * coeff)))
		has_metal = 0
	var/has_glass = 1
	if(D.materials["glass"] && (stored_material["glass"] < (D.materials["glass"] * coeff)))
		has_glass = 0

	data[++data.len] = list("name" = "metal", "amount" = D.materials[DEFAULT_WALL_MATERIAL] * coeff, "is_red" = !has_metal)
	data[++data.len] = list("name" = "glass", "amount" = D.materials["glass"] * coeff, "is_red" = !has_glass)

	return data

/obj/machinery/autolathe/proc/queue_data(list/data)
	var/temp_metal = stored_material[DEFAULT_WALL_MATERIAL]
	var/temp_glass = stored_material["glass"]
	data["processing"] = being_built.len ? get_processing_line() : null
	if(istype(queue) && queue.len)
		var/list/data_queue = list()
		for(var/list/L in queue)
			var/datum/design/item/autolathe/D = L[1]
			var/list/LL = get_design_cost_as_list(D, L[2])
			data_queue[++data_queue.len] = list("name" = initial(D.name), "can_build" = can_build(D, L[2], temp_metal, temp_glass), "multiplier" = L[2])
			temp_metal = max(temp_metal - LL[1], 1)
			temp_glass = max(temp_glass - LL[2], 1)
		data["queue"] = data_queue
		data["queue_len"] = data_queue.len
	else
		data["queue"] = null
	return data

/obj/machinery/autolathe/proc/get_coeff(datum/design/D)
	var/coeff = (ispath(D.build_path,/obj/item/stack) ? 1 : mat_efficiency)//stacks are unaffected by production coefficient
	return coeff

/obj/machinery/autolathe/proc/build_item(datum/design/D, multiplier)
	desc = initial(desc)+"\nIt's building \a [initial(D.name)]."
	var/is_stack = ispath(D.build_path, /obj/item/stack)
	var/is_box = ispath(D.build_path, /obj/item/weapon/storage/box)
	var/coeff = get_coeff(D)
	var/metal_cost = D.materials[DEFAULT_WALL_MATERIAL]
	var/glass_cost = D.materials["glass"]
	var/power = max(2000, (metal_cost+glass_cost)*multiplier/5)
	if(can_build(D, multiplier))
		being_built = list(D, multiplier)
		use_power(power)
		update_icon()
		if(is_stack)
			var/list/materials_used = list(DEFAULT_WALL_MATERIAL=metal_cost*multiplier, "glass"=glass_cost*multiplier)
			//stored_material = list(DEFAULT_WALL_MATERIAL -= materials_used[DEFAULT_WALL_MATERIAL], "glass" -= materials_used["glass"])
			stored_material[DEFAULT_WALL_MATERIAL] -= materials_used[DEFAULT_WALL_MATERIAL]
			stored_material["glass"] -= materials_used["glass"]
		else
			var/list/materials_used = list(DEFAULT_WALL_MATERIAL=metal_cost*coeff, "glass"=glass_cost*coeff)
			stored_material[DEFAULT_WALL_MATERIAL] -= materials_used[DEFAULT_WALL_MATERIAL]
			stored_material["glass"] -= materials_used["glass"]
		SSnanoui.update_uis(src)
		sleep(32*coeff)
		flick("[initial(icon_state)]_finish", src)
		if(is_stack)
			var/obj/item/stack/S = new D.build_path(BuildTurf)
			S.amount = multiplier
		else
			var/obj/item/new_item = new D.build_path(BuildTurf)
			if(is_box)
				for(var/obj/item/L in new_item.contents)
					if(!(L.matter))
						continue
					L.matter[DEFAULT_WALL_MATERIAL] *= coeff
					L.matter["glass"] *= coeff
			else
				new_item.matter[DEFAULT_WALL_MATERIAL] *= coeff
				new_item.matter["glass"] *= coeff
	SSnanoui.update_uis(src)
	desc = initial(desc)

/obj/machinery/autolathe/proc/can_build(var/datum/design/D, var/multiplier = 1, custom_metal, custom_glass)
	if(D.chemicals.len)
		return 0

	var/coeff = get_coeff(D)
	var/metal_amount = stored_material[DEFAULT_WALL_MATERIAL]
	if(custom_metal)
		metal_amount = custom_metal
	var/glass_amount = stored_material["glass"]
	if(custom_glass)
		glass_amount = custom_glass

	if(D.materials[DEFAULT_WALL_MATERIAL] && (metal_amount < (multiplier*D.materials[DEFAULT_WALL_MATERIAL] * coeff)))
		return 0
	if(D.materials["glass"] && (glass_amount < (multiplier*D.materials["glass"] * coeff)))
		return 0
	return 1

/obj/machinery/autolathe/proc/get_design_cost_as_list(datum/design/D, multiplier = 1)
	var/list/OutputList = list(0,0)
	var/coeff = get_coeff(D)
	if(D.materials[DEFAULT_WALL_MATERIAL])
		OutputList[1] = (D.materials[DEFAULT_WALL_MATERIAL] * coeff)*multiplier
	if(D.materials["glass"])
		OutputList[2] = (D.materials["glass"] * coeff)*multiplier
	return OutputList

/obj/machinery/autolathe/proc/get_processing_line()
	var/datum/design/D = being_built[1]
	var/multiplier = being_built[2]
	var/is_stack = (multiplier>1)
	var/output = "PROCESSING: [initial(D.name)][is_stack?" (x[multiplier])":null]"
	return output

/obj/machinery/autolathe/proc/add_to_queue(D, multiplier)
	if(!istype(queue))
		queue = list()
	if(D)
		queue.Add(list(list(D,multiplier)))
	return queue.len

/obj/machinery/autolathe/proc/remove_from_queue(index)
	if(!isnum(index) || !istype(queue) || (index<1 || index>queue.len))
		return 0
	queue.Cut(index,++index)
	return 1

/obj/machinery/autolathe/proc/process_queue()
	var/datum/design/D = queue[1][1]
	var/multiplier = queue[1][2]
	if(!D)
		remove_from_queue(1)
		if(queue.len)
			return process_queue()
		else
			return
	while(D)
		if(stat & (NOPOWER|BROKEN))
			being_built = new /list()
			return 0
		if(!can_build(D, multiplier))
			visible_message("[bicon(src)] <b>\The [src]</b> beeps, \"Not enough resources. Queue processing terminated.\"")
			queue = list()
			being_built = new /list()
			return 0

		remove_from_queue(1)
		build_item(D,multiplier)
		D = listgetindex(listgetindex(queue, 1),1)
		multiplier = listgetindex(listgetindex(queue,1),2)
	being_built = new /list()


/datum/research/autolathe

/datum/research/autolathe/New()		//Insert techs into possible_tech here. Known_tech automatically updated.
	for(var/T in typesof(/datum/tech) - /datum/tech)
		known_tech += new T(src)
	for(var/D in typesof(/datum/design) - /datum/design)
		possible_designs += new D(src)
//	generate_integrated_circuit_designs()
	RefreshResearch()


/datum/research/autolathe/DesignHasReqs(var/datum/design/D)
	if(D.req_tech.len == 0)
		return 1
	if(D.build_type == AUTOLATHE)
		return 1

	else
		return 0


/obj/machinery/autolathe/proc/AddDesignViaDisk(var/mob/user, var/datum/design/D)
	for(var/datum/design/F in files.possible_designs)
		if(F.autolathe_build != 1 || F.id != D.id)
			continue
		if(F in files.known_designs)
			to_chat(user, "This design is already exists")
			return
		if(!F.category)
			F.category = "Imported"
		files.known_designs.Add(F)
		return

/obj/machinery/autolathe/proc/FindDesign(var/id)
	for(var/datum/design/item/desired_design in files.known_designs)
		if(desired_design.id == id)
			return desired_design
	return 0

/obj/machinery/autolathe/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(busy)
		to_chat(user, "<span class='notice'>\The [src] is busy. Please wait for completion of previous operation.</span>")
		return

	if(default_deconstruction_screwdriver(user, O))
		updateUsrDialog()
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return

	if(stat)
		return

	if(panel_open)
		//Don't eat multitools or wirecutters used on an open lathe.
		if(O.is_multitool() || O.is_wirecutter())
			wires.Interact(user)
			return

	if(O.loc != user && !(istype(O,/obj/item/stack)))
		return 0

	if(istype(O, /obj/item/weapon/disk))
		if(istype(O, /obj/item/weapon/disk/design_disk))
			var/obj/item/weapon/disk/design_disk/D = O
			var/datum/design/B = D.blueprint
			if(D.blueprint)
				if(B.autolathe_build == 1 || B.build_type == AUTOLATHE)
					user.visible_message("[user] begins to load \the [O] in \the [src]...", "You begin to load a design from \the [O]...", "You hear the chatter of a floppy drive.")
					busy = 1
					AddDesignViaDisk(user, D.blueprint)
					busy = 0
				else
					to_chat(user, "<span class='warning'>That disk doens't have a compatible design</span>")
			else
				to_chat(user, "<span class='warning'>That disk does not have a design on it!</span>")
			return
		else
		// So that people who are bad at computers don't shred their disks
			to_chat(user, "<span class='warning'>This is not the correct type of disk for the autolathe!</span>")
			return

	if(is_robot_module(O))
		return 0

	if(istype(O,/obj/item/ammo_magazine/clip) || istype(O,/obj/item/ammo_magazine/s357) || istype(O,/obj/item/ammo_magazine/s38) || istype (O,/obj/item/ammo_magazine/s44)/* VOREstation Edit*/) // Prevents ammo recycling exploit with speedloaders.
		to_chat(user, "\The [O] is too hazardous to recycle with the autolathe!")
		return
		/*  ToDo: Make this actually check for ammo and change the value of the magazine if it's empty. -Spades
		var/obj/item/ammo_magazine/speedloader = O
		if(speedloader.stored_ammo)
			to_chat(user, "\The [speedloader] is too hazardous to put back into the autolathe while there's ammunition inside of it!")
			return
		else
			speedloader.matter = list(DEFAULT_WALL_MATERIAL = 75) // It's just a hunk of scrap metal now.
	if(istype(O,/obj/item/ammo_magazine)) // This was just for immersion consistency with above.
		var/obj/item/ammo_magazine/mag = O
		if(mag.stored_ammo)
			to_chat(user, "\The [mag] is too hazardous to put back into the autolathe while there's ammunition inside of it!")
			return*/

	//Resources are being loaded.
	var/obj/item/eating = O
	if(!eating.matter)
		to_chat(user, "\The [eating] does not contain significant amounts of useful materials and cannot be accepted.")
		return

	var/filltype = 0       // Used to determine message.
	var/total_used = 0     // Amount of material used.
	var/mass_per_sheet = 0 // Amount of material constituting one sheet.

	for(var/material in eating.matter)

		if(isnull(stored_material[material]) || isnull(storage_capacity[material]))
			continue

		if(stored_material[material] >= storage_capacity[material])
			continue

		var/total_material = eating.matter[material]

		//If it's a stack, we eat multiple sheets.
		if(istype(eating,/obj/item/stack))
			var/obj/item/stack/stack = eating
			total_material *= stack.get_amount()

		if(stored_material[material] + total_material > storage_capacity[material])
			total_material = storage_capacity[material] - stored_material[material]
			filltype = 1
		else
			filltype = 2

		stored_material[material] += total_material
		total_used += total_material
		mass_per_sheet += eating.matter[material]

	if(!filltype)
		to_chat(user, "<span class='notice'>\The [src] is full. Please remove material from the autolathe in order to insert more.</span>")
		return
	else if(filltype == 1)
		to_chat(user, "You fill \the [src] to capacity with \the [eating].")
	else
		to_chat(user, "You fill \the [src] with \the [eating].")

	flick("autolathe_loading", src) // Plays metal insertion animation. Work out a good way to work out a fitting animation. ~Z

	if(istype(eating,/obj/item/stack))
		var/obj/item/stack/stack = eating
		stack.use(max(1, round(total_used/mass_per_sheet))) // Always use at least 1 to prevent infinite materials.
	else
		user.remove_from_mob(O)
		qdel(O)

	updateUsrDialog()
	return

/obj/machinery/autolathe/verb/eatmaterialsnearby()
	set name = "Recycle nearby materials"
	set category = "Object"
	set src in oview(1)

	var/filltype = 0       // Used to determine message.
	var/total_used = 0     // Amount of material used.
	if(busy)
		visible_message("[bicon(src)]<b>\The [src]</b> beeps, \"Autolathe is busy. Please wait for completion of previous operation\"")
		return
	busy = 1
	for(var/obj/item/eating in get_step(src,input_dir))
		if(istype(eating,/obj/item/ammo_magazine/clip) || istype(eating,/obj/item/ammo_magazine/s357) || istype(eating,/obj/item/ammo_magazine/s38) || istype(eating,/obj/item/ammo_magazine/s44) || istype(eating,/obj/item/stack))
			continue

		if(!eating.matter)
			continue


		var/mass_per_sheet = 0 // Amount of material constituting one sheet.
		for(var/material in eating.matter)

			if(isnull(stored_material[material]) || isnull(storage_capacity[material]))
				continue

			if(stored_material[material] >= storage_capacity[material])
				continue

			var/total_material = eating.matter[material]


			if(stored_material[material] + total_material > storage_capacity[material])
				total_material = storage_capacity[material] - stored_material[material]
				filltype = 1
			else
				filltype = 2

			stored_material[material] += total_material
			total_used += total_material
			mass_per_sheet += eating.matter[material]

		if(!filltype)
			visible_message("[bicon(src)]<b>\The [src]</b> beeps, \"Storage is full. Operation aborted\"")
			break

		flick("autolathe_loading", src)

		if(istype(eating,/obj/item/stack))
			var/obj/item/stack/stack = eating
			stack.use(max(1, round(total_used/mass_per_sheet))) // Always use at least 1 to prevent infinite materials.
		else
			qdel(eating)
		sleep(10*mat_efficiency)

	busy = 0
	if(filltype == 1)
		visible_message("[bicon(src)] <b>\The [src]</b> beeps, \"Storage capacity full. Operation terminated. Materials recycled: [total_used]\"")
	else
		visible_message("[bicon(src)] <b>\The [src]</b> beeps, \"All materials recycled. Operation terminated. Materials recycled: [total_used]\"")



/obj/machinery/autolathe/verb/setrecyclepos()
	set name = "Set recycle input"
	set category = "Object"
	set src in oview(1)

	input_dir_name = input("Which direction ?") in list("North", "South", "East", "West")
	switch(input_dir_name)
		if("North")
			input_dir = NORTH
		if("South")
			input_dir = SOUTH
		if("East")
			input_dir = EAST
		if("West")
			input_dir = WEST
	to_chat(src, "You set the material input to [input_dir_name]")


