/*
 * Hooks to set up the shipping system for the round.
 */

// Snowflake marker for now. Because easy modularity.
/obj/effect/landmark/shipping_marker/New()
	switch (name)
		if ("return")
			shippping_return = loc

	delete_me = TRUE

/**
 * Does all of the shipping ID init at round start.
 */
/hook/startup/proc/initialize_shipping()
	if (!shippping_return)
		error("Global shipping return point is not marked.")

	load_shipping_ids()

	return 1

/**
 * @name	load_shipping_ids
 * @desc	Will load the shipping_ids.txt and save it into the global_shipping_ids list.
 *			Expects a format of "shippingID /path/to/item" per every line.
 *			Will ignore all bad lines and log them as debug info.
 */
/proc/load_shipping_ids()
	var/list/lines = file2list("config/shipping_ids.txt")

	for (var/line in lines)
		var/list/tuple = splittext(line, " ")
		if (!tuple || tuple.len != 2)
			log_debug("Invalid data when reading shipping_ids. '[line]'")
			continue

		global_shipping_ids[tuple[1]] = tuple[2]
		global_shipping_paths[tuple[2]] = tuple[1]