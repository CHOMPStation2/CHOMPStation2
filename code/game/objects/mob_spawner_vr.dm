/obj/structure/mob_spawner
	name = "mob spawner"
	desc = "This shouldn't be seen, yell at a dev."
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	anchored = TRUE

	var/last_spawn = 0
	var/spawn_delay = 10 MINUTES

	var/list/spawn_types = list(
	/mob/living/simple_mob/animal/passive/dog/corgi = 100,
	/mob/living/simple_mob/animal/passive/cat = 25
	)

	var/total_spawns = -1 //Total mob spawns, over all time, -1 for no limit
	var/simultaneous_spawns = 3 //Max spawned mobs active at one time
	var/mob_faction

	var/destructible = 0
	var/health = 50

	var/list/spawned_mobs = list()

/obj/structure/mob_spawner/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	last_spawn = world.time + rand(0,spawn_delay)

/obj/structure/mob_spawner/Destroy()
	STOP_PROCESSING(SSobj, src)
	//CHOMPEdit Start
	for(var/spawned in spawned_mobs)
		if(istype(spawned, /mob/living))
			var/mob/living/L = spawned
			L.nest = null
		if(istype(spawned, /obj/structure/closet/crate/mimic))
			var/obj/structure/closet/crate/mimic/O = spawned
			O.nest = null
	//CHOMPEdit End
	spawned_mobs.Cut()
	return ..()

/obj/structure/mob_spawner/process()
	if(!can_spawn())
		return
	var/chosen_mob = choose_spawn()
	if(chosen_mob)
		do_spawn(chosen_mob)

/obj/structure/mob_spawner/proc/can_spawn()
	if(!total_spawns)
		return 0
	if(spawned_mobs.len >= simultaneous_spawns)
		return 0
	if(world.time < last_spawn + spawn_delay)
		return 0
	return 1

/obj/structure/mob_spawner/proc/choose_spawn()
	return pickweight(spawn_types)

/obj/structure/mob_spawner/proc/do_spawn(var/mob_path)
	if(!ispath(mob_path))
		return 0
	//CHOMPEdit Start
	if(!ispath(mob_path, /mob/living) && !ispath(mob_path, /obj/structure/closet/crate/mimic))
		return 0
	last_spawn = world.time
	if(total_spawns > 0)
		total_spawns--
	if(ispath(mob_path, /mob/living))
		var/mob/living/L = new mob_path(get_turf(src))
		L.nest = src
		spawned_mobs.Add(L)
		if(mob_faction)
			L.faction = mob_faction
		return L
	if(ispath(mob_path, /obj/structure/closet/crate/mimic))
		var/obj/structure/closet/crate/mimic/O = new mob_path(get_turf(src))
		spawned_mobs.Add(O)
		O.nest = src
		return O
	return 0
	//CHOMPEdit End

/obj/structure/mob_spawner/proc/get_death_report(var/mob/living/L)
	if(L in spawned_mobs)
		spawned_mobs.Remove(L)

/obj/structure/mob_spawner/attackby(var/obj/item/I, var/mob/living/user)
	if(!I.force || I.flags & NOBLUDGEON || !destructible)
		return

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(src)
	visible_message(span_warning("\The [src] has been [LAZYLEN(I.attack_verb) ? "[pick(I.attack_verb)]":"attacked"] with \the [I] by [user]."))
	take_damage(I.force)

/obj/structure/mob_spawner/bullet_act(var/obj/item/projectile/Proj)
	..()
	if(destructible)
		take_damage(Proj.get_structure_damage())

/obj/structure/mob_spawner/take_damage(var/damage)
	health -= damage
	if(health <= 0)
		visible_message(span_warning("\The [src] breaks apart!"))
		qdel(src)

/obj/structure/mob_spawner/clear_zlevel/can_spawn()
	if(!..())
		return 0
	var/turf/T = get_turf(src)
	if(!T)
		return 0
	for(var/mob/living/L in GLOB.player_list)
		var/turf/L_T
		if(L.stat == DEAD)
			continue
		L_T = get_turf(L)
		if(T.z == L_T.z)
			return 0
	return 1


/*
This code is based on the mob spawner and the proximity sensor, the idea is to lazy load mobs to avoid having the server use mobs when they arent needed.
It also makes it so a ghost wont know where all the goodies/mobs are.
*/

