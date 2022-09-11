/obj/structure/largecrate/animal/teppi
	name = "teppi crate"
	starts_with = list(/mob/living/simple_mob/vore/alienanimals/teppi/baby)

/obj/structure/largecrate/animal/sheep
	name = "sheep crate"
	starts_with = list(/mob/living/simple_mob/vore/sheep)

/obj/structure/largecrate/animal/woofdog
	name = "dog crate"
	starts_with = list(/mob/living/simple_mob/vore/woof)

/obj/structure/largecrate/animal/bugsect
	name = "Dangerous drone carrier"
	starts_with = list(/mob/living/simple_mob/vore/sect_drone)


/obj/structure/largecrate/animal/bugsect/Initialize()
	starts_with = list(pick(/mob/living/simple_mob/vore/sect_drone,
							/mob/living/simple_mob/vore/sect_queen))
	return ..()
