/turf/simulated/shuttle/wall/alien/orange
	icon = 'modular_chomp/icons/turf/alien.dmi'
	icon_state = "alien"
	base_state = "alien"
	light_range = 3
	light_power = 0.75
	light_color = "#FF3300" // Orangeish?
	light_on = TRUE

/turf/simulated/shuttle/wall/alien/orange/Initialize()
	. = ..()
	update_light()

/turf/simulated/shuttle/wall/alien/orange/hard_corner
	name = "hardcorner wall"
	icon_state = "alien-hc"
	hard_corner = 1

/turf/simulated/shuttle/wall/alien/orange/no_join
	name = "nojoin wall"
	icon_state = "alien-nj"
	join_group = null

/turf/simulated/wall/quartz
	icon_state = "hull-r_titanium"

/turf/simulated/wall/quartz/Initialize(mapload)
	. = ..(mapload,  MAT_QUARTZ, MAT_QUARTZ, MAT_QUARTZ)