// Describes a point source of radiation.  Created either in response to a pulse of radiation, or over an irradiated atom.
// Sources will decay over time, unless something is renewing their power!
/datum/radiation_source
	var/turf/source_turf		// Location of the radiation source.
	var/rad_power				// Strength of the radiation being emitted.
	var/decay = TRUE			// True for automatic decay.  False if owner promises to handle it (i.e. supermatter)
	var/respect_maint = FALSE	// True for not affecting RAD_SHIELDED areas.
	var/flat = FALSE			// True for power falloff with distance.
	var/range					// Cached maximum range, used for quick checks against mobs.

/datum/radiation_source/Destroy()
	SSradiation.sources -= src
	if(SSradiation.sources_assoc[src.source_turf] == src)
		SSradiation.sources_assoc -= src.source_turf
	src.source_turf = null
	. = ..()

/datum/radiation_source/proc/update_rad_power(var/new_power = null)
	if(new_power == null || new_power == rad_power)
		return // No change
	else if(new_power <= CONFIG_GET(number/radiation_lower_limit))
		qdel(src) // Decayed to nothing
	else
		rad_power = new_power
		if(!flat)
			range = min(round(sqrt(rad_power / CONFIG_GET(number/radiation_lower_limit))), 31)  // R = rad_power / dist**2 - Solve for dist
	return

/turf
	var/cached_rad_resistance = 0

/turf/proc/calc_rad_resistance()
	cached_rad_resistance = 0
	for(var/obj/O in src.contents)
		if(O.rad_resistance) //Override
			cached_rad_resistance += O.rad_resistance

		else if(O.density) //So open doors don't get counted
			var/datum/material/M = O.get_material()
			if(!M)	continue
			cached_rad_resistance += (M.weight + M.radiation_resistance) / CONFIG_GET(number/radiation_material_resistance_divisor)
	// Looks like storing the contents length is meant to be a basic check if the cache is stale due to items enter/exiting.  Better than nothing so I'm leaving it as is. ~Leshana
	SSradiation.resistance_cache[src] = (length(contents) + 1)
	return

/turf/simulated/wall/calc_rad_resistance()
	SSradiation.resistance_cache[src] = (length(contents) + 1)
	var/temp_rad_resistance
	temp_rad_resistance += material.weight + material.radiation_resistance
	if(reinf_material)
		temp_rad_resistance += reinf_material.weight + reinf_material.radiation_resistance
	cached_rad_resistance = (density ? (temp_rad_resistance) / CONFIG_GET(number/radiation_material_resistance_divisor) : 0)
	return

/turf/simulated/mineral/calc_rad_resistance()
	if(!density)
		return ..()
	SSradiation.resistance_cache[src] = (length(contents) + 1)
	cached_rad_resistance = 60 //Three times that of a steel wall. Rock is less dense than steel, but this is assuming that a normal wall isn't just solid steel all the way through like rock turfs are.
	return

/obj
	var/rad_resistance = 0  // Allow overriding rad resistance

// If people expand the system, this may be useful. Here as a placeholder until then
/atom/proc/rad_act(var/severity)
	return 1

/mob/living/rad_act(var/severity)
	if(severity && !isbelly(loc)) //eaten mobs are made immune to radiation //VOREStation Edit
		src.apply_effect(severity, IRRADIATE, src.getarmor(null, "rad"))
		for(var/atom/I in src)
			I.rad_act(severity)
	return
