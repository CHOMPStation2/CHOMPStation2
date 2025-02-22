/mob
	var/voice_freq = 42500	// Preference for character voice frequency
	var/list/voice_sounds_list = list()	// The sound list containing our voice sounds!
	var/enabled = TRUE //Pauses a mob if disabled (Prevents life ticks from happening)
	var/died_in_vr = FALSE //For virtual reality sleepers
	var/last_move_time = 0 //For movement smoothing

/mob/is_incorporeal()
	if(incorporeal_move)
		return 1
	..()
