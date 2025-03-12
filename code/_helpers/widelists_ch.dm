GLOBAL_LIST_EMPTY(widelists)

/proc/widelist(var/list/input_list)
	var/list_hash = gen_hash_list(input_list)
	if(!(list_hash in GLOB.widelists))
		GLOB.widelists[list_hash] = input_list
	return GLOB.widelists[list_hash]

/proc/gen_hash_list(var/list/input_list)
	var/string = ""
	for(var/item in input_list)
		var/p1 = ""
		if(islist(item))
			p1 = ">>>::-;[gen_hash_list(item)];-::<<<"
		else
			p1 = "[item]"

		var/p2 = ""
		if(islist(input_list[item]))
			p2 = ">>>::-;[gen_hash_list(input_list[item])];-::<<<"
		else
			p2 = "[input_list[item]]"

		string += "[p1]::--::[p2]::;;;"
	return md5(string)
