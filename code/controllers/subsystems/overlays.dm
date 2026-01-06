//CHOMPEDIT -- this file is no longer ticked. See overlays_ch.dm for the new overlays subsystem.

SUBSYSTEM_DEF(overlays)
	name = "Overlay"
	flags = SS_NO_FIRE|SS_NO_INIT
	var/list/stats

/datum/controller/subsystem/overlays/PreInit()
	stats = list()

/datum/controller/subsystem/overlays/Shutdown()
	WRITE_LOG("[GLOB.log_directory]-overlay.log", render_stats(stats))

/datum/controller/subsystem/overlays/Recover()
	stats = SSoverlays.stats

<<<<<<< HEAD
/datum/controller/subsystem/overlays/Initialize()
	fire(FALSE, TRUE)
	return SS_INIT_SUCCESS
=======
/// Converts an overlay list into text for debug printing
/// Of note: overlays aren't actually mutable appearances, they're just appearances
/// Don't have access to that type tho, so this is the best you're gonna get
/proc/overlays2text(list/overlays)
	var/list/unique_overlays = list()
	// As anything because we're basically doing type coerrsion, rather then actually filtering for mutable apperances
	for(var/mutable_appearance/overlay as anything in overlays)
		var/key = "[overlay.icon]-[overlay.icon_state]-[overlay.dir]"
		unique_overlays[key] += 1
	var/list/output_text = list()
	for(var/key in unique_overlays)
		output_text += "([key]) = [unique_overlays[key]]"
	return output_text.Join("\n")

/proc/iconstate2appearance(icon, iconstate)
	var/static/image/stringbro = new()
	stringbro.icon = icon
	stringbro.icon_state = iconstate
	return stringbro.appearance
