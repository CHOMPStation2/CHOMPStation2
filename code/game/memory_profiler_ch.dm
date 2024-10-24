#define LOOP_STEP_SIZE 25000
//#define MEM_NO_CHECK_TICK
#ifdef MEM_NO_CHECK_TICK
/world
	loop_checks = 0
#endif
/proc/cmp_numeric_desc(a,b)
	return b - a

/proc/profile_memory()
	if(usr?.client)
		if(tgui_alert(usr,"Running this will likely cause minor lag for around 20 minutes and the server will freeze for a bit at the end", "Profile memory", list("Yes", "No")) != "Yes")
			return
	var/list/types_count = list()
	var/list/mem_count = list()
	var/list/by_variable = list()
	var/list/list_of_lists = list()
	var/list/list_count = list()
	var/list/exclude_vars = list("overlays","underlays","vis_contents","vis_locs","contents","vars","verbs")
	world.log << "Counting memory for atoms"
	var/i = 0
	var/total_time = 0
	rustg_time_reset("fops")
	for(var/datum/thing in world)
		types_count[thing.type]++
		#ifndef MEM_NO_CHECK_TICK
		if(!thing || QDELETED(thing)) continue
		#endif
		if(i%LOOP_STEP_SIZE==0)
			var/ms = rustg_time_milliseconds("fops")
			total_time += ms
			rustg_time_reset("fops")
			world.log << "[i] atoms processed in [total_time/1000] seconds. ([ms]ms for chunk)"
			world.log << "list of lists at [list_of_lists.len] before pruning"
			prune_list(list_of_lists)
			world.log << "list of lists at [list_of_lists.len] after pruning"
		mem_and_lists(thing,list_of_lists,list_count,exclude_vars,mem_count,by_variable)
		i++
		#ifndef MEM_NO_CHECK_TICK
		CHECK_TICK
		#endif
	i = 0
	world.log << "Counting memory for datums"
	for(var/datum/thing)
		types_count[thing.type]++
		#ifndef MEM_NO_CHECK_TICK
		if(!thing || QDELETED(thing)) continue
		#endif
		if(i%LOOP_STEP_SIZE==0)
			var/ms = rustg_time_milliseconds("fops")
			total_time += ms
			rustg_time_reset("fops")
			world.log << "[i] datums processed in [total_time/1000] seconds. ([ms]ms for chunk)"
			world.log << "list of lists at [list_of_lists.len] before pruning"
			prune_list(list_of_lists)
			world.log << "list of lists at [list_of_lists.len] after pruning"
		mem_and_lists(thing,list_of_lists,list_count,exclude_vars,mem_count,by_variable)
		i++
		#ifndef MEM_NO_CHECK_TICK
		CHECK_TICK
		#endif
	var/accounted_for = 0
	for(var/type in mem_count) //Quickly prune anything below 10kb total usage to make sorting the list much faster
		accounted_for += mem_count[type]
		if(mem_count[type] < 10000) mem_count -= type
	world.log << "[display_bytes(accounted_for)] of memory accounted for"
	world.log << "Sorting and exporting data"
	to_world(span_alert("Memory profiler is exporting data. Expect server to freeze for 10-30 seconds."))
	sortTim(types_count, /proc/cmp_numeric_desc, TRUE)
	var/output = ""
	for(var/type in types_count)
		output += "[type] - [types_count[type]]\n"
	rustg_file_write(output, "data/stuff.txt")
	output = ""
	sortTim(mem_count, /proc/cmp_numeric_desc, TRUE)
	for(var/type in mem_count)
		var/mem_per_instance = mem_count[type] / types_count[type]
		output += "[type] - [display_bytes(mem_count[type])] total - [display_bytes(mem_per_instance)] per instance"
		if(type in list_count)
			var/lists_per_instance = list_count[type] / types_count[type]
			output += " - [list_count[type]] lists total - [lists_per_instance] per instance"
		output += "\n"
	var/ms = rustg_time_milliseconds("fops")
	rustg_file_write(output, "data/lists.txt")
	var/list/count_subtypes = list()
	for(var/type in types_count)
		add_types_val(type, count_subtypes, types_count[type])
	var/list/mem_count_subtypes = list()
	for(var/type in mem_count)
		add_types_val(type, mem_count_subtypes, mem_count[type])
	output = ""
	sortTim(mem_count_subtypes, /proc/cmp_numeric_desc, TRUE)
	for(var/type in mem_count_subtypes)
		var/mem_per_instance = mem_count_subtypes[type] / count_subtypes[type]
		output += "[type] - [display_bytes(mem_count_subtypes[type])] total - [display_bytes(mem_per_instance)] per instance"
		output += "\n"
	rustg_file_write(output, "data/lists-subtypes.txt")
	output = ""
	sortTim(by_variable, /proc/cmp_numeric_desc, TRUE)
	for(var/type in by_variable)
		output += "[type] - [display_bytes(by_variable[type])] total"
		output += "\n"
	total_time += ms
	rustg_time_reset("fops")
	output += "\nTotal time: [total_time/1000] seconds"
	rustg_file_write(output, "data/membyvariable.txt")

	world.log << "Finished in [total_time/1000] seconds"


