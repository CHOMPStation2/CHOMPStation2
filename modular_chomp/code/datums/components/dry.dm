/datum/component/dry
	var/turf/simulated/turf

/datum/component/dry/Initialize()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	if(istype(parent, /obj/item/clothing/shoes))
		RegisterSignal(parent, COMSIG_SHOES_STEP_ACTION, PROC_REF(step_dry))

/datum/component/dry/proc/step_dry(obj/item/clothing/shoes/source)
	SIGNAL_HANDLER

	var/turf/simulated/turf = get_turf(parent)
	turf.wet_floor_finish()
