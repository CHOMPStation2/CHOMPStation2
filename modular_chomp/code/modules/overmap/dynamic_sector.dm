// This is an attempt to make space POI's which load/unload on demand, so we can have 50 overmap POI's without
// 50 z-levels (which may lead to OOM). No idea what forces I'm working with, so let's see how poorly this goes.
// Map templates for this system are stored in space_pois.dm.

GLOBAL_VAR_INIT(dynamic_sector_master, null)
// Also adjust find_z_levels() if you adjust increase dynamic levels, that part is hard-coded so you don't gloss over world.increment_max_z().
#define MAX_DYNAMIC_LEVELS 2
#define MAX_DYNAMIC_POI_DIMENSIONS 200 // Keep this an even number if using even world.maxx/maxy. This value MUST
// a large enough static border to fit OM ships. A 30x30 ship means max dimensions must be 60 less than the z-level max
// to keep a 30 turf border on each side of the load/unload area.

// The "master" object, which creates + stores + registers the actual z-levels used for dynamic POI's. Handles overmap
// sanity checks, + procs, should not be directly accessible by players. Do not use in maps. Only 1 should exist currently.
/obj/effect/overmap/visitable/dynamic
	name = "DO NOT USE IN MAPS"
	known = FALSE
	scannable = FALSE
	invisibility = INVISIBILITY_ABSTRACT
	in_space = FALSE //This prevents you from walking off the edge and getting soft-locked into the infinispace layer
	scanner_desc = "You should not see this."
	var/generated_z = FALSE
	var/base_area = /area/space

	// Initialized to match max dynamic levels.
	map_z = list(null,null,null)

	// Overmap poi's CURRENTLY USING a z-level. Dynamic POI's get referenced here when loading in and removed when unloaded.
	// Length must match map_z length or bad things may happen.
	var/list/active_pois[MAX_DYNAMIC_LEVELS]

	// Reference list of shuttle landmarks for each z-level. Used to register/unregister shuttle landmarks in POI's.
	var/list/shuttle_landmarks[MAX_DYNAMIC_LEVELS]
	var/list/all_children = list()


// This handles generating and assigning z-levels. Overriding this proc means we don't need a hacky Initialize() override.
// This means extra_z_levels won't do anything, which is intentional.
/obj/effect/overmap/visitable/dynamic/find_z_levels()
	if(!generated_z && (GLOB.dynamic_sector_master == src)) // Ensure this only runs once per round.
		for(var/i = 1; i <= 2; i++) // Hard-coding limit because this is dangerous.
			world.increment_max_z()
			map_z[i] = world.maxz
			// Spawn shuttle_landmarks near the lower x border, aligned with the POI spawning turf. These move during POI generation.
			var/turf/T = locate(10, round(world.maxy/2), map_z[i])
			if(istype(T))
				var/list/spawn_directions = list() // Stores a landmark for each direction.
				for(var/direction in list("FORE", "PORT", "AFT", "STARBOARD"))
					var/obj/effect/shuttle_landmark/om_poi/S = new(T, "Subspace sector [i] - [direction]", "dynamic_sector_[i] - [direction]")
					spawn_directions[direction] = S
				shuttle_landmarks[i] = spawn_directions
		generated_z = TRUE

/obj/effect/overmap/visitable/dynamic/Initialize(mapload, dyn_poi)
	if(!GLOB.dynamic_sector_master)
		GLOB.dynamic_sector_master = src
	. = ..()
	if(!dyn_poi)
		if(ispath(base_area))
			var/area/spehss = locate(base_area)
			if(!istype(spehss))
				CRASH("Dynamic POI generation couldn't locate area [base_area].")
			base_area = spehss
		create_children()

// Create POI objects for each overmap POI template, link to parent. Initialize() of children handles turf assignment
/obj/effect/overmap/visitable/dynamic/proc/create_children()
	for(var/datum/map_template/dynamic_overmap/poi as anything in subtypesof(/datum/map_template/dynamic_overmap))
		if(!initial(poi.mappath) || !initial(poi.name) || (initial(poi.block_size) > MAX_DYNAMIC_POI_DIMENSIONS)) // Exclude templates without an actual map or are too big (or are not included in the mapping subsystem map_templates)
			continue
		var/obj/effect/overmap/visitable/dynamic/poi/P = new(null, TRUE, SSmapping.map_templates[initial(poi.name)])
		P.parent = src
		all_children.Add(P)

