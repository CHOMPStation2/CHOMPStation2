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

/obj/structure/largecrate/animal/guardbeast
	name = "VARMAcorp autoNOMous security solution"
	desc = "The VARMAcorp bioengineering division flagship product on trained optimal snowflake guard dogs."
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "sotiecrate"
	starts_with = list(/mob/living/simple_mob/otie/security)

/obj/structure/largecrate/animal/guardmutant
	name = "VARMAcorp autoNOMous security solution for hostile environments."
	desc = "The VARMAcorp bioengineering division flagship product on trained optimal snowflake guard dogs. This one can survive hostile atmosphere."
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "sotiecrate"
	starts_with = list(/mob/living/simple_mob/otie/security/phoron)

/obj/structure/largecrate/animal/otie
	name = "VARMAcorp adoptable reject (Dangerous!)"
	desc = "A warning on the side says the creature inside was returned to the supplier after injuring or devouring several unlucky members of the previous adoption family. It was given a second chance with the next customer. Godspeed and good luck with your new pet!"
	icon = 'icons/obj/storage_vr.dmi'
	icon_state = "otiecrate2"
	starts_with = list(/mob/living/simple_mob/otie/cotie)
	var/taped = 1

/obj/structure/largecrate/animal/otie/phoron
	name = "VARMAcorp adaptive beta subject (Experimental)"
	desc = "VARMAcorp experimental hostile environment adaptive breeding development kit. WARNING, DO NOT RELEASE IN WILD!"
	starts_with = list(/mob/living/simple_mob/otie/cotie/phoron)

/obj/structure/largecrate/animal/otie/phoron/Initialize()
	starts_with = list(pick(/mob/living/simple_mob/otie/cotie/phoron;2,
						/mob/living/simple_mob/otie/red/friendly;0.5))
	return ..()

/obj/structure/largecrate/animal/otie/attack_hand(mob/living/carbon/human/M as mob)
	if(taped == 1)
		playsound(src, 'sound/items/poster_ripped.ogg', 50, 1)
		icon_state = "otiecrate"
		taped = 0
	..()