/obj/structure/mob_spawner/scanner
	name ="Lazy Mob Spawner"
	var/range = 10 //range in tiles from the spawner to detect moving stuff
//CHOMPEdit Begin
	var/datum/proximity_monitor/mobspawner/prox
	var/list/mobs_in_range = list()

/obj/structure/mob_spawner/scanner/Initialize(mapload)
	. = ..()
	prox = new(src, range)

//CHOMPEdit Start
/obj/structure/mob_spawner/scanner/do_spawn(var/mob_path)
	if(!ispath(mob_path))
		return 0
	if(!ispath(mob_path, /mob/living) && !ispath(mob_path, /obj/structure/closet/crate/mimic))
		return 0
	last_spawn = world.time
	if(total_spawns > 0)
		total_spawns--
	//how about we find a suitable location first
	var/attempts = 0
	var/turf/spawn_turf = null

	while((!spawn_turf || spawn_turf.density) && attempts < 15)
		var/xcoord = rand(-5,5)
		var/ycoord = rand(-5,5)
		spawn_turf = locate(x + xcoord, y + ycoord, z)
		attempts++

	//and then we spawn them
	if(ispath(mob_path, /mob/living))
		var/mob/living/L = new mob_path(get_turf(spawn_turf))
		L.nest = spawn_turf
		spawned_mobs.Add(L)
		if(mob_faction)
			L.faction = mob_faction
		return L
	if(ispath(mob_path, /obj/structure/closet/crate/mimic))
		var/obj/structure/closet/crate/mimic/O = new mob_path(get_turf(spawn_turf))
		spawned_mobs.Add(O)
		O.nest = spawn_turf
		return O
	return 0
//CHOMPEdit End

/obj/structure/mob_spawner/scanner/proc/NewProximity(atom/movable/AM)
	if(istype(AM,/mob/living) && !(AM in mobs_in_range))
		mobs_in_range += AM


/obj/structure/mob_spawner/scanner/proc/CheckProximity(atom/movable/AM,turf/new_loc)
	if((AM in mobs_in_range) && (!AM || get_dist(src,new_loc) > range))
		mobs_in_range -= AM

//CHOMPEdit End

/obj/structure/mob_spawner/scanner/process()
	if(!can_spawn())
		return
	//CHOMPEdit Begin
	if(world.time > last_spawn + spawn_delay)
		for(var/mob/living/A in mobs_in_range) //No more calling fucking range(10) every goddamn processing tick, christ.
			if ((A.faction != mob_faction) && A.ckey)
				var/chosen_mob = choose_spawn()
				if(chosen_mob)
					do_spawn(chosen_mob)
					break //ALSO NO SPAWNING MULTIPLE MOBS
	//CHOMPEdit End

//////////////
// Spawners //
/////////////
/obj/structure/mob_spawner/scanner/corgi
	name = "Corgi Lazy Spawner"
	desc = "This is a proof of concept, not sure why you would use this one"
	spawn_delay = 3 MINUTES
	mob_faction = FACTION_CORGI
	spawn_types = list(
	/mob/living/simple_mob/animal/passive/dog/corgi = 75,
	/mob/living/simple_mob/animal/passive/dog/corgi/puppy = 50
	)

	simultaneous_spawns = 5
	range = 7
	destructible = 1
	health = 200
	total_spawns = 100

/obj/structure/mob_spawner/scanner/wild_animals
	name = "Wilderness Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = FACTION_WILD_ANIMAL
	total_spawns = -1
	destructible = 0
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	spawn_types = list(
	/mob/living/simple_mob/animal/passive/gaslamp = 20,
//	/mob/living/simple_mob/vore/otie/feral = 10,
	/mob/living/simple_mob/vore/aggressive/dino/virgo3b = 5,
	/mob/living/simple_mob/vore/aggressive/dragon/virgo3b = 1
	)

/obj/structure/mob_spawner/scanner/xenos
	name = "Xenomorph Egg"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = FACTION_XENO
	total_spawns = -1
	destructible = 1
	health = 50
	anchored = TRUE
	icon = 'icons/mob/actions.dmi'
	icon_state = "alien_egg"
	spawn_types = list(
	/mob/living/simple_mob/animal/space/alien/drone = 20,
	/mob/living/simple_mob/animal/space/alien = 10,
	/mob/living/simple_mob/animal/space/alien/sentinel = 5,
	/mob/living/simple_mob/animal/space/alien/queen = 1
	)