// Randomly unload a child POI, if possible. Returns the index of the recovered level if successful, 0 if not.
// Should only be called if active_pois[] is full.
/obj/effect/overmap/visitable/dynamic/proc/cull_child(mob/user)
	var/random_index = rand(1,MAX_DYNAMIC_LEVELS)
	var/obj/effect/overmap/visitable/dynamic/poi/P

	// User selection. Remains random if user cancels.
	if(user)
		P = tgui_input_list(user, "Would you like to choose which link to sever?", "Sever link", active_pois)
		if(P && istype(P) && src.is_empty(P.my_index))
			random_index = P.my_index
			P.destroy_poi(user)
			active_pois[random_index] = null
			return random_index
		else
			return 0

	if(is_empty(random_index)) // If this z-level is empty, destroy the poi
		P = active_pois[random_index]
		P.destroy_poi(user)
		active_pois[random_index] = null // Should be set in destroy_poi but this lets us use the z-level again if anything goes horribly wrong.
		return random_index

	for(var/i = 1, i <= MAX_DYNAMIC_LEVELS, i++) // Level was not empty, check remaining levels
		if(i == random_index)
			continue // Don't run this one again.
		if(is_empty(i))
			P = active_pois[i]
			P.destroy_poi(user)
			active_pois[i] = null
			return i
	return 0

/obj/effect/overmap/visitable/dynamic/proc/is_empty(var/index, var/mob/observer)
	if(!LAZYLEN(map_z))
		log_and_message_admins("CANARY: [src] tried to check is_empty, but map_z is `[map_z || "null"]`")
		return TRUE
	if(!index)
		index = 1
	testing("Checking if sector at [map_z[index]] has no players.")
	for(var/mob/M in global.player_list)
		if(M != observer && (M.z == map_z[index]))
			testing("There are people on it.")
			return FALSE
	return TRUE

// You generally shouldn't destroy these.
/obj/effect/overmap/visitable/dynamic/Destroy()
	for(var/child in all_children)
		qdel(child)
	return ..()

// These are the player-viewable/interactible POI's which tell the parent how to use its z-levels. Spawned by the parent.
/obj/effect/overmap/visitable/dynamic/poi
	name = "bluespace static"
	unknown_name = "bluespace static"
	unknown_state = "poi"
	known = FALSE
	scannable = TRUE
	invisibility = INVISIBILITY_NONE
	in_space = TRUE
	map_z = list(null) // Override parent value
	active_pois = null
	var/obj/effect/overmap/visitable/dynamic/parent // The object which created us.
	var/datum/map_template/dynamic_overmap/my_template
	var/last_scanned = 0 // Timer to prevent spamming POI loading/unloading since that's probably exploitable.
	var/loaded = FALSE
	var/my_index = 0 // Tracks which z-level we're using in the parent. Corresponds to index in parent's active_pois[]

/obj/effect/overmap/visitable/dynamic/poi/Initialize(mapload, dyn_poi, var/template)
	if(!global.using_map.use_overmap || !template)
		return INITIALIZE_HINT_QDEL
	my_template = template
	. = ..(mapload, dyn_poi)



// Grab scanner info from map template, allow the user to load/unload POI's.
/obj/effect/overmap/visitable/dynamic/poi/get_scan_data(user)
	scanner_desc = my_template.scanner_desc
	if(!known)
		known = TRUE
		name = my_template.name
		icon_state = my_template.poi_icon
		color = my_template.poi_color
		desc = initial(desc)

	if(loaded)
		var/confirm = tgui_alert(user, "Sever bluespace link? This location will become permanently inaccessible.", "Are you sure?", list("No", "Yes"))
		if(confirm == "Yes")
			if(is_empty(1)) // Dynamic POI's should only ever have 1 entry in map_z
				destroy_poi(user) // Delete POI from dynamic z-level
			else
				to_chat(user, "Unable to sever link. Location likely contains living realspace entities.")
	else
		var/confirm = tgui_alert(user, "Transient subspace anomaly detected. Tether object to realspace?", "Stabilize anomaly?", list("Yes", "No"))
		if(confirm == "Yes")
			create_poi(user) // Load POI to dynamic z-level

	return ..()

