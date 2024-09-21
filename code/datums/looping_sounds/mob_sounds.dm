/*
 *	The purpose of this file is to house mob injury loops - such as being on fire.
*/

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mob
	// volume_chan = VOLUME_CHANNEL_MOB_SOUNDS

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mob/deafened
	start_sound = 'modular_chomp/sound/effects/ear_ring/ear_deaf_in.ogg'
	start_length = 4 SECONDS // 2 seconds shorter than the actual file ending, bc we want it to overlap
	mid_sounds = list('modular_chomp/sound/misc/silence.ogg'=1)
	mid_length = 3 SECONDS
	end_sound = 'modular_chomp/sound/effects/ear_ring/ear_deaf_out.ogg'
	volume = 40
	direct = TRUE 		// We send this sound directly to the mob, bc they only hear it when they're deaf.
	exclusive = TRUE	// This should only occur once, because we can only be deafened once.
	volume_chan = VOLUME_CHANNEL_HUD_WARNINGS

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mob/cozyloop
	mid_sounds = list('modular_chomp/sound/misc/cozy.ogg'=1)
	mid_length = 21 SECONDS
	volume = 40
	pref_check = /datum/preference/toggle/sleep_music
	direct = TRUE 		// We send this sound directly to the mob, bc they only hear it when they're asleep.
	exclusive = TRUE	// This should only occur once, because we only want one music loop running while we snooze.
	volume_chan = VOLUME_CHANNEL_HUD_WARNINGS

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mob/on_fire
	mid_sounds = list('sound/effects/mob_effects/on_fire/on_fire_loop.ogg'=1)
	mid_length = 6 SECONDS
	end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish.ogg'
	volume = 20
	exclusive = TRUE // This should only occur once, because we only want one loop running while we're on fire, even if we're set on fire multiple times.
	volume_chan = VOLUME_CHANNEL_INJURY_SOUNDS

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/looping_sound/mob/stunned // Going to hang onto this one for later
	mid_sounds = list('sound/effects/mob_effects/stun_loop.ogg'=1)
	mid_length = 3 SECONDS
	volume = 70
	direct = TRUE // Send this one directly to the mob, only applies when we're Weakened()
	exclusive = TRUE // This should only occur once, because we only want one loop running.
	volume_chan = VOLUME_CHANNEL_HUD_WARNINGS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
