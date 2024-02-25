/datum/random_map/automata/cave_system/purplelayer
	animals = /obj/structure/mob_spawner/scanner/mining_animals/purple

/datum/random_map/automata/cave_system/deeppurplelayer
	animals = /obj/structure/mob_spawner/scanner/mining_animals/deeppurple

/datum/random_map/automata/cave_system/redlayer
	animals = /obj/structure/mob_spawner/scanner/mining_animals/red

/datum/random_map/automata/cave_system/darklayer
	animals = /obj/structure/mob_spawner/scanner/mining_animals/dark



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
		/mob/living/simple_mob/mechanical/hivebot/swarm = 1,
		/mob/living/simple_mob/animal/space/carp = 10,
		/obj/structure/closet/crate/mimic/dangerous = 2,
		/mob/living/simple_mob/animal/space/bats = 70,
		/mob/living/simple_mob/vore/jelly = 25,
		/mob/living/simple_mob/animal/space/bear = 1,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1,
		/mob/living/simple_mob/animal/space/goose = 60,
		/mob/living/simple_mob/vore/bee = 50,
		/mob/living/simple_mob/metroid/mine = 20,
	)


/obj/structure/mob_spawner/scanner/mining_animals/purple
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	spawn_types = list(
		/mob/living/simple_mob/vore/oregrub = 60,
		/mob/living/simple_mob/animal/crystalcore/jellyfish = 60,
		/mob/living/simple_mob/animal/crystalcore/jellyfish/explosive = 60,
		/mob/living/simple_mob/vore/oregrub/lava = 40,
		/mob/living/simple_mob/animal/crystalcore/crab = 40,
		/mob/living/simple_mob/vore/sect_drone = 40,
		/mob/living/simple_mob/mechanical/hivebot/swarm = 20,
		/mob/living/simple_mob/construct/shade = 20,
		/mob/living/simple_mob/vore/pitcher_plant = 5,
		/mob/living/simple_mob/vore/sect_queen = 5,
	)

/obj/structure/mob_spawner/scanner/mining_animals/deeppurple
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	spawn_types = list(
		/mob/living/simple_mob/vore/oregrub/lava = 60,
		/mob/living/simple_mob/animal/crystalcore/crab = 60,
		/mob/living/simple_mob/animal/crystalcore/eel = 60,
		/mob/living/simple_mob/vore/oregrub/lava = 40,
		/mob/living/simple_mob/mechanical/hivebot/swarm = 40,
		/mob/living/simple_mob/vore/sect_drone = 40,
		/mob/living/simple_mob/humanoid/possessed/industrial = 20,
		/mob/living/simple_mob/vore/sect_queen = 20,
		/mob/living/simple_mob/animal/crystalcore/revospider = 5,
		/mob/living/simple_mob/mechanical/hivebot/precusor/laser = 5,
	)

/obj/structure/mob_spawner/scanner/mining_animals/red
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	spawn_types = list(
		/mob/living/simple_mob/vore/oregrub/lava = 60,
		/mob/living/simple_mob/mechanical/deepdrilldrone = 60,
		/mob/living/simple_mob/mechanical/hivebot/swarm = 60,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/laser = 40,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/basic = 40,
		/mob/living/simple_mob/humanoid/possessed/industrial = 40,
		/mob/living/simple_mob/humanoid/obsidianscale/melee = 20,
		/mob/living/simple_mob/humanoid/cultist/tesh = 20,
		/mob/living/simple_mob/animal/crystalcore/hypnofish = 5,
		/mob/living/simple_mob/vore/demonAI = 5,
	)

/obj/structure/mob_spawner/scanner/mining_animals/dark
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	spawn_types = list(
		/mob/living/simple_mob/animal/crystalbeast/snail = 5,
		/mob/living/simple_mob/construct/shade = 60,
		/mob/living/simple_mob/faithless = 60,
		/mob/living/simple_mob/animal/crystalcore/shadowray = 60,
		/mob/living/simple_mob/animal/crystalcore/turtle = 40,
		/mob/living/simple_mob/animal/crystalcore/shark = 40,
		/mob/living/simple_mob/animal/crystalcore/depthworm = 40,
		/mob/living/simple_mob/animal/crystalcore/blobfish = 20,
		/mob/living/simple_mob/animal/crystalcore/angler = 20,
		/mob/living/simple_mob/slime/xenobio/sepia = 5,
	)