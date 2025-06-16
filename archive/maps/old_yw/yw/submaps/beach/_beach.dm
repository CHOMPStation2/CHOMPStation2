/obj/effect/overmap/visitable/sector/borealis1
	name = "Borealis 1"
	desc = "Home to sand and rocks."
	icon_state = "globe"
	color = "#ffd300" //Sandy
	initial_generic_waypoints = list(
									"borealis1_landing",
									"borealis1_landing_backup"
									)

/obj/effect/shuttle_landmark/premade/borealis1_landing
	name = "Borealis 1 Landing Pad"
	landmark_tag = "borealis1_landing"

/obj/effect/shuttle_landmark/premade/borealis1_landing_backup
	name = "Borealis 1 Backup Landing Pad"
	landmark_tag = "borealis1_landing_backup"

//This is a special subtype of the thing that generates ores on a map
//It will generate more rich ores because of the lower numbers than the normal one
/datum/random_map/noise/ore/beachmine
	descriptor = "beach mine ore distribution map"
	deep_val = 0.6 //More riches, normal is 0.7 and 0.8
	rare_val = 0.5

//The check_map_sanity proc is sometimes unsatisfied with how AMAZING our ores are
/datum/random_map/noise/ore/beachmine/check_map_sanity()
	var/rare_count = 0
	var/surface_count = 0
	var/deep_count = 0

	// Increment map sanity counters.
	for(var/value in map)
		if(value < rare_val)
			surface_count++
		else if(value < deep_val)
			rare_count++
		else
			deep_count++
	// Sanity check.
	if(surface_count < 100)
		admin_notice(span_danger("Insufficient surface minerals. Rerolling..."), R_DEBUG)
		return 0
	else if(rare_count < 50)
		admin_notice(span_danger("Insufficient rare minerals. Rerolling..."), R_DEBUG)
		return 0
	else if(deep_count < 50)
		admin_notice(span_danger("Insufficient deep minerals. Rerolling..."), R_DEBUG)
		return 0
	else
		return 1

// -- Objs -- //

// Two mob spawners that are placed on the map that spawn some mobs!
// They keep track of their mob, and when it's dead, spawn another (only if nobody is looking)
// Note that if your map has step teleports, mobs may wander through them accidentally and not know how to get back
/obj/cryogaia_away_spawner/beach_outside
	name = "Beach Outside Spawner" //Just a name
	faction = "beach_out" //Sets all the mobs to this faction so they don't infight
	atmos_comp = TRUE //Sets up their atmos tolerances to work in this setting, even if they don't normally (20% up/down tolerance for each gas, and heat)
	prob_spawn = 50 //Chance of this spawner spawning a mob (once this is missed, the spawner is 'depleted' and won't spawn anymore)
	prob_fall = 25 //Chance goes down by this much each time it spawns one (not defining and prob_spawn 100 means they spawn as soon as one dies)
	//guard = 40 //They'll stay within this range (not defining this disables them staying nearby and they will wander the map (and through step teleports))
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/passive/snake
	)

/obj/cryogaia_away_spawner/beach_outside_friendly
	name = "Fennec Spawner"
	faction = "fennec"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 25
	//guard = 40
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/fennec
	)

/obj/cryogaia_away_spawner/beach_cave
	name = "Beach Cave Spawner"
	faction = "beach_cave"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 40
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/frog = 3, //Frogs are 3x more likely to spawn than,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1, //these deathclaws are, with these values,
		/mob/living/simple_mob/animal/giant_spider = 2,
		/mob/living/simple_mob/vore/aggressive/giant_snake = 1,
		/mob/living/simple_mob/animal/giant_spider/webslinger = 1
	)

// These are step-teleporters, for map edge transitions
// This top one goes INTO the cave
/obj/effect/step_trigger/teleporter/away_beach_tocave/Initialize(mapload)
	. = ..()
	teleport_x = src.x //X is horizontal. This is a top of map transition, so you want the same horizontal alignment in the cave as you have on the beach
	teleport_y = 2 //2 is because it's putting you on row 2 of the map to the north
	teleport_z = z+1 //The cave is always our Z-level plus 1, because it's loaded after us

//This one goes OUT OF the cave
/obj/effect/step_trigger/teleporter/away_beach_tobeach/Initialize(mapload)
	. = ..()
	teleport_x = src.x //Same reason as bove
	teleport_y = world.maxy - 1 //This means "1 space from the top of the map"
	teleport_z = z-1 //Opposite of 'tocave', beach is always loaded as the map before us

// -- Turfs -- //

//These are just some special turfs for the beach water
/turf/simulated/floor/beach/coastwater
	name = "Water"
	icon_state = "water"

/turf/simulated/floor/beach/coastwater/Initialize(mapload)
	. = ..()
	add_overlay(image("icon"='icons/misc/beach.dmi',"icon_state"="water","layer"=MOB_LAYER+0.1))

// -- Areas -- //

//And some special areas, including our shuttle landing spot (must be unique)
/area/shuttle/excursion/away_beach
	name = "\improper Excursion Shuttle - Beach"
	base_turf = /turf/simulated/floor/beach/sand/desert
	dynamic_lighting = 0

/area/tether_away/beach
	name = "\improper Away Mission - Borealis 1a Beach"
	icon_state = "away"
	base_turf = /turf/simulated/floor/beach/sand //This is what the ground turns into if destroyed/bombed/etc
	//Not going to do sunlight simulations here like virgo3b
	//So we just make the whole beach fullbright all the time
	dynamic_lighting = 0
	requires_power = 0

/area/tether_away/beach/outpost //yw EDIT
	name = "\improper Away Mission - Borealis 1a Outpost"
	icon_state = "blue2"
	base_turf = /turf/simulated/floor/beach/sand
	dynamic_lighting = 1

/area/tether_away/beach/coast
	name = "\improper Away Mission - Borealis 1a Coast"
	icon_state = "blue2"
	base_turf = /turf/simulated/floor/beach/coastline

/area/tether_away/beach/water
	name = "\improper Away Mission - Borealis 1a Water"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/beach/coastwater

/area/tether_away/beach/jungle
	name = "\improper Away Mission - Borealis 1a Desert" //yw EDIT
	icon_state = "green"
	base_turf = /turf/simulated/floor/beach/sand/desert

//Some areas for the cave, which are referenced by our init object to seed submaps and ores
/area/tether_away/cave
	flags = RAD_SHIELDED
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/cave

/area/tether_away/cave/explored/normal
	name = "\improper Away Mission - Borealis 1a Cave (E)"
	icon_state = "explored"

/area/tether_away/cave/unexplored/normal
	name = "\improper Away Mission - Borealis 1a Cave (UE)"
	icon_state = "unexplored"

/area/tether_away/cave/explored/deep
	name = "\improper Away Mission - Borealis 1a Cave Deep (E)"
	icon_state = "explored_deep"

/area/tether_away/cave/unexplored/deep
	name = "\improper Away Mission - Borealis 1a Cave Deep (UE)"
	icon_state = "unexplored_deep"