>>>>>>> c7c3a151ec (up ports the TG overlays subsystem update (#18945))

/proc/icon2appearance(icon)
	var/static/image/iconbro = new()
	iconbro.icon = icon
	return iconbro.appearance

<<<<<<< HEAD
/datum/controller/subsystem/overlays/fire(resumed, no_mc_tick)
	var/count = 1
	for (var/atom/atom as anything in queue)
		++count
		atom?.UpdateOverlays()
		if (no_mc_tick)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			queue.Cut(1, count)
			return
	queue.Cut()


/datum/controller/subsystem/overlays/proc/GetStateAppearance(icon, state)
	var/list/subcache = state_cache[icon]
	if (!subcache)
		subcache = list()
		state_cache[icon] = subcache
	if (!subcache[state])
		var/image/image = new (icon, null, state)
		subcache[state] = image.appearance
		++cache_size
	return subcache[state]


/datum/controller/subsystem/overlays/proc/GetIconAppearance(icon)
	if (!icon_cache[icon])
		var/image/image = new (icon)
		icon_cache[icon] = image.appearance
		++cache_size
	return icon_cache[icon]


/datum/controller/subsystem/overlays/proc/GetAppearanceList(atom/subject, list/sources)
	if (!sources)
		return list()
	if (!islist(sources))
		sources = list(sources)
	var/list/result = list()
	var/icon/icon = subject.icon
	for (var/atom/entry as anything in sources)
		AppearanceListEntry(entry, result, icon)
	return result

//Fixes runtime with overlays present in 515
/datum/controller/subsystem/overlays/proc/AppearanceListEntry(var/atom/entry,var/list/result,var/icon/icon)
	if (!entry)
		return
	else if(islist(entry))
		var/list/entry_list = entry
		for(var/entry_item in entry_list)
			AppearanceListEntry(entry_item)
	else if (istext(entry))
		result += GetStateAppearance(icon, entry)
	else if (isicon(entry))
		result += GetIconAppearance(entry)
	else
		if (isloc(entry))
			if (entry.flags & OVERLAY_QUEUED)
				entry.ImmediateOverlayUpdate()
		if (!ispath(entry))
			if(entry.appearance)
				result += entry.appearance
=======
/atom/proc/build_appearance_list(list/build_overlays)
	if (!islist(build_overlays))
		build_overlays = list(build_overlays)
	if(priority_overlays)
		var/list/prio_overlay_temp
		if(!islist(priority_overlays))
			prio_overlay_temp = list(priority_overlays)
>>>>>>> c7c3a151ec (up ports the TG overlays subsystem update (#18945))
		else
			prio_overlay_temp = priority_overlays.Copy()
		prio_overlay_temp |= build_overlays
		build_overlays = prio_overlay_temp
	for (var/overlay in build_overlays)
		if(!overlay)
			build_overlays -= overlay
			continue
		if (istext(overlay))
			// This is too expensive to run normally but running it during CI is a good test
			/*if (PERFORM_ALL_TESTS(focus_only/invalid_overlays))
				var/list/icon_states_available = icon_states(icon)
				if(!(overlay in icon_states_available))
					var/icon_file = "[icon]" || "Unknown Generated Icon"
					stack_trace("Invalid overlay: Icon object '[icon_file]' [REF(icon)] used in '[src]' [type] is missing icon state [overlay].")
					continue*/

			var/index = build_overlays.Find(overlay)
			build_overlays[index] = iconstate2appearance(icon, overlay)
		else if(isicon(overlay))
			var/index = build_overlays.Find(overlay)
			build_overlays[index] = icon2appearance(overlay)
	return build_overlays

/atom/proc/cut_overlays(priority)
	STAT_START_STOPWATCH
	if(priority)
		priority_overlays = null
	overlays = null
	//POST_OVERLAY_CHANGE(src)
	STAT_STOP_STOPWATCH
	STAT_LOG_ENTRY(SSoverlays.stats, type)

/atom/proc/cut_overlay(list/remove_overlays, priority)
	if(!overlays)
		return
	STAT_START_STOPWATCH
	if(priority)
		priority_overlays -= remove_overlays
	if(islist(remove_overlays))
		remove_overlays = remove_overlays.Copy() //May not be ideal to copy, but as build_appearance_list modifies lists in place which breaks certain things
	overlays -= build_appearance_list(remove_overlays)
	//POST_OVERLAY_CHANGE(src)
	STAT_STOP_STOPWATCH
	STAT_LOG_ENTRY(SSoverlays.stats, type)

/atom/proc/add_overlay(list/add_overlays, priority)
	if(!overlays)
		return
	STAT_START_STOPWATCH
	if(islist(add_overlays))
		if(priority)
			if (priority_overlays)
				priority_overlays += add_overlays
			else
				priority_overlays = add_overlays
		add_overlays = add_overlays.Copy() //May not be ideal to copy, but as build_appearance_list modifies lists in place which breaks certain things
	overlays += build_appearance_list(add_overlays) //May not be ideal to copy, but as build_appearance_list modifies lists in place which breaks certain things
	VALIDATE_OVERLAY_LIMIT(src)
	//POST_OVERLAY_CHANGE(src)
	STAT_STOP_STOPWATCH
	STAT_LOG_ENTRY(SSoverlays.stats, type)

/atom/proc/copy_overlays(atom/other, cut_old) //copys our_overlays from another atom
	if(!other)
		if(cut_old)
			cut_overlays()
		return

	STAT_START_STOPWATCH
	var/list/cached_other = other.overlays.Copy()
	if(cut_old)
		if(cached_other)
			overlays = cached_other
		else
			overlays = null
		VALIDATE_OVERLAY_LIMIT(src)
		//POST_OVERLAY_CHANGE(src)
		STAT_STOP_STOPWATCH
		STAT_LOG_ENTRY(SSoverlays.stats, type)
	else if(cached_other)
		overlays += cached_other
		VALIDATE_OVERLAY_LIMIT(src)
		//POST_OVERLAY_CHANGE(src)
		STAT_STOP_STOPWATCH
		STAT_LOG_ENTRY(SSoverlays.stats, type)

//TODO: Better solution for these?
/image/proc/add_overlay(x)
	overlays |= x

/image/proc/cut_overlay(x)
	overlays -= x

/image/proc/cut_overlays(x)
	overlays.Cut()

/image/proc/copy_overlays(atom/other, cut_old)
	if(!other)
		if(cut_old)
			cut_overlays()
		return

	var/list/cached_other = other.overlays.Copy()
	if(cached_other)
		if(cut_old || !overlays.len)
			overlays = cached_other
		else
			overlays |= cached_other
	else if(cut_old)
		cut_overlays()

// Debug procs

/atom
	/// List of overlay "keys" (info about the appearance) -> mutable versions of static appearances
	/// Drawn from the overlays list
	var/list/realized_overlays
	/// List of underlay "keys" (info about the appearance) -> mutable versions of static appearances
	/// Drawn from the underlays list
	var/list/realized_underlays

/image
	/// List of overlay "keys" (info about the appearance) -> mutable versions of static appearances
	/// Drawn from the overlays list
	var/list/realized_overlays
	/// List of underlay "keys" (info about the appearance) -> mutable versions of static appearances
	/// Drawn from the underlays list
	var/list/realized_underlays

/// Takes the atoms's existing overlays and underlays, and makes them mutable so they can be properly vv'd in the realized_overlays/underlays list
/atom/proc/realize_overlays()
	realized_overlays = realize_appearance_queue(overlays)
	realized_underlays = realize_appearance_queue(underlays)

/// Takes the image's existing overlays, and makes them mutable so they can be properly vv'd in the realized_overlays list
/image/proc/realize_overlays()
	realized_overlays = realize_appearance_queue(overlays)
	realized_underlays = realize_appearance_queue(underlays)

/// Takes a list of appearnces, makes them mutable so they can be properly vv'd and inspected
/proc/realize_appearance_queue(list/appearances)
	var/list/real_appearances = list()
	var/list/queue = appearances.Copy()
	var/queue_index = 0
	while(queue_index < length(queue))
		queue_index++
		// If it's not a command, we assert that it's an appearance
		var/mutable_appearance/appearance = queue[queue_index]
		if(!appearance) // Who fucking adds nulls to their sublists god you people are the worst
			continue

		var/mutable_appearance/new_appearance = new /mutable_appearance()
		new_appearance.appearance = appearance
		var/key = "[appearance.icon]-[appearance.icon_state]-[appearance.plane]-[appearance.layer]-[appearance.dir]-[appearance.color]"
		var/tmp_key = key
		var/appearance_indx = 1
		while(real_appearances[tmp_key])
			tmp_key = "[key]-[appearance_indx]"
			appearance_indx++

		real_appearances[tmp_key] = new_appearance
		var/add_index = queue_index
		// Now check its children
		for(var/mutable_appearance/child_appearance as anything in appearance.overlays)
			add_index++
			queue.Insert(add_index, child_appearance)
		for(var/mutable_appearance/child_appearance as anything in appearance.underlays)
			add_index++
			queue.Insert(add_index, child_appearance)
	return real_appearances

/// Takes two appearances as args, prints out, logs, and returns a text representation of their differences
/// Including suboverlays
/proc/diff_appearances(mutable_appearance/first, mutable_appearance/second, iter = 0)
	var/list/diffs = list()
	var/list/firstdeet = first.vars
	var/list/seconddeet = second.vars
	var/diff_found = FALSE
	for(var/name in first.vars)
		var/firstv = firstdeet[name]
		var/secondv = seconddeet[name]
		if(firstv ~= secondv)
			continue
		if((islist(firstv) || islist(secondv)) && length(firstv) == 0 && length(secondv) == 0)
			continue
		if(name == "vars") // Go away
			continue
		if(name == "_listen_lookup") // This is just gonna happen with marked datums, don't care
			continue
		if(name == "overlays")
			first.realize_overlays()
			second.realize_overlays()
			var/overlays_differ = FALSE
			for(var/i in 1 to length(first.realized_overlays))
				if(diff_appearances(first.realized_overlays[i], second.realized_overlays[i], iter + 1))
					overlays_differ = TRUE

			if(!overlays_differ)
				continue

		diff_found = TRUE
		diffs += "Diffs detected at [name]: First ([firstv]), Second ([secondv])"

	var/text = "Depth of: [iter]\n\t[diffs.Join("\n\t")]"
	message_admins(text)
	log_world(text)
	return diff_found

//Legacy, does basically nothing
/atom/proc/ImmediateOverlayUpdate()
	if (gc_destroyed)
		if (length(overlays))
			overlays.Cut()
		return
