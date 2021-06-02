
/obj/machinery/media/jukebox/casinojukebox
	name = "space casino jukebox"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinojukebox-nopower"
	state_base = "casinojukebox"

/* Commenting out for now due to conflicts with upstream jukebox changes.
// On initialization, copy our tracks from the global list
/obj/machinery/media/jukebox/casinojukebox/Initialize()
	. = ..()
	if(LAZYLEN(all_jukebox_tracks)) //Global list has tracks
		tracks.Cut()
		secret_tracks.Cut()
		for(var/datum/track/T in all_jukebox_tracks) //Load them
			if(!T.casino)
				tracks -= T
				secret_tracks -= T
			if(T.casino)
				tracks |= T
	else if(!LAZYLEN(tracks)) //We don't even have default tracks
		stat |= BROKEN // No tracks configured this round!
*/