/obj/structure/mob_spawner/scanner/xenos/royal
	name = "Royal Xenomorph Egg"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = FACTION_XENO
	total_spawns = 1
	destructible = 1
	health = 50
	anchored = TRUE
	icon = 'icons/mob/actions.dmi'
	icon_state = "alien_egg"
	spawn_types = list(
	/mob/living/simple_mob/animal/space/alien/queen = 5,
	)
<<<<<<< HEAD
=======

/obj/structure/mob_spawner/scanner/mining_animals
	name = "Mining Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	destructible = 0
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT
	spawn_types = list(
		/mob/living/simple_mob/vore/bat = 70,
		/mob/living/simple_mob/animal/passive/cockroach = 60,
		/obj/effect/spider/spiderling/non_growing = 50,
		/mob/living/simple_mob/animal/giant_spider/tunneler/cave = 50,
		/mob/living/simple_mob/vore/jelly = 40,
		/mob/living/simple_mob/vore/aggressive/rat = 30,
		/mob/living/simple_mob/animal/passive/mouse = 30,
		/mob/living/simple_mob/animal/passive/mouse/rat = 25,
		// /mob/living/simple_mob/metroid/mine = 25, // Downstream
		/mob/living/simple_mob/vore/oregrub = 25,
		/mob/living/simple_mob/vore/aggressive/dino = 20,
		/mob/living/simple_mob/animal/space/carp = 20,
		/mob/living/simple_mob/vore/oregrub/lava = 15,
		/mob/living/simple_mob/vore/stalker = 10,
		/mob/living/simple_mob/vore/lamia/copper/cave = 10,
		/mob/living/simple_mob/vore/lamia/albino/cave = 5,
		/mob/living/simple_mob/vore/aggressive/lizardman = 5,
		/mob/living/simple_mob/vore/otie = 5,
		/mob/living/simple_mob/animal/passive/pillbug = 5, // These aren't dangerous, but are made rare just because few people are going to bother killing them.
		/obj/structure/closet/crate/mimic/cointoss = 1,
		/obj/structure/closet/crate/mimic/closet/cointoss = 1,
		/mob/living/simple_mob/vore/otie/feral = 1,
		// /mob/living/simple_mob/vore/sonadile = 1, // Removed until sprite issues fixed.
		/mob/living/simple_mob/animal/space/bear/brown = 1,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1,
		/mob/living/simple_mob/vore/gryphon = 1,
		/mob/living/simple_mob/vore/demon = 0.5 // VERY rare!
	)

/obj/structure/mob_spawner/proc/get_used_report(var/obj/structure/closet/crate/mimic/O)
	if(O in spawned_mobs)
		spawned_mobs.Remove(O)

/obj/structure/mob_spawner/mouse_nest/mousehole
	name = "small hole"
	desc = "A small hole, critters seem to move in and out from here."
	icon = 'icons/effects/effects.dmi'
	icon_state = "tunnel_hole"
	spawn_types = list(
	/mob/living/simple_mob/animal/passive/mouse = 100,
	/mob/living/simple_mob/animal/passive/cockroach = 25,
	/mob/living/simple_mob/animal/passive/mouse/rat/strong = 10, // Because I'm a horrible person. <3
	/obj/effect/spider/spiderling/non_growing = 5)

/obj/structure/mob_spawner/mouse_nest/mousehole/Initialize(mapload)
	. = ..()
	icon_state = "tunnel_hole"

/obj/structure/mob_spawner/recycler
	desc = "A bizarre mess of robotic limbs, glowing microrefineries, and nanoassemblers gradually converting the pile of raw materials into active hivebots."
	destructible = 1
	icon = 'icons/obj/recycling.dmi'
	icon_state = "grinder-b1"
	name = "hivebot assembler"
	simultaneous_spawns = 6
	spawn_delay = 300
	spawn_types = list(/mob/living/simple_mob/mechanical/hivebot/swarm = 200, /mob/living/simple_mob/mechanical/hivebot/ranged_damage/basic = 50, /mob/living/simple_mob/mechanical/hivebot/ranged_damage/laser = 25, /mob/living/simple_mob/mechanical/hivebot/ranged_damage/ion = 10, /mob/living/simple_mob/mechanical/hivebot/tank/meatshield = 10)

>>>>>>> 6f1d6c524d (Simple mob port [IDB IGNORE] (#18236))
