//Eggs
/obj/effect/spider/eggcluster/broodling
	spider_type = /obj/effect/spider/spiderling/broodling

/obj/effect/spider/eggcluster/royal/broodling
	spider_type = /obj/effect/spider/spiderling/varied/broodling



//Spiderling types
/obj/effect/spider/spiderling/broodling
	name = "brood spiderling"
	grow_as = list(/mob/living/simple_mob/animal/giant_spider/broodling, /mob/living/simple_mob/animal/giant_spider/nurse/broodling, /mob/living/simple_mob/animal/giant_spider/hunter/broodling)

/obj/effect/spider/spiderling/varied/broodling
	grow_as = list(/mob/living/simple_mob/animal/giant_spider/broodling, /mob/living/simple_mob/animal/giant_spider/nurse/broodling, /mob/living/simple_mob/animal/giant_spider/hunter/broodling,
			/mob/living/simple_mob/animal/giant_spider/frost/broodling, /mob/living/simple_mob/animal/giant_spider/electric/broodling, /mob/living/simple_mob/animal/giant_spider/lurker/broodling,
			/mob/living/simple_mob/animal/giant_spider/pepper/broodling, /mob/living/simple_mob/animal/giant_spider/thermic/broodling, /mob/living/simple_mob/animal/giant_spider/tunneler/broodling,
			/mob/living/simple_mob/animal/giant_spider/webslinger/broodling)

//Space Spiderling
/obj/effect/spider/eggcluster/space
	spider_type = /obj/effect/spider/spiderling/space

/obj/effect/spider/eggcluster/royal/space
	spider_type = /obj/effect/spider/spiderling/varied/space

/obj/effect/spider/spiderling/space
	name = "brood spiderling"
	grow_as = list(/mob/living/simple_mob/animal/giant_spider/space, /mob/living/simple_mob/animal/giant_spider/nurse/space, /mob/living/simple_mob/animal/giant_spider/hunter/space)

/obj/effect/spider/spiderling/varied/space
	grow_as = list(/mob/living/simple_mob/animal/giant_spider/space, /mob/living/simple_mob/animal/giant_spider/nurse/space, /mob/living/simple_mob/animal/giant_spider/hunter/space,
			/mob/living/simple_mob/animal/giant_spider/frost/space, /mob/living/simple_mob/animal/giant_spider/electric/space, /mob/living/simple_mob/animal/giant_spider/lurker/space,
			/mob/living/simple_mob/animal/giant_spider/pepper/space, /mob/living/simple_mob/animal/giant_spider/thermic/space, /mob/living/simple_mob/animal/giant_spider/tunneler/space,
			/mob/living/simple_mob/animal/giant_spider/webslinger/space)
