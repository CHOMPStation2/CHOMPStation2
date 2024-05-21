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
		/mob/living/simple_mob/vore/oregrub = 25,
		/mob/living/simple_mob/vore/aggressive/lizardman = 25,
		/mob/living/simple_mob/animal/space/bear = 1,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1,
		/mob/living/simple_mob/animal/space/goose = 60,
		/mob/living/simple_mob/vore/bee = 50,
		/mob/living/simple_mob/metroid/mine = 20,
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
	/mob/living/simple_mob/animal/passive/mouse/rat = 10, // Because I'm a horrible person. <3
	/obj/effect/spider/spiderling/non_growing = 5)

/obj/structure/mob_spawner/mouse_nest/mousehole/New()
	..()
	icon_state = "tunnel_hole"
