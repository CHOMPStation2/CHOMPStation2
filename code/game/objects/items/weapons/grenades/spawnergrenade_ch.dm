/obj/item/grenade/spawnergrenade/casino // CHOMPEdit - Removal of obj/item/weapon

	desc = "It is set to detonate in 5 seconds. It will release a goose that has been won from the golden goose casino!"
	name = "Casino Creature Container (Goose)"
	icon = 'icons/obj/grenade_ch.dmi'
	icon_state = "casino"
	item_state = "casino"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 2)
	spawner_type = /mob/living/simple_mob/animal/space/goose/domesticated


// Detonate now just handles the two loops that query for people in lockers and people who can see it.
/obj/item/grenade/spawnergrenade/casino/detonate() // CHOMPEdit - Removal of obj/item/weapon

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

/obj/item/grenade/spawnergrenade/casino/goat // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a goat that has been won from the golden goose casino!"
	name = "Casino Creature Container (Goat)"
	spawner_type = /mob/living/simple_mob/animal/goat

/obj/item/grenade/spawnergrenade/casino/armadillo // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a armadillo that has been won from the golden goose casino!"
	name = "Casino Creature Container (Armadillo)"
	spawner_type = /mob/living/simple_mob/animal/passive/armadillo

/obj/item/grenade/spawnergrenade/casino/cat // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a cat that has been won from the golden goose casino!"
	name = "Casino Creature Container (Cat)"
	spawner_type = /mob/living/simple_mob/animal/passive/cat

/obj/item/grenade/spawnergrenade/casino/chicken // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a chicken that has been won from the golden goose casino!"
	name = "Casino Creature Container (Chicken)"
	spawner_type = /mob/living/simple_mob/animal/passive/chicken

/obj/item/grenade/spawnergrenade/casino/cow // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a cow that has been won from the golden goose casino!"
	name = "Casino Creature Container (Cow)"
	spawner_type = /mob/living/simple_mob/animal/passive/cow

/obj/item/grenade/spawnergrenade/casino/corgi // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a corgi that has been won from the golden goose casino!"
	name = "Casino Creature Container (Corgi)"
	spawner_type = /mob/living/simple_mob/animal/passive/dog/corgi

/obj/item/grenade/spawnergrenade/casino/fox // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a fox that has been won from the golden goose casino!"
	name = "Casino Creature Container (Fox)"
	spawner_type = /mob/living/simple_mob/animal/passive/fox

/obj/item/grenade/spawnergrenade/casino/lizard // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a lizard that has been won from the golden goose casino!"
	name = "Casino Creature Container (Lizard)"
	spawner_type = /mob/living/simple_mob/animal/passive/lizard

/obj/item/grenade/spawnergrenade/casino/penguin // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a penguin that has been won from the golden goose casino!"
	name = "Casino Creature Container (Penguin)"
	spawner_type = /mob/living/simple_mob/animal/passive/penguin

/obj/item/grenade/spawnergrenade/casino/snake // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a snake that has been won from the golden goose casino!"
	name = "Casino Creature Container (Snake)"
	spawner_type = /mob/living/simple_mob/animal/passive/snake

/obj/item/grenade/spawnergrenade/casino/yithian // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a yithian that has been won from the golden goose casino!"
	name = "Casino Creature Container (Yithian)"
	spawner_type = /mob/living/simple_mob/animal/passive/yithian

/obj/item/grenade/spawnergrenade/casino/tindalos // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a tindalos that has been won from the golden goose casino!"
	name = "Casino Creature Container (Tindalos)"
	spawner_type = /mob/living/simple_mob/animal/passive/tindalos

/obj/item/grenade/spawnergrenade/casino/fennec // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a fennec that has been won from the golden goose casino!"
	name = "Casino Creature Container (Fennec)"
	spawner_type = /mob/living/simple_mob/vore/fennec

/obj/item/grenade/spawnergrenade/casino/redpanda // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a red panda that has been won from the golden goose casino!"
	name = "Casino Creature Container (Red panda)"
	spawner_type = /mob/living/simple_mob/vore/redpanda

/obj/item/grenade/spawnergrenade/casino/horse // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a horse that has been won from the golden goose casino!"
	name = "Casino Creature Container (Horse)"
	spawner_type = /mob/living/simple_mob/vore/horse

/obj/item/grenade/spawnergrenade/casino/otie // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a otie that has been won from the golden goose casino!"
	name = "Casino Creature Container (Otie)"
	spawner_type = /mob/living/simple_mob/vore/otie/friendly