// Loads POI template into a dynamic z-level
/obj/effect/overmap/visitable/dynamic/poi/proc/create_poi(mob/user)
	if(!parent) // Ideally this should never happen.
		log_and_message_admins("Dynamic overmap POI attempted to generate without a parent z-level.")
		qdel(src)
		return
	if(!my_template) // Also shouldn't happen.
		log_and_message_admins("Dynamic overmap POI attempted to generate without a map template.")
		qdel(src)
		return
	if(loaded) // These may only be created once.
		return
	if(last_scanned + 10 SECONDS > world.time)
		to_chat(user, "\[REDACTED\] matrix is still recharging!")
		return
	last_scanned = world.time

	for(var/i = 1, i <= MAX_DYNAMIC_LEVELS, i++)
		if(!parent.active_pois[i]) // We found an unused z-level
			my_index = i
			parent.active_pois[i] = src
			map_z[1] = parent.map_z[i]
			GLOB.map_sectors["[parent.map_z[i]]"] = src // Pass ownership of z-level to child, probably hacky and terribad, also mandatory for using forceMove() on shuttle landmarks
			break // Terminate loop
	if(!my_index) // No z-levels available
		var/confirm = tgui_alert(user, "\[REDACTED\] matrix at capacity; a bluespace link must be permanently severed to stabilize this anomaly. Continue?", "Are you sure?", list("No", "Yes"))
		if(confirm != "Yes")
			return
		my_index = parent.cull_child(user)
		if(my_index)
			parent.active_pois[my_index] = src
			map_z[1] = parent.map_z[my_index]
			GLOB.map_sectors["[parent.map_z[my_index]]"] = src
		else // Something went wrong, ideally due to all relevant z-levels containing players.
			to_chat(user, "Unable to sever any bluespace link. All links likely contain living realspace entities.")
			return

	var/turf/T = locate(round(world.maxx/2), round(world.maxy/2), map_z[1]) // Find center turf, or near center for even-dimension maps.
	if(!istype(T))
		log_debug("Dynamic overmap POI found [T] instead of a valid turf.")
		return

	// Move the shuttle landmarks.
	var/list/landmark_directions = parent.shuttle_landmarks[my_index] // Each shuttle_landmarks entry is an associative list.
	var/obj/effect/shuttle_landmark/om_poi/S = landmark_directions["FORE"]
	S.forceMove(locate(T.x, min(world.maxy, T.y + round(src.my_template.block_size/2) + rand(10,20)), T.z)) // Above
	add_landmark(S) // This lets overmap shuttles find our newly assigned z-level.
	S = landmark_directions["AFT"]
	S.forceMove(locate(T.x, max(1, T.y - round(src.my_template.block_size/2) - rand(10,20)), T.z))// Below
	add_landmark(S)
	S = landmark_directions["PORT"]
	S.forceMove(locate(max(1, T.x - round(src.my_template.block_size/2) - rand(10,20)), T.y, T.z)) // Left
	add_landmark(S)
	S = landmark_directions["STARBOARD"]
	S.forceMove(locate(min(world.maxx, T.x + round(src.my_template.block_size/2) + rand(10,20)), T.y, T.z)) // Right
	add_landmark(S)

	my_template.load(T, centered=TRUE)
	loaded = TRUE
	my_template.update_lighting(T)
	to_chat(user, "Stabilization tether successfully created.")
	if(my_template.active_icon)
		icon_state = my_template.active_icon

