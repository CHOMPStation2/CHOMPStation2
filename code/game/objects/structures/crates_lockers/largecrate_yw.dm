/obj/structure/largecrate/piano
	name = "piano crate"
	starts_with = list(/obj/structure/musician/piano)
	desc = "*Grand piano may end up being a minimoog."

/obj/structure/largecrate/piano/Initialize(mapload) //This is nessesary to get a random one each time.
	starts_with = list(/obj/structure/musician/piano)
	return ..()
