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

	// CHOMP vore icons refactor (Now on mob)
	var/vore_capacity = 0				// Maximum capacity, -1 for unlimited
	var/vore_capacity_ex = list("stomach" = 0) //expanded list of capacities
	var/vore_fullness = 0				// How "full" the belly is (controls icons)
	var/list/vore_fullness_ex = list("stomach" = 0) // Expanded list of fullness
	var/belly_size_multiplier = 1
	var/vore_sprite_multiply = list("stomach" = FALSE, "taur belly" = FALSE)
	var/vore_sprite_color = list("stomach" = "#000", "taur belly" = "#000")

	var/list/vore_icon_bellies = list("stomach")
	var/updating_fullness = FALSE
	var/obj/belly/previewing_belly
