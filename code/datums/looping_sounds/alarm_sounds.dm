///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm
	volume_chan = VOLUME_CHANNEL_ALARMS
	pref_check = /datum/preference/toggle/looping_alarms

/datum/looping_sound/alarm/fire_alarm // Commented out start/end as I don't feel they're very fitting
	// start_sound = 'sound/effects/alarms/fire_alarm/fire_alarm_start.ogg'
	// start_length = 40
	mid_sounds = list('sound/effects/alarms/fire_alarm/fire_alarm_mid.ogg' = 1)
	mid_length = 6 SECONDS // Exact loop, these things should be constantly running while there's a fire actively going
	// end_sound = 'sound/effects/alarms/fire_alarm/fire_alarm_stop.ogg'
	volume = 30
	extra_range = 60 // Alarms should be clearly heard from far away

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/decompression_alarm
	mid_sounds = list('sound/effects/alarms/decon_alarm.ogg'=1)
	mid_length = 4 SECONDS // Delay by 1 second so as to not spam it
	volume = 100
	extra_range = 20

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/engineering_alarm
	mid_sounds = list('sound/effects/alarms/engineering_alarm.ogg'=1)
	mid_length = 30
	volume = 20
	extra_range = 30

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/threat_level_high
	mid_sounds = list('sound/effects/alarms/threat_level_high.ogg'=1)
	mid_length = 4 SECONDS
	volume = 60
	extra_range = 40

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/threat_level_extreme
	mid_sounds = list('sound/effects/alarms/threat_level_extreme.ogg'=1)
	mid_length = 4 SECONDS
	volume = 60
	extra_range = 40

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/sm_critical_alarm
	mid_sounds = list('sound/effects/alarms/crit_alarm.ogg'=1)
	mid_length = 3 SECONDS
	volume = 90
	extra_range = 40

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/alarm/sm_causality_alarm
	mid_sounds = list('sound/effects/alarms/causality_alarm.ogg'=1)
	mid_length = 9 SECONDS
	volume = 80
	extra_range = 60
