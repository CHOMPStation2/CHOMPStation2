//Sif defines
/datum/weather_holder/sif
	temperature = T0C
	allowed_weather_types = list(
		WEATHER_CLEAR		= new /datum/weather/sif/clear(),
		WEATHER_OVERCAST	= new /datum/weather/sif/overcast(),
		WEATHER_LIGHT_SNOW	= new /datum/weather/sif/light_snow(),
		WEATHER_SNOW		= new /datum/weather/sif/snow(),
		WEATHER_BLIZZARD	= new /datum/weather/sif/blizzard(),
		WEATHER_RAIN		= new /datum/weather/sif/rain(),
		WEATHER_STORM		= new /datum/weather/sif/storm(),
		WEATHER_HAIL		= new /datum/weather/sif/hail(),
		WEATHER_FOG			= new /datum/weather/sif/fog(),
		WEATHER_BLOOD_MOON	= new /datum/weather/sif/blood_moon(),
		WEATHER_EMBERFALL	= new /datum/weather/sif/emberfall(),
		WEATHER_ASH_STORM	= new /datum/weather/sif/ash_storm(),
		WEATHER_FALLOUT		= new /datum/weather/sif/fallout(),
		WEATHER_FALLOUT_TEMP	= new /datum/weather/sif/fallout/temp(),
		WEATHER_CONFETTI		= new /datum/weather/sif/confetti(),
		WEATHER_EERIE_WIND		= new /datum/weather/sif/eeriewind(),
		WEATHER_SANDSTORM 		= new /datum/weather/sif/sandstorm(),
		WEATHER_TOXIN_RAIN		= new /datum/weather/sif/toxinrain(),
		WEATHER_STARRY_RIFT		= new /datum/weather/sif/starryrift(),
		WEATHER_MIDNIGHT_FOG	= new /datum/weather/sif/midnightfog(),
		WEATHER_DOWNPOURWARNING = new /datum/weather/sif/downpourwarning(),
		WEATHER_DOWNPOUR 		= new /datum/weather/sif/downpour(),
		WEATHER_DOWNPOURFATAL 	= new /datum/weather/sif/downpourfatal() //CHOMPedit end
		)
//Weather
/datum/weather/sif/fog
	name = "fog"
	icon_state = "fog"
	wind_high = 1
	wind_low = 0
	light_modifier = 0.7

	temp_high = T0C		// 0c
	temp_low = 263.15	// -10c

	transition_chances = list(
		WEATHER_FOG = 30,
		WEATHER_CLEAR = 35,
		WEATHER_OVERCAST = 15,
		WEATHER_LIGHT_SNOW = 10,
		WEATHER_RAIN = 5,
		WEATHER_EERIE_WIND = 5
		)
	imminent_transition_message = "Fog settles down."

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
	imminent_transition_message = "Fireworks begin to fly."

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

/datum/weather/sif/blizzard
	name = "blizzard"
	icon_state = "snowfall_heavy"
	temp_high = 243.15 // -30c
	temp_low = 233.15  // -40c
	wind_high = 4
	wind_low = 2
	light_modifier = 0.3
	flight_failure_modifier = 10
	transition_chances = list(
		WEATHER_SNOW = 40,
		WEATHER_BLIZZARD = 40,
		WEATHER_HAIL = 10,
		WEATHER_OVERCAST = 5,
		WEATHER_EERIE_WIND = 5
		)
	imminent_transition_message = "A blinding snowstorm rolls in."


//Anomalous Weather
/datum/weather/sif/eeriewind
	name = "breezy winds"
	transition_chances = list(
		WEATHER_SANDSTORM = 25,
		WEATHER_TOXIN_RAIN = 25,
		WEATHER_STARRY_RIFT	= 25,
		WEATHER_MIDNIGHT_FOG = 25
		)
	imminent_transition_message = "The wind begins to howl."

/datum/weather/sif/toxinrain //wanted phoron but explosions come with phoron
	name = "toxic rain"
	icon_state = "toxic_rain"
	//light_modifier = 0.7

	temp_high = 283.15
	temp_low = 303.15
	transition_chances = list(
		WEATHER_OVERCAST = 100
		)
	imminent_transition_message = "The sky fills with green clouds."
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_HUMANS

