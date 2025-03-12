
/obj/machinery/media/jukebox/casinojukebox
	name = "space casino jukebox"
	desc = "A jukebox to play the tracks on the golden goose, jazzy~"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinojukebox-nopower"
	state_base = "casinojukebox"

	use_power = USE_POWER_OFF

/obj/machinery/media/jukebox/casinojukebox/getTracksList()
	return SSmedia_tracks.casino_tracks
