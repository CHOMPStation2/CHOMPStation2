#define WIRE		"wire"
#define WIRING		"wiring"
#define UNWIRE		"unwire"
#define UNWIRING	"unwiring"


/obj/item/integrated_electronics/wirer
	name = "circuit wirer"
	desc = "It's a small wiring tool, with a wire roll, electric soldering iron, wire cutter, and more in one package. \
	The wires used are generally useful for small electronics, such as circuitboards and breadboards, as opposed to larger wires \
	used for power or data transmission."
	icon = 'icons/obj/integrated_electronics/electronic_tools.dmi'
	icon_state = "wirer-wire"
	item_state = "wirer"
	w_class = ITEMSIZE_SMALL
	var/datum/integrated_io/selected_io = null
	var/mode = WIRE

/obj/item/integrated_electronics/wirer/update_icon()
	icon_state = "wirer-[mode]"

/obj/item/integrated_electronics/wirer/proc/wire(var/datum/integrated_io/io, mob/user)
	if(!io.holder.assembly)
		to_chat(user, span_warning("\The [io.holder] needs to be secured inside an assembly first."))
		return
	if(mode == WIRE)
		selected_io = io
		to_chat(user, span_notice("You attach a data wire to \the [selected_io.holder]'s [selected_io.name] data channel."))
		mode = WIRING
		update_icon()
	else if(mode == WIRING)
		if(io == selected_io)
			to_chat(user, span_warning("Wiring \the [selected_io.holder]'s [selected_io.name] into itself is rather pointless."))
			return
		if(io.io_type != selected_io.io_type)
			to_chat(user, span_warning("Those two types of channels are incompatible. The first is a [selected_io.io_type], \
			while the second is a [io.io_type]."))
			return
		if(io.holder.assembly && io.holder.assembly != selected_io.holder.assembly)
			to_chat(user, span_warning("Both \the [io.holder] and \the [selected_io.holder] need to be inside the same assembly."))
			return
		selected_io.linked |= io
		io.linked |= selected_io

		to_chat(user, span_notice("You connect \the [selected_io.holder]'s [selected_io.name] to \the [io.holder]'s [io.name]."))
		mode = WIRE
		update_icon()
		selected_io.holder.interact(user) // This is to update the UI.
		selected_io = null

	else if(mode == UNWIRE)
		selected_io = io
		if(!io.linked.len)
			to_chat(user, span_warning("There is nothing connected to \the [selected_io] data channel."))
			selected_io = null
			return
		to_chat(user, span_notice("You prepare to detach a data wire from \the [selected_io.holder]'s [selected_io.name] data channel."))
		mode = UNWIRING
		update_icon()
		return

	else if(mode == UNWIRING)
		if(io == selected_io)
			to_chat(user, span_warning("You can't wire a pin into each other, so unwiring \the [selected_io.holder] from \
			the same pin is rather moot."))
			return
		if(selected_io in io.linked)
			io.linked.Remove(selected_io)
			selected_io.linked.Remove(io)
			to_chat(user, span_notice("You disconnect \the [selected_io.holder]'s [selected_io.name] from \
			\the [io.holder]'s [io.name]."))
			selected_io.holder.interact(user) // This is to update the UI.
			selected_io = null
			mode = UNWIRE
			update_icon()
		else
			to_chat(user, span_warning("\The [selected_io.holder]'s [selected_io.name] and \the [io.holder]'s \
			[io.name] are not connected."))
			return
	return

/obj/item/integrated_electronics/wirer/attack_self(mob/user)
	switch(mode)
		if(WIRE)
			mode = UNWIRE
		if(WIRING)
			if(selected_io)
				to_chat(user, span_notice("You decide not to wire the data channel."))
			selected_io = null
			mode = WIRE
		if(UNWIRE)
			mode = WIRE
		if(UNWIRING)
			if(selected_io)
				to_chat(user, span_notice("You decide not to disconnect the data channel."))
			selected_io = null
			mode = UNWIRE
	update_icon()
	to_chat(user, span_notice("You set \the [src] to [mode]."))

#undef WIRE
#undef WIRING
#undef UNWIRE
#undef UNWIRING

/obj/item/integrated_electronics/debugger
	name = "circuit debugger"
	desc = "This small tool allows one working with custom machinery to directly set data to a specific pin, useful for writing \
	settings to specific circuits, or for debugging purposes. It can also pulse activation pins."
	icon = 'icons/obj/integrated_electronics/electronic_tools.dmi'
	icon_state = "debugger"
	w_class = 2
	var/data_to_write = null
	var/accepting_refs = 0

