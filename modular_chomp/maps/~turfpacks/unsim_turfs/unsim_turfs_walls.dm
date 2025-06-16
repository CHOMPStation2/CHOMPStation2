
/turf/unsimulated/wall/fancy_shuttle/window
	opacity = FALSE
	icon_state = "hull_transparent"

/turf/unsimulated/wall/fancy_shuttle/nondense
	density = FALSE
	blocks_air = FALSE
	opacity = FALSE
	icon_state = "hull_nondense"

/turf/unsimulated/shuttle/wall/alien
	icon = 'icons/turf/shuttle_alien.dmi'
	icon_state = "alien"
	light_range = 3
	light_power = 0.75
	light_color = "#ff0066" // Pink-ish
	light_on = TRUE
	block_tele = TRUE // Will be used for dungeons so this is needed to stop cheesing with handteles.

/turf/unsimulated/shuttle/wall/alien/blue
	name = "hybrid wall"
	desc = "Seems slightly more friendly than if the wall were ominous purple."
	icon = 'icons/turf/shuttle_alien_blue.dmi'
	light_color = "#1fdbf4" // Cyan-ish

/turf/unsimulated/shuttle/wall/alien/blue/hard_corner
	name = "hybrid wall"
	icon_state = "alien-hc"

/turf/unsimulated/shuttle/wall/alien/blue/no_join
	name = "hybrid wall"
	icon_state = "alien-nj"

/turf/unsimulated/flesh
	name = "flesh wall"
	desc = "The fleshy surface of this wall squishes nicely under your touch but looks and feels extremly strong"
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "flesh"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/flesh/colour
	name = "flesh wall"
	desc = "The fleshy surface of this wall squishes nicely under your touch but looks and feels extremly strong"
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "colorable-wall"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/gore
	name = "wall of viscera"
	desc = "Its veins pulse in a sickeningly rapid fashion, while certain spots of the wall rise and fall gently, much like slow, deliberate breathing."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_2"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/goreeyes
	name = "wall of viscera"
	desc = "Strangely observant eyes dot the wall. Getting too close has the eyes fixate on you, while their pupils shake violently. Each socket is connected by a series of winding, writhing veins."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_4"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/shuttle/wall/flock
	icon = 'icons/goonstation/featherzone.dmi'
	icon_state = "flockwall0"

/turf/unsimulated/shuttle/wall/flock/Initialize(mapload)
	. = ..()
	set_light(3,3,"#26c5a9")

/turf/unsimulated/wall/rplastitanium
	icon_state = "rwall-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/plastitanium
	icon_state = "wall-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/rplastihull
	icon_state = "rhull-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/plastihull
	icon_state = "hull-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/ghull
	icon_state = "hull-titanium"

/turf/unsimulated/wall/diamond
	icon_state = "diamond"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/dungeon
	icon_state = "dungeon"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/durasteel
	icon_state = "durasteel"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/elevator
	icon_state = "elevator"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/gold
	icon_state = "gold"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/golddiamond
	icon_state = "golddiamond"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/iron
	icon_state = "iron"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/ironphoron
	icon_state = "ironphoron"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/lead
	icon_state = "lead"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/log
	icon_state = "log"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/log_sif
	icon_state = "log_sif"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/phoron
	icon_state = "phoron"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/r_lead
	icon_state = "lead"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/resin
	icon_state = "resin"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/sandstone
	icon_state = "sandstone"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/sandstonediamond
	icon_state = "sandstonediamond"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/sifwood
	icon_state = "sifwood"
	icon = 'icons/turf/wall_masks_vr.dmi'

//CHOMPEdit Start
/turf/unsimulated/wall/rsifwood
	icon_state = "sifwood"
	icon = 'icons/turf/wall_masks_vr.dmi'
//CHOMPEdit End

/turf/unsimulated/wall/silver
	icon_state = "silver"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/silvergold
	icon_state = "silvergold"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/skipjack
	icon_state = "skipjack"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/snowbrick
	icon_state = "snowbrick"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/solidrock
	icon_state = "solidrock"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/titanium
	icon_state = "titanium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/uranium
	icon_state = "uranium"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/virgo2
	icon_state = "virgo2"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/wood
	icon_state = "wood"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/stonebricks
	icon_state = "stonebrick"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/stonelogs
	icon_state = "stonelogs"
	icon = 'icons/turf/wall_masks_vr.dmi'

/turf/unsimulated/wall/r_wall
	icon_state = "rgeneric"

/turf/unsimulated/wall/shull
	icon_state = "hull-steel"

/turf/unsimulated/wall/rshull
	icon_state = "hull-r_steel"

/turf/unsimulated/wall/pshull
	icon_state = "hull-plasteel"

/turf/unsimulated/wall/rpshull
	icon_state = "hull-r_plasteel"

/turf/unsimulated/wall/dshull
	icon_state = "hull-durasteel"

/turf/unsimulated/wall/rdshull
	icon_state = "hull-r_durasteel"

/turf/unsimulated/wall/thull
	icon_state = "hull-titanium"

/turf/unsimulated/wall/rthull
	icon_state = "hull-r_titanium"

/turf/unsimulated/wall/concrete
	icon_state = "brick"

/turf/unsimulated/wall/r_concrete
	icon_state = "rbrick"
