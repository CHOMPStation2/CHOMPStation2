#define FIRE_MAX_TEMP 20000

/turf/proc/lingering_fire(fl)
	return FALSE

/turf/simulated/floor/water/lingering_fire(fl)
	return FALSE

/turf/simulated/floor/flesh/lingering_fire(fl)
	return FALSE

/turf/simulated/lingering_fire(fl)
	if(istype(src, /turf/simulated/open))
		var/turf/below = GetBelow(src)
		if(below)
			return below.lingering_fire(fl)

	if(!zone)
		return TRUE

	if(fire)
		fire.firelevel = max(fl, fire.firelevel)
		return TRUE

	fire = new /obj/fire/lingering(src, fl)
	SSair.active_fire_zones |= zone
	zone.fire_tiles |= src
	return FALSE

/turf/proc/feed_lingering_fire(var/amnt)
	return

/turf/simulated/feed_lingering_fire(var/amnt)
	if(fire && istype(fire, /obj/fire/lingering))
		var/obj/fire/lingering/F = fire
		F.firelevel += amnt
		if(F.firelevel > 2) // Allow above 0 if fed
			F.firelevel = 2
		F.ultimate_burnout = 0 // Reset
		zone.fire_tiles |= src
		// Add C02
		var/datum/gas_mixture/air_contents = return_air()
		air_contents.adjust_gas(GAS_CO2, rand(1,5))
		air_contents.update_values()

/obj/fire/lingering

	anchored = TRUE // While it would be funny... Sadly no.
	mouse_opacity = 0

	icon = 'modular_chomp/icons/effects/fire.dmi'
	icon_state = "fire"
	light_color = "#ED9200"
	layer = GASFIRE_LAYER
	var/ultimate_burnout = 0 // If it reaches 1, begin dying down

/obj/fire/lingering/Initialize(mapload, fl)
	if(fl > 1)
		fl = 1
	if(fl <= 0)
		fl = 0.001
	. = ..(mapload, fl)
	// USes parent fire init, so let's clear these
	icon_state = "[initial(icon_state)]-[rand(0, 2)]"
	color = initial(color)
	set_light(3, 1, l_color = light_color)
	SSair.lingering_fires++

/obj/fire/lingering/process()
	. = 1

	var/turf/simulated/my_tile = loc
	if(!istype(my_tile) || !my_tile.zone)
		if(my_tile && my_tile.fire == src)
			my_tile.fire = null
		qdel(src)
		return TRUE

	// Don't burn forever, eventually we have no more fuel
	ultimate_burnout += 0.001

	// Spread while burning out oxigen
	var/datum/gas_mixture/air_contents = my_tile.return_air()
	var/gas_exchange = rand(0.01, 0.2)
	air_contents.remove_by_flag(XGM_GAS_OXIDIZER, gas_exchange)
	air_contents.adjust_gas(GAS_CO2, gas_exchange * 1.5) // Lots of CO2

	// Limit max lingering fire temp gain, or engines melt
	if(air_contents.temperature < FIRE_MAX_TEMP) // May as well limit this
		var/starting_energy = air_contents.temperature * air_contents.heat_capacity()
		if(starting_energy > 0)
			air_contents.temperature = min((starting_energy + vsc.fire_fuel_energy_release * (gas_exchange * 1.025)) / air_contents.heat_capacity(), FIRE_MAX_TEMP)
	air_contents.update_values()

	// Affect contents
	for(var/mob/living/L in loc)
		L.FireBurn(firelevel, air_contents.temperature, air_contents.return_pressure()) // Burn the mobs!

	loc.fire_act(air_contents, air_contents.temperature, air_contents.volume)
	for(var/atom/A in loc)
		A.fire_act(air_contents, air_contents.temperature, air_contents.volume)

	// Spreading behaviour
	for(var/direction in shuffle(cardinal))
		var/turf/simulated/enemy_tile = get_step(my_tile, direction)
		if(istype(enemy_tile))
			if(my_tile.open_directions & direction)
				if(!enemy_tile.zone)
					continue

				// If extinguisher mist passed over the turf it's trying to spread to, don't spread and end the fire
				if(enemy_tile.fire_protection > world.time-60)
					firelevel = 0
					qdel(src)
					my_tile.fire = null
					continue

				if(enemy_tile.fire)
					if(firelevel > 0.5)
						// Share with other fires if we have the energy
						enemy_tile.fire.firelevel += firelevel / 3
						firelevel /= 2
					continue

				if(firelevel >= 0.15 && prob(20) && my_tile.CanPass(src, enemy_tile) && enemy_tile.CanPass(src, my_tile))
					var/splitrate = 0.85
					enemy_tile.lingering_fire(firelevel * splitrate)
					firelevel -= (1 - splitrate)

			else if(prob(10))
				enemy_tile.adjacent_fire_act(loc, air_contents, air_contents.temperature, air_contents.volume)

	var/total_oxidizers = 0
	for(var/g in air_contents.gas)
		if(gas_data.flags[g] & XGM_GAS_OXIDIZER)
			total_oxidizers += air_contents.gas[g]

	var/invalid_fire = total_oxidizers < 1 || air_contents.temperature <= (T0C + 15) || ultimate_burnout >= 1 || my_tile.is_outdoors() || SSair.lingering_fires >= 1000
	if(prob(30) || invalid_fire)
		if(total_oxidizers < 10 && prob(10))
			firelevel *= 0.95
		else if(invalid_fire)
			firelevel *= 0.5

	if(firelevel <= 0.01)
		qdel(src)
		my_tile.fire = null

/obj/fire/lingering/ex_act(strength)
	. = ..()
	var/turf/T = get_turf(src)
	if(T)
		T.fire = null
		qdel(src)

/obj/fire/lingering/Destroy()
	. = ..()
	SSair.lingering_fires--

#undef FIRE_MAX_TEMP
