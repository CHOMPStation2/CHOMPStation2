/mob
	var/voice_freq = 42500	// Preference for character voice frequency
	var/list/voice_sounds_list = list()	// The sound list containing our voice sounds!
	var/enabled = TRUE //Pauses a mob if disabled (Prevents life ticks from happening)
	var/died_in_vr = FALSE //For virtual reality sleepers
	var/last_move_time = 0 //For movement smoothing
	/// dict of custom stat tabs with data
	var/list/list/misc_tabs = list()

/mob/proc/update_misc_tabs()
	misc_tabs = list() //Reset misc_tabs every Stat() to prevent old shit sticking around

/mob/is_incorporeal()
	if(incorporeal_move)
		return 1
	..()
