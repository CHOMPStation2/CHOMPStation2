/datum/looping_sound/showering
	start_sound = 'sound/machines/shower/shower_start.ogg'
	start_length = 2
	mid_sounds = list('sound/machines/shower/shower_mid1.ogg'=1,'sound/machines/shower/shower_mid2.ogg'=1,'sound/machines/shower/shower_mid3.ogg'=1)
	mid_length = 10
	end_sound = 'sound/machines/shower/shower_end.ogg'
	volume = 15

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/supermatter
	mid_sounds = list('sound/machines/sm/loops/calm.ogg'=1)
	mid_length = 60
	volume = 40
	extra_range = 10
	pref_check = /datum/preference/toggle/supermatter_hum

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/generator
	start_sound = 'sound/machines/generator/generator_start.ogg'
	start_length = 4
	mid_sounds = list('sound/machines/generator/generator_mid1.ogg'=1, 'sound/machines/generator/generator_mid2.ogg'=1, 'sound/machines/generator/generator_mid3.ogg'=1)
	mid_length = 4
	end_sound = 'sound/machines/generator/generator_end.ogg'
	volume = 40

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/datum/looping_sound/deep_fryer
	start_sound = 'sound/machines/kitchen/fryer/deep_fryer_immerse.ogg' //my immersions
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/fryer/deep_fryer_1.ogg' = 1, 'sound/machines/kitchen/fryer/deep_fryer_2.ogg' = 1)
	mid_length = 2
	end_sound = 'sound/machines/kitchen/fryer/deep_fryer_emerge.ogg'
	volume = 15

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/microwave
	start_sound = 'sound/machines/kitchen/microwave/microwave-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/microwave/microwave-mid1.ogg'=10, 'sound/machines/kitchen/microwave/microwave-mid2.ogg'=1)
	mid_length = 10
	end_sound = 'sound/machines/kitchen/microwave/microwave-end.ogg'
	volume = 90

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/oven
	start_sound = 'sound/machines/kitchen/oven/oven-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/oven/oven-mid1.ogg'=10)
	mid_length = 40
	end_sound = 'sound/machines/kitchen/oven/oven-stop.ogg'
	volume = 50

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/grill
	start_sound = 'sound/machines/kitchen/grill/grill-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/grill/grill-mid1.ogg'=10)
	mid_length = 40
	end_sound = 'sound/machines/kitchen/grill/grill-stop.ogg'
	volume = 50

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mixer
	start_sound = 'sound/machines/kitchen/mixer/mixer-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/mixer/mixer-mid1.ogg'=10)
	mid_length = 10
	end_sound = 'sound/machines/kitchen/mixer/mixer-stop.ogg'
	volume = 50

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/cerealmaker
	start_sound = 'sound/machines/kitchen/cerealmaker/cerealmaker-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/cerealmaker/cerealmaker-mid1.ogg'=10)
	mid_length = 60
	end_sound = 'sound/machines/kitchen/cerealmaker/cerealmaker-stop.ogg'
	volume = 50

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/candymaker
	start_sound = 'sound/machines/kitchen/candymaker/candymaker-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/kitchen/candymaker/candymaker-mid1.ogg'=10)
	mid_length = 40
	end_sound = 'sound/machines/kitchen/candymaker/candymaker-stop.ogg'
	volume = 20

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/looping_sound/air_pump
	start_sound = 'sound/machines/air_pump/airpumpstart.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/air_pump/airpumpidle.ogg' = 1)
	mid_length = 70
	end_sound = 'sound/machines/air_pump/airpumpshutdown.ogg'
	volume = 15
	pref_check = /datum/preference/toggle/air_pump_noise

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/vehicle_engine
	start_sound = 'sound/machines/vehicle/engine_start.ogg'
	start_length = 2
	mid_sounds = list('sound/machines/vehicle/engine_mid.ogg'=1)
	mid_length = 6
	end_sound = 'sound/machines/vehicle/engine_end.ogg'
	volume = 20

// CHOMPAdd: Fridges!
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/fridge
	mid_sounds = list('sound/machines/kitchen/fridge/fridge_loop.ogg' = 1)
	mid_length = 60
	volume = 10
	extra_range = -1 // Short-range
	pref_check = /datum/preference/toggle/fridge_hum
	volume_chan = VOLUME_CHANNEL_MACHINERY_IDLE

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/tcomms
	start_sound = 'sound/machines/tcomms/tcomms_pulse.ogg'
	mid_sounds = list('sound/machines/tcomms/tcomms_01.ogg' = 1)
	mid_length = 20
	end_sound = 'sound/machines/tcomms/tcomms_pulse.ogg'
	volume = 40
	extra_range = -5 // Short-range
	falloff = 0.1 // Harsh
	volume_chan = VOLUME_CHANNEL_MACHINERY_IDLE

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/shield_generator
	start_sound = 'sound/machines/shield_hum/shield_generator_whir.ogg'
	mid_sounds = list('sound/machines/shield_hum/shield_generator_hum2.ogg', 'sound/machines/shield_hum/shield_generator_hum3.ogg')
	mid_length = 60
	end_sound = 'sound/machines/shield_hum/shield_generator_whir.ogg'
	volume = 40
	volume_chan = VOLUME_CHANNEL_MACHINERY
	exclusive = TRUE
	extra_range = 10

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/lathe_print
	mid_sounds = list('sound/machines/lathe/lathe_print.ogg')
	mid_length = 2 SECONDS
	volume = 50
	vary = TRUE
	// ignore_walls = FALSE
	// falloff_distance = 1
	// mid_length_vary = 1 SECONDS