/datum/weather/sif/toxinrain/planet_effect(mob/living/carbon/H)
	if(H.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(H)
		if(!T.is_outdoors())
			return

		var/obj/item/melee/umbrella/U = H.get_active_hand()
		if(!istype(U) || !U.open)
			U = H.get_inactive_hand()

		if(istype(U) && U.open)
			if(show_message)
				to_chat(H, span_notice("Rain patters onto your umbrella."))
			return

		var/target_zone = pick(BP_ALL)
		var/amount_blocked = H.run_armor_check(target_zone, "bio")
		var/amount_soaked = H.get_armor_soak(target_zone, "bio")

		var/damage = rand(1,5)

		if(amount_blocked >= 40)
			return

		if(amount_soaked >= damage)
			return // No need to apply damage.

		H.apply_damage(damage, BURN, target_zone, amount_blocked, amount_soaked, used_weapon = "acidic rain")
		if(show_message)
			to_chat(H, effect_message)

/datum/weather/sif/sandstorm
	name = "Sandstorm"
	icon_state = "sandstorm"
	temp_low = 293.15
	temp_high = 313.15
	transition_chances = list(
		WEATHER_OVERCAST = 100
		)
	imminent_transition_message = "Pebbles fly through the sky."
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_HUMANS

/datum/weather/sif/sandstorm/planet_effect(mob/living/carbon/H)
	if(H.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(H)
		if(!T.is_outdoors())
			return

		var/target_zone = pick(BP_ALL)
		var/amount_blocked = H.run_armor_check(target_zone, "melee")
		var/amount_soaked = H.get_armor_soak(target_zone, "melee")

		var/damage = rand(1,2)

		if(amount_blocked >= 10)
			return

		if(amount_soaked >= damage)
			return // No need to apply damage.

		H.apply_damage(damage, BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "sand")
		if(show_message)
			to_chat(H, effect_message)

//datum/weather/sif/stupidbrainwantingthingsinfives

/datum/weather/sif/starryrift
	name = "starry skies"
	icon_state = "starry_night"
	light_modifier = 1.5

	temp_low = 283.15
	temp_high = 303.15
	transition_chances = list(
		WEATHER_OVERCAST = 100
		)
	imminent_transition_message = "Stars begin to dance closer then before."
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_HUMANS

/datum/weather/sif/starryrift/planet_effect(mob/living/carbon/H)
	if(H.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(H)
		if(!T.is_outdoors())
			return
		H.add_modifier(/datum/modifier/starrynight_boon, 1 SECONDS, src)

/datum/modifier/starrynight_boon
	name = "Starry Night"
	desc = "You feel serene and well rested."

	stacks = MODIFIER_STACK_EXTEND

	incoming_healing_percent = 2

/*
/datum/modifier/starrynight_boon/tick() Wanna have this and it's counter part mess with kin but brain says noto figuring out how lol
	holder.shadekin_adjust_energy(-3)
*/

/datum/modifier/midnightfog_boon
	name = "Midnight Fog"
	desc = "You feel not fully there."

	stacks = MODIFIER_STACK_EXTEND

	bleeding_rate_percent = 2 //It desires you
	evasion = 10 //Worlds bend and meld. Small chance you aren't where you appear to be

/*
/datum/modifier/midnightfog_boon/tick()
	holder.shadekin_adjust_energy(3)
*/

/datum/weather/sif/midnightfog
	name = "heavy fog"
	icon_state = "midnight_fog"
	light_modifier = 0.3

	temp_low = 283.15
	temp_high = 303.15
	transition_chances = list(
		WEATHER_OVERCAST = 100
		)
	imminent_transition_message = "Fog emerges from nowhere."
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_HUMANS

/datum/weather/sif/midnightfog/planet_effect(mob/living/carbon/H)
	if(H.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(H)
		if(!T.is_outdoors())
			return
		H.add_modifier(/datum/modifier/midnightfog_boon, 1 SECONDS, src)

/datum/weather/sif/fallout/temp
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
	imminent_transition_message = "A fallout has settled upon sif."

/datum/weather/sif/downpourwarning
	name = "early extreme monsoon"
	light_modifier = 0.4
	timer_low_bound = 1
	timer_high_bound = 2

	imminent_transition_message = "A fatal monsoon approaches."

	transition_chances = list(
		WEATHER_DOWNPOUR = 100
	)
	observed_message = "It looks like a very bad storm is about to approach."
	transition_messages = list(
		span_danger("Inky black clouds cover the sky in a eerie rumble, get to cover!")
	)
	outdoor_sounds_type = /datum/looping_sound/weather/rainrumble
	indoor_sounds_type = /datum/looping_sound/weather/rainrumble/indoors

/datum/weather/sif/downpour
	name = "extreme monsoon"
	icon_state = "downpour"
	light_modifier = 0.3
	timer_low_bound = 1
	timer_high_bound = 1
	wind_high = 4
	wind_low = 2
	flight_failure_modifier = 100
	effect_message = span_warning("Extreme rain is knocking you down!")

	imminent_transition_message = "A fatal monsoon approaches."

	var/next_lightning_strike = 0 // world.time when lightning will strike.
	var/min_lightning_cooldown = 5 SECONDS
	var/max_lightning_cooldown = 15 SECONDS

	transition_chances = list(
		WEATHER_DOWNPOURFATAL = 90,
		WEATHER_STORM = 10
	)
	observed_message = "Extreme rain is crushing you, get to cover!"
	transition_messages = list(
		span_danger("An immense downpour of falls on top of of the planet crushing anything in its path!")
	)
	outdoor_sounds_type = /datum/looping_sound/weather/rainheavy
	indoor_sounds_type = /datum/looping_sound/weather/rainindoors
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_LIVING

/datum/weather/sif/downpour/planet_effect(mob/living/L)
	if(L.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(L)
		if(!T.is_outdoors())
			return // They're indoors, so no need to rain on them.

		// If they have an open umbrella, knock it off, this is more then an umbrella
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			var/obj/item/melee/umbrella/U = L.get_active_hand()
			if(!istype(U) || !U.open)
				U = L.get_inactive_hand()

			if(istype(U) && U.open)
				if(show_message)
					to_chat(L, span_notice("The rain pushes the umbrella off your hands!"))
					H.drop_both_hands()

		L.water_act(2)
		L.Weaken(3)
		if(show_message)
			to_chat(L, effect_message)

/datum/weather/sif/downpour/process_effects()
	..()
	handle_lightning()

// This gets called to do lightning periodically.
// There is a seperate function to do the actual lightning strike, so that badmins can play with it.
/datum/weather/sif/downpour/proc/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)

/datum/weather/sif/downpourfatal
	name = "fatal monsoon"
	icon_state = "downpourfatal"
	light_modifier = 0.15
	timer_low_bound = 1
	timer_high_bound = 3
	wind_high = 6
	wind_low = 4
	flight_failure_modifier = 100
	effect_message = span_warning("Extreme rain is crushing you!")

	imminent_transition_message = "A fatal monsoon approaches."

	var/next_lightning_strike = 0 // world.time when lightning will strike.
	var/min_lightning_cooldown = 1 SECONDS
	var/max_lightning_cooldown = 3 SECONDS

	transition_chances = list(
		WEATHER_RAIN = 90,
		WEATHER_STORM = 10
	)
	observed_message = "Extreme rain is crushing you, get to cover!"
	//No transition message, supposed to be the 'actual' rain
	outdoor_sounds_type = /datum/looping_sound/weather/rainextreme
	indoor_sounds_type = /datum/looping_sound/weather/rainindoors
	effect_flags = HAS_PLANET_EFFECT | EFFECT_ONLY_LIVING

/datum/weather/sif/downpourfatal/planet_effect(mob/living/L)
	if(L.z in holder.our_planet.expected_z_levels)
		var/turf/T = get_turf(L)
		if(!T.is_outdoors())
			return // They're indoors, so no need to rain on them.

		// Knock the umbrella off your hands, aint protecting you c:
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			var/obj/item/melee/umbrella/U = L.get_active_hand()
			if(!istype(U) || !U.open)
				U = L.get_inactive_hand()

			if(istype(U) && U.open)
				if(show_message)
					to_chat(L, span_notice("The rain pushes the umbrella off your hands!"))
					H.drop_both_hands()

		var/target_zone = pick(BP_ALL)
		var/amount_blocked = L.run_armor_check(target_zone, "melee")
		var/amount_soaked = L.get_armor_soak(target_zone, "melee")

		var/damage = rand(10,30) //Ow

		if(amount_blocked >= 30)
			return

		if(amount_soaked >= damage)
			return // No need to apply damage.

		L.apply_damage(damage, BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "rain bludgoning")
		L.Weaken(3)
		if(show_message)
			to_chat(L, effect_message)

/datum/weather/sif/downpourfatal/process_effects()
	..()
	handle_lightning()

// This gets called to do lightning periodically.
// There is a seperate function to do the actual lightning strike, so that badmins can play with it.
/datum/weather/sif/downpourfatal/proc/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)
