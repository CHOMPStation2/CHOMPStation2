/datum/event/meteor_wave/meatyores/get_skybox_image()
	var/image/res = image('icons/skybox/rockbox.dmi', "rockbox")
	res.color = COLOR_ASSEMBLY_RED
	res.appearance_flags = RESET_COLOR
	return res

/datum/event/meteor_wave/meatyores/tick()
	if(activeFor >= alarmWhen)
		for(var/obj/machinery/shield_diffuser/SD in GLOB.machines)
			if(SD.z in affecting_z)
				SD.meteor_alarm(10)

	if(waves && activeFor >= next_meteor)
		wave()

/datum/event/meteor_wave/meatyores/proc/wave()
	var/pick_side = prob(80) ? start_side : (prob(50) ? turn(start_side, 90) : turn(start_side, -90))

	if(!affecting_z.len)
		return
	spawn() spawn_meteors(get_wave_size(), get_meatyores(), pick_side, pick(affecting_z))
	next_meteor += rand(next_meteor_lower, next_meteor_upper) / severity
	waves--
	endWhen = worst_case_end()

/datum/event/meteor_wave/meatyores/announce()
	if(!victim)
		switch(severity)
			if(EVENT_LEVEL_MAJOR)
				command_announcement.Announce("Meatyores have been detected on collision course with \the [location_name()].", "Meteor Alert", new_sound = 'sound/AI/meteors.ogg')
			else
				command_announcement.Announce("\The [location_name()] is now in a meatyore shower.", "Meteor Alert")

/datum/event/meteor_wave/meatyores/end()
	if(has_skybox_image)
		SSskybox.rebuild_skyboxes(affecting_z)
	if(!victim)
		switch(severity)
			if(EVENT_LEVEL_MAJOR)
				command_announcement.Announce("\The [location_name()] has cleared the meatyore storm.", "Meteor Alert")
			else
				command_announcement.Announce("\The [location_name()] has cleared the meatyore shower", "Meteor Alert")

/datum/event/meteor_wave/meatyores/proc/get_meatyores()
	switch(severity)
		if(EVENT_LEVEL_MAJOR)
			return GLOB.meatyores_major
		if(EVENT_LEVEL_MODERATE)
			return GLOB.meatyores_moderate
		else
			return GLOB.meatyores_minor

GLOBAL_LIST_INIT(meatyores_minor, list(
	/obj/effect/meteor/medium/meatyore     = 80,
	/obj/effect/meteor/dust/meatyore       = 30,
	/obj/effect/meteor/irradiated/meatyore = 30,
	/obj/effect/meteor/big/meatyore        = 30,
	/obj/effect/meteor/flaming/meatyore    = 10,
))

GLOBAL_LIST_INIT(meatyores_moderate, list(
	/obj/effect/meteor/medium/meatyore     = 80,
	/obj/effect/meteor/big/meatyore        = 30,
	/obj/effect/meteor/dust/meatyore       = 30,
	/obj/effect/meteor/irradiated/meatyore = 30,
	/obj/effect/meteor/flaming/meatyore    = 10,
	/obj/effect/meteor/emp/meatyore        = 10,
))

GLOBAL_LIST_INIT(meatyores_major, list(
	/obj/effect/meteor/medium/meatyore     = 80,
	/obj/effect/meteor/big/meatyore        = 30,
	/obj/effect/meteor/dust/meatyore       = 30,
	/obj/effect/meteor/irradiated/meatyore = 30,
	/obj/effect/meteor/emp/meatyore        = 30,
	/obj/effect/meteor/flaming/meatyore    = 10,
	/obj/effect/meteor/tunguska/meatyore   = 1,
))
