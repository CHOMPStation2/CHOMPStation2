// This is a set of datums instantiated by SSpersistence.
// They basically just handle loading, processing and saving specific forms
// of persistent data like graffiti and round to round filth.

/datum/persistent
	var/name = null
	var/filename
	var/entries_expire_at						// Set in rounds, this controls when the item is finally removed permanently regardless if cleaned or not.
	var/entries_decay_at						// Set in rounds. This controls when item messages start getting scrambled.
	var/entry_decay_weight = 0.5
	var/has_admin_data

/datum/persistent/New()
	SetFilename()
	..()

/datum/persistent/proc/SetFilename()
	if(name)
		filename = "data/persistent/[lowertext(using_map.name)]-[lowertext(name)].json"
	if(!isnull(entries_decay_at) && !isnull(entries_expire_at))
		entries_decay_at = round(entries_expire_at * entries_decay_at)

<<<<<<< HEAD
/datum/persistent/proc/LabelTokens(var/list/tokens)
	var/list/labelled_tokens = list()
	labelled_tokens["x"] = text2num(tokens[1])
	labelled_tokens["y"] = text2num(tokens[2])
	labelled_tokens["z"] = text2num(tokens[3])
	labelled_tokens["age"] = text2num(tokens[4])
	return labelled_tokens

/datum/persistent/proc/GetValidTurf(var/turf/T, var/list/tokens)
	if(T && CheckTurfContents(T, tokens))
||||||| parent of ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
// Reads in list of text tokens taken from file, generates labelled list of actual token values
/datum/persistent/proc/LabelTokens(var/list/tokens)
	var/list/labelled_tokens = list()
	labelled_tokens["x"] = text2num(tokens[1])
	labelled_tokens["y"] = text2num(tokens[2])
	labelled_tokens["z"] = text2num(tokens[3])
	labelled_tokens["age"] = text2num(tokens[4])
	return labelled_tokens

/datum/persistent/proc/GetValidTurf(var/turf/T, var/list/tokens)
	if(T && CheckTurfContents(T, tokens))
=======
/datum/persistent/proc/GetValidTurf(var/turf/T, var/list/token)
	if(T && CheckTurfContents(T, token))
>>>>>>> ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
		return T

/datum/persistent/proc/CheckTurfContents(var/turf/T, var/list/token)
	return TRUE

/datum/persistent/proc/CheckTokenSanity(var/list/token)
	return ( \
		!isnull(token["x"]) && \
		!isnull(token["y"]) && \
		!isnull(token["z"]) && \
		!isnull(token["age"]) && \
		token["age"] <= entries_expire_at \
	)

<<<<<<< HEAD
/datum/persistent/proc/CreateEntryInstance(var/turf/creating, var/list/tokens)
||||||| parent of ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
// Restores saved data to world
/datum/persistent/proc/CreateEntryInstance(var/turf/creating, var/list/tokens)
=======
// Restores saved data to world
/datum/persistent/proc/CreateEntryInstance(var/turf/creating, var/list/token)
>>>>>>> ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
	return

/datum/persistent/proc/ProcessAndApplyTokens(var/list/tokens)

	// If it's old enough we start to trim down any textual information and scramble strings.
	for(var/list/token in tokens)
		if(token["message"] && !isnull(entries_decay_at) && !isnull(entry_decay_weight))
			var/_n =       token["age"]
			var/_message = token["message"]
			if(_n >= entries_decay_at)
				var/decayed_message = ""
				for(var/i = 1 to length(_message))
					var/char = copytext(_message, i, i + 1)
					if(prob(round(_n * entry_decay_weight)))
						if(prob(99))
							decayed_message += pick(".",",","-","'","\\","/","\"",":",";")
					else
						decayed_message += char
				_message = decayed_message
			if(length(_message))
				token["message"] = _message
			else
				return

		var/_z = token["z"]
		if(_z in using_map.station_levels)
			. = GetValidTurf(locate(token["x"], token["y"], _z), token)
			if(.)
				CreateEntryInstance(., token)

