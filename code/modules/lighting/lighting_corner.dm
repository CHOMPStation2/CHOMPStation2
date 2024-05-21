// Because we can control each corner of every lighting object.
// And corners get shared between multiple turfs (unless you're on the corners of the map, then 1 corner doesn't).
// For the record: these should never ever ever be deleted, even if the turf doesn't have dynamic lighting.

/datum/lighting_corner
	var/list/datum/light_source/affecting // Light sources affecting us.

	var/sunlight = SUNLIGHT_NONE // CHOMPEdit
	var/x = 0
	var/y = 0

	var/turf/master_NE
	var/turf/master_SE
	var/turf/master_SW
	var/turf/master_NW

	//"raw" color values, changed by update_lumcount()
	var/lum_r = 0
	var/lum_g = 0
	var/lum_b = 0

	//true color values, guaranteed to be between 0 and 1
	var/cache_r = LIGHTING_SOFT_THRESHOLD
	var/cache_g = LIGHTING_SOFT_THRESHOLD
	var/cache_b = LIGHTING_SOFT_THRESHOLD

	///the maximum of lum_r, lum_g, and lum_b. if this is > 1 then the three cached color values are divided by this
	var/largest_color_luminosity = 0

	///whether we are to be added to SSlighting's corners_queue list for an update
	var/needs_update = FALSE

/datum/lighting_corner/New(turf/new_turf, diagonal)
	. = ..()
	save_master(new_turf, turn(diagonal, 180))

	var/vertical   = diagonal & ~(diagonal - 1) // The horizontal directions (4 and 8) are bigger than the vertical ones (1 and 2), so we can reliably say the lsb is the horizontal direction.
	var/horizontal = diagonal & ~vertical       // Now that we know the horizontal one we can get the vertical one.

	x = new_turf.x + (horizontal == EAST  ? 0.5 : -0.5)
	y = new_turf.y + (vertical   == NORTH ? 0.5 : -0.5)

	// My initial plan was to make this loop through a list of all the dirs (horizontal, vertical, diagonal).
	// Issue being that the only way I could think of doing it was very messy, slow and honestly overengineered.
	// So we'll have this hardcode instead.
	var/turf/new_master_turf

	// Diagonal one is easy.
	new_master_turf = get_step(new_turf, diagonal)
	if (new_master_turf) // In case we're on the map's border.
		save_master(new_master_turf, diagonal)

	// Now the horizontal one.
	new_master_turf = get_step(new_turf, horizontal)
	if (new_master_turf) // Ditto.
		save_master(new_master_turf, ((new_master_turf.x > x) ? EAST : WEST) | ((new_master_turf.y > y) ? NORTH : SOUTH)) // Get the dir based on coordinates.

	// And finally the vertical one.
	new_master_turf = get_step(new_turf, vertical)
	if (new_master_turf)
		save_master(new_master_turf, ((new_master_turf.x > x) ? EAST : WEST) | ((new_master_turf.y > y) ? NORTH : SOUTH)) // Get the dir based on coordinates.

	if(((SSplanets && SSplanets.z_to_planet.len >= new_turf.z && SSplanets.z_to_planet[new_turf.z]) || SSlighting.get_pshandler_z(new_turf.z)) && new_turf.has_dynamic_lighting()) sunlight = SUNLIGHT_POSSIBLE //CHOMPEdit

/datum/lighting_corner/proc/save_master(turf/master, dir)
	switch (dir)
		if (NORTHEAST)
			master_NE = master
			master.lighting_corner_SW = src
		if (SOUTHEAST)
			master_SE = master
			master.lighting_corner_NW = src
		if (SOUTHWEST)
			master_SW = master
			master.lighting_corner_NE = src
		if (NORTHWEST)
			master_NW = master
			master.lighting_corner_SE = src

/datum/lighting_corner/proc/self_destruct_if_idle()
	if (!LAZYLEN(affecting) && !sunlight) //CHOMPEdit
		qdel(src, force = TRUE)

/datum/lighting_corner/proc/vis_update()
	for (var/datum/light_source/light_source as anything in affecting)
		light_source.vis_update()

/datum/lighting_corner/proc/full_update()
	for (var/datum/light_source/light_source as anything in affecting)
		light_source.recalc_corner(src)

