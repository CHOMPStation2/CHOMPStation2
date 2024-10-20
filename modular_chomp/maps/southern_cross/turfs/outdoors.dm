// Sif Planetside stuff
#define O2SIF 0.181
#define N2SIF 0.819

#define MOLES_CELLSIF 114.50978

#define MOLES_O2SIF (MOLES_CELLSIF * O2SIF) // O2 value on Sif(18%)
#define MOLES_N2SIF (MOLES_CELLSIF * N2SIF) // N2 value on Sif(82%)

#define TEMPERATURE_SIF 243.15 // Roughly -30C / -22F
#define TEMPERATURE_ALTSIF 225.15


/turf/simulated/floor/outdoors/mud/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/rocks/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/tiled/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/tiled/steel/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/plating/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/outdoors/snow/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/grass/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/grass/sif/forest/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/dirt/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/ignore_mapgen/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/floor/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/floor/ignore_mapgen/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/mud/sif/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/open/sif //CHOMP Edit now I'm adding shit here now too. Skylands
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_ALTSIF

// PoI compatability, to stop active edges.
// In hindsight it would've been better to do this first instead of making a billion /sif subtypes above,
// but maybe we can transition to this instead now and over time get rid of the /sif subtypes.
// The downside is if someone wants to use this in normal/vaccum they'll need to make a new subtype, but since the typical use case has changed, this might be acceptable.

/turf/simulated/mineral
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/water
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/shuttle/floor/alienplating/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/shuttle/floor/voidcraft/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/shuttle/floor/voidcraft/external/dark
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/shuttle/floor/voidcraft/external/light
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/plating/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/tiled/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/sky
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_ALTSIF
/turf/simulated/floor/tiled/asteroid_steel //CHOMP Edit now I'm adding shit here now too. Abandoned temple.
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_ALTSIF

// Space mineral tiles are now not the default, so they get demoted to subtype status.

/turf/simulated/mineral/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/ignore_mapgen/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/floor/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/floor/ignore_mapgen/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

// Step trigger to fall down to planet Sif
/obj/effect/step_trigger/teleporter/planetary_fall/sif/find_planet()
	planet = planet_sif

//CHOMPedit: Changes to sif/planetuse snow to make it work properly as it does on Polaris, it was broken by YW edits.
/turf/simulated/floor/outdoors/snow/sif/planetuse
	name = "snow"
	icon_state = "snow"
	edge_blending_priority = 6
	movement_cost = 2
	initial_flooring = /decl/flooring/snow
	/*turf_layers = list( CHOMP Removal Begin
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		) CHOMP Removal End */

/turf/simulated/floor/outdoors/snow/sif/planetuse/Entered(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.hovering) // Flying things shouldn't make footprints.
			return ..()
		var/mdir = "[A.dir]"
		crossed_dirs[mdir] = 1
		update_icon()
	. = ..()

/turf/simulated/floor/outdoors/snow/sif/planetuse/update_icon()
	..()
	for(var/d in crossed_dirs)
		add_overlay(image(icon = 'icons/turf/outdoors.dmi', icon_state = "snow_footprints", dir = text2num(d)))

/turf/simulated/floor/outdoors/snow/sif/planetuse/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/shovel))
		to_chat(user, "<span class='notice'>You begin to remove \the [src] with your [W].</span>")
		if(do_after(user, 4 SECONDS * W.toolspeed))
			to_chat(user, "<span class='notice'>\The [src] has been dug up, and now lies in a pile nearby.</span>")
			new /obj/item/stack/material/snow(src)
			demote()
		else
			to_chat(user, "<span class='notice'>You decide to not finish removing \the [src].</span>")
	else
		..()

/turf/simulated/floor/outdoors/snow/sif/planetuse/attack_hand(mob/user as mob)
	visible_message("[user] starts scooping up some snow.", "You start scooping up some snow.")
	if(do_after(user, 1 SECOND))
		var/obj/S = new /obj/item/stack/material/snow(user.loc)
		user.put_in_hands(S)
		visible_message("[user] scoops up a pile of snow.", "You scoop up a pile of snow.")
	return
