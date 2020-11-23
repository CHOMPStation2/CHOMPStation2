/obj/item/weapon/grenade/spawnergrenade/casino

	desc = "It is set to detonate in 5 seconds. It will release a goose that has been won from the golden goose casino!"
	name = "Casino Creature Container (Goose)"
	icon = 'icons/obj/grenade_ch.dmi'
	icon_state = "casino"
	item_state = "casino"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 2)
	spawner_type = /mob/living/simple_mob/animal/space/goose/domesticated


// Detonate now just handles the two loops that query for people in lockers and people who can see it.
/obj/item/weapon/grenade/spawnergrenade/casino/detonate()

	if(spawner_type && deliveryamt)
		var/turf/T = get_turf(src)
		playsound(T, 'sound/effects/phasein.ogg', 100, 1)

		for(var/i=1, i<=deliveryamt, i++)
			var/atom/movable/x = new spawner_type(T)
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(x, pick(NORTH,SOUTH,EAST,WEST))
	qdel(src)
	return

/obj/item/weapon/grenade/spawnergrenade/casino/goat
	desc = "It is set to detonate in 5 seconds. It will release a goat that has been won from the golden goose casino!"
	name = "Casino Creature Container (Goat)"
	spawner_type = /mob/living/simple_mob/animal/goat

/obj/item/weapon/grenade/spawnergrenade/casino/armadillo
	desc = "It is set to detonate in 5 seconds. It will release a armadillo that has been won from the golden goose casino!"
	name = "Casino Creature Container (Armadillo)"
	spawner_type = /mob/living/simple_mob/animal/passive/armadillo

/obj/item/weapon/grenade/spawnergrenade/casino/cat
	desc = "It is set to detonate in 5 seconds. It will release a cat that has been won from the golden goose casino!"
	name = "Casino Creature Container (Cat)"
	spawner_type = /mob/living/simple_mob/animal/passive/cat

/obj/item/weapon/grenade/spawnergrenade/casino/chicken
	desc = "It is set to detonate in 5 seconds. It will release a chicken that has been won from the golden goose casino!"
	name = "Casino Creature Container (Chicken)"
	spawner_type = /mob/living/simple_mob/animal/passive/chicken

/obj/item/weapon/grenade/spawnergrenade/casino/cow
	desc = "It is set to detonate in 5 seconds. It will release a cow that has been won from the golden goose casino!"
	name = "Casino Creature Container (Cow)"
	spawner_type = /mob/living/simple_mob/animal/passive/cow

/obj/item/weapon/grenade/spawnergrenade/casino/corgi
	desc = "It is set to detonate in 5 seconds. It will release a corgi that has been won from the golden goose casino!"
	name = "Casino Creature Container (Corgi)"
	spawner_type = /mob/living/simple_mob/animal/passive/dog/corgi

/obj/item/weapon/grenade/spawnergrenade/casino/fox
	desc = "It is set to detonate in 5 seconds. It will release a fox that has been won from the golden goose casino!"
	name = "Casino Creature Container (Fox)"
	spawner_type = /mob/living/simple_mob/animal/passive/fox

/obj/item/weapon/grenade/spawnergrenade/casino/lizard
	desc = "It is set to detonate in 5 seconds. It will release a lizard that has been won from the golden goose casino!"
	name = "Casino Creature Container (Lizard)"
	spawner_type = /mob/living/simple_mob/animal/passive/lizard

/obj/item/weapon/grenade/spawnergrenade/casino/penguin
	desc = "It is set to detonate in 5 seconds. It will release a penguin that has been won from the golden goose casino!"
	name = "Casino Creature Container (Penguin)"
	spawner_type = /mob/living/simple_mob/animal/passive/penguin

/obj/item/weapon/grenade/spawnergrenade/casino/snake
	desc = "It is set to detonate in 5 seconds. It will release a snake that has been won from the golden goose casino!"
	name = "Casino Creature Container (Snake)"
	spawner_type = /mob/living/simple_mob/animal/passive/snake

/obj/item/weapon/grenade/spawnergrenade/casino/yithian
	desc = "It is set to detonate in 5 seconds. It will release a yithian that has been won from the golden goose casino!"
	name = "Casino Creature Container (Yithian)"
	spawner_type = /mob/living/simple_mob/animal/passive/yithian

/obj/item/weapon/grenade/spawnergrenade/casino/tindalos
	desc = "It is set to detonate in 5 seconds. It will release a tindalos that has been won from the golden goose casino!"
	name = "Casino Creature Container (Tindalos)"
	spawner_type = /mob/living/simple_mob/animal/passive/tindalos

/obj/item/weapon/grenade/spawnergrenade/casino/fennec
	desc = "It is set to detonate in 5 seconds. It will release a fennec that has been won from the golden goose casino!"
	name = "Casino Creature Container (Fennec)"
	spawner_type = /mob/living/simple_mob/vore/fennec

/obj/item/weapon/grenade/spawnergrenade/casino/redpanda
	desc = "It is set to detonate in 5 seconds. It will release a red panda that has been won from the golden goose casino!"
	name = "Casino Creature Container (Red panda)"
	spawner_type = /mob/living/simple_mob/vore/redpanda

/obj/item/weapon/grenade/spawnergrenade/casino/horse
	desc = "It is set to detonate in 5 seconds. It will release a horse that has been won from the golden goose casino!"
	name = "Casino Creature Container (Horse)"
	spawner_type = /mob/living/simple_mob/vore/horse

/obj/item/weapon/grenade/spawnergrenade/casino/otie
	desc = "It is set to detonate in 5 seconds. It will release a otie that has been won from the golden goose casino!"
	name = "Casino Creature Container (Otie)"
	spawner_type = /mob/living/simple_mob/otie/friendly

/obj/item/weapon/grenade/spawnergrenade/casino/otie/chubby
	desc = "It is set to detonate in 5 seconds. It will release a chonker otie that has been won from the golden goose casino!"
	name = "Casino Creature Container (Well feed Otie)"
	spawner_type = /mob/living/simple_mob/otie/friendly/chubby

/obj/item/weapon/grenade/spawnergrenade/casino/zorgoia
	desc = "It is set to detonate in 5 seconds. It will release a zorgoia that has been won from the golden goose casino!"
	name = "Casino Creature Container (Zorgoia)"
	spawner_type = /mob/living/simple_mob/otie/zorgoia/friendly