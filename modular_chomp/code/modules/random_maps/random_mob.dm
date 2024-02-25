/obj/structure/mob_spawner/scanner/fesh
	name = "Fish Filled Water"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	total_spawns = -1
	destructible = 0
	anchored = 1
	invisibility = 101
	anchored = TRUE
	spawn_types = list(
	/mob/living/simple_mob/animal/passive/fish/bass = 25,
	/mob/living/simple_mob/animal/passive/fish/trout = 25,
	/mob/living/simple_mob/animal/passive/fish/salmon = 25,
	/mob/living/simple_mob/animal/passive/fish/perch = 25,
	/mob/living/simple_mob/animal/passive/fish/pike = 25,
	/mob/living/simple_mob/animal/passive/fish/koi = 25,
	/mob/living/simple_mob/animal/passive/fish/javelin = 25,
	/mob/living/simple_mob/animal/passive/fish/icebass = 25,
	/mob/living/simple_mob/animal/passive/fish/rockfish = 25,
	/mob/living/simple_mob/animal/passive/fish/solarfish = 25,
	/mob/living/simple_mob/animal/passive/fish/murkin = 25,
	/mob/living/simple_mob/animal/passive/fish/measelshark = 5
	)

/obj/structure/mob_spawner/scanner/mosquito
	name = "Pulsating Hive"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 5
	mob_faction = "hive_court"
	total_spawns = -1
	destructible = 1
	health = 30
	anchored = TRUE
	icon = 'modular_chomp/icons/mob/crystalcore.dmi'
	icon_state = "nest"
	spawn_types = list(
	/mob/living/simple_mob/animal/crystalcore/mosquito/red = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/orange = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/yellow = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/green = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/blue = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/purple = 75,
	/mob/living/simple_mob/animal/crystalcore/mosquito/red/countess = 3,
	/mob/living/simple_mob/animal/crystalcore/mosquito/orange/baron = 3,
	/mob/living/simple_mob/animal/crystalcore/mosquito/blue/sleeper = 3,
	/mob/living/simple_mob/animal/crystalcore/mosquito/green/croc = 3,
	/mob/living/simple_mob/animal/crystalcore/mosquito/yellow/guardian = 3,
	/mob/living/simple_mob/animal/crystalcore/mosquito/purple/viscount = 3
	)