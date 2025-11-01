/////////////////////////////////////////////////////////////////////////////////////
// Add objects that will be used in ALL away missions. Keep area specific stuff separate.
/obj/sc_away_spawner
	name = "RENAME ME, JERK"
	desc = "Spawns the mobs!"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	invisibility = INVISIBILITY_ABSTRACT
	mouse_opacity = 0
	density = 0
	anchored = 1

	//Weighted with values (not %chance, but relative weight)
	//Can be left value-less for all equally likely
	var/list/mobs_to_pick_from

	//When the below chance fails, the spawner is marked as depleted and stops spawning
	var/prob_spawn = 100	//Chance of spawning a mob whenever they don't have one
	var/prob_fall = 5		//Above decreases by this much each time one spawns

	//Settings to help mappers/coders have their mobs do what they want in this case
	var/faction				//To prevent infighting if it spawns various mobs, set a faction
	var/atmos_comp			//TRUE will set all their survivability to be within 20% of the current air
	//var/guard				//# will set the mobs to remain nearby their spawn point within this dist

	//Internal use only
	var/mob/living/simple_mob/my_mob
	var/depleted = FALSE

/obj/sc_away_spawner/Initialize(mapload)
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		log_mapping("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")
		flags |= ATOM_INITIALIZED
		return INITIALIZE_HINT_QDEL
	START_PROCESSING(SSobj, src)

/obj/sc_away_spawner/process()
	if(my_mob && my_mob.stat != DEAD)
		return //No need

	if(LAZYLEN(loc.human_mobs(world.view)))
		return //I'll wait.

	if(prob(prob_spawn))
		prob_spawn -= prob_fall
		var/picked_type = pickweight(mobs_to_pick_from)
		my_mob = new picked_type(get_turf(src))
		my_mob.low_priority = TRUE

		if(faction)
			my_mob.faction = faction

		if(atmos_comp)
			var/turf/T = get_turf(src)
			var/datum/gas_mixture/env = T.return_air()
			if(env)
				my_mob.minbodytemp = env.temperature * 0.8
				my_mob.maxbodytemp = env.temperature * 1.2

				var/list/gaslist = env.gas
				my_mob.min_oxy = gaslist[GAS_O2] * 0.8
				my_mob.min_tox = gaslist[GAS_PHORON] * 0.8
				my_mob.min_n2 = gaslist[GAS_N2] * 0.8
				my_mob.min_co2 = gaslist[GAS_CO2] * 0.8
				my_mob.max_oxy = gaslist[GAS_O2] * 1.2
				my_mob.max_tox = gaslist[GAS_PHORON] * 1.2
				my_mob.max_n2 = gaslist[GAS_N2] * 1.2
				my_mob.max_co2 = gaslist[GAS_CO2] * 1.2
/* //VORESTATION AI TEMPORARY REMOVAL
		if(guard)
			my_mob.returns_home = TRUE
			my_mob.wander_distance = guard
*/
		return
	else
		STOP_PROCESSING(SSobj, src)
		depleted = TRUE
		return

/obj/effect/map_effect/portal/master/side_a/retreat_west
	portal_id = "retreat_west"

/obj/effect/map_effect/portal/master/side_b/retreat_west
	portal_id = "retreat_west"

/obj/effect/map_effect/portal/master/side_a/retreat_east
	portal_id = "retreat_east"

/obj/effect/map_effect/portal/master/side_b/retreat_east
	portal_id = "retreat_east"
