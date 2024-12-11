/turf/simulated/shuttlewalls/white
	icon_state = ORE_QUARTZ

/turf/simulated/shuttlewalls/white/Initialize(mapload)
	. = ..(mapload, ORE_QUARTZ,ORE_QUARTZ)

/turf/simulated/shuttlewalls/void
	icon_state = "void"

/turf/simulated/shuttlewalls/void/Initialize(mapload)
	. = ..(mapload, MAT_VOPAL,MAT_VOPAL)

/turf/simulated/shuttlewalls/dark
	icon_state = "dark"

/turf/simulated/shuttlewalls/dark/Initialize(mapload)
	. = ..(mapload, MAT_PAINITE,MAT_PAINITE)