// God that was a mess, now to do the rest of the corner code! Hooray!
/datum/lighting_corner/proc/update_lumcount(delta_r, delta_g, delta_b, var/from_sholder = FALSE) //CHOMPEdit
	if (!(delta_r || delta_g || delta_b)) // 0 is falsey ok
		return

	//CHOMPEdit Begin
	if((sunlight == SUNLIGHT_ONLY || sunlight == SUNLIGHT_ONLY_SHADE) && LAZYLEN(affecting))
		change_sun()
		if(sunlight == SUNLIGHT_ONLY || sunlight == SUNLIGHT_ONLY_SHADE)
			//Okay fuck. If we're here some doodoo kaka bullshit happened (probably thanks to in-round map loading) and now the sunlight handler that owned us previously is fucking gone (real cool dude) so like try to get a new one ig
			//Is this optimal? No. Is there a better way? Maybe. God knows I tried, but whatever fucking black magic is going on behind the scenes seems to defy all attempts at logic. So, if this works, it stays.
			sunlight = SUNLIGHT_POSSIBLE
	//CHOMPEdit End
	lum_r += delta_r
	lum_g += delta_g
	lum_b += delta_b

	//CHOMPEdit Begin
	if(sunlight == SUNLIGHT_CURRENT && !LAZYLEN(affecting) && !from_sholder)
		update_sunlight_handlers()
		update_sunlight_handlers()
	//CHOMPEdit End

	if (!needs_update)
		needs_update = TRUE
		SSlighting.corners_queue += src

/datum/lighting_corner/proc/update_objects()
	// Cache these values ahead of time so 4 individual lighting objects don't all calculate them individually.
	var/lum_r = src.lum_r
	var/lum_g = src.lum_g
	var/lum_b = src.lum_b
	var/largest_color_luminosity = max(lum_r, lum_g, lum_b) // Scale it so one of them is the strongest lum, if it is above 1.
	. = 1 // factor
	if (largest_color_luminosity > 1)
		. = 1 / largest_color_luminosity

	#if LIGHTING_SOFT_THRESHOLD != 0
	else if (largest_color_luminosity < LIGHTING_SOFT_THRESHOLD)
		. = 0 // 0 means soft lighting.

	cache_r  = round(lum_r * ., LIGHTING_ROUND_VALUE) || LIGHTING_SOFT_THRESHOLD
	cache_g  = round(lum_g * ., LIGHTING_ROUND_VALUE) || LIGHTING_SOFT_THRESHOLD
	cache_b  = round(lum_b * ., LIGHTING_ROUND_VALUE) || LIGHTING_SOFT_THRESHOLD
	#else
	cache_r  = round(lum_r * ., LIGHTING_ROUND_VALUE)
	cache_g  = round(lum_g * ., LIGHTING_ROUND_VALUE)
	cache_b  = round(lum_b * ., LIGHTING_ROUND_VALUE)
	#endif

	src.largest_color_luminosity = round(largest_color_luminosity, LIGHTING_ROUND_VALUE)

	var/datum/lighting_object/lighting_object = master_NE?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_SE?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_SW?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_NW?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	self_destruct_if_idle()


/datum/lighting_corner/dummy/New()
	return

/datum/lighting_corner/Destroy(force)
	if (!force)
		return QDEL_HINT_LETMELIVE

	for (var/datum/light_source/light_source as anything in affecting)
		LAZYREMOVE(light_source.effect_str, src)
	affecting = null

	if (master_NE)
		master_NE.lighting_corner_SW = null
		master_NE.lighting_corners_initialised = FALSE
	if (master_SE)
		master_SE.lighting_corner_NW = null
		master_SE.lighting_corners_initialised = FALSE
	if (master_SW)
		master_SW.lighting_corner_NE = null
		master_SW.lighting_corners_initialised = FALSE
	if (master_NW)
		master_NW.lighting_corner_SE = null
		master_NW.lighting_corners_initialised = FALSE
	if(needs_update)
		SSlighting.corners_queue -= src

	return ..()

