//
#define O2SIF 0.201
#define N2SIF 0.819

#define MOLES_CELLSIF 114.50978

#define MOLES_O2SIF (MOLES_CELLSIF * O2SIF) // O2 value on Sif(18%)
#define MOLES_N2SIF (MOLES_CELLSIF * N2SIF) // N2 value on Sif(82%)

#define TEMPERATURE_SIF 293.15 // warm
#define TEMPERATURE_ALTSIF 225.15

/turf/simulated/floor/outdoors/mud/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/rocks/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/tiled/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/tiled/steel/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/plating/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
	outdoors = OUTDOORS_YES

/turf/simulated/floor/outdoors/snow/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/grass/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/grass/thor/forest/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/dirt/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/ignore_mapgen/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/floor/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/mineral/floor/ignore_mapgen/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/floor/outdoors/mud/thor/planetuse
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

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

// Step trigger to fall down to planet Thor
obj/effect/step_trigger/teleporter/planetary_fall/thor/find_planet()
	planet = planet_thor

//CHOMPedit: Changes to sif/planetuse snow to make it work properly as it does on Polaris, it was broken by YW edits.
/turf/simulated/floor/outdoors/snow/thor/planetuse
	name = "snow"
	icon_state = "snow"
	edge_blending_priority = 6
	movement_cost = 2
	initial_flooring = /decl/flooring/snow
	turf_layers = list(
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		)

/turf/simulated/floor/outdoors/snow/thor/planetuse/Entered(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.hovering) // Flying things shouldn't make footprints.
			return ..()
		var/mdir = "[A.dir]"
		crossed_dirs[mdir] = 1
		update_icon()
	. = ..()

/turf/simulated/floor/outdoors/snow/thor/planetuse/update_icon()
	..()
	for(var/d in crossed_dirs)
		add_overlay(image(icon = 'icons/turf/outdoors.dmi', icon_state = "snow_footprints", dir = text2num(d)))

/turf/simulated/floor/outdoors/snow/thor/planetuse/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/weapon/shovel))
		to_chat(user, "<span class='notice'>You begin to remove \the [src] with your [W].</span>")
		if(do_after(user, 4 SECONDS * W.toolspeed))
			to_chat(user, "<span class='notice'>\The [src] has been dug up, and now lies in a pile nearby.</span>")
			new /obj/item/stack/material/snow(src)
			demote()
		else
			to_chat(user, "<span class='notice'>You decide to not finish removing \the [src].</span>")
	else
		..()

/turf/simulated/floor/outdoors/snow/thor/planetuse/attack_hand(mob/user as mob)
	visible_message("[user] starts scooping up some snow.", "You start scooping up some snow.")
	if(do_after(user, 1 SECOND))
		var/obj/S = new /obj/item/stack/material/snow(user.loc)
		user.put_in_hands(S)
		visible_message("[user] scoops up a pile of snow.", "You scoop up a pile of snow.")
	return

//placeholder stuff for transit turfs

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"

// Tram transit floor
/turf/simulated/floor/tiled/techfloor/grid/transit
	icon = 'icons/turf/transit_vr.dmi'
	initial_flooring = null

//grass for mobs and trees
/turf/simulated/floor/outdoors/grass/heavy/randomgen
	name = "heavy grass"
	icon_state = "grass-heavy0"
	edge_blending_priority = 4
	initial_flooring = /decl/flooring/grass/heavy
	turf_layers = list(
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		)
	grass_chance = 85

	grass_types = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass,
		/obj/structure/flora/ausbushes/lavendergrass,
		/obj/structure/flora/ausbushes/genericbush,
		/obj/structure/flora/ausbushes/grassybush,
		/obj/structure/flora/ausbushes/sunnybush,
		/obj/structure/flora/ausbushes/brflowers,
		/obj/structure/flora/ausbushes/ppflowers,
		/obj/structure/flora/ausbushes/ywflowers,
		/obj/structure/flora/tree/jungle_small,
		/obj/structure/flora/tree/jungle,
		/obj/structure/flora/ausbushes/leafybush,
		)

	animal_chance = 0.5

	animal_types = list(
		/mob/living/simple_mob/vore/aggressive/frog = 1,
		/mob/living/simple_mob/animal/sif/glitterfly = 7,
		/mob/living/simple_mob/otie = 3,
		/mob/living/simple_mob/otie/feral = 1,
		/mob/living/simple_mob/vore/fennec = 4,
		/mob/living/simple_mob/animal/passive/lizard = 4,
		/mob/living/simple_mob/animal/passive/armadillo = 2,
		/mob/living/simple_mob/animal/passive/opossum = 2,
		/mob/living/simple_mob/animal/passive/mouse/jerboa = 1,
		/mob/living/simple_mob/animal/wolf/direwolf = 1,
		/mob/living/simple_mob/vore/aggressive/rat = 1,
		/mob/living/simple_mob/vore/horse/big = 2,
		/mob/living/simple_mob/otie/zorgoia/feral = 0.2
		)