/obj/item/integrated_electronics/debugger/attack_self(mob/user)
	var/type_to_use = tgui_input_list(user, "Please choose a type to use.","[src] type setting", list("string","number","ref", "null"))
	if(!CanInteract(user, GLOB.tgui_physical_state))
		return

	var/new_data = null
	switch(type_to_use)
		if("string")
			accepting_refs = 0
			new_data = tgui_input_text(user, "Now type in a string.","[src] string writing", null, MAX_MESSAGE_LEN)
			new_data = sanitizeSafe(new_data, MAX_MESSAGE_LEN, 0, 0)
			if(istext(new_data) && CanInteract(user, GLOB.tgui_physical_state))
				data_to_write = new_data
				to_chat(user, span_notice("You set \the [src]'s memory to \"[new_data]\"."))
		if("number")
			accepting_refs = 0
			new_data = tgui_input_number(user, "Now type in a number.","[src] number writing", min_value=-INFINITY, round_value=FALSE)
			if(isnum(new_data) && CanInteract(user, GLOB.tgui_physical_state))
				data_to_write = new_data
				to_chat(user, span_notice("You set \the [src]'s memory to [new_data]."))
		if("ref")
			accepting_refs = 1
			to_chat(user, span_notice("You turn \the [src]'s ref scanner on. Slide it across \
			an object for a ref of that object to save it in memory."))
		if("null")
			data_to_write = null
			to_chat(user, span_notice("You set \the [src]'s memory to absolutely nothing."))

/obj/item/integrated_electronics/debugger/afterattack(atom/target, mob/living/user, proximity)
	if(accepting_refs && proximity)
		data_to_write = WEAKREF(target)
		visible_message(span_notice("[user] slides \a [src]'s over \the [target]."))
		to_chat(user, span_notice("You set \the [src]'s memory to a reference to [target.name] \[Ref\]. The ref scanner is \
		now off."))
		accepting_refs = 0

/obj/item/integrated_electronics/debugger/proc/write_data(var/datum/integrated_io/io, mob/user)
	if(io.io_type == DATA_CHANNEL)
		io.write_data_to_pin(data_to_write)
		var/data_to_show = data_to_write
		if(isweakref(data_to_write))
			var/datum/weakref/w = data_to_write
			var/atom/A = w.resolve()
			data_to_show = A.name
		to_chat(user, span_notice("You write '[data_to_write ? data_to_show : "NULL"]' to the '[io]' pin of \the [io.holder]."))
	else if(io.io_type == PULSE_CHANNEL)
		io.holder.check_then_do_work(ignore_power = TRUE)
		to_chat(user, span_notice("You pulse \the [io.holder]'s [io]."))

	io.holder.interact(user) // This is to update the UI.




/obj/item/multitool
	var/accepting_refs
	var/datum/integrated_io/selected_io = null
	var/mode = 0

/obj/item/multitool/attack_self(mob/user)
	if(selected_io)
		selected_io = null
		to_chat(user, span_notice("You clear the wired connection from the multitool."))
	else
		..()
	update_icon()

/obj/item/multitool/update_icon()
	if(selected_io)
		if(buffer || connecting || connectable)
			icon_state = "multitool_tracking"
		else
			icon_state = "multitool_red"
	else
		if(buffer || connecting || connectable)
			icon_state = "multitool_tracking_fail"
		else if(accepting_refs)
			icon_state = "multitool_ref_scan"
		else if(weakref_wiring)
			icon_state = "multitool_no_camera"
		else
			icon_state = "multitool"

/obj/item/multitool/proc/wire(var/datum/integrated_io/io, mob/user)
	if(!io.holder.assembly)
		to_chat(user, span_warning("\The [io.holder] needs to be secured inside an assembly first."))
		return

	if(selected_io)
		if(io == selected_io)
			to_chat(user, span_warning("Wiring \the [selected_io.holder]'s [selected_io.name] into itself is rather pointless."))
			return
		if(io.io_type != selected_io.io_type)
			to_chat(user, span_warning("Those two types of channels are incompatible. The first is a [selected_io.io_type], \
			while the second is a [io.io_type]."))
			return
		if(io.holder.assembly && io.holder.assembly != selected_io.holder.assembly)
			to_chat(user, span_warning("Both \the [io.holder] and \the [selected_io.holder] need to be inside the same assembly."))
			return
		selected_io.linked |= io
		io.linked |= selected_io

		to_chat(user, span_notice("You connect \the [selected_io.holder]'s [selected_io.name] to \the [io.holder]'s [io.name]."))
		selected_io.holder.interact(user) // This is to update the UI.
		selected_io = null

	else
		selected_io = io
		to_chat(user, span_notice("You link \the multitool to \the [selected_io.holder]'s [selected_io.name] data channel."))

	update_icon()