//CHOMPEdit Begin
/datum/lighting_corner/proc/update_sun(var/datum/planet_sunlight_handler/pshandler)
	if(!pshandler)
		return
	if(sunlight == SUNLIGHT_ONLY)
		lum_r = pshandler.red
		lum_g = pshandler.green
		lum_b = pshandler.blue
		cache_r = pshandler.cache_r
		cache_g = pshandler.cache_g
		cache_b = pshandler.cache_b
		largest_color_luminosity = pshandler.maxlum
	if(sunlight == SUNLIGHT_ONLY_SHADE)
		lum_r = pshandler.redshade
		lum_g = pshandler.greenshade
		lum_b = pshandler.blueshade
		cache_r = pshandler.cache_r_shade
		cache_g = pshandler.cache_g_shade
		cache_b = pshandler.cache_b_shade
		largest_color_luminosity = pshandler.maxlumshade


	var/datum/lighting_object/lighting_object = master_NE?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_SE?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_SW?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

	lighting_object = master_NW?.lighting_object
	if (lighting_object && !lighting_object.needs_update)
		lighting_object.needs_update = TRUE
		SSlighting.objects_queue += lighting_object

/datum/lighting_corner/proc/change_sun()
	lum_r = 0
	lum_g = 0
	lum_b = 0
	var/turf/simulated/master_NE_sim = master_NE
	var/turf/simulated/master_SE_sim = master_SE
	var/turf/simulated/master_SW_sim = master_SW
	var/turf/simulated/master_NW_sim = master_NW
	if(istype(master_NE_sim) && master_NE_sim.shandler)
		master_NE_sim.shandler.corner_sunlight_change(src)
	if(istype(master_SE_sim) && master_SE_sim.shandler)
		master_SE_sim.shandler.corner_sunlight_change(src)
	if(istype(master_SW_sim) && master_SW_sim.shandler)
		master_SW_sim.shandler.corner_sunlight_change(src)
	if(istype(master_NW_sim) && master_NW_sim.shandler)
		master_NW_sim.shandler.corner_sunlight_change(src)
	update_sunlight_handlers()


/datum/lighting_corner/proc/update_sunlight_handlers()
	var/turf/simulated/master_NE_sim = master_NE
	var/turf/simulated/master_SE_sim = master_SE
	var/turf/simulated/master_SW_sim = master_SW
	var/turf/simulated/master_NW_sim = master_NW
	if(istype(master_NE_sim) && master_NE_sim.shandler)
		master_NE_sim.shandler.sunlight_update()
	if(istype(master_SE_sim) && master_SE_sim.shandler)
		master_SE_sim.shandler.sunlight_update()
	if(istype(master_SW_sim) && master_SW_sim.shandler)
		master_SW_sim.shandler.sunlight_update()
	if(istype(master_NW_sim) && master_NW_sim.shandler)
		master_NW_sim.shandler.sunlight_update()

/datum/lighting_corner/proc/all_onlysun()
	var/datum/lighting_object/lighting_object = master_NE?.lighting_object
	if (lighting_object && !(lighting_object.sunlight_only == sunlight))
		return FALSE

	lighting_object = master_SE?.lighting_object
	if (lighting_object && !(lighting_object.sunlight_only == sunlight))
		return FALSE

	lighting_object = master_SW?.lighting_object
	if (lighting_object && !(lighting_object.sunlight_only == sunlight))
		return FALSE

	lighting_object = master_NW?.lighting_object
	if (lighting_object && !(lighting_object.sunlight_only == sunlight))
		return FALSE

	return TRUE

/datum/lighting_corner/proc/wake_sleepers()
	var/turf/simulated/master_NE_sim = master_NE
	var/turf/simulated/master_SE_sim = master_SE
	var/turf/simulated/master_SW_sim = master_SW
	var/turf/simulated/master_NW_sim = master_NW
	if(istype(master_NE_sim) && master_NE_sim.shandler && master_NE_sim.shandler.sleeping)
		master_NE_sim.shandler.sunlight_update()
	if(istype(master_SE_sim) && master_SE_sim.shandler && master_SE_sim.shandler.sleeping)
		master_SE_sim.shandler.sunlight_update()
	if(istype(master_SW_sim) && master_SW_sim.shandler && master_SW_sim.shandler.sleeping)
		master_SW_sim.shandler.sunlight_update()
	if(istype(master_NW_sim) && master_NW_sim.shandler && master_NW_sim.shandler.sleeping)
		master_NW_sim.shandler.sunlight_update()

//CHOMPEdit End
