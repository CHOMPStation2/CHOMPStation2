/obj/effect/meteor/dust/meatyore
	name = "space blood"
	meteordrop = /obj/item/weapon/reagent_containers/food/snacks/bacon

/obj/effect/meteor/dust/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/drip(get_turf(src))

/obj/effect/meteor/medium/meatyore
	name = "meatyore"
	meteordrop = /obj/random/organ

/obj/effect/meteor/medium/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))

/obj/effect/meteor/medium/meatyore/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human(get_turf(src))

/obj/effect/meteor/big/meatyore
	name = "large meatyore"
	meteordrop = /obj/random/organ

/obj/effect/meteor/big/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))

/obj/effect/meteor/big/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human(get_turf(src))

/obj/effect/meteor/flaming/meatyore
	name = "flaming meatyore"
	meteordrop = /obj/item/weapon/reagent_containers/food/snacks/meatsteak

/obj/effect/meteor/flaming/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))

/obj/effect/meteor/flaming/meatyore/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human(get_turf(src))

/obj/effect/meteor/irradiated/meatyore
	name = "glowing meaty ore"
	meteordrop = /obj/item/weapon/reagent_containers/food/snacks/deathclawmeat

/obj/effect/meteor/irradiated/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))

/obj/effect/meteor/irradiated/meatyore/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human(get_turf(src))

/obj/effect/meteor/emp/meatyore
	name = "conducting meaty ore"
	meteordrop = /obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat

/obj/effect/meteor/emp/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))

/obj/effect/meteor/emp/meatyore/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human

/obj/effect/meteor/tunguska/meatyore
	name = "tunguska meatyore"
	meteordrop = /obj/item/weapon/reagent_containers/food/snacks/phorondragonmeat

/obj/effect/meteor/tunguska/meatyore/meteor_effect(var/gib)
	..()
	if(gib)
		new /obj/effect/gibspawner/human(get_turf(src))

/obj/effect/meteor/tunguska/meatyore/Bump()
	..()
	new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))
	if(prob(20))
		new /obj/effect/decal/cleanable/blood/gibs(get_turf(src))
