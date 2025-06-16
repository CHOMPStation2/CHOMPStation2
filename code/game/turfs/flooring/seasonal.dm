GLOBAL_VAR(world_time_season)
GLOBAL_VAR(world_time_year)
GLOBAL_VAR(world_time_month)
GLOBAL_VAR(world_time_day)

/proc/setup_season()
	GLOB.world_time_month = text2num(time2text(world.timeofday, "MM")) 	// get the current month
	switch(GLOB.world_time_month)
		if(1 to 2)
			GLOB.world_time_season = "winter"
		if(3 to 5)
			GLOB.world_time_season = "spring"
		if(6 to 8)
			GLOB.world_time_season = "summer"
		if(9 to 11)
			GLOB.world_time_season = "autumn"
		if(12)
			GLOB.world_time_season = "winter"
	GLOB.world_time_day = text2num(time2text(world.timeofday, "DD"))
	GLOB.world_time_year = text2num(time2text(world.timeofday, "YYYY"))

/turf/simulated/floor/outdoors/grass/seasonal
	name = "grass"
	icon = 'icons/seasonal/turf.dmi'
	icon_state = "s-grass"

	icon_edge = 'icons/seasonal/turf_edge.dmi'

	initial_flooring = /decl/flooring/grass/seasonal_grass

	grass = null //CHOMPEdit
	var/static/list/overlays_cache = list()
	animal_chance = 0.5 // CHOMPedit: upstream redeclared these as new vars for some reason
	animals = null // CHOMPedit end
	var/tree_chance = 1
	var/trees = null //CHOMPEdit
	var/snow_chance = 10

/turf/simulated/floor/outdoors/grass/seasonal/Initialize(mapload)

	switch(GLOB.world_time_season)
		if("spring")
			trees = "seasonalspring" //CHOMPEdit
			animals = "seasonalspring" //CHOMPEdit
			grass = "seasonalspring" //CHOMPEdit

			grass_chance = 30
		if("summer")
			trees = "seasonalsummer" //CHOMPEdit
			animals = "seasonalsummer" //CHOMPEdit
			grass = "seasonalsummer" //CHOMPEdit

		if("autumn")
			trees = "seasonalautumn" //CHOMPEdit

			animals = "seasonalautumn" //CHOMPEdit
			grass = "seasonalautumn" //CHOMPEdit

			grass_chance = 10
			animal_chance = 0.25
		if("winter")
			grass_chance = 0
			trees = "seasonalwinter"

			animals = "seasonalwinter" //CHOMPEdit
			if(prob(snow_chance))
				chill()
				return

			grass = "seasonalwinter" //CHOMPEdit

			grass_chance = 1
			animal_chance = 0.1


	if(tree_chance && prob(tree_chance) && !check_density())
		var/tree_type = pickweight(GLOB.grass_trees[trees]) //CHOMPEdit
		new tree_type(src)


	if(animal_chance && prob(animal_chance) && !check_density())
		var/animal_type = pickweight(GLOB.grass_animals[animals]) //CHOMPEdit
		new animal_type(src)


	. = ..()

/turf/simulated/floor/outdoors/grass/seasonal/proc/update_desc()

	switch(GLOB.world_time_season)
		if("spring")
			desc = "Lush green grass, flourishing! Little flowers peek out from between the blades here and there!"
		if("summer")
			desc = "Bright green grass, a little dry in the summer heat!"
		if("autumn")
			desc = "Golden grass, it's a little crunchy as it prepares for winter!"
		if("winter")
			desc = "Dry, seemingly dead grass! It's too cold for the grass..."


/turf/simulated/floor/outdoors/grass/seasonal/update_icon(update_neighbors)
	. = ..()
	update_desc()
	switch(GLOB.world_time_season)
		if("spring")
			if(prob(50))
				var/cache_key = "[GLOB.world_time_season]-overlay[rand(1,19)]"
				if(!overlays_cache[cache_key])
					var/image/I = image(icon = src.icon, icon_state = cache_key, layer = ABOVE_TURF_LAYER) // Icon should be abstracted out
					I.plane = TURF_PLANE
					I.color = null
					I.appearance_flags = RESET_COLOR|KEEP_APART|PIXEL_SCALE
					overlays_cache[cache_key] = I
				add_overlay(overlays_cache[cache_key])
		if("summer")
			return
		if("autumn")
			if(prob(33))
				var/cache_key = "[GLOB.world_time_season]-overlay[rand(1,6)]"
				if(!overlays_cache[cache_key])
					var/image/I = image(icon = src.icon, icon_state = cache_key, layer = ABOVE_TURF_LAYER) // Icon should be abstracted out
					I.plane = TURF_PLANE
					I.color = null
					I.appearance_flags = RESET_COLOR|KEEP_APART|PIXEL_SCALE
					overlays_cache[cache_key] = I
				add_overlay(overlays_cache[cache_key])

		if("winter")
			return

/turf/simulated/floor/outdoors/grass/seasonal/notrees
	tree_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/nomobs
	animal_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/notrees_nomobs
	tree_chance = 0
	animal_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/notrees_nomobs_nosnow
	tree_chance = 0
	animal_chance = 0
	snow_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/notrees_nomobs_lowsnow
	tree_chance = 0
	animal_chance = 0
	snow_chance = 1
/turf/simulated/floor/outdoors/grass/seasonal/lowsnow
	snow_chance = 1

/turf/simulated/floor/outdoors/grass/seasonal/dark
	icon_state = "ds-grass"
	edge_blending_priority = 4.01
	initial_flooring = /decl/flooring/grass/seasonal_grass/dark
	tree_chance = 5
/turf/simulated/floor/outdoors/grass/seasonal/dark/notrees
	tree_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/dark/nomobs
	animal_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/dark/notrees_nomobs
	tree_chance = 0
	animal_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/dark/notrees_nomobs_nosnow
	tree_chance = 0
	animal_chance = 0
	snow_chance = 0
/turf/simulated/floor/outdoors/grass/seasonal/dark/notrees_nomobs_lowsnow
	tree_chance = 0
	animal_chance = 0
	snow_chance = 1
/turf/simulated/floor/outdoors/grass/seasonal/dark/lowsnow
	snow_chance = 1

/turf/simulated/floor/water/seasonal/Initialize(mapload)
	. = ..()
	switch(GLOB.world_time_season)
		if("winter")
			if(prob(99))
				ChangeTurf(/turf/simulated/floor/outdoors/ice)

/turf/simulated/floor/water/deep/seasonal/Initialize(mapload)
	. = ..()
	switch(GLOB.world_time_season)
		if("winter")
			if(prob(75))
				ChangeTurf(/turf/simulated/floor/outdoors/ice)
