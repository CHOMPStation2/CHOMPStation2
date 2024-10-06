var/datum/planet/tyr/planet_tyr = null

/datum/time/tyr
	seconds_in_day = 24 HOURS

/datum/planet/tyr
	name = "Tyr"
	desc = "Tyr, a hot planet." //rewrite me
	current_time = new /datum/time/tyr()
//	expected_z_levels = list(1) // This is defined elsewhere.
	planetary_wall_type = /turf/unsimulated/wall/planetary/normal/thor

/datum/planet/tyr/New()
	..()
	planet_thor = src
	weather_holder = new /datum/weather_holder/tyr(src)

/datum/planet/tyr/update_sun()
	..()
	var/datum/time/time = current_time
	var/length_of_day = time.seconds_in_day / 10 / 60 / 60
	var/noon = length_of_day / 2
	var/distance_from_noon = abs(text2num(time.show_time("hh")) - noon)
	sun_position = distance_from_noon / noon
	sun_position = abs(sun_position - 1)

	var/low_brightness = null
	var/high_brightness = null

	var/low_color = null
	var/high_color = null
	var/min = 0

	switch(sun_position)
		if(0 to 0.20) // Night
			low_brightness = 0.1
			low_color = "#0A0028"

			high_brightness = 0.3
			high_color = "#21007F"
			min = 0

		if(0.20 to 0.30) // Twilight
			low_brightness = 0.35
			low_color = "#310D54"

			high_brightness = 0.5
			high_color = "#58389E"
			min = 0.40

		if(0.30 to 0.40) // Sunrise/set
			low_brightness = 0.5
			low_color = "#19277F"

			high_brightness = 0.6
			high_color = "#2437B5"
			min = 0.50

		if(0.40 to 1.00) // Noon
			low_brightness = 0.6
			low_color = "#487EBF"

			high_brightness = 0.7
			high_color = "#2B95FF"
			min = 0.70

	var/interpolate_weight = (abs(min - sun_position)) * 4
	var/weather_light_modifier = 1
	if(weather_holder && weather_holder.current_weather)
		weather_light_modifier = weather_holder.current_weather.light_modifier

	var/new_brightness = (LERP(low_brightness, high_brightness, interpolate_weight) ) * weather_light_modifier

	var/new_color = null
	if(weather_holder && weather_holder.current_weather && weather_holder.current_weather.light_color)
		new_color = weather_holder.current_weather.light_color
	else
		var/list/low_color_list = hex2rgb(low_color)
		var/low_r = low_color_list[1]
		var/low_g = low_color_list[2]
		var/low_b = low_color_list[3]

		var/list/high_color_list = hex2rgb(high_color)
		var/high_r = high_color_list[1]
		var/high_g = high_color_list[2]
		var/high_b = high_color_list[3]

		var/new_r = LERP(low_r, high_r, interpolate_weight)
		var/new_g = LERP(low_g, high_g, interpolate_weight)
		var/new_b = LERP(low_b, high_b, interpolate_weight)

		new_color = rgb(new_r, new_g, new_b)

	spawn(1)
		update_sun_deferred(new_brightness, new_color)

//Ooooh weathers
/datum/weather_holder/tyr
	temperature = 313
	allowed_weather_types = list(
		WEATHER_CLEAR			= new /datum/weather/tyr/clear(),
		WEATHER_FIRESTART			= new /datum/weather/tyr/firestart(),
		WEATHER_FLAMESTORM			= new /datum/weather/tyr/flamestorm(),
		WEATHER_SANDSTORM			= new /datum/weather/tyr/sandstorm(),
		WEATHER_HEAVYSANDSTORM			= new /datum/weather/tyr/sandstorm_fierce(),
		WEATHER_FALLOUT_TEMP			= new /datum/weather/tyr/starrynight(),
		WEATHER_BLIZZARD	= new /datum/weather/tyr/blizzard(),
		WEATHER_STORM		= new /datum/weather/tyr/storm(),
		WEATHER_FOG			= new /datum/weather/tyr/fog()

		)
	roundstart_weather_chances = list(
		WEATHER_CLEAR		= 100
		)