/proc/prune_list(var/list/list_of_lists)
	if(!list_of_lists.len) return
	for(var/list/L in list_of_lists)
		if(list_of_lists[L] == 1 && refcount(L) < 10) list_of_lists.Remove(list(L))

/proc/mem_and_lists(var/datum/thing,var/list/list_of_lists,var/list/list_count,var/list/exclude_vars,var/list/mem_count,var/list/by_variable)
	mem_count[thing.type] += 24
	for(var/variable in thing.vars)
		if(variable == "vars") continue
		if(islist(thing.vars[variable]))
			if(!(variable in exclude_vars) && refcount(thing.vars[variable]) > 1 && (thing.vars[variable] in list_of_lists))
				if(thing.vars[variable] != initial(thing.vars[variable]))
					mem_count[thing.type] += 16
					by_variable[variable] += 16
				list_of_lists[thing.vars[variable]]++
				continue
			if(thing.vars[variable] != initial(thing.vars[variable]))
				if(!(variable in exclude_vars) && refcount(thing.vars[variable]) > 1) list_of_lists[thing.vars[variable]] = 1
				var/mem_size = list_memory_size(thing.vars[variable],list_of_lists)
				mem_count[thing.type] += mem_size
				by_variable[variable] += mem_size
				if(variable in exclude_vars)
					continue
				if(thing.type in list_count) list_count[thing.type]++
				else list_count[thing.type] = 1
		else if(thing.vars[variable] != initial(thing.vars[variable]))
			mem_count[thing.type] += 16
			by_variable[variable] += 16

/proc/list_memory_size(list/L,list/list_of_lists,list/recursed_from)
	if(L in recursed_from || LAZYLEN(recursed_from) > 64 || (LAZYLEN(recursed_from) && (L in list_of_lists))) return 0
	if(LAZYLEN(recursed_from) && refcount(L) > 4)
		if(L in list_of_lists) list_of_lists[L]++
		else list_of_lists[L] = 1
	var/total = 24
	var/associative = is_associative(L)
	var/per_item = associative ? 48 : 8
	if(L.len < 8)
		total += 8 * per_item
		per_item = 0
	for(var/item in L)
		total += per_item
		if(recursed_from) recursed_from[++recursed_from.len] = L
		else recursed_from = list(L)
		if(associative && islist(L[item]))
			total += list_memory_size(L[item],list_of_lists,recursed_from.Copy())
		if(islist(item))
			total += list_memory_size(item,list_of_lists,recursed_from.Copy())
	return total



//This feels like it shouldn't work but it does
/proc/is_associative(list/L)
	try
		for(var/item in L)
			if(!isnum(item) && L[item]) return TRUE
			if(!L[item]) return FALSE
	catch
		return FALSE

/proc/add_types(var/datum/thing, var/list/L)
	var/type = thing::type
	var/p_type = thing::parent_type
	if(type in L) L[type]++
	else L[type] = 1
	if(p_type) add_types(p_type, L)

/proc/add_types_val(var/datum/thing, var/list/L, var/val)
	var/type = thing::type
	var/p_type = thing::parent_type
	L[type] += val
	if(p_type) add_types_val(p_type, L, val)
/*
/datum/controller/master/SetRunLevel(new_runlevel)
	if(new_runlevel == RUNLEVEL_GAME)
		spawn(300)
			get_stuff()
	. = ..(new_runlevel)
*/
/proc/display_bytes(num_bytes)
	if(num_bytes > 10000000)
		return "[num_bytes/1000000] mb"
	if(num_bytes > 10000)
		return "[num_bytes/1000] kb"
	return "[num_bytes] b"
