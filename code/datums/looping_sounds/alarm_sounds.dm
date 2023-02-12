///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/fire_alarm // Commented out start/end as I don't feel they're very fitting
	// start_sound = 'sound/effects/alarms/fire_alarm/fire_alarm_start.ogg'
	// start_length = 40
	mid_sounds = list('sound/effects/alarms/fire_alarm/fire_alarm_mid.ogg' = 1)
	mid_length = 20
	// end_sound = 'sound/effects/alarms/fire_alarm/fire_alarm_stop.ogg'
	volume = 30
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/decompression_alarm
	mid_sounds = list('sound/effects/alarms/decon_alarm.ogg'=1)
	mid_length = 60
	volume = 100
	extra_range = 20
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/datum/looping_sound/ship_alarm
	mid_sounds = list('sound/effects/alarms/ship_alarm.ogg'=1)
	mid_length = 20
	volume = 60
	extra_range = 10
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/engineering_alarm
	mid_sounds = list('sound/effects/alarms/engineering_alarm.ogg'=1)
	mid_length = 30
	volume = 15
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/threat_level_high
	mid_sounds = list('sound/effects/alarms/threat_level_high.ogg'=1)
	mid_length = 30
	volume = 60
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/threat_level_extreme
	mid_sounds = list('sound/effects/alarms/threat_level_extreme.ogg'=1)
	mid_length = 30
	volume = 60
	pref_check = /datum/client_preference/looping_alarms

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
