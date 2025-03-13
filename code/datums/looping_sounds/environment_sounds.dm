/*
 *	The purpose of this file is to house environment sound loops that originate from TURFS OR OBJECTS SOLELY FOR ENVIRONMENTAL AMBIENCE.
 *	Lava bubbling is one such thing, the water rushing through a stream is another.
*/

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/water
	mid_sounds = list('sound/effects/weather/water_loop.ogg'=1)
	mid_length = 6 SECONDS
	volume = 10
	volume_chan = VOLUME_CHANNEL_AMBIENCE

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/lava
	mid_sounds = list(
		'sound/effects/lava/lava_mid1.ogg'=1,
		'sound/effects/lava/lava_mid2.ogg'=1,
		'sound/effects/lava/lava_mid3.ogg'=1,
		'sound/effects/lava/lava_mid4.ogg'=1,
		'sound/effects/lava/lava_mid5.ogg'=1
		)
	mid_length = 9 SECONDS
	volume = 40
	volume_chan = VOLUME_CHANNEL_AMBIENCE

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
