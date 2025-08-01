//
#define O2SIF 0.201
#define N2SIF 0.819

#define MOLES_CELLSIF 114.50978

#define MOLES_O2SIF MOLES_O2STANDARD // O2 value on Sif(18%)
#define MOLES_N2SIF MOLES_N2STANDARD // N2 value on Sif(82%)

#define TEMPERATURE_SIF 293.15 // warm
#define TEMPERATURE_ALTSIF 225.15

//Backwards compatibility sif tiles (mostly for POIs)
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

/turf/simulated/mineral/thor/ignore_mapgen/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF

/turf/simulated/mineral/thor/floor/sif
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF

/turf/simulated/mineral/thor/floor/ignore_mapgen/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF

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


//grass for mobs and trees
/turf/simulated/floor/outdoors/grass/heavy/randomgen
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF


//Overrides to fix active edges

/turf/unsimulated/mineral
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

#if defined(Z_LEVEL_SURFACE_MINES) || defined(Z_LEVEL_UNDERMINES)
//Dealing with having mining POIs spawn on different Z levels
/turf/simulated/mineral/Initialize(mapload)
	. = ..()
	if(istype(src, /turf/simulated/mineral/thor) || istype(src, /turf/simulated/mineral/sif) || istype(src, /turf/simulated/mineral/floor/sif) || istype(src, /turf/simulated/mineral/ignore_mapgen/sif) || istype(src, /turf/simulated/mineral/floor/ignore_mapgen/sif))
		return
	if(src.z == Z_LEVEL_SURFACE_MINES)
		if(density)
			ChangeTurf(/turf/simulated/mineral/ignore_mapgen/sif)
		else
			ChangeTurf(/turf/simulated/mineral/floor/ignore_mapgen/sif)
	if(src.z == Z_LEVEL_UNDERMINES)
		if(density)
			ChangeTurf(/turf/simulated/mineral/thor/ignore_mapgen)
		else
			ChangeTurf(/turf/simulated/mineral/thor/floor/ignore_mapgen)
#endif

/turf/unsimulated/wall/planetary/normal/thor
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF

/turf/simulated/open
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