/obj/item/multitool/proc/unwire(var/datum/integrated_io/io1, var/datum/integrated_io/io2, mob/user)
	if(!io1.linked.len || !io2.linked.len)
		to_chat(user, span_warning("There is nothing connected to the data channel."))
		return

	if(!(io1 in io2.linked) || !(io2 in io1.linked) )
		to_chat(user, span_warning("These data pins aren't connected!"))
		return
	else
		io1.linked.Remove(io2)
		io2.linked.Remove(io1)
		to_chat(user, span_notice("You clip the data connection between the [io1.holder.displayed_name]'s \
		[io1.name] and the [io2.holder.displayed_name]'s [io2.name]."))
		io1.holder.interact(user) // This is to update the UI.
		update_icon()

/obj/item/multitool/afterattack(atom/target, mob/living/user, proximity)
	if(accepting_refs && toolmode == MULTITOOL_MODE_INTCIRCUITS && proximity)
		weakref_wiring = WEAKREF(target)
		visible_message(span_notice("[user] slides \a [src]'s over \the [target]."))
		to_chat(user, span_notice("You set \the [src]'s memory to a reference to [target.name] \[Ref\]. The ref scanner is \
		now off."))
		accepting_refs = 0









/obj/item/storage/bag/circuits
	name = "circuit kit"
	desc = "This kit's essential for any circuitry projects."
	icon = 'icons/obj/integrated_electronics/electronic_misc.dmi'
	icon_state = "circuit_kit"
	w_class = 3
	display_contents_with_number = 0
	can_hold = list(
		/obj/item/integrated_circuit,
		/obj/item/storage/bag/circuits/mini,
		/obj/item/electronic_assembly,
		/obj/item/integrated_electronics,
		/obj/item/tool/crowbar,
		/obj/item/tool/screwdriver,
		/obj/item/multitool,
		/obj/item/integrated_electronics/wirer, //CHOMP Edit,
		/obj/item/integrated_electronics/debugger, //CHOMP Edit,
		/obj/item/integrated_electronics/detailer, //CHOMP Edit,
		)

//CHOMPAdd, this whole proc. Emp'ing this one bag causes a recursion loop of over 700 emp_act's,
//Which is enough to trigger byond's recursion level protection
/obj/item/storage/bag/circuits/emp_act()
	return	//No

/obj/item/storage/bag/circuits/basic/Initialize(mapload)
	new /obj/item/storage/bag/circuits/mini/arithmetic(src)
	new /obj/item/storage/bag/circuits/mini/trig(src)
	new /obj/item/storage/bag/circuits/mini/input(src)
	new /obj/item/storage/bag/circuits/mini/output(src)
	new /obj/item/storage/bag/circuits/mini/memory(src)
	new /obj/item/storage/bag/circuits/mini/logic(src)
	new /obj/item/storage/bag/circuits/mini/time(src)
	new /obj/item/storage/bag/circuits/mini/reagents(src)
	new /obj/item/storage/bag/circuits/mini/transfer(src)
	new /obj/item/storage/bag/circuits/mini/converter(src)
	new /obj/item/storage/bag/circuits/mini/power(src)
	new /obj/item/electronic_assembly(src)
	new /obj/item/assembly/electronic_assembly(src)
	new /obj/item/assembly/electronic_assembly(src)
	new /obj/item/multitool(src)
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/integrated_electronics/wirer(src) //CHOMPEdit
	new /obj/item/integrated_electronics/debugger(src) //CHOMPEdit
	new /obj/item/integrated_electronics/detailer(src) //CHOMPEdit
	make_exact_fit()
	. = ..()

/obj/item/storage/bag/circuits/all/Initialize(mapload)
	new /obj/item/storage/bag/circuits/mini/arithmetic/all(src)
	new /obj/item/storage/bag/circuits/mini/trig/all(src)
	new /obj/item/storage/bag/circuits/mini/input/all(src)
	new /obj/item/storage/bag/circuits/mini/output/all(src)
	new /obj/item/storage/bag/circuits/mini/memory/all(src)
	new /obj/item/storage/bag/circuits/mini/logic/all(src)
	new /obj/item/storage/bag/circuits/mini/smart/all(src)
	new /obj/item/storage/bag/circuits/mini/manipulation/all(src)
	new /obj/item/storage/bag/circuits/mini/time/all(src)
	new /obj/item/storage/bag/circuits/mini/reagents/all(src)
	new /obj/item/storage/bag/circuits/mini/transfer/all(src)
	new /obj/item/storage/bag/circuits/mini/converter/all(src)
	new /obj/item/storage/bag/circuits/mini/power/all(src)

	new /obj/item/electronic_assembly(src)
	new /obj/item/electronic_assembly/medium(src)
	new /obj/item/electronic_assembly/large(src)
	new /obj/item/electronic_assembly/drone(src)
	new /obj/item/integrated_electronics/wirer(src)
	new /obj/item/integrated_electronics/debugger(src)
	new /obj/item/integrated_electronics/detailer(src) //CHOMPEdit
	new /obj/item/tool/crowbar(src)
	make_exact_fit()
	. = ..()