/obj/effect/overmap/visitable/dynamic/poi/proc/destroy_poi(mob/user)
	if(!loaded) // Ideally this should never happen.
		log_debug("Dynamic overmap POI tried to unload itself but is not loaded.")
		return
	if(!parent) // Also shouldn't happen.
		log_and_message_admins("Dynamic overmap POI attempted to unload without a parent z-level.")
		loaded = FALSE // Always make sure loaded = FALSE before using qdel(src) in this proc to prevent an infinite loop in Destroy().
		qdel(src)
		return
	if(!((my_index >= 1) && (my_index <= MAX_DYNAMIC_LEVELS))) // Make sure my_index is sane
		log_debug("Dynamic overmap POI attempted to unload with an invalid index.")
		loaded = FALSE
		qdel(src)
		return

	GLOB.map_sectors["[parent.map_z[my_index]]"] = parent // Pass ownership back to parent.
	parent.active_pois[my_index] = null
	if(!LAZYLEN(map_z)) // If this is 0, how did we get this far?
		log_and_message_admins("Dynamic overmap POI attempted to unload without a linked z-level.")
		loaded = FALSE
		qdel(src)
		return

	to_chat(user, "Destabilization initiated...")
	log_debug("Dynamic overmap POI unloading initiated...")
	// Some math to return a block of block_size turfs (+ 1 to each dimension to account for even-size maps lacking a true center to safely do math with). Basically, start from center turf and subtract half of block_size for bottom left corner, add for top right corner.
	var/list/turfs_to_reset = block(locate(round(world.maxx/2 - my_template.block_size/2 - 1), round(world.maxy/2 - my_template.block_size/2 - 1), map_z[1]), locate(round(world.maxx/2 + my_template.block_size/2 + 1), round(world.maxy/2 + my_template.block_size/2 + 1), map_z[1]))
	var/deleted_atoms = 0
	if(turfs_to_reset.len)
		var/area/A = parent.base_area
		if(ispath(A))
			A = locate(A)
		if(!istype(A))
			CRASH("Dynamic POI unloading couldn't locate area [A], unload aborted.")

		for(var/turf/T in turfs_to_reset)
			for(var/atom/movable/AM in T)
				if(istype(AM, /mob/observer))
					continue
				++deleted_atoms
				qdel(AM)
			ChangeArea(T, A)
			T = T.ChangeTurf(/turf/space)
	loaded = FALSE
	map_z = null
	icon_state = "ring_destroyed"
	log_debug("Dynamic POI unload complete, [deleted_atoms] atoms destroyed.")
	to_chat(user, "Subspace pocket collapse successful.")
	qdel(src)

/obj/effect/overmap/visitable/dynamic/poi/Destroy()
	if(loaded)
		if(is_empty()) // If we're deleted while loaded but the z-level is occupied, relinquish ownership instead.
			destroy_poi()
		else
			if(parent && (parent.active_pois.len >= my_index) && (parent.map_z.len >= my_index) && (my_index > 0)) // Unless vars are turbofucked.
				GLOB.map_sectors["[parent.map_z[my_index]]"] = parent
				parent.active_pois[my_index] = null
	if(parent)
		parent.all_children.Remove(src)
	return ..()

// This assigns map_sectors which we don't want for this subtype since we have other procs to handle it.
/obj/effect/overmap/visitable/dynamic/poi/register_z_levels()
	return

// Make sure we reassign our z_level to the parent if one exists and somehow this gets called.
/obj/effect/overmap/visitable/dynamic/poi/unregister_z_levels()
	if(parent && LAZYLEN(map_z))
		GLOB.map_sectors["[map_z[1]]"] = parent
		map_z = null
	return ..()

// Hahah recursion
/obj/effect/overmap/visitable/dynamic/poi/create_children()
	return

/obj/effect/overmap/visitable/dynamic/poi/cull_child()
	return

/obj/effect/shuttle_landmark/om_poi // Landmarks used in dynamic poi generation
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/om_poi/Initialize(mapload, var/new_name, var/new_tag)
	name = new_name
	landmark_tag = new_tag
	. = ..()

#undef MAX_DYNAMIC_LEVELS
#undef MAX_DYNAMIC_POI_DIMENSIONS
