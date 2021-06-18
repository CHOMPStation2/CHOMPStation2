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
		/mob/living/silicon/robot/lost = 2,
		/mob/living/simple_mob/mechanical/hivebot/swarm = 1,
		/mob/living/simple_mob/animal/space/carp = 10,
		/obj/structure/closet/crate/mimic = 2,
		/mob/living/simple_mob/animal/space/bats = 70,
		/mob/living/simple_mob/animal/space/jelly = 25,
		/mob/living/simple_mob/animal/space/bear = 1,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1,
		/mob/living/simple_mob/animal/space/goose = 60,
		/mob/living/simple_mob/vore/bee = 50,
		/mob/living/simple_mob/metroid/mine = 20,
	)