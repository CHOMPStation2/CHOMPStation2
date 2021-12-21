//
// VOREStation extensions to unit test framework.
//
//CHOMPStation Edit 14/1/20 TFF - Bugger you, runtimes. Forces test mobs to spawn at these coords for unit checks.
/datum/unit_test
	var/static/default_mobloc = locate(133,122,2)

/datum/unit_test/proc/create_test_mob(var/turf/mobloc = null, var/mobtype = /mob/living/carbon/human, var/with_mind = FALSE)
	if(isnull(mobloc))
		if(!default_mobloc)
			for(var/turf/simulated/floor/tiled/T in world)
				var/pressure = T.zone.air.return_pressure()
				if(90 < pressure && pressure < 120) // Find a turf between 90 and 120
					default_mobloc = T
					break
		mobloc = default_mobloc
	if(!mobloc)
		fail("Unable to find a location to create test mob")
		return 0

	var/mob/living/carbon/human/H = new mobtype(mobloc)
	H.init_vore()

	if(with_mind)
		H.mind_initialize("TestKey[rand(0,10000)]")

	return H
