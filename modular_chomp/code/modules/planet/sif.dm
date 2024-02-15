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