/obj/item/storage/bag/circuits/mini
	name = "circuit box"
	desc = "Used to partition categories of circuits, for a neater workspace."
	w_class = 2
	display_contents_with_number = 1
	can_hold = list(/obj/item/integrated_circuit)
	var/spawn_flags_to_use = IC_SPAWN_DEFAULT

/obj/item/storage/bag/circuits/mini/arithmetic
	name = "arithmetic circuit box"
	desc = "Warning: Contains math."
	icon_state = "box_arithmetic"

/obj/item/storage/bag/circuits/mini/arithmetic/all // Don't believe this will ever be needed.
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/arithmetic/Initialize(mapload)
	for(var/obj/item/integrated_circuit/arithmetic/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/trig
	name = "trig circuit box"
	desc = "Danger: Contains more math."
	icon_state = "box_trig"

/obj/item/storage/bag/circuits/mini/trig/all // Ditto
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/trig/Initialize(mapload)
	for(var/obj/item/integrated_circuit/trig/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/input
	name = "input circuit box"
	desc = "Tell these circuits everything you know."
	icon_state = "box_input"

/obj/item/storage/bag/circuits/mini/input/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/input/Initialize(mapload)
	for(var/obj/item/integrated_circuit/input/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/output
	name = "output circuit box"
	desc = "Circuits to interface with the world beyond itself."
	icon_state = "box_output"

/obj/item/storage/bag/circuits/mini/output/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/output/Initialize(mapload)
	for(var/obj/item/integrated_circuit/output/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/memory
	name = "memory circuit box"
	desc = "Machines can be quite forgetful without these."
	icon_state = "box_memory"

/obj/item/storage/bag/circuits/mini/memory/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/memory/Initialize(mapload)
	for(var/obj/item/integrated_circuit/memory/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/logic
	name = "logic circuit box"
	desc = "May or may not be Turing complete."
	icon_state = "box_logic"

/obj/item/storage/bag/circuits/mini/logic/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/logic/Initialize(mapload)
	for(var/obj/item/integrated_circuit/logic/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/time
	name = "time circuit box"
	desc = "No time machine parts, sadly."
	icon_state = "box_time"

/obj/item/storage/bag/circuits/mini/time/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/time/Initialize(mapload)
	for(var/obj/item/integrated_circuit/time/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/reagents
	name = "reagent circuit box"
	desc = "Unlike most electronics, these circuits are supposed to come in contact with liquids."
	icon_state = "box_reagents"

/obj/item/storage/bag/circuits/mini/reagents/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/reagents/Initialize(mapload)
	for(var/obj/item/integrated_circuit/reagent/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/transfer
	name = "transfer circuit box"
	desc = "Useful for moving data representing something arbitrary to another arbitrary virtual place."
	icon_state = "box_transfer"

/obj/item/storage/bag/circuits/mini/transfer/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/transfer/Initialize(mapload)
	for(var/obj/item/integrated_circuit/transfer/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/converter
	name = "converter circuit box"
	desc = "Transform one piece of data to another type of data with these."
	icon_state = "box_converter"

/obj/item/storage/bag/circuits/mini/converter/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/converter/Initialize(mapload)
	for(var/obj/item/integrated_circuit/converter/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()

/obj/item/storage/bag/circuits/mini/smart
	name = "smart box"
	desc = "Sentience not included."
	icon_state = "box_ai"

/obj/item/storage/bag/circuits/mini/smart/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/smart/Initialize(mapload)
	for(var/obj/item/integrated_circuit/smart/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()

/obj/item/storage/bag/circuits/mini/manipulation
	name = "manipulation box"
	desc = "Make your machines actually useful with these."
	icon_state = "box_manipulation"

/obj/item/storage/bag/circuits/mini/manipulation/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/manipulation/Initialize(mapload)
	for(var/obj/item/integrated_circuit/manipulation/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()


/obj/item/storage/bag/circuits/mini/power
	name = "power circuit box"
	desc = "Electronics generally require electricity."
	icon_state = "box_power"

/obj/item/storage/bag/circuits/mini/power/all
	spawn_flags_to_use = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/storage/bag/circuits/mini/power/Initialize(mapload)
	for(var/obj/item/integrated_circuit/passive/power/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	for(var/obj/item/integrated_circuit/power/IC in GLOB.all_integrated_circuits)
		if(IC.spawn_flags & spawn_flags_to_use)
			for(var/i = 1 to 4)
				new IC.type(src)
	make_exact_fit()
	. = ..()
