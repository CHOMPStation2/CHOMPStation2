/mob
	var/receive_reagents = FALSE			//Pref for people to avoid others transfering reagents into them.
	var/give_reagents = FALSE				//Pref for people to avoid others taking reagents from them.
	var/apply_reagents = TRUE				//Pref for people to avoid having stomach reagents applied to them
	var/latejoin_vore = FALSE				//If enabled, latejoiners can spawn into this, assuming they have a client
	var/latejoin_prey = FALSE				//If enabled, latejoiners can spawn ontop of and instantly eat the victim
	var/noisy_full = FALSE					//Enables belching when a mob has overeaten
	var/phase_vore = TRUE					//Enabled by default since you have to enable drop pred/prey to do this anyway
	var/strip_pref = TRUE					//Enables the ability for worn items to be stripped
	var/no_latejoin_vore_warning = FALSE	//Auto accepts pred spwan notifications (roundbased / saveable)
	var/no_latejoin_prey_warning = FALSE	//Auto accepts prey spawn notifications (roundbased / saveable)
	var/no_latejoin_vore_warning_time = 15	//Time until accepting prey
	var/no_latejoin_prey_warning_time = 15	//Time until accepting pred
	var/no_latejoin_vore_warning_persists = FALSE	//Do we save it?
	var/no_latejoin_prey_warning_persists = FALSE	//Do we save it?
	var/belly_rub_target = null
	var/soulcatcher_pref_flags = 0			//Default disabled
