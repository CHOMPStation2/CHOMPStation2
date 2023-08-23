/**
 *! Open Space
 *? "empty" turf that lets stuff fall thru it to the layer below.
 */
/turf/simulated/open
	name = "open space"
	icon = 'icons/turf/space.dmi'
	icon_state = "opendebug"
	density = FALSE
	turf_path_danger = TURF_PATH_DANGER_FALL
	can_build_into_floor = TRUE
	allow_gas_overlays = FALSE
	mz_flags = MZ_MIMIC_DEFAULTS | MZ_MIMIC_OVERWRITE | MZ_MIMIC_NO_AO | MZ_ATMOS_BOTH | MZ_OPEN_BOTH

/turf/simulated/open/Initialize(mapload)
	. = ..()
	icon_state = ""
	ASSERT(HasBelow(z))
	queue()

/turf/simulated/open/Entered(atom/movable/mover)
	..()
	if(mover.movement_type & MOVEMENT_GROUND)
		mover.fall()

// Called when thrown object lands on this turf.
/turf/simulated/open/throw_landed(atom/movable/AM, datum/thrownthing/TT)
	. = ..()
	if(AM.movement_type & MOVEMENT_GROUND)
		AM.fall()

/turf/simulated/open/proc/queue()
	if(smoothing_flags & SMOOTH_QUEUED)
		return
	smoothing_flags |= SMOOTH_QUEUED

//! We hijack smoothing flags.
/turf/simulated/open/smooth_icon()
	return // Nope.amv

// Override to make sure nothing is hidden
/turf/simulated/open/levelupdate()
	for(var/obj/O in src)
		O.hide(0)

/turf/simulated/open/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(distance <= 2)
		var/depth = 1
		for(var/turf/T = GetBelow(src); (istype(T) && T.is_open()); T = GetBelow(T))
			depth += 1
		to_chat(user, "It is about [depth] level\s deep.")

// Most things use is_plating to test if there is a cover tile on top (like regular floors)
/turf/simulated/open/is_plating()
	return TRUE

/turf/simulated/open/is_space()
	var/turf/below = GetBelow(src)
	return !below || below.is_space()

/turf/simulated/open/is_open()
	return TRUE

/turf/simulated/open/is_solid_structure()
	return locate(/obj/structure/lattice, src)	// Counts as solid structure if it has a lattice (same as space)

/turf/simulated/open/is_safe_to_enter(mob/living/L)
	if(L.can_fall())
		if(!locate(/obj/structure/stairs) in GetBelow(src))
			return FALSE
	return ..()

// Straight copy from space.
/turf/simulated/open/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>Constructing support lattice ...</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(src)
		return

	if (istype(C, /obj/item/stack/tile/floor))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = C
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			ChangeTurf(/turf/simulated/floor, flags = CHANGETURF_INHERIT_AIR)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")

	// To lay cable.
	if(istype(C, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/coil = C
		coil.turf_place(src, user)
