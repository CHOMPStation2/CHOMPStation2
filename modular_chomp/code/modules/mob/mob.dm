/mob
	var/voice_freq = 42500	// Preference for character voice frequency
	var/list/voice_sounds_list = list()	// The sound list containing our voice sounds!
	var/died_in_vr = FALSE //For virtual reality sleepers

/mob/is_incorporeal()
	if(incorporeal_move)
		return 1
	..()