/world
	loop_checks = 0

/proc/get_stuff()
	var/list/types_count = list()
	for(var/datum/thing in world)
		add_types(thing, types_count)
	for(var/datum/thing)
		add_types(thing, types_count)
	sortTim(types_count, /proc/cmp_numeric_asc, TRUE)
	var/output = ""
	for(var/type in types_count)
		output += "[type] - [types_count[type]]\n"
	rustg_file_write(output, "data/stuff.txt")
	output = ""
	var/list/mem_count = list()
	var/list/list_of_lists = list()
	var/list/list_count = list()
	var/list/exclude_vars = list("overlays","underlays","vis_contents","vis_locs","contents","vars","verbs")
	for(var/datum/thing in world)
		mem_and_lists(thing,list_of_lists,list_count,exclude_vars,mem_count)
	for(var/datum/thing)
		mem_and_lists(thing,list_of_lists,list_count,exclude_vars,mem_count)
	sortTim(mem_count, /proc/cmp_numeric_asc, TRUE)
	for(var/type in mem_count)
		var/mem_per_instance = mem_count[type] / types_count[type]
		output += "[type] - [mem_count[type]] bytes total - [mem_per_instance] bytes per instance"
		if(type in list_count)
			var/lists_per_instance = list_count[type] / types_count[type]
			output += " - [list_count[type]] lists total - [lists_per_instance] per instance"
		output += "\n"
	rustg_file_write(output, "data/lists.txt")

/proc/mem_and_lists(var/datum/thing,var/list/list_of_lists,var/list/list_count,var/list/exclude_vars,var/list/mem_count)
	for(var/variable in thing.vars)
		if(islist(thing.vars[variable]))
			if(!(thing.vars[variable] in list_of_lists) && thing.vars[variable] != initial(thing.vars[variable]))
				list_of_lists[++list_of_lists.len] = thing.vars[variable]
				var/mem_size = list_memory_size(thing.vars[variable],list_of_lists)
				if(thing.type in mem_count) mem_count[thing.type] += mem_size
				else mem_count[thing.type] = mem_size
				if(variable in exclude_vars)
					continue
				if(thing.type in list_count) list_count[thing.type]++
				else list_count[thing.type] = 1
		else
			if(thing.vars[variable] != initial(thing.vars[variable]))
				if(thing.type in mem_count) mem_count[thing.type] += 16
				else mem_count[thing.type] = 16

/proc/list_memory_size(list/L,list/list_of_lists,list/recursed_from)
	if(L in recursed_from || recursed_from.len > 64 || (LAZYLEN(recursed_from) && (L in list_of_lists))) return 0
	if(LAZYLEN(recursed_from))
		list_of_lists[++list_of_lists.len] = L
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
			total += list_memory_size(L[item],list_of_lists,recursed_from)
		if(islist(item))
			total += list_memory_size(item,list_of_lists,recursed_from)



//This feels like it shouldn't work but it does
/proc/is_associative(list/L)
	try
		for(var/item in L)
			if(!isnum(item) && L[item]) return TRUE
			if(!L[item]) return FALSE
	catch(var/exception/e)
		return FALSE

/proc/add_types(var/datum/thing, var/list/L)
	var/type = thing::type
	var/p_type = thing::parent_type
	if(type in L) L[type]++
	else L[type] = 1
	if(p_type) add_types(p_type, L)

/datum/controller/master/SetRunLevel(new_runlevel)
	if(new_runlevel == RUNLEVEL_LOBBY)
		get_stuff()
	. = ..(new_runlevel)
