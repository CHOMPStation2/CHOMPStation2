/datum/weather/sif/fog
	name = "fog"
	icon_state = "fog"
	wind_high = 1
	wind_low = 0
	light_modifier = 0.7

	temp_high = T0C		// 0c
	temp_low = 263.15	// -10c

	transition_chances = list(
		WEATHER_FOG = 35,
		WEATHER_CLEAR = 35,
		WEATHER_OVERCAST = 15,
		WEATHER_LIGHT_SNOW = 10,
		WEATHER_RAIN = 5
		)

/datum/weather/sif/fallout/temp //fixys firework stars
	name = "short-term fallout"
	timer_low_bound = 1
	timer_high_bound = 3
	transition_chances = list(
		WEATHER_FALLOUT = 10,
		WEATHER_RAIN = 50,
		WEATHER_FOG = 35,
		WEATHER_STORM = 20,
		WEATHER_OVERCAST = 5
		)

/datum/weather/sif/confetti //fixys firework stars
	name = "confetti"
	icon_state = "confetti"

	transition_chances = list(
		WEATHER_CLEAR = 50,
		WEATHER_OVERCAST = 20,
		WEATHER_CONFETTI = 5
		)
	observed_message = "Confetti is raining from the sky."
	transition_messages = list(
		"Suddenly, colorful confetti starts raining from the sky."
	)
	imminent_transition_message = "A rain is starting... A rain of confetti...?"