/datum/persistent/proc/IsValidEntry(var/atom/entry)
	if(!istype(entry))
		return FALSE
	if(GetEntryAge(entry) >= entries_expire_at)
		return FALSE
	var/turf/T = get_turf(entry)
	if(!T || !(T.z in using_map.station_levels) )
		return FALSE
	var/area/A = get_area(T)
	if(!A || (A.flags & AREA_FLAG_IS_NOT_PERSISTENT))
		return FALSE
	return TRUE

/datum/persistent/proc/GetEntryAge(var/atom/entry)
	return 0

/datum/persistent/proc/CompileEntry(var/atom/entry)
	var/turf/T = get_turf(entry)
<<<<<<< HEAD
	. = list(
		T.x,
		T.y,
		T.z,
		GetEntryAge(entry)
||||||| parent of ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
	return list(
		T.x,
		T.y,
		T.z,
		GetEntryAge(entry)
=======
	return list(
		"x" = T.x,
		"y" = T.y,
		"z" = T.z,
		"age" = GetEntryAge(entry)
>>>>>>> ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
	)

/datum/persistent/proc/Initialize()
	if(fexists(filename))
		var/list/tokens = json_decode(file2text(filename))
		for(var/list/token in tokens)
			if(!CheckTokenSanity(token))
				tokens -= token
		ProcessAndApplyTokens(tokens)

/datum/persistent/proc/Shutdown()
	if(fexists(filename))
		fdel(filename)
	
	var/list/to_store = list()
	for(var/thing in SSpersistence.tracking_values[type])
<<<<<<< HEAD
		if(IsValidEntry(thing))
			var/list/entry = CompileEntry(thing)
			if(tokens_per_line == PERSISTENCE_VARIABLE_TOKEN_LENGTH || \
					LAZYLEN(entry) == tokens_per_line)
				for(var/i = 1 to LAZYLEN(entry))
					if(istext(entry[i]))
						entry[i] = replacetext(entry[i], file_entry_split_character, file_entry_substitute_character)
				to_file(write_file, jointext(entry, file_entry_split_character))
||||||| parent of ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets
		if(IsValidEntry(thing))
			var/list/entry = CompileEntry(thing)
			if(tokens_per_line == PERSISTENCE_VARIABLE_TOKEN_LENGTH || \
					LAZYLEN(entry) == tokens_per_line)
				for(var/i = 1 to LAZYLEN(entry))
					if(istext(entry[i]))
						entry[i] = replacetext(entry[i], file_entry_split_character, file_entry_substitute_character)
				to_file(write_file, jointext(entry, file_entry_split_character))
=======
		if(!IsValidEntry(thing))
			continue
		to_store[++to_store.len] = CompileEntry(thing)

	if(to_store.len)
		to_file(file(filename), json_encode(to_store))
>>>>>>> ba346f5f63... Merge pull request #10325 from VOREStation/Arokha/persistsheets

/datum/persistent/proc/RemoveValue(var/atom/value)
	qdel(value)

/datum/persistent/proc/GetAdminSummary(var/mob/user, var/can_modify)
	var/list/my_tracks = SSpersistence.tracking_values[type]
	if(!my_tracks?.len)
		return
	
	. = list("<tr><td colspan = 4><b>[capitalize(name)]</b></td></tr>")
	. += "<tr><td colspan = 4><hr></td></tr>"
	
	for(var/thing in my_tracks)
		. += "<tr>[GetAdminDataStringFor(thing, can_modify, user)]</tr>"
	. += "<tr><td colspan = 4><hr></td></tr>"


/datum/persistent/proc/GetAdminDataStringFor(var/thing, var/can_modify, var/mob/user)
	if(can_modify)
		. = "<td colspan = 3>[thing]</td><td><a href='byond://?src=\ref[src];caller=\ref[user];remove_entry=\ref[thing]'>Destroy</a></td>"
	else
		. = "<td colspan = 4>[thing]</td>"

/datum/persistent/Topic(var/href, var/href_list)
	. = ..()
	if(!.)
		if(href_list["remove_entry"])
			var/datum/value = locate(href_list["remove_entry"])
			if(istype(value))
				RemoveValue(value)
				. = TRUE
		if(.)
			var/mob/user = locate(href_list["caller"])
			if(user)
				SSpersistence.show_info(user)