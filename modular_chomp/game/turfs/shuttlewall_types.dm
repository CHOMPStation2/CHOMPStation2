/turf/simulated/shuttlewalls/white
	icon_state = "quartz"

/turf/simulated/shuttlewalls/white/Initialize(mapload)
	. = ..(mapload, "quartz","quartz")

/turf/simulated/shuttlewalls/void
	icon_state = "void"

/turf/simulated/shuttlewalls/void/Initialize(mapload)
	. = ..(mapload, "void opal","void opal")

/turf/simulated/shuttlewalls/dark
	icon_state = "dark"

/turf/simulated/shuttlewalls/dark/Initialize(mapload)
	. = ..(mapload, "painite","painite")