/obj/item/grenade/spawnergrenade/casino/otie/chubby // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a chonker otie that has been won from the golden goose casino!"
	name = "Casino Creature Container (Well feed Otie)"
	spawner_type = /mob/living/simple_mob/vore/otie/friendly/chubby

/obj/item/grenade/spawnergrenade/casino/zorgoia // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a zorgoia that has been won from the golden goose casino!"
	name = "Casino Creature Container (Zorgoia)"
	spawner_type = /mob/living/simple_mob/vore/zorgoia/tamed

/obj/item/grenade/spawnergrenade/casino/gygax // CHOMPEdit - Removal of obj/item/weapon
	desc = "You feel great power inside this small round sphere, with great powers comes great responsibilities!"
	name = "Mysterious Grenade"
	spawner_type = /obj/mecha/combat/gygax/dark

/obj/item/grenade/spawnergrenade/casino/gygax/mining // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Mining Ripley)"
	spawner_type = /obj/mecha/working/ripley/mining

/obj/item/grenade/spawnergrenade/casino/gygax/firefighter // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Firefighter Ripley)"
	spawner_type = /obj/mecha/working/ripley/firefighter

/obj/item/grenade/spawnergrenade/casino/gygax/serenity // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Serenity)"
	spawner_type = /obj/mecha/combat/gygax/serenity

/obj/item/grenade/spawnergrenade/casino/gygax/Odysseus // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Odysseus)"
	spawner_type = /obj/mecha/medical/odysseus/loaded

/obj/item/grenade/spawnergrenade/casino/gygax/scree // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Phazon Scuttlebug)"
	spawner_type = /obj/mecha/combat/phazon/scree

/obj/item/grenade/spawnergrenade/casino/gygax/janus // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Phazon Janus)"
	spawner_type = /obj/mecha/combat/phazon/janus

/obj/item/grenade/spawnergrenade/casino/gygax/scarab // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Scarab)"
	spawner_type = /obj/mecha/combat/scarab

/obj/item/grenade/spawnergrenade/casino/gygax/gorilla // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Gorilla)"
	spawner_type = /obj/mecha/combat/gorilla

/obj/item/grenade/spawnergrenade/casino/gygax/shuttlepod // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Shuttlepod)"
	spawner_type = /obj/mecha/working/hoverpod/shuttlepod

/obj/item/grenade/spawnergrenade/casino/gygax/shuttlecraft // CHOMPEdit - Removal of obj/item/weapon
	name = "Casino Mech Container (Shuttlecraft)"
	spawner_type = /obj/mecha/working/hoverpod/shuttlecraft

/obj/item/grenade/spawnergrenade/casino/infinitycake // CHOMPEdit - Removal of obj/item/weapon
	desc = "Some say a gouda in his hubris made a cake to rival the gods. Sometimes it appears where it is least expected, only to vanish a few hours later.."
	name = "Mysterious Grenade"
	spawner_type = null

/obj/item/grenade/spawnergrenade/casino/infinitycake/detonate() // CHOMPEdit - Removal of obj/item/weapon

	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/phasein.ogg', 100, 1)

	new /obj/structure/thecake(T)
	new /obj/item/thecake_layer(T) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/thecake_layer/three(T) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/thecake_layer/four(T) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/thecake_layer/five(T) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/thecake_layer/six(T) // CHOMPEdit - Removal of obj/item/weapon

	qdel(src)
	return

/obj/item/grenade/spawnergrenade/casino/universal_technomancer // CHOMPEdit - Removal of obj/item/weapon
	name = "Mysterious Grenade (Tell an admin on server or discord before playing with!)"
	desc = "Sometimes one wishes upon a lucky star and obtains by pure chance great power! (TELL AN ADMIN ON DISCORD OR SERVER BEFORE PLAYING WITH)"

/obj/item/grenade/spawnergrenade/casino/universal_technomancer/detonate() // CHOMPEdit - Removal of obj/item/weapon
	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/phasein.ogg', 100, 1)

	new /obj/item/technomancer_catalog/universal(T) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/technomancer_core/universal(T) // CHOMPEdit - Removal of obj/item/weapon

	qdel(src)
	return

/obj/item/grenade/spawnergrenade/clustaur // CHOMPEdit - Removal of obj/item/weapon
	desc = "It is set to detonate in 5 seconds. It will release a cluster of hydration."
	name = "clustaur grenade"
	icon = 'icons/obj/grenade_ch.dmi'
	icon_state = "clustaur"
	item_state = "clustaur"
	banglet = 1
	deliveryamt = 10
	spawner_type = /obj/item/reagent_containers/food/drinks/cans/waterbottle/wataur // CHOMPEdit - Removal of obj/item/weapon
