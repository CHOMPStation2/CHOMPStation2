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

/obj/structure/largecrate/animal/bugsect/Initialize(mapload)
	starts_with = list(pick(/mob/living/simple_mob/vore/sect_drone,
							/mob/living/simple_mob/vore/sect_queen))
	return ..()

/obj/structure/largecrate/animal/swoopie
	name = "SWOOPIE XL CleanBot Starter Kit"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION. Consult spiritual observer intervention to avoid rogue units. (That means ghosts. Ominous.)"
	starts_with = list(/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie)

/obj/structure/largecrate/animal/solarray
	name = "Exotic crate"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION"
	starts_with = list(/mob/living/simple_mob/vore/spacecritter/solarray)

/obj/structure/largecrate/animal/livingice
	name = "Exotic crate"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION"
	starts_with = list(/mob/living/simple_mob/vore/spacecritter/livingice)

/obj/structure/largecrate/animal/radcrab
	name = "Exotic crate"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION"
	starts_with = list(/mob/living/simple_mob/vore/spacecritter/radcrab)

/obj/structure/largecrate/animal/dreameel
	name = "Exotic crate"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION"
	starts_with = list(/mob/living/simple_mob/vore/spacecritter/dreameel)

/obj/structure/largecrate/animal/gravityshell
	name = "Exotic crate"
	desc = "WARNING: HAZARDOUS CONTENTS. HANDLE WITH CAUTION"
	starts_with = list(/mob/living/simple_mob/vore/spacecritter/gravityshell)
