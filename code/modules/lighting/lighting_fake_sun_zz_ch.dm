//_zz is to change load order c:
//Urgh, I hate lighting - Cadyn

/obj/effect/fake_sun
	var/advanced_lighting = FALSE

/obj/effect/fake_sun/Initialize()
	if(!advanced_lighting)
		return ..()
	do_sun = FALSE

	//Copied code
	if(family)	//Allows one to make multiple fake_suns to use the same settings
		for(var/obj/effect/fake_sun/l in world_suns)	//check all the suns that exist
			if(l.family == family && l.shared_settings)	//do you have settings we need?
				choice = l.shared_settings
				break
	if(!choice)	//We didn't get anything from our family, let's pick something
		choice = pick(possible_light_setups)
		if(family)	//Let's pass our settings on to our family
			shared_settings = choice
	if(choice["brightness"] <= LIGHTING_SOFT_THRESHOLD) // dark!
		return
	//Copied code end

	var/datum/simple_sun/Ssun = new()
	Ssun.brightness = CLAMP01(choice["brightness"])
	Ssun.color = choice["color"]
	var/datum/planet_sunlight_handler/pshandler = new(Ssun)
	if(z > SSlighting.z_to_pshandler.len)
		SSlighting.z_to_pshandler.len = z
	SSlighting.z_to_pshandler[z] = pshandler
	SSlighting.update_sunlight(pshandler) //Queue an update for when it starts running

	. = ..()