/datum/weather/tyr
	name = "tyr"
	temp_high = 323.15
	temp_low = 300.15

/datum/weather/tyr/clear
	name = "clear"
	transition_chances = list(
		WEATHER_FIRESTART = 20,
		WEATHER_CLEAR = 45,
		WEATHER_SANDSTORM = 30
		)
	transition_messages = list(
		"The sky clears up.",
		"The sky is visible.",
		"The weather is calm."
		)
	sky_visible = TRUE
	observed_message = "The sky is clear."
	imminent_transition_message = "The sky is rapidly clearing up."

/datum/weather/tyr/firestart
	name = "warm winds"
	icon_state = "ashfall_light"
	transition_chances = list(
		WEATHER_FIRESTART = 50,
		WEATHER_FLAMESTORM = 50)
	transition_messages = list(
		"The sky begins to turn orange."
		)
	sky_visible = TRUE
	observed_message = "The sky is orange."
	imminent_transition_message = "The sky flares orange."


/datum/weather/tyr/flamestorm
	name = "fire storm"
	icon_state = "ashfall_light"
	transition_chances = list(
		WEATHER_FLAMESTORM = 50,
		WEATHER_CLEAR = 50)
	transition_messages = list(
		"The sky is engulfed by flames."
		)
	sky_visible = TRUE
	observed_message = "The sky is on fire."
	imminent_transition_message = "The sky is set ablaze."

/datum/weather/tyr/flamestorm/process_effects()
	..()
	for(var/mob/living/carbon/H as anything in human_mob_list)
		if(H?.z in holder.our_planet.expected_z_levels) // CHOMPedit Add a check that L has to be valid and not null
			var/turf/T = get_turf(H)
			if(!T.is_outdoors())
				continue

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = H.run_armor_check(target_zone, "bio")
			var/amount_soaked = H.get_armor_soak(target_zone, "bio")

			var/damage = rand(1,1)

			if(amount_blocked >= 40)
				continue

			if(amount_soaked >= damage)
				continue // No need to apply damage.

			H.apply_damage(damage, BURN, target_zone, amount_blocked, amount_soaked, used_weapon = "burning ash")
			if(show_message)
				to_chat(H, effect_message)

/datum/weather/tyr/sandstorm
	name = "sandstorm"
	icon_state = "sandstorm"
	transition_chances = list(
		WEATHER_FIRESTART = 15,
		WEATHER_CLEAR = 55,
		WEATHER_SANDSTORM = 15,
		WEATHER_HEAVYSANDSTORM = 15)
	transition_messages = list(
		"The sky is engulfed by sand."
		)
	sky_visible = TRUE
	observed_message = "The sky is full of sand."
	imminent_transition_message = "Pebbles begin to fill the sky."


