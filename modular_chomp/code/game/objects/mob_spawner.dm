/obj/structure/mob_spawner/scanner/mining_animals
	name = "Mining Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	destructible = 0
	anchored = 1
	invisibility = 101
	spawn_types = list(
		/mob/living/simple_mob/vore/bat = 70,
		/mob/living/simple_mob/animal/passive/cockroach = 60,
		/obj/effect/spider/spiderling/non_growing = 50,
		/mob/living/simple_mob/animal/giant_spider/tunneler/cave = 50,
		/mob/living/simple_mob/vore/jelly = 40,
		/mob/living/simple_mob/vore/aggressive/rat = 30,
		/mob/living/simple_mob/animal/passive/mouse = 30,
		/mob/living/simple_mob/animal/passive/mouse/rat = 25,
		/mob/living/simple_mob/metroid/mine = 25,
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
