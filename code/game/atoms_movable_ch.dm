//gonna be honest this is really just a ripoff of tg's recursive hearing
/atom/movable
	var/recursive_listeners
	var/listening_recursive = NON_LISTENING_ATOM

/atom/movable/New()
	. = ..()
	if (listening_recursive)
		set_listening(listening_recursive)

/atom/movable/Destroy()
	. = ..()
	set_listening(NON_LISTENING_ATOM)

/atom/movable/proc/set_listening(var/set_to)
	if (listening_recursive && !set_to)
		LAZYREMOVE(recursive_listeners, src)
		if (!LAZYLEN(recursive_listeners))
			for (var/atom/movable/location as anything in get_nested_locs(src))
				LAZYREMOVE(location.recursive_listeners, src)
	if (!listening_recursive && set_to)
		LAZYOR(recursive_listeners, src)
		for (var/atom/movable/location as anything in get_nested_locs(src))
			LAZYOR(location.recursive_listeners, src)
	listening_recursive = set_to

///Returns a list of all locations (except the area) the movable is within.
/proc/get_nested_locs(atom/movable/atom_on_location, include_turf = FALSE)
	. = list()
	var/atom/location = atom_on_location.loc
	var/turf/our_turf = get_turf(atom_on_location)
	while(location && location != our_turf)
		. += location
		location = location.loc
	if(our_turf && include_turf) //At this point, only the turf is left, provided it exists.
		. += our_turf

/atom/movable/Exited(atom/movable/gone, atom/new_loc)
	. = ..()

	if (!LAZYLEN(gone.recursive_listeners))
		return
	for (var/atom/movable/location as anything in get_nested_locs(src)|src)
		LAZYREMOVE(location.recursive_listeners, gone.recursive_listeners)

/atom/movable/Entered(atom/movable/arrived, atom/old_loc)
	. = ..()

	if (!LAZYLEN(arrived.recursive_listeners))
		return
	for (var/atom/movable/location as anything in get_nested_locs(src)|src)
		LAZYOR(location.recursive_listeners, arrived.recursive_listeners)

// Helper procs called on entering/exiting a belly. Does nothing by default, override on children for special behavior.
/atom/movable/proc/enter_belly(obj/belly/B)
	return

/atom/movable/proc/exit_belly(obj/belly/B)
	return

/atom/movable/proc/show_message(msg, type, alt, alt_type)//Message, type of message (1 or 2), alternative message, alt message type (1 or 2)
	return

/atom/movable/proc/abstract_move(atom/new_loc)
	var/atom/old_loc = loc
	var/direction = get_dir(old_loc, new_loc)
	loc = new_loc
	Moved(old_loc, direction, TRUE)