/datum/weather/tyr/sandstorm/process_effects()
	..()
	for(var/mob/living/carbon/H as anything in human_mob_list)
		if(H?.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(H)
			if(!T.is_outdoors())
				continue

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = H.run_armor_check(target_zone, "melee")
			var/amount_soaked = H.get_armor_soak(target_zone, "melee")

			var/damage = rand(1,2)

			if(amount_blocked >= 10)
				continue

			if(amount_soaked >= damage)
				continue // No need to apply damage.

			H.apply_damage(damage, BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "sand")
			if(show_message)
				to_chat(H, effect_message)

/datum/weather/tyr/sandstorm_fierce
	name = "fierce sandstorm"
	icon_state = "sandstorm"
	transition_chances = list(
		WEATHER_FIRESTART = 15,
		WEATHER_CLEAR = 55,
		WEATHER_SANDSTORM = 15,
		WEATHER_HEAVYSANDSTORM = 15)
	transition_messages = list(
		"The sky is engulfed by sand."
		)
	sky_visible = TRUE
	observed_message = "The sky is full of sand."
	light_color = "#996600"
	light_modifier = 0.5

	imminent_transition_message = "The sky is blocked out by rock."

/datum/weather/tyr/sandstorm_fierce/process_effects()
	..()
	for(var/mob/living/carbon/H as anything in human_mob_list)
		if(H?.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(H)
			if(!T.is_outdoors())
				continue

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = H.run_armor_check(target_zone, "melee")
			var/amount_soaked = H.get_armor_soak(target_zone, "melee")

			var/damage = rand(7,7)

			if(amount_blocked >= 40)
				continue

			if(amount_soaked >= damage)
				continue // No need to apply damage.

			H.apply_damage(damage, BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "sand")
			if(show_message)
				to_chat(H, effect_message)

//Anomalous/summonable weather
/datum/weather/tyr/starrynight
	name = "unknown"
	icon_state = "starry_night"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_FALLOUT_TEMP = 50)

	imminent_transition_message = "The sky is rapidly begins to glow."

/datum/weather/tyr/starrynight/process_effects()
	..()
	for(var/mob/living/carbon/H as anything in human_mob_list)
		if(H?.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(H)
			if(!T.is_outdoors())
				continue
			H.add_modifier(/datum/modifier/starrynight_boon, 1 SECONDS, src)

/datum/weather/tyr/blizzard
	name = "blizzard"
	icon_state = "snowfall_heavy_old"
	temp_high = 123.15
	temp_low = 100.15
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_BLIZZARD = 50)
	outdoor_sounds_type = /datum/looping_sound/weather/storm
	indoor_sounds_type = /datum/looping_sound/weather/storm/indoors

	imminent_transition_message = "The sky is overtaken by snow."

/datum/weather/tyr/storm
	icon_state = "fallout"
	light_modifier = 0.7
	light_color = "#CCFFCC"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_STORM = 50)
	imminent_transition_message = "Sky and clouds are growing sickly green... Radiation storm is approaching, get to cover!"
	outdoor_sounds_type = /datum/looping_sound/weather/wind
	indoor_sounds_type = /datum/looping_sound/weather/wind/indoors

	imminent_transition_message = "The sky is overtaken by green clouds."

	// How much radiation a mob gets while on an outside tile.
	var/direct_rad_low = RAD_LEVEL_LOW
	var/direct_rad_high = RAD_LEVEL_MODERATE

	// How much radiation is bursted onto a random tile near a mob.
	var/fallout_rad_low = RAD_LEVEL_HIGH
	var/fallout_rad_high = RAD_LEVEL_VERY_HIGH

/datum/weather/tyr/storm/process_effects()
	..()
	for(var/mob/living/L as anything in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			irradiate_nearby_turf(L)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to irradiate them with fallout.

			L.rad_act(rand(direct_rad_low, direct_rad_high))

// This makes random tiles near people radioactive for awhile.
// Tiles far away from people are left alone, for performance.
/datum/weather/tyr/storm/proc/irradiate_nearby_turf(mob/living/L)
	if(!istype(L))
		return
	var/list/turfs = RANGE_TURFS(world.view, L)
	var/turf/T = pick(turfs) // We get one try per tick.
	if(!istype(T))
		return
	if(T.is_outdoors())
		SSradiation.radiate(T, rand(fallout_rad_low, fallout_rad_high))



/datum/weather/tyr/fog
	light_modifier = 0.5
	light_color = "#FF0000"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_FOG = 50)

	imminent_transition_message = "Fog emerges from nowhere."

	var/next_lightning_strike = 0 // world.time when lightning will strike.
	var/min_lightning_cooldown = 5 SECONDS
	var/max_lightning_cooldown = 1 MINUTE

/datum/weather/tyr/fog/process_effects()
	..()
	for(var/mob/living/L as anything in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to rain on them.

			// If they have an open umbrella, it'll guard from rain
			var/obj/item/melee/umbrella/U = L.get_active_hand()
			if(!istype(U) || !U.open)
				U = L.get_inactive_hand()

			if(istype(U) && U.open)
				if(show_message)
					to_chat(L, span_notice("Rain showers loudly onto your umbrella!"))
				continue


			L.water_act(2)
			if(show_message)
				to_chat(L, effect_message)

	handle_lightning()

// This gets called to do lightning periodically.
// There is a seperate function to do the actual lightning strike, so that badmins can play with it.
/datum/weather/tyr/fog/proc/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)

/*
WEATHER_BLIZZARD	= new (),
		WEATHER_STORM		= new(),
		WEATHER_FOG			= new /datum/weather/tyr/fog()
	*/
