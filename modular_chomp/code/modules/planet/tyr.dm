var/datum/planet/tyr/planet_tyr = null

/datum/time/tyr
	seconds_in_day = 24 HOURS

/datum/planet/tyr
	name = "Thor"
	desc = "Sif's moon, heavy in flora and fauna." //rewrite me
	current_time = new /datum/time/thor()
//	expected_z_levels = list(1) // This is defined elsewhere.
	planetary_wall_type = /turf/unsimulated/wall/planetary/normal/thor

/datum/planet/tyr/New()
	..()
	planet_thor = src
	weather_holder = new /datum/weather_holder/thor(src)

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
		WEATHER_SIRENS			= new /datum/weather/tyr/siren(),
		WEATHER_ACIDRAIN			= new /datum/weather/tyr/acidrain(),
		WEATHER_BLOODSKY			= new /datum/weather/tyr/bloodsky(),
		WEATHER_SNOWFALL			= new /datum/weather/tyr/freezefall(),
		WEATHER_OILFALL			= new /datum/weather/tyr/oilfall(),
		WEATHER_STARYYNIGHT			= new /datum/weather/tyr/starrynight()
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
		WEATHER_FIRESTART = 30,
		WEATHER_CLEAR = 30,
		WEATHER_SANDSTORM = 30,
		WEATHER_SIRENS = 10
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
	transition_chances = list(
		WEATHER_FIRESTART = 50,
		WEATHER_FLAMESTORM = 50)
	transition_messages = list(
		"The sky begins to turn orange."
		)
	sky_visible = TRUE
	observed_message = "The sky is orange."


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

			var/damage = rand(7,7)

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
		WEATHER_FIRESTART = 25,
		WEATHER_CLEAR = 25,
		WEATHER_SANDSTORM = 25,
		WEATHER_HEAVYSANDSTORM = 25)
	transition_messages = list(
		"The sky is engulfed by sand."
		)
	sky_visible = TRUE
	observed_message = "The sky is full of sand."


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
	icon_state = "sandstorm_fierce"
	transition_chances = list(
		WEATHER_FIRESTART = 25,
		WEATHER_CLEAR = 25,
		WEATHER_SANDSTORM = 25,
		WEATHER_HEAVYSANDSTORM = 25)
	transition_messages = list(
		"The sky is engulfed by sand."
		)
	sky_visible = TRUE
	observed_message = "The sky is full of sand."

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


/datum/weather/tyr/siren
	name = "unknown"
	transition_chances = list(
		WEATHER_ACIDRAIN = 20,
		WEATHER_BLOODSKY = 20,
		WEATHER_SNOWFALL = 20,
		WEATHER_OILFALL = 20,
		WEATHER_STARRYNIGHT = 20
		)
	transition_messages = list(
		"The sky clears up but sirens are heard in the distance."
		)
	sky_visible = TRUE
	observed_message = "The sky is clear but siren are heard from the distance."


/datum/weather/tyr/acidrain
	name = "unknown"
	icon_state = "toxic_rain"
	light_modifier = 0.5
	light_color = "#00FF00"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_ACIDRAIN = 50)

/datum/weather/tyr/bloodsky
	name = "unknown"
	light_modifier = 0.5
	light_color = "#FF0000"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_BLOODSKY = 50)

/datum/weather/tyr/freezefall
	name = "unknown"
	icon_state = "snowfall_heavy_old"
	temp_high = 223.15
	temp_low = 200.15
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_SNOWFALL = 50)

/datum/weather/tyr/oilfall
	name = "unknown"
	icon_state = "oilfall"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_OILFALL = 50)

/datum/weather/tyr/starrynight
	name = "unknown"
	icon_state = "starry_night"
	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_STARRYNIGHT = 50)