/datum/controller
	var/name
	// The object used for the clickable stat() button.
	var/obj/effect/statclick/statclick

/datum/controller/proc/Initialize()

//cleanup actions
/datum/controller/proc/Shutdown()

//when we enter dmm_suite.load_map
/datum/controller/proc/StartLoadingMap()

//when we exit dmm_suite.load_map
/datum/controller/proc/StopLoadingMap()

/datum/controller/proc/Recover()

<<<<<<< HEAD
/datum/controller/proc/stat_entry(msg) //CHOMPEdit
=======
/datum/controller/proc/stat_entry(msg)
>>>>>>> c07027136e... Port tg statpanel (#16463